{{ config(
	materialized='incremental',
	unique_key='customer_id'
) }}

select *, current_timestamp() as processed_at
from {{ source('walmart_bronze', 'customers') }}

{% if is_incremental() %}
where current_timestamp() > (SELECT COALESCE(MAX(processed_at), '1900-01-01') FROM {{ this }})
{% endif %}