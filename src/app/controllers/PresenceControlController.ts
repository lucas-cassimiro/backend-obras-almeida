import { Request, Response } from "express";

import prisma from "config/clientPrisma";

export class PresenceControlController {
    async create(req: Request, res: Response) {
        try {
            const { presenceDate, work, employees, arrival_time } = req.body;

            for (const employeeId of employees) {
                await prisma.presenceControl.create({
                    data: {
                        obra_id: work,
                        presence_date: new Date(presenceDate),
                        arrival_time,
                        employee_id: employeeId,
                    },
                });
            }

            return res.status(201).send({ message: "Cadastro realizado." });
        } catch (error) {
            console.log(error);
            return res.status(500).send({
                message: "Falha ao cadastrar controle na tabela de presença.",
            });
        }
    }

    async show(req: Request, res: Response) {
        const selectValue: number = Number(req.query.select);
        const dateValue: string = req.query.data as string;

        function groupDataByPlaceAndAmbient(data: any) {
            const result: any[] = [];
            data.forEach((item: any) => {
                const existingPlaceIndex = result.findIndex(
                    (r) => r.name === item.place
                );

                if (existingPlaceIndex !== -1) {
                    const existingAmbientIndex = result[
                        existingPlaceIndex
                    ].ambiente.findIndex((a) => a.ambient_name === item.ambient);
                    if (existingAmbientIndex !== -1) {
                        result[existingPlaceIndex].ambiente[
                            existingAmbientIndex
                        ].subservice.push({
                            id: item.id,
                            sub_id: item.sub_id,
                            quantity: item.quantity,
                            weight: item.weight,
                            subservices: item.subservices,
                        });
                    } else {
                        result[existingPlaceIndex].ambiente.push({
                            ambient_name: item.ambient,
                            subservice: [
                                {
                                    id: item.id,
                                    sub_id: item.sub_id,
                                    quantity: item.quantity,
                                    weight: item.weight,
                                    subservices: item.subservices,
                                },
                            ],
                        });
                    }
                } else {
                    result.push({
                        name: item.place,
                        ambiente: [
                            {
                                ambient_name: item.ambient,
                                subservice: [
                                    {
                                        id: item.id,
                                        sub_id: item.sub_id,
                                        quantity: item.quantity,
                                        weight: item.weight,
                                        subservices: item.subservices,
                                    },
                                ],
                            },
                        ],
                    });
                }
            });
            return result;
        }

        try {
            const employeeInWork = await prisma.presenceControl.findMany({
                where: {
                    obra_id: selectValue,
                    presence_date: new Date(dateValue),
                },
                include: {
                    employees: true,
                },
            });

            const workManagement = await prisma.workManagement.findMany({
                where: {
                    obra_id: selectValue,
                },
                include: {
                    subservices: {
                        include: {
                            macroservices: true,
                        },
                    },
                },
            });

            const groupedWorkManagement = groupDataByPlaceAndAmbient(workManagement);

            const sanitizedWorkManagement = groupedWorkManagement.map((item) => ({
                name: item.name,
                ambiente: item.ambiente.map((ambientItem: any) => ({
                    ambient_name: ambientItem.ambient_name,
                    subservice: ambientItem.subservice.map((subserviceItem: any) => ({
                        id: subserviceItem.id,
                        sub_id: subserviceItem.sub_id,
                        quantity: subserviceItem.quantity,
                        weight: subserviceItem.weight,
                        subservices: subserviceItem.subservices,
                    })),
                })),
            }));

            return res.status(200).send({
                employeeInWork,
                workManagement: sanitizedWorkManagement,
            });
        } catch (error) {
            console.error(error);
            return res.status(500).send({ message: "Falha ao realizar a busca." });
        }
    }
}
