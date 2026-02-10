{{ config(
    materialized='incremental',
    unique_key='sk_order_line'
) }}

select *
from {{ ref('silver_clean') }}

{% if is_incremental() %}
  where order_date > (
      select max(order_date) from {{ this }}
  )
{% endif %}