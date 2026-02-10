select
    cast(customer_id as string) as customer_id,
    trim(first_name) as first_name,
    trim(last_name) as last_name,
    lower(email) as email,
    current_timestamp() as loaded_at
from {{ ref('customers') }}

