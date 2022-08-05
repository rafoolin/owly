CREATE OR REPLACE FUNCTION public.tr_fn_sub_tasks_ai ()
  RETURNS TRIGGER
  AS $tr_fn_sub_tasks_ai$
BEGIN
  -- Refresh [tasks] [completed], because a new sub-task is added
  PERFORM
    fn_refresh_tasks_completed (NEW.task_id);
  RETURN NEW;
END;
$tr_fn_sub_tasks_ai$
LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS tr_sub_tasks_ai ON "public"."sub_tasks";

CREATE TRIGGER tr_sub_tasks_ai
  AFTER INSERT ON "public"."sub_tasks"
  FOR EACH ROW
  EXECUTE FUNCTION tr_fn_sub_tasks_ai ();

