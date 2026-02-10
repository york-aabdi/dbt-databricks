select
    cast(order_item_id as int) as order_item_id,
    cast(order_id as string) as order_id,
    cast(product_id as string) as product_id,
    cast(quantity as int) as quantity,
    cast(unit_price as double) as unit_price,
    quantity * unit_price as total_cost
from {{ ref('order_items') }}