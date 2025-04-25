WITH source AS (
    SELECT * FROM {{ source('sakila_proxy', 'country') }}
)
SELECT
    country_id,
    country
FROM source

