/*  
 This function will update the [completed] on [tasks] table based on the
 [sub_tasks]'s [completed].
 This value will be [true] if and only if all [sub_tasks]'s [completed] are true.
 */
CREATE OR REPLACE FUNCTION public.fn_refresh_tasks_completed (taskId uuid)
  RETURNS void
  AS $$
DECLARE
  has_completed bool;
BEGIN
  -- Check to see if there is any uncompleted subtasks or not, if yes, this
  -- task is also uncompleted.
  SELECT
    FALSE INTO has_completed
  FROM
    sub_tasks
  WHERE
    sub_tasks.task_id = taskId
    AND completed = FALSE
  LIMIT 1;
  -- If all sub-tasks are [true], [select] will set [has_completed] to null.
  has_completed := COALESCE(has_completed, TRUE);
  -- Update [tasks][completed] column based on the [has_completed]
  UPDATE
    tasks
  SET
    completed = has_completed
  WHERE
    tasks.id = taskId;
END;
$$
LANGUAGE plpgsql;

