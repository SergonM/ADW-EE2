WITH source AS (
    SELECT * FROM `sakila_proxy`.`language`
)
SELECT
    language_id,
    name
FROM source