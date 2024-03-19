-- CreateTable
CREATE TABLE "addresses_works" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "street" VARCHAR(255) NOT NULL,
    "number" INTEGER NOT NULL,
    "cep" VARCHAR(9) NOT NULL,
    "city" VARCHAR(50) NOT NULL,
    "state" VARCHAR(50) NOT NULL,

    CONSTRAINT "addresses_works_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "contracts" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(50) NOT NULL,

    CONSTRAINT "contracts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "employees" (
    "id" SERIAL NOT NULL,
    "ra" VARCHAR(8) NOT NULL,
    "first_name" VARCHAR(50) NOT NULL,
    "last_name" VARCHAR(50) NOT NULL,
    "alternative_name" VARCHAR(50) NOT NULL,
    "admission_date" DATE NOT NULL,
    "salary" DECIMAL(12,2) NOT NULL,
    "lunch_cost" DECIMAL(10,2) NOT NULL,
    "ticket_cost" DECIMAL(10,2) NOT NULL,
    "payment_id" INTEGER NOT NULL,
    "contract_id" INTEGER NOT NULL,
    "position_id" INTEGER NOT NULL,
    "dinner" VARCHAR(3) NOT NULL,
    "lunch" VARCHAR(3) NOT NULL,
    "total_cost" DECIMAL(12,2) NOT NULL,

    CONSTRAINT "employees_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "macroservices" (
    "id" SERIAL NOT NULL,
    "macroservice" VARCHAR(100) NOT NULL,

    CONSTRAINT "macroservices_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "payments" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(50) NOT NULL,

    CONSTRAINT "payments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "permissions" (
    "id" SERIAL NOT NULL,
    "access_name" VARCHAR(50) NOT NULL,

    CONSTRAINT "permissions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "positions" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(50) NOT NULL,

    CONSTRAINT "positions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "presence_controls" (
    "id" SERIAL NOT NULL,
    "obra_id" INTEGER NOT NULL,
    "employee_id" INTEGER NOT NULL,
    "presence_date" DATE NOT NULL,
    "arrival_time" VARCHAR(10) NOT NULL,

    CONSTRAINT "presence_controls_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "productivity_controls" (
    "id" SERIAL NOT NULL,
    "employee_id" INTEGER NOT NULL,
    "obra_id" INTEGER NOT NULL,
    "place" VARCHAR(50) NOT NULL,
    "sub_id" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    "weight" INTEGER NOT NULL,
    "created_at" DATE NOT NULL,
    "ambient" VARCHAR(50) NOT NULL,

    CONSTRAINT "productivity_controls_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "quality_controls" (
    "id" SERIAL NOT NULL,
    "productivity_id" INTEGER NOT NULL,
    "nonconformity" VARCHAR(3) NOT NULL,
    "operation" VARCHAR(255),

    CONSTRAINT "quality_controls_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "subservices" (
    "id" SERIAL NOT NULL,
    "macro_id" INTEGER NOT NULL,
    "unit_id" INTEGER NOT NULL,
    "subservice" VARCHAR(100) NOT NULL,

    CONSTRAINT "subservices_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "units" (
    "id" SERIAL NOT NULL,
    "unit" VARCHAR(30) NOT NULL,

    CONSTRAINT "units_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users" (
    "id" SERIAL NOT NULL,
    "username" VARCHAR(100) NOT NULL,
    "first_name" VARCHAR(50) NOT NULL,
    "last_name" VARCHAR(50) NOT NULL,
    "password_hash" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL,
    "permission_id" INTEGER NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "works_managements" (
    "id" SERIAL NOT NULL,
    "obra_id" INTEGER NOT NULL,
    "place" VARCHAR(50) NOT NULL,
    "ambient" VARCHAR(50) NOT NULL,
    "sub_id" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    "weight" INTEGER NOT NULL,

    CONSTRAINT "works_managements_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "addresses_works_cep_key" ON "addresses_works"("cep");

-- CreateIndex
CREATE UNIQUE INDEX "employees_ra_key" ON "employees"("ra");

-- CreateIndex
CREATE UNIQUE INDEX "presence_controls_obra_id_key" ON "presence_controls"("obra_id");

-- CreateIndex
CREATE UNIQUE INDEX "users_username_key" ON "users"("username");

-- AddForeignKey
ALTER TABLE "employees" ADD CONSTRAINT "fk_contract" FOREIGN KEY ("contract_id") REFERENCES "contracts"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "employees" ADD CONSTRAINT "fk_payment" FOREIGN KEY ("payment_id") REFERENCES "payments"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "employees" ADD CONSTRAINT "fk_position" FOREIGN KEY ("position_id") REFERENCES "positions"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "presence_controls" ADD CONSTRAINT "fk_employee" FOREIGN KEY ("employee_id") REFERENCES "employees"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "presence_controls" ADD CONSTRAINT "fk_work" FOREIGN KEY ("obra_id") REFERENCES "addresses_works"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "productivity_controls" ADD CONSTRAINT "fk_employee" FOREIGN KEY ("employee_id") REFERENCES "employees"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "productivity_controls" ADD CONSTRAINT "fk_subservice" FOREIGN KEY ("sub_id") REFERENCES "subservices"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "productivity_controls" ADD CONSTRAINT "fk_work" FOREIGN KEY ("obra_id") REFERENCES "addresses_works"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quality_controls" ADD CONSTRAINT "fk_productivity" FOREIGN KEY ("productivity_id") REFERENCES "productivity_controls"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "subservices" ADD CONSTRAINT "fk_macroservice" FOREIGN KEY ("macro_id") REFERENCES "macroservices"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "subservices" ADD CONSTRAINT "fk_unit" FOREIGN KEY ("unit_id") REFERENCES "units"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "fk_permission" FOREIGN KEY ("permission_id") REFERENCES "permissions"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "works_managements" ADD CONSTRAINT "fk_subservice" FOREIGN KEY ("sub_id") REFERENCES "subservices"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "works_managements" ADD CONSTRAINT "fk_work" FOREIGN KEY ("obra_id") REFERENCES "addresses_works"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
