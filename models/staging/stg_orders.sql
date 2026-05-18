select
    cast(id as string) as order_id,
    cast(customer as string) as customer_id,
    cast(ordered_at as timestamp) as ordered_at,
    cast(store_id as string) as store_id,
    cast(subtotal as numeric) as subtotal,
    cast(tax_paid as numeric) as tax_paid,
    cast(order_total as numeric) as order_total

from {{ source('jaffle_shop', 'raw_orders') }}