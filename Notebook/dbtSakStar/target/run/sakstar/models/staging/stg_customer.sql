
  
    
    
    
        
         


        insert into `adw02_stag`.`stg_customer`
        ("customer_id", "store_id", "first_name", "last_name", "email", "address_id", "active", "create_date", "last_update")WITH source AS (
    SELECT * FROM `sakila_proxy`.`customer`
)
SELECT
    customer_id,
    store_id,
    first_name,
    last_name,
    email,
    address_id,
    active,
    create_date,
    last_update
FROM source
  