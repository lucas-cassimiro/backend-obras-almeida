import { Router } from "express";

import { ProductivityControlController } from "@src/app/controllers/ProductivityControlController";

const productivityControl = Router();

productivityControl.post("/", new ProductivityControlController().create);
productivityControl.get("/", new ProductivityControlController().show);

export default productivityControl;
