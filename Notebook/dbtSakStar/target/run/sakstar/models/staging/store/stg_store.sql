
  
    
    
    
        
         


        insert into `adw02_stag`.`stg_store`
        ("store_key", "store_address", "store_postal_code", "store_phone_number", "store_city", "store_country", "store_manager_staff_id", "store_manager_first_name", "store_manager_last_name", "store_last_update")WITH source AS (
    SELECT * FROM sakila_proxy.store
),
joined AS (
    SELECT
        s.store_id as store_key,
        a.address as store_address,
        a.postal_code as store_postal_code,
        a.phone as store_phone_number,
        ci.city as store_city,
        co.country as store_country,
        s.manager_staff_id as store_manager_staff_id,
        stf.first_name as store_manager_first_name,
        stf.last_name as store_manager_last_name,
        s.last_update as store_last_update
    FROM source s
    JOIN sakila_proxy.address a ON s.address_id = a.address_id
    JOIN sakila_proxy.city ci ON a.city_id = ci.city_id
    JOIN sakila_proxy.country co ON ci.country_id = co.country_id
    JOIN sakila_proxy.staff stf ON s.manager_staff_id = stf.staff_id
)
SELECT * FROM joined
  