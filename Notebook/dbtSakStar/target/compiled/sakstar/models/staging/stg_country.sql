WITH source AS (
    SELECT * FROM `sakila_proxy`.`country`
)
SELECT
    country_id,
    country
FROM source