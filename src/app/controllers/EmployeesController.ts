import { Request, Response } from "express";

import prisma from "config/clientPrisma";

export class EmployeesController {
    async index(_req: Request, res: Response) {
        try {
            const employees = await prisma.employee.findMany();
            return res.json({ employees });
        } catch (error) {
            return res
                .status(500)
                .send({ message: "Falha ao buscar dados dos funcionários." });
        }
    }

    async create(req: Request, res: Response) {
        try {
            const {
                ra,
                first_name,
                last_name,
                admission_date,
                alternative_name,
                salary,
                lunch_cost,
                ticket_cost,
                payment_id,
                contract_id,
                position_id,
            } = req.body;

            const employeeExistentInDatabase = await prisma.employee.findUnique({
                where: {
                    ra,
                },
            });

            if (employeeExistentInDatabase)
                return res
                    .status(400)
                    .send({ message: "Funcionário já cadastrado no Banco de Dados." });

            await prisma.employee.create({
                data: {
                    ra,
                    first_name,
                    last_name,
                    alternative_name,
                    admission_date,
                    salary,
                    lunch_cost,
                    ticket_cost,
                    payment_id,
                    contract_id,
                    position_id,
                },
            });

            return res.status(201).send({ message: "Cadastro efetuado." });
        } catch (error) {
            return res
                .status(500)
                .send({ message: "Falha ao cadastrar funcionário." });
        }
    }
}
