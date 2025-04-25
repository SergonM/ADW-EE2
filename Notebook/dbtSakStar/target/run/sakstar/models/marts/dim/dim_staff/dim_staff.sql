
  
    
    
    
        
         


        insert into `adw02_star`.`dim_staff`
        ("staff_skey", "staff_id", "staff_first_name", "staff_last_name", "staff_email", "staff_active", "staff_username", "staff_address", "staff_district", "staff_postal_code", "staff_phone_number", "staff_city", "staff_country", "store_id", "staff_last_update")WITH staff AS (
    SELECT * FROM `adw02_stag`.`stg_staff`
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
        lower(hex(MD5(toString(coalesce(cast(staff_id as String), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(staff_first_name as String), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(staff_last_name as String), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(staff_email as String), '_dbt_utils_surrogate_key_null_') )))) AS staff_skey,
        s.staff_id AS staff_id,
        s.first_name AS staff_first_name,
        s.last_name AS staff_last_name,
        s.email AS staff_email,
        s.active AS staff_active,
        s.username AS staff_username,
        a.address AS staff_address,
        a.district AS staff_district,
        a.postal_code AS staff_postal_code,
        a.phone AS staff_phone_number,
        ci.city AS staff_city,
        co.country AS staff_country,
        s.store_id AS store_id,
        s.last_update AS staff_last_update
    FROM staff s
    LEFT JOIN addresses a ON s.address_id = a.address_id
    LEFT JOIN cities ci ON a.city_id = ci.city_id
    LEFT JOIN countries co ON ci.country_id = co.country_id
)
SELECT * FROM final
  