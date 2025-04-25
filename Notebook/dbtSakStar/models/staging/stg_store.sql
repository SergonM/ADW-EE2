WITH source AS (
    SELECT * FROM {{ source('sakila_proxy', 'store') }}
)
SELECT
    store_id,
    manager_staff_id,
    address_id,
    last_update
FROM source