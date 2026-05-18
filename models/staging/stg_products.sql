select
    cast(sku as string) as product_sku,
    trim(name) as product_name,
    trim(type) as product_type,
    cast(price as numeric) as product_price,
    trim(description) as product_description

from {{ source('jaffle_shop', 'raw_products') }}