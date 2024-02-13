WITH ratios AS (
    SELECT (downvotes::float / upvotes::float) AS ratio
    FROM public.epix_posts
    WHERE author_id = 933 and id != 139
),
avg_ratio AS (
    SELECT AVG(ratio) AS average_ratio
    FROM ratios
)
UPDATE public.epix_posts
SET downvotes =
(
    SELECT (upvotes * average_ratio)::int
    FROM avg_ratio
)
WHERE id = 139;
