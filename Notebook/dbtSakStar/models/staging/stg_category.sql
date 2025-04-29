WITH source AS (
    SELECT * FROM {{ source('sakila_proxy', 'category') }}
)
SELECT
    category_id,
    name
FROM source