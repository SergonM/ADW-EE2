
  
    
    
    
        
         


        insert into `adw02_stag`.`stg_country`
        ("country_id", "country")WITH source AS (
    SELECT * FROM `sakila_proxy`.`country`
)
SELECT
    country_id,
    country
FROM source
  