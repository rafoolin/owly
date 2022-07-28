DROP FUNCTION IF EXISTS trigger_fill_task_category_color ();
DROP TRIGGER IF EXISTS trigger_before_update_fill_task_category_color ON "public"."categories";
DROP TRIGGER IF EXISTS trigger_before_insert_fill_task_category_color ON "public"."categories";
