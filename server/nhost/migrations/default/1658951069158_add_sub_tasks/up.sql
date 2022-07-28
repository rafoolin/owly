CREATE TABLE "public"."sub_tasks" (
  "id" uuid NOT NULL DEFAULT gen_random_uuid(),
  "user_id" uuid NOT NULL,
  "title" text NOT NULL,
  "task_id" uuid NOT NULL,
  "due_at" time NOT NULL DEFAULT now(),
  "completed" boolean NOT NULL DEFAULT false,
  "created_at" timestamptz NOT NULL DEFAULT now(),
  "updated_at" timestamptz,
  "note" text,
  "index_value" integer,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("task_id") REFERENCES "public"."tasks"("id") ON UPDATE restrict ON DELETE cascade
);
