
  
    
    
    
        
         


        insert into `adw02_stag`.`stg_film`
        ("film_id", "title", "description", "release_year", "language_id", "original_language_id", "rental_duration", "rental_rate", "length", "replacement_cost", "rating", "special_features", "last_update")WITH source AS (
    SELECT * FROM `sakila_proxy`.`film`
)
SELECT
    film_id,
    title,
    description,
    release_year,
    language_id,
    original_language_id,
    rental_duration,
    rental_rate,
    length,
    replacement_cost,
    rating,
    special_features,
    last_update
FROM source
  