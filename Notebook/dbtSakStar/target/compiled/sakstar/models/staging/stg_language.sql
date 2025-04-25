WITH source AS (
    SELECT * FROM `sakila_proxy`.`language`
)
SELECT
    language_id,
    name,
    last_update
FROM source