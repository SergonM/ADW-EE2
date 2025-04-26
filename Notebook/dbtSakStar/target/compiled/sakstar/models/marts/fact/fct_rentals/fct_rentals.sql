WITH rental_data AS (
    SELECT
        r.rental_id,
        r.rental_date,
        r.return_date,
        r.customer_id,
        r.staff_id,
        i.film_id,
        i.store_id,
        dateDiff('day', r.rental_date, COALESCE(r.return_date, now())) AS rental_duration
    FROM `adw02_stag`.`stg_rental` r
    LEFT JOIN `adw02_stag`.`stg_inventory` i ON r.inventory_id = i.inventory_id
),

date_lookup AS (
    SELECT
        date_key,
        date_actual
    FROM `adw02_star`.`dim_date`
)

SELECT
    lower(hex(MD5(toString(coalesce(cast(r.rental_id as String), '_dbt_utils_surrogate_key_null_') )))) AS rental_skey,
    dc.customer_skey,
    df.film_skey,
    ds.staff_skey,
    dst.store_skey,
    d.date_key,
    r.rental_id,
    COUNT(*) OVER(PARTITION BY r.customer_id) AS count_rentals,
    r.rental_duration
FROM rental_data r
JOIN `adw02_star`.`dim_customer` dc ON r.customer_id = dc.customer_id
JOIN `adw02_star`.`dim_film` df ON r.film_id = df.film_id
JOIN `adw02_star`.`dim_staff` ds ON r.staff_id = ds.staff_id
JOIN `adw02_star`.`dim_store` dst ON r.store_id = dst.store_id
JOIN date_lookup d ON toDate(r.rental_date) = d.date_actual