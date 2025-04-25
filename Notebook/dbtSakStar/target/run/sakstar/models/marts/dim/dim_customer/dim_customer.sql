
  
    
    
    
        
         


        insert into `adw02_star`.`dim_customer`
        ("customer_skey", "customer_id", "customer_first_name", "customer_last_name", "customer_email", "customer_active", "customer_created", "customer_address", "customer_district", "customer_postal_code", "customer_phone_number", "customer_city", "customer_country", "customer_last_update")WITH customers AS (
    SELECT * FROM `adw02_stag`.`stg_customer`
),
addresses AS (
    SELECT * FROM `adw02_stag`.`stg_address`
),
cities AS (
    SELECT * FROM `adw02_stag`.`stg_city`
),
countries AS (
    SELECT * FROM `adw02_stag`.`stg_country`
),
final AS (
    SELECT
        lower(hex(MD5(toString(coalesce(cast(customer_id as String), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(customer_first_name as String), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(customer_last_name as String), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(customer_email as String), '_dbt_utils_surrogate_key_null_') )))) AS customer_skey,
        c.customer_id AS customer_id,
        c.first_name AS customer_first_name,
        c.last_name AS customer_last_name,
        c.email AS customer_email,
        c.active AS customer_active,
        c.create_date AS customer_created,
        a.address AS customer_address,
        a.district AS customer_district,
        a.postal_code AS customer_postal_code,
        a.phone AS customer_phone_number,
        ci.city AS customer_city,
        co.country AS customer_country,
        c.last_update AS customer_last_update
    FROM customers c
    LEFT JOIN addresses a ON c.address_id = a.address_id
    LEFT JOIN cities ci ON a.city_id = ci.city_id
    LEFT JOIN countries co ON ci.country_id = co.country_id
)
SELECT * FROM final
ORDER BY customer_id
  