DROP FUNCTION IF EXISTS fill_sub_stask_completed_at ();
DROP TRIGGER IF EXISTS before_update_fill_sub_tasks_completed_at ON "public"."sub_tasks";

