select
    cast(id as string) as supply_id,
    trim(name) as supply_name,
    cast(cost as numeric) as supply_cost,
    cast(perishable as boolean) as is_perishable,
    cast(sku as string) as product_sku

from {{ source('jaffle_shop', 'raw_supplies') }}