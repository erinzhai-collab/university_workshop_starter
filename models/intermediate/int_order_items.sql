with product_costs as (

    select
        product_sku,
        sum(supply_cost) as supply_cost,
        avg(cast(is_perishable as int64)) as perishability_ratio

    from {{ ref('stg_supplies') }}

    group by
        product_sku

),

order_items as (

    select
        items.item_id,
        orders.order_id,
        orders.ordered_at,
        orders.customer_id,
        stores.store_id,
        stores.store_name,
        products.product_sku,
        products.product_name,
        products.product_type,
        products.product_price,
        product_costs.supply_cost,
        product_costs.perishability_ratio,
        orders.subtotal,
        orders.tax_paid,
        orders.order_total

    from {{ ref('stg_items') }} as items

    left join {{ ref('stg_orders') }} as orders
        on items.order_id = orders.order_id

    left join {{ ref('stg_products') }} as products
        on items.product_sku = products.product_sku

    left join {{ ref('stg_stores') }} as stores
        on orders.store_id = stores.store_id

    left join product_costs
        on products.product_sku = product_costs.product_sku

)

select
    *,
    product_price - supply_cost as item_profit,
    safe_divide(product_price - supply_cost, product_price) as item_margin_rate

from order_items