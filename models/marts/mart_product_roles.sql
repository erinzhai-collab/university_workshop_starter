with base as (

    select *
    from {{ ref('mart_product_performance') }}

),

benchmarks as (

    select
        avg(total_revenue) as avg_revenue,
        avg(profit_margin_rate) as avg_margin,
        avg(total_items_sold) as avg_volume,
        avg(perishability_ratio) as avg_perishability_ratio
    from base

)

select
    base.product_sku,
    base.product_name,
    base.product_type,

    base.total_orders,
    base.total_items_sold,
    base.total_revenue,
    base.total_profit,

    base.avg_product_price,
    base.avg_item_profit,
    base.profit_margin_rate,
    base.perishability_ratio,

    case
        when base.total_revenue >= benchmarks.avg_revenue
        then 'High Revenue'
        else 'Lower Revenue'
    end as revenue_profile,

    case
        when base.profit_margin_rate >= benchmarks.avg_margin
        then 'High Margin'
        else 'Lower Margin'
    end as margin_profile,

    case
        when base.total_items_sold >= benchmarks.avg_volume
        then 'High Volume'
        else 'Lower Volume'
    end as volume_profile,

    case
        when base.perishability_ratio >= benchmarks.avg_perishability_ratio
        then 'Higher Perishability Exposure'
        else 'Lower Perishability Exposure'
    end as operational_profile

from base
cross join benchmarks