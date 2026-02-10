select
    order_date,
    sum(line_amount) as revenue
from {{ ref('fact_orders') }}
group by order_date
