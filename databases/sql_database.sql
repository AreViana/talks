CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TYPE "products_status" AS ENUM (
  'out_of_stock',
  'in_stock'
);

CREATE TABLE "clients" (
  "client_id" SERIAL PRIMARY KEY,
  "dui" varchar UNIQUE,
  "full_name" varchar,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "products" (
  "product_id" SERIAL PRIMARY KEY,
  "sku" varchar UNIQUE NOT NULL DEFAULT (uuid_generate_v4()),
  "name" varchar,
  "price" decimal(5,2) NOT NULL DEFAULT 0,
  "category" varchar NOT NULL DEFAULT 'generic',
  "status" products_status NOT NULL DEFAULT 'in_stock',
  "created_at" timestamp DEFAULT (now()),
  "deleted_at" timestamp,
  "details" jsonb DEFAULT '{}'
);

CREATE TABLE "invoices" (
  "invoice_id" SERIAL PRIMARY KEY,
  "client_id" int,
  "product_id" int,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "available_products" (
  "product_id" SERIAL PRIMARY KEY,
  "sku" varchar UNIQUE NOT NULL DEFAULT (uuid_generate_v4()),
  "name" varchar,
  "price" decimal(5,2) NOT NULL DEFAULT 0,
  "category" varchar NOT NULL DEFAULT 'generic',
  "status" products_status NOT NULL DEFAULT 'in_stock',
  "created_at" timestamp DEFAULT (now()),
  "deleted_at" timestamp,
  "details" jsonb DEFAULT '{}'
);

ALTER TABLE "invoices" ADD FOREIGN KEY ("client_id") REFERENCES "clients" ("client_id");

ALTER TABLE "invoices" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("product_id");
