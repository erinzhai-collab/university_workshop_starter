select
    cast(id as string) as customer_id,
    trim(name) as customer_name

from {{ source('jaffle_shop', 'raw_customers') }}