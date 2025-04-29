WITH staff AS (
    SELECT * FROM {{ ref('stg_staff') }}
),
addresses AS (
    SELECT * FROM {{ ref('stg_address') }}
),
cities AS (
    SELECT * FROM {{ ref('stg_city') }}
),
countries AS (
    SELECT * FROM {{ ref('stg_country') }}
),
final AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['staff_id', 'staff_first_name', 'staff_last_name', 'staff_email']) }} AS staff_skey,
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