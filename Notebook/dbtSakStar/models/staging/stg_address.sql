WITH source AS (
    SELECT * FROM {{ source('sakila_proxy', 'address') }}
)
SELECT
    address_id,
    address,
    district,
    city_id,
    postal_code,
    phone,
    last_update
FROM source