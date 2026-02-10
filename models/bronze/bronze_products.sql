select
    cast(product_id as string) as product_id,
    trim(product_name) as product_name,
    sku,
    cast(category as string) as category,
    price
from {{ ref('products') }}