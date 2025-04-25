
  
    
    
    
        
         


        insert into `adw02_stag`.`stg_inventory`
        ("inventory_id", "film_id", "store_id", "last_update")WITH source AS (
    SELECT * FROM `sakila_proxy`.`inventory`
)
SELECT
    inventory_id,
    film_id,
    store_id,
    last_update
FROM source
  