{% snapshot scd_raw_listings %}

{{
    config(
        target_schema='Dev',
        unique_key='id',
        strategy='timestamp',
        updated_at='updated_at',
        invalidate_hard_deletes=True
    )
}}

SELECT 
    * 
FROM {{ source('Raw', 'Raw_Listings') }}

{% endsnapshot %}