
  
    
    
    
        
         


        insert into `adw02_stag`.`stg_film`
        ("film_key", "film_title", "film_description", "film_release_year", "film_language", "film_has_original_language", "film_rental_duration", "film_rental_rate", "film_duration", "film_replacement_cost", "film_rating", "film_special_features", "film_last_update")WITH source AS (
    SELECT * FROM sakila_proxy.film
)
SELECT
    f.film_id as film_key,
    f.title as film_title,
    f.description as film_description,
    f.release_year as film_release_year,
    l.name as film_language,
    CASE WHEN f.original_language_id IS NOT NULL THEN 1 ELSE 0 END as film_has_original_language,
    f.rental_duration as film_rental_duration,
    f.rental_rate as film_rental_rate,
    f.length as film_duration,
    f.replacement_cost as film_replacement_cost,
    f.rating as film_rating,
    f.special_features as film_special_features,
    f.last_update as film_last_update
FROM source f
JOIN sakila_proxy.language l ON f.language_id = l.language_id
  