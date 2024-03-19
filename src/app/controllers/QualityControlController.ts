import { Request, Response } from "express";

import prisma from "config/clientPrisma";

type RequestBodyItem = {
  id: number;
  resultado: string;
  acao: string;
};

export class QualityControlController {
    async create(req: Request, res: Response) {
        try {
            const { body } = req;

            for (const { id, resultado, acao } of body as RequestBodyItem[]) {
                await prisma.qualityControl.create({
                    data: {
                        productivity_id: id,
                        nonconformity: resultado,
                        operation: acao,
                    },
                });
            }
        } catch (error) {
            console.log(error);
            return res
                .status(500)
                .send({ message: "Não foi possível cadastrar os dados." });
        }
    }
}
