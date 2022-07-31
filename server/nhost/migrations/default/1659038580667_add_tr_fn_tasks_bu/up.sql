-- This trigger will update the [created_at] on [tasks] table based on the [comlpeted_at]
-- If [completed_at] is [true] it will set to [now()] otherwise to [null]
CREATE OR REPLACE FUNCTION public.tr_fn_tasks_bu ()
    RETURNS TRIGGER
    AS $tr_fn_tasks_bu$
BEGIN
    IF TG_OP = 'UPDATE' THEN
        NEW.completed_at := CASE NEW.completed
        WHEN TRUE THEN
            now()
        ELSE
            NULL
        END;
    END IF;
    RETURN NEW;
END;
$tr_fn_tasks_bu$
LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS tr_tasks_bu ON "public"."tasks";
CREATE TRIGGER tr_tasks_bu
    BEFORE UPDATE OF completed ON "public"."tasks"
    FOR EACH ROW
    WHEN (OLD.completed IS DISTINCT FROM NEW.completed)
    EXECUTE FUNCTION tr_fn_tasks_bu ();

