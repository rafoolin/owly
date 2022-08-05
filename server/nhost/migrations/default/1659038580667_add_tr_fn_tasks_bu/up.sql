-- This trigger will update the [created_at] on [tasks] table based on the [comlpeted_at]
-- If [completed_at] is [true] it will set to [now()] otherwise to [null]
CREATE OR REPLACE FUNCTION public.tr_fn_tasks_bu ()
    RETURNS TRIGGER
    AS $tr_fn_tasks_bu$
BEGIN
    IF TG_OP = 'UPDATE' THEN
        -- Update the [completed_at] based on [completed]
        IF (NEW.completed != OLD.completed) THEN
            NEW.completed_at := CASE NEW.completed
            WHEN TRUE THEN
                now()
            ELSE
                NULL
            END;
        END IF;
        -- If user change the [category_id], update the [category_color] based on that
        IF (NEW.category_id != OLD.category_id) THEN
            NEW.category_color :=
            (SELECT
                color
            FROM
                categories
            WHERE
                id = NEW.category_id);
        END IF;
    END IF;
    RETURN NEW;
END;
$tr_fn_tasks_bu$
LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS tr_tasks_bu ON "public"."tasks";

CREATE TRIGGER tr_tasks_bu
    BEFORE UPDATE ON "public"."tasks"
    FOR EACH ROW
    EXECUTE FUNCTION tr_fn_tasks_bu ();

