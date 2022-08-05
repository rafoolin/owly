CREATE OR REPLACE FUNCTION public.tr_fn_sub_tasks_ad ()
  RETURNS TRIGGER
  AS $tr_fn_sub_tasks_ad$
BEGIN
  -- Refresh [tasks] [completed], because a sub-task is deleted
  PERFORM
    fn_refresh_tasks_completed (OLD.task_id);
  RETURN OLD;
END;
$tr_fn_sub_tasks_ad$
LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS tr_sub_tasks_ad ON "public"."sub_tasks";

CREATE TRIGGER tr_sub_tasks_ad
  AFTER DELETE ON "public"."sub_tasks"
  FOR EACH ROW
  EXECUTE FUNCTION tr_fn_sub_tasks_ad ();
