/*  
 This trigger will update the [completed] on [sub_tasks] table based on the
 [tasks]'s [completed].
 
 User can use a button to mark all the sub-tasks as done, in this case we ignore
 the value of the [completed] from [sub_tasks].
 */
CREATE OR REPLACE FUNCTION public.tr_fn_tasks_au ()
  RETURNS TRIGGER
  AS $tr_fn_tasks_au$
BEGIN
  IF TG_OP = 'UPDATE' THEN
    IF NEW.completed = TRUE THEN
      -- Set [false] [sub_tasks]'s [completed] column to [true] if [NEW.completed] is true.
      UPDATE
        sub_tasks
      SET
        completed = TRUE
      WHERE
        sub_tasks.task_id = NEW.id and sub_tasks.completed = FALSE;
    END IF;
  END IF;
  RETURN NEW;
END;
$tr_fn_tasks_au$
LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS tr_tasks_au ON "public"."tasks";

CREATE TRIGGER tr_tasks_au
  AFTER UPDATE OF completed ON "public"."tasks"
  FOR EACH ROW
  WHEN (NEW.completed IS DISTINCT FROM OLD.completed)
  EXECUTE FUNCTION tr_fn_tasks_au ();

