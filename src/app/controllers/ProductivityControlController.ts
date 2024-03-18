import { Request, Response } from "express";

import prisma from "config/clientPrisma";

export class ProductivityControlController {
    async create(req: Request, res: Response) {
        try {
            const {
                employee_id,
                obra_id,
                place,
                sub_id,
                quantity,
                weight,
                created_at,
            } = req.body;

            await prisma.productivityControl.create({
                data: {
                    employee_id,
                    obra_id,
                    place,
                    sub_id,
                    quantity,
                    weight,
                    created_at: new Date(created_at),
                },
            });

            return res
                .status(201)
                .send({ message: "Registro efetuado com sucesso." });
        } catch (error) {
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
