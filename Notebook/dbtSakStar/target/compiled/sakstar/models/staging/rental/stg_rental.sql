WITH source AS (
    SELECT * FROM sakila_proxy.rental
),
inventory AS (
    SELECT * FROM sakila_proxy.inventory
)
SELECT
    r.rental_id as rental_key,
    r.customer_id as customer_key,
    i.film_id as film_key,
    r.staff_id as staff_key,
    i.store_id as store_key,
    r.rental_date,
    r.return_date,
    i.inventory_id,
    DATEDIFF('second', r.rental_date, r.return_date) as rental_duration,
    r.last_update
FROM source r
JOIN inventory i ON r.inventory_id = i.inventory_id