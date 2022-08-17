CREATE OR REPLACE VIEW "public"."vm_tasks_on_date" AS 
 SELECT tasks.id,
    tasks.user_id,
    tasks.title,
    tasks.category_id,
    tasks.completed,
    tasks.due_datetime,
    date(tasks.due_datetime) as due_date,
    tasks.completed_at,
    tasks.created_at,
    tasks.updated_at,
    tasks.note,
    tasks.index_value,
    tasks.category_color
   FROM tasks;
