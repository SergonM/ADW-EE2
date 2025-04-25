WITH source AS (
    SELECT * FROM {{ source('sakila_proxy', 'city') }}
)
SELECT
    city_id,
    city,
    country_id,
    last_update
FROM source