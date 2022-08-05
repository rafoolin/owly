CREATE OR REPLACE FUNCTION public.tr_fn_sub_tasks_au ()
  RETURNS TRIGGER
  AS $tr_fn_sub_tasks_au$
BEGIN
  -- Refresh [tasks] [completed], because a the sub-task is updated
  PERFORM
    fn_refresh_tasks_completed (NEW.task_id);
  RETURN NEW;
END;
$tr_fn_sub_tasks_au$
LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS tr_sub_tasks_au ON "public"."sub_tasks";

CREATE TRIGGER tr_sub_tasks_au
  AFTER UPDATE ON "public"."sub_tasks"
  FOR EACH ROW
  EXECUTE FUNCTION tr_fn_sub_tasks_au ();

