WITH stores AS (
    SELECT * FROM {{ ref('stg_store') }}
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
staff AS (
    SELECT * FROM {{ ref('stg_staff') }}
),
final AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['store_id', 'store_address', 'store_district', 'store_postal_code']) }} AS store_skey,
        s.store_id AS store_id,
        a.address AS store_address,
        a.district AS store_district,
        a.postal_code AS store_postal_code,
        a.phone AS store_phone_number,
        ci.city AS store_city,
        co.country AS store_country,
        s.manager_staff_id AS store_manager_staff_id,
        stf.first_name AS store_manager_first_name,
        stf.last_name AS store_manager_last_name,
        s.last_update AS store_last_update
    FROM stores s
    LEFT JOIN addresses a ON s.address_id = a.address_id
    LEFT JOIN cities ci ON a.city_id = ci.city_id
    LEFT JOIN countries co ON ci.country_id = co.country_id
    LEFT JOIN staff stf ON s.manager_staff_id = stf.staff_id
)
SELECT * FROM final