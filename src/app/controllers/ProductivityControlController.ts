import { Request, Response } from "express";

import prisma from "config/clientPrisma";

interface RequestBodyItem {
  workId: string;
  presenceDate: string;
  employees: number;
  place: string;
  ambient: string;
  subId: number;
  quantity: string;
  weight: string;
}

export class ProductivityControlController {
    async create(req: Request, res: Response) {
        try {
            const { body } = req;

            for (const {
                workId,
                presenceDate,
                employees,
                place,
                ambient,
                subId,
                quantity,
                weight,
            } of body as RequestBodyItem[]) {
                await prisma.productivityControl.create({
                    data: {
                        obra_id: Number(workId),
                        created_at: new Date(presenceDate),
                        employee_id: Number(employees),
                        place: place,
                        ambient,
                        sub_id: subId,
                        quantity: Number(quantity),
                        weight: Number(weight),
                    },
                });
            }

            return res
                .status(201)
                .send({ message: "Registro efetuado com sucesso." });
        } catch (error) {
            console.log(error);
            return res
                .status(500)
                .send({ message: "Erro ao cadastrar controle de produtividade." });
        }
    }

    async show(req: Request, res: Response) {
        try {
            const selectValue: number = Number(req.query.select);
            const dateValue: string = req.query.data as string;
            console.log(selectValue, dateValue);

            const productivityControl = await prisma.productivityControl.findMany({
                where: {
                    obra_id: selectValue,
                    created_at: new Date(dateValue),
                },
                include: {
                    employees: true,
                    subservices: {
                        include: {
                            macroservices: true,
                        },
                    },
                },
            });

            return res.json(productivityControl);
        } catch (error) {
            console.log(error);
            return res.status(500).send({ message: "Falha ao realizar a busca." });
        }
    }
}
