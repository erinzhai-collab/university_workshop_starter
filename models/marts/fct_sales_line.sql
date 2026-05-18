select
    item_id,
    order_id,

    ordered_at,
    customer_id,

    store_id,
    store_name,

    product_sku,
    product_name,
    product_type,

    product_price,
    supply_cost,

    item_profit,
    item_margin_rate,

    perishability_ratio

from {{ ref('int_order_items') }}