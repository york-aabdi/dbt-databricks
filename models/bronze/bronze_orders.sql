select
    cast(order_id as int) as order_id,
    cast(customer_id as string) as customer_id,
    cast(order_timestamp as date) as order_date,
    cast(status as string) as status,
    current_timestamp() as loaded_at
from {{ ref('orders') }}