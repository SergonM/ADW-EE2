WITH source AS (
    SELECT * FROM {{ source('sakila_proxy', 'staff') }}
)
SELECT
    staff_id,
    first_name,
    last_name,
    address_id,
    email,
    store_id,
    active,
    username,
    last_update
FROM source