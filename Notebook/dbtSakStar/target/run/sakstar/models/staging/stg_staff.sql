
  
    
    
    
        
         


        insert into `adw02_stag`.`stg_staff`
        ("staff_id", "first_name", "last_name", "address_id", "picture", "email", "store_id", "active", "username", "password", "last_update")WITH source AS (
    SELECT * FROM `sakila_proxy`.`staff`
)
SELECT
    staff_id,
    first_name,
    last_name,
    address_id,
    picture,
    email,
    store_id,
    active,
    username,
    password,
    last_update
FROM source
  