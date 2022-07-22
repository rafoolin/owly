-- Create [public.vm_user_categories] view
DROP VIEW IF EXISTS public.vm_user_categories;

CREATE VIEW public.vm_user_categories AS
SELECT
    *
FROM
    public.categories
ORDER BY
    name;
