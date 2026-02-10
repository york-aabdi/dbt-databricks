select
    product_id,
    product_name,
    category
from {{ ref('bronze_products') }}