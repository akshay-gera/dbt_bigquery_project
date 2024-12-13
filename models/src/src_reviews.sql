
 
 WITH raw_reviews AS(
    SELECT
        listing_id,
        date,
        reviewer_name,
        comments,
        sentiment
    FROM
        {{ source('Raw', 'raw_reviews_permanent') }}
 )
SELECT 
    *
FROM 
    raw_reviews