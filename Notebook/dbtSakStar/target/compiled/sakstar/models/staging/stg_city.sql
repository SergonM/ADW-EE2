WITH source AS (
    SELECT * FROM `sakila_proxy`.`city`
)
SELECT
    city_id,
    city,
    country_id,
    last_update
FROM source