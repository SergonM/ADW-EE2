WITH source AS (
    SELECT * FROM {{ source('sakila_proxy', 'country') }}
)
SELECT
    country_id,
    country,
    last_update
FROM source

