insert into `adw02_stag`.`stg_category`
        ("category_id", "name")WITH source AS (
    SELECT * FROM `sakila_proxy`.`category`
)
SELECT
    category_id,
    name
FROM source
  