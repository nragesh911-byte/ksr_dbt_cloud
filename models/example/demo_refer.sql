{{
    config(
        materialized='table',
        transient = false,
        query_tag = 'DBT'
    )
}}

select * from {{ ref('demo') }}
where joining_date > '2024-10-11'