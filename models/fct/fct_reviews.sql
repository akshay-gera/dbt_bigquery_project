{{
  config(
    materialized = 'incremental',
    on_schema_change = 'fail',
    )
}}

WITH src_reviews AS(
    SELECT
        *
    FROM
        {{ ref('src_reviews') }}
)
SELECT 
    listing_id,
    date AS review_date,
    reviewer_name,
    comments AS review_text,
    sentiment
FROM src_reviews
WHERE comments is not null

{% if is_incremental() %}
  AND date >= (select max(date) from {{ this }})
  
{% endif %}