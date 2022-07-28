-- Create [categories] table
CREATE TABLE "public"."categories" (
    "id" uuid NOT NULL DEFAULT gen_random_uuid (),
    "name" text NOT NULL,
    "user_id" uuid NOT NULL,
    "created_at" timestamptz NOT NULL DEFAULT NOW(),
    "update_at" timestamptz,
    -- In Dart, [0] is equivelant to [Colors.transparent]
    "color" bigint DEFAULT 0,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("user_id") REFERENCES "auth"."users" ("id") ON UPDATE RESTRICT ON DELETE CASCADE,
    CONSTRAINT "categories_id_color_key" UNIQUE ("id", "color")
);

CREATE EXTENSION IF NOT EXISTS pgcrypto;

