select
    product_name,
    category,
    sum(line_amount) as revenue
from {{ ref('silver_clean') }}
group by product_name, category
order by revenue desc