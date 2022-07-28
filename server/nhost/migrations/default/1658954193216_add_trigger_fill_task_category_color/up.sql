CREATE OR REPLACE FUNCTION fill_task_category_color ()
    RETURNS TRIGGER
    AS $trigger_fill_task_category_color$
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
$trigger_fill_task_category_color$
LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS before_insert_fill_task_category_color ON "public"."tasks";
CREATE TRIGGER before_insert_fill_task_category_color
    BEFORE INSERT ON "public"."tasks"
    FOR EACH ROW
    EXECUTE FUNCTION fill_task_category_color ();