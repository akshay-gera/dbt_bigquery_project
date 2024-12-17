/*
{{
  config(
    materialized = 'incremental',
    on_schema_change = 'fail',
  )
}}
*/
{{
  config(
    materialized = 'table',
    on_schema_change = 'fail'
    )
}}
WITH src_reviews AS (
    SELECT
        listing_id,
        date AS review_date,
        reviewer_name,
        comments AS review_text,
        sentiment
    FROM
        {{ ref('src_reviews') }}
    WHERE comments IS NOT NULL
)

SELECT 
    listing_id,
    review_date,
    reviewer_name,
    review_text,
    sentiment
FROM src_reviews

/*
{% if is_incremental() %}
  WHERE review_date > (SELECT MAX(review_date) FROM {{ this }})
{% endif %}
*/