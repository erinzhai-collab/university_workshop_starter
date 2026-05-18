with product_costs as (

    select
        product_sku,
        sum(supply_cost) as supply_cost,
        max(is_perishable) as is_perishable

    from {{ ref('stg_supplies') }}

    group by
        product_sku

)

select
    products.product_sku,
    products.product_name,
    products.product_type,
    products.product_price,

    product_costs.supply_cost,
    products.product_price - product_costs.supply_cost as unit_profit,
    safe_divide(
        products.product_price - product_costs.supply_cost,
        products.product_price
    ) as unit_margin_rate,
    product_costs.is_perishable

from {{ ref('stg_products') }} as products

left join product_costs
    on products.product_sku = product_costs.product_sku