-- Create [categories] table
CREATE TABLE "public"."categories" (
    "id" uuid NOT NULL DEFAULT gen_random_uuid (),
    "name" text NOT NULL,
    "user_id" uuid NOT NULL,
    "created_at" timestamptz NOT NULL DEFAULT NOW(),
    "update_at" timestamptz,
    "color" BIGINT,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("user_id") REFERENCES "auth"."users" ("id") ON UPDATE RESTRICT ON DELETE CASCADE
);

CREATE EXTENSION IF NOT EXISTS pgcrypto;

