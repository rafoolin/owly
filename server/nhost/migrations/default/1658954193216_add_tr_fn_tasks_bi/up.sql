CREATE OR REPLACE FUNCTION tr_fn_tasks_bi ()
    RETURNS TRIGGER
    AS $tr_fn_tasks_bi$
DECLARE
    categoryColor bigint;
BEGIN
    -- Get category color from [categories] table and
    -- fill [category_color] with that value.
    IF TG_OP = 'INSERT' THEN
        SELECT
            color INTO categoryColor
        FROM
            "public"."categories"
        WHERE
            "public"."categories".id = NEW.category_id;
        NEW.category_color := categoryColor;
        RETURN NEW;
    END IF;
END;
$tr_fn_tasks_bi$
LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS tr_tasks_bi ON "public"."tasks";
CREATE TRIGGER tr_tasks_bi
    BEFORE INSERT ON "public"."tasks"
    FOR EACH ROW
    EXECUTE FUNCTION tr_fn_tasks_bi ();