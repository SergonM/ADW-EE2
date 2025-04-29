WITH source AS (
    SELECT * FROM `sakila_proxy`.`category`
)
SELECT
    category_id,
    name
FROM source