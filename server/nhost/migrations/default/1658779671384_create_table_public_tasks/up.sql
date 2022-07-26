CREATE TABLE "public"."tasks" (
  "id" uuid NOT NULL DEFAULT gen_random_uuid(),
  "user_id" uuid NOT NULL,
  "category_id" uuid NOT NULL,
  "parent_id" uuid,
  "title" text NOT NULL,
  "date_time" timestamptz NOT NULL DEFAULT now(),
  "note" text,
  "completed" boolean NOT NULL DEFAULT false,
  "created_at" timestamptz NOT NULL DEFAULT now(),
  "updated_at" timestamptz,
  "completed_at" timestamptz,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON UPDATE restrict ON DELETE cascade,
  FOREIGN KEY ("category_id") REFERENCES "public"."categories"("id") ON UPDATE restrict ON DELETE cascade
);
CREATE EXTENSION IF NOT EXISTS pgcrypto;
-- set fk_public_tasks_parent_id
alter table "public"."tasks"
add constraint "tasks_parent_id_fkey" foreign key ("parent_id") references "public"."tasks" ("id") on update restrict on delete cascade;