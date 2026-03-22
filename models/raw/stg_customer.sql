{{
    config(
        materialized='ephemeral'
    )
}}

with src_table_1 AS (
    select id as customer_id,first_name,last_name from {{ source('data_feed', 'customer') }}
)
select  * from src_table_1