import express from "express";
import cors from "cors";

import routerMacroservices from "./routes/macroservicesRoutes";

export const app = express();
export const port = 3333;

app.use(express.json());
app.use(cors());

app.use("/macroservices", routerMacroservices);
