
  
    
    
    
        
         


        insert into `adw02_stag`.`stg_city`
        ("city_id", "city", "country_id")WITH source AS (
    SELECT * FROM `sakila_proxy`.`city`
)
SELECT
    city_id,
    city,
    country_id
FROM source
  