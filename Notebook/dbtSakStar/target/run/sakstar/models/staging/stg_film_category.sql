insert into `adw02_stag`.`stg_film_category`
        ("film_id", "category_id")WITH source AS (
    SELECT * FROM `sakila_proxy`.`film_category`
)
SELECT
    film_id,
    category_id
FROM source
  