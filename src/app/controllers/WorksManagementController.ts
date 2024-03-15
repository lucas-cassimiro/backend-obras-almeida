import { Request, Response } from "express";

import prisma from "config/clientPrisma";

export class WorksManagementsController {
    async create(req: Request, res: Response) {
        try {
            const { name, street, number, cep, city, state, unidades_repeticao } =
        req.body;

            const existentWorkInDatabase = await prisma.addressWork.findUnique({
                where: {
                    cep,
                },
            });

            if (existentWorkInDatabase)
                return res.status(401).send({ message: "Obra já cadastrada." });

            const createWorkInDatabase = await prisma.addressWork.create({
                data: {
                    name,
                    street,
                    number,
                    cep,
                    city,
                    state,
                },
            });

            const workId: number = createWorkInDatabase.id;

            for (const unidade of unidades_repeticao) {
                await prisma.workManagement.create({
                    data: {
                        obra_id: workId,
                        place: unidade.local_repeticao,
                        ambient: unidade.name,
                        sub_id: unidade.sub_servico,
                        quantity: 0
                    },
                });
            }


            return res
                .status(201)
                .send({ message: "Obra cadastrada com sucesso." });


        } catch (error) {
            return res
                .status(500)
                .send({ message: "Erro ao cadastrar dados da obra." });
        }
    }
}
