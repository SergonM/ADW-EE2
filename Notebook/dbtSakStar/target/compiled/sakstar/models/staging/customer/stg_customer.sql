WITH source AS (
    SELECT * FROM sakila_proxy.customer
),
joined AS (
    SELECT
        c.customer_id as customer_key,
        c.first_name as customer_first_name,
        c.last_name as customer_last_name,
        c.email as customer_email,
        c.active as customer_active,
        c.create_date as customer_created,
        a.address as customer_address,
        a.postal_code as customer_postal_code,
        a.phone as customer_phone_number,
        ci.city as customer_city,
        co.country as customer_country,
        c.last_update as customer_last_update,
        c.address_id,
        c.store_id
    FROM source c
    JOIN sakila_proxy.address a ON c.address_id = a.address_id
    JOIN sakila_proxy.city ci ON a.city_id = ci.city_id
    JOIN sakila_proxy.country co ON ci.country_id = co.country_id
)
SELECT * FROM joined