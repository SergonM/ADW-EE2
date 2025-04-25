
  
    
    
    
        
         


        insert into `adw02_star`.`dim_customer`
        ("customer_skey", "customer_id", "customer_first_name", "customer_last_name", "customer_email", "customer_active", "customer_created", "customer_address", "customer_district", "customer_postal_code", "customer_phone_number", "customer_city", "customer_country", "customer_last_update")SELECT
    MD5(CONCAT(customer_first_name, customer_last_name, customer_email)) AS customer_skey,
    customer_id,
    customer_first_name,
    customer_last_name,
    customer_email,
    customer_active,
    customer_created,
    customer_address,
    customer_district,
    customer_postal_code,
    customer_phone_number,
    customer_city,
    customer_country,
    customer_last_update
FROM `adw02_stag`.`stg_customer`
  