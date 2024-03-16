import { Request, Response } from "express";

import prisma from "config/clientPrisma";

export class ProductivityControlController {
    async create(req: Request, res: Response) {
        try {
            const { employee_id, obra_id, place, sub_id, quantity } = req.body;

            await prisma.productivityControl.create({
                data: {
                    employee_id,
                    obra_id,
                    place,
                    sub_id,
                    quantity,
                    created_at: new Date(),
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
}
