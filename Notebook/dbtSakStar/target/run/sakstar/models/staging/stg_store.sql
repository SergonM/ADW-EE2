
  
    
    
    
        
         


        insert into `adw02_stag`.`stg_store`
        ("store_id", "manager_staff_id", "address_id", "last_update")WITH source AS (
    SELECT * FROM `sakila_proxy`.`store`
)
SELECT
    store_id,
    manager_staff_id,
    address_id,
    last_update
FROM source
  