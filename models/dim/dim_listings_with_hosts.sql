WITH hosts AS(
    SELECT
        host_id,
        host_name,
        is_superhost,
        created_at AS host_created_at,
        updated_at AS host_updated_at
    FROM 
        {{ ref('dim_hosts') }}
),
listings AS(
    SELECT
        listing_id,
        listing_name,
        listing_room_type,
        minimum_nights,
        price,
        created_at AS listing_created_at,
        updated_at AS listing_updated_at,
        host_id
    FROM
        {{ ref('dim_listings_cleansed') }}
)
SELECT
    l.listing_id,
    l.listing_name,
    l.listing_room_type,
    l.minimum_nights,
    l.price,
    l.host_id,
    h.host_name,
    h.is_superhost,
    GREATEST(l.listing_created_at, h.host_created_at) AS created_at,
    GREATEST(h.host_updated_at, l.listing_updated_at) AS updated_at
FROM
    listings AS l
LEFT JOIN
    hosts AS h
ON l.host_id = h.host_id