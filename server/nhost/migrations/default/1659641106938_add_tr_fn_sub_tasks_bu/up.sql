CREATE OR REPLACE FUNCTION public.tr_fn_sub_tasks_bu ()
  RETURNS TRIGGER
  AS $tr_fn_sub_tasks_bu$
BEGIN
  IF TG_OP = 'UPDATE' THEN
    -- Update the [sub_tasks][completed_at] based on [completed]
    IF (NEW.completed != OLD.completed) THEN
        NEW.completed_at := CASE NEW.completed
        WHEN TRUE THEN
            now()
        ELSE
            NULL
        END;
    END IF;
  END IF;
  RETURN NEW;
END;
$tr_fn_sub_tasks_bu$
LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS tr_sub_tasks_bu ON "public"."sub_tasks";

CREATE TRIGGER tr_sub_tasks_bu
  BEFORE UPDATE ON "public"."sub_tasks"
  FOR EACH ROW
  EXECUTE FUNCTION tr_fn_sub_tasks_bu ();
