
  
    
    
    
        
         


        insert into `adw02_star`.`dim_film`
        ("film_skey", "film_id", "film_title", "film_description", "film_release_year", "film_category_name", "film_language", "film_original_language", "film_rental_duration", "film_rental_rate", "film_duration", "film_replacement_cost", "film_rating", "film_special_features", "film_last_update")WITH films AS (
    SELECT * FROM `adw02_stag`.`stg_film`
),
languages AS (
    SELECT * FROM `adw02_stag`.`stg_language`
),
original_languages AS (
    SELECT * FROM `adw02_stag`.`stg_language`
),

film_categories AS (
    SELECT * FROM `adw02_stag`.`stg_film_category`
),
categories AS (
    SELECT * FROM `adw02_stag`.`stg_category`
),

films_with_categories AS (
    SELECT
        f.*,
        c.name AS category_name
    FROM films f
    LEFT JOIN film_categories fc ON f.film_id = fc.film_id
    LEFT JOIN categories c ON fc.category_id = c.category_id
),
final AS (
    SELECT
        lower(hex(MD5(toString(coalesce(cast(f.film_id as String), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(f.title as String), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(f.description as String), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(f.release_year as String), '_dbt_utils_surrogate_key_null_') )))) AS film_skey,
        f.film_id AS film_id,
        f.title AS film_title,
        f.description AS film_description,
        f.release_year AS film_release_year,
        f.category_name AS film_category_name,
        l.name AS film_language,
        ol.name AS film_original_language,
        f.rental_duration AS film_rental_duration,
        f.rental_rate AS film_rental_rate,
        f.length AS film_duration,
        f.replacement_cost AS film_replacement_cost,
        f.rating AS film_rating,
        f.special_features AS film_special_features,
        f.last_update AS film_last_update
    FROM films_with_categories f
    LEFT JOIN languages l ON f.language_id = l.language_id
    LEFT JOIN original_languages ol ON f.original_language_id = ol.language_id
)
SELECT * FROM final
  