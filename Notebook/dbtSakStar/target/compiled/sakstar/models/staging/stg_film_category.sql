WITH source AS (
    SELECT * FROM `sakila_proxy`.`film_category`
)
SELECT
    film_id,
    category_id
FROM source