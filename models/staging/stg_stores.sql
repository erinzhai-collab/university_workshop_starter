select
    cast(id as string) as store_id,
    trim(name) as store_name,
    cast(opened_at as date) as opened_at,
    cast(tax_rate as numeric) as tax_rate

from {{ source('jaffle_shop', 'raw_stores') }}