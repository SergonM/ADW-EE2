WITH source AS (
    SELECT * FROM {{ source('sakila_proxy', 'language') }}
)
SELECT
    language_id,
    name
FROM source