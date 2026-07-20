{{ config(
  materialized='table',
  schema='silver'
) }}

-- Minimal marker model to ensure the `silver` schema exists in the Databricks catalog.
select
  1 as marker_id,
  current_timestamp() as created_at
