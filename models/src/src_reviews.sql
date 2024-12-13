 WITH raw_reviews AS(
    SELECT
        listing_id,
        date,
        reviewer_name,
        comments,
        sentiment
    FROM
        {{ source('Raw', 'Raw_Reviews') }}
 )
SELECT 
    *
FROM 
    raw_reviews