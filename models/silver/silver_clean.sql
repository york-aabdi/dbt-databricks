with orders as (
    select * from {{ ref('bronze_orders') }}
),

items as (
    select * from {{ ref('bronze_order_items') }}
),

products as (
    select * from {{ ref('bronze_products') }}
),

joined as (

    select
        i.order_item_id,
        o.order_id,
        o.customer_id,
        o.order_date,
        p.product_name,
        p.category,
        i.quantity,
        i.unit_price,
        i.quantity * i.unit_price as line_amount

    from items i
    join orders o using (order_id)
    join products p using (product_id)

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key(
            ['order_item_id','order_id']
        ) }} as sk_order_line,
        *
    from joined

)

select *
from final
where quantity > 0