select
    product_type,

    count(distinct order_id) as total_orders,
    count(*) as total_items_sold,

    sum(product_price) as total_revenue,
    sum(item_profit) as total_profit,

    avg(product_price) as avg_product_price,
    avg(item_profit) as avg_item_profit,

    safe_divide(sum(item_profit), sum(product_price)) as profit_margin_rate,

    avg(perishability_ratio) as avg_perishability_ratio

from {{ ref('int_order_items') }}

group by
    product_type