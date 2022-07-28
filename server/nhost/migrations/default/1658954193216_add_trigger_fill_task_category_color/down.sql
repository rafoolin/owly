DROP FUNCTION IF EXISTS trigger_fill_task_category_color ();
DROP TRIGGER IF EXISTS before_insert_fill_tasks_category_color ON "public"."tasks";