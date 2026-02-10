select
    customer_id,
    count(distinct order_id) as total_orders,
    sum(line_amount) as total_spent,
    max(order_date) as last_order_date
from {{ ref('silver_clean') }}
group by customer_id
