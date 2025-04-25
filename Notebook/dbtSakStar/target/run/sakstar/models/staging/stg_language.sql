
  
    
    
    
        
         


        insert into `adw02_stag`.`stg_language`
        ("language_id", "name", "last_update")WITH source AS (
    SELECT * FROM `sakila_proxy`.`language`
)
SELECT
    language_id,
    name,
    last_update
FROM source
  