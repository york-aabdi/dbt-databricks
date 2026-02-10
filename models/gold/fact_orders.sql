select
    f.sk_order_line,
    f.order_id,
    f.customer_id,
    f.product_name,
    f.line_amount,
    f.order_date
from {{ ref('fact_order_lines') }} f