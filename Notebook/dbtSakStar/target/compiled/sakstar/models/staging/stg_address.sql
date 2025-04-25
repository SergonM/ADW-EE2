WITH source AS (
    SELECT * FROM `sakila_proxy`.`address`
)
SELECT
    address_id,
    address,
    address2,
    district,
    city_id,
    postal_code,
    phone,
    last_update
FROM source