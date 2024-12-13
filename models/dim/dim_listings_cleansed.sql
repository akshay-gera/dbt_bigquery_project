WITH src_listings AS (
    SELECT 
        *
     FROM  `dbt-integration-444313.Dev.src_listings`
)
SELECT 
    listing_id,
    listing_name,
    listing_room_type,
    CASE
        WHEN minimum_nights = 0 THEN 1
        ELSE minimum_nights
    END AS minimum_nights,
    host_id,
    CAST(REPLACE(CAST(listing_price AS STRING), '$', '') AS NUMERIC) AS price,
    created_at,
    updated_at
FROM
    src_listings