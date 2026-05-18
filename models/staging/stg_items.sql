select
    cast(id as string) as item_id,
    cast(order_id as string) as order_id,
    cast(sku as string) as product_sku

from {{ source('jaffle_shop', 'raw_items') }}