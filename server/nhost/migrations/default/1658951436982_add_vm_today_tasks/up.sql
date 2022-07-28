CREATE OR REPLACE VIEW "public"."vm_today_tasks" AS 
 SELECT *
   FROM tasks
  WHERE (date(tasks.due_datetime) = CURRENT_DATE);
