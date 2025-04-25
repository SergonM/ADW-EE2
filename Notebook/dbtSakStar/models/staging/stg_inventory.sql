WITH source AS (
    SELECT * FROM {{ source('sakila_proxy', 'inventory') }}
)
SELECT
    inventory_id,
    film_id,
    store_id,
    last_update
FROM source