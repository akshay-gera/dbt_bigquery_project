WITH raw_hosts AS(
    SELECT
        id AS host_id,
        name AS host_name,
        is_superhost,
        created_at,
        updated_at
    FROM
        {{ source('Raw', 'Raw_Hosts') }}
)
SELECT 
    *
FROM
    raw_hosts