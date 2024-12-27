
WITH reviews AS(
    SELECT
        *
    FROM 
        {{ ref('fct_reviews') }}
),
full_moon_dates AS(
    SELECT
        *
    FROM
        {{ ref('seed_full_moon_dates') }}
)
SELECT
    r.*,
    CASE 
        WHEN fm.full_moon_date IS NULL
            THEN 'not full moon'
        ELSE 'full moon'
    END AS is_full_moon
FROM
    reviews AS r
LEFT JOIN full_moon_dates AS fm
ON DATE(r.review_date) = DATE_ADD( fm.full_moon_date, INTERVAL 1 DAY)

