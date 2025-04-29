WITH staff AS (
    SELECT * FROM `adw02_stag`.`stg_staff`
),
addresses AS (
    SELECT * FROM `adw02_stag`.`stg_address`
),
cities AS (
    SELECT * FROM `adw02_stag`.`stg_city`
),
countries AS (
    SELECT * FROM `adw02_stag`.`stg_country`
),
final AS (
    SELECT
        lower(hex(MD5(toString(coalesce(cast(staff_id as String), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(staff_first_name as String), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(staff_last_name as String), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(staff_email as String), '_dbt_utils_surrogate_key_null_') )))) AS staff_skey,
        s.staff_id AS staff_id,
        s.first_name AS staff_first_name,
        s.last_name AS staff_last_name,
        s.email AS staff_email,
        s.active AS staff_active,
        s.store_id AS staff_store_id,
        s.last_update AS staff_last_update
    FROM staff s
)
SELECT * FROM final