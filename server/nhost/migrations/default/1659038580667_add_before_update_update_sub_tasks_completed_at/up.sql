CREATE OR REPLACE FUNCTION public.fill_sub_stask_completed_at ()
    RETURNS TRIGGER
    AS $fill_sub_stask_completed_at$
BEGIN
    IF TG_OP = 'UPDATE' THEN
        NEW.completed_at := CASE NEW.completed
        WHEN TRUE THEN
            now()
        ELSE
            NULL
        END;
        RETURN NEW;
    END IF;
END;
$fill_sub_stask_completed_at$
LANGUAGE plpgsql;


DROP TRIGGER IF EXISTS before_update_fill_sub_tasks_completed_at ON "public"."sub_tasks";
CREATE TRIGGER before_update_fill_sub_tasks_completed_at
    BEFORE UPDATE OF completed ON "public"."sub_tasks"
    FOR EACH ROW
    WHEN (OLD.completed IS DISTINCT FROM NEW.completed)
    EXECUTE FUNCTION fill_sub_stask_completed_at ();

