
  
    
    
    
        
         


        insert into `adw02_stag`.`stg_staff`
        ("staff_key", "staff_first_name", "staff_last_name", "staff_email", "staff_active", "staff_username", "staff_password", "staff_last_update", "store_id")WITH source AS (
    SELECT * FROM sakila_proxy.staff
)
SELECT
    staff_id as staff_key,
    first_name as staff_first_name,
    last_name as staff_last_name,
    email as staff_email,
    active as staff_active,
    username as staff_username,
    password as staff_password,
    last_update as staff_last_update,
    store_id as store_id
FROM source
  