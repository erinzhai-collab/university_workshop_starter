select
    date(ordered_at) as order_date,
    date_trunc(date(ordered_at), month) as order_month,

    product_sku,
    product_name,
    product_type,

    count(*) as units_sold,

    sum(product_price) as total_revenue,
    sum(item_profit) as total_profit,

    avg(item_margin_rate) as avg_margin_rate

from {{ ref('fct_sales_line') }}

group by
    order_date,
    order_month,
    product_sku,
    product_name,
    product_type