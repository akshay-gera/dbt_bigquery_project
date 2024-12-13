WITH raw_listings AS(
    SELECT
        id AS listing_id,
        listing_url,
        name AS listing_name,
        room_type AS listing_room_type ,
        minimum_nights,
        host_id,
        price AS listing_price,
        created_at,
        updated_at
    FROM
        {{ source('Raw', 'Raw_Listings') }}
)
SELECT 
    *
FROM 
    raw_listings