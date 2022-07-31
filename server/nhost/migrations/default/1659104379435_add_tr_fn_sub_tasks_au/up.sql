/*  
 This trigger will update the [completed] on [tasks] table based on the
 [sub_tasks]'s [completed].
 User can also manually change it.
 
 User can use a button to mark all the sub-tasks as done, in this case we ignore
 the value of the [completed] from [sub_tasks].
 But if user didn't assign a value manually, it wil be based on [completed] from
 [sub_tasks].
 
 This value will be [true] if and only if all [sub_tasks]'s [completed] are true.
 */
CREATE OR REPLACE FUNCTION public.tr_fn_sub_tasks_au ()
  RETURNS TRIGGER
  AS $tr_fn_sub_tasks_au$
DECLARE
  has_completed bool;
BEGIN
  IF TG_OP = 'UPDATE' THEN
    -- If [sub_tasks]'s [completed] is false, [tasks]'s one should be false as well
    -- but if it is true, we should check other syb-tasks of this task.
    has_completed := NEW.completed;
    -- Check to see if any sub-tasks for this [task_id] is not completed yet(bieng fals)
    IF NEW.completed = TRUE THEN
      SELECT
        FALSE INTO has_completed
      FROM
        sub_tasks
      WHERE
        task_id = NEW.task_id
        AND completed = FALSE
      LIMIT 1;
      -- If all sub-tasks are [true], [select] will set [has_completed] to null.
      has_completed := COALESCE(has_completed, TRUE);
    END IF;
    -- Update [tasks] [completed] column based on the [sub_tasks] [completed] column
    UPDATE
      tasks
    SET
      completed = has_completed
    WHERE
      id = NEW.task_id;
    RETURN NEW;
  END IF;
END;
$tr_fn_sub_tasks_au$
LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS tr_sub_tasks_au ON "public"."sub_tasks";

CREATE TRIGGER tr_sub_tasks_au
  AFTER UPDATE OF completed ON "public"."sub_tasks"
  FOR EACH ROW
  WHEN (NEW.completed IS DISTINCT FROM OLD.completed)
  EXECUTE FUNCTION tr_fn_sub_tasks_au ();

