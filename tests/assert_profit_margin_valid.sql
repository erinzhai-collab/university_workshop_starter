select *
from {{ ref('mart_product_performance') }}
where profit_margin_rate < 0
   or profit_margin_rate > 1