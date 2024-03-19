import { Router } from "express";

import { QualityControlController } from "@src/app/controllers/QualityControlController";

const qualityControlControllerRoutes = Router();

qualityControlControllerRoutes.post("/", new QualityControlController().create);

export default qualityControlControllerRoutes;
