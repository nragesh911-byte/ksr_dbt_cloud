{{
    config(
        materialized='table',
        transient = true,
        query_tag = 'DBT'
    )
}}

select * from {{ ref('demo') }}
where joining_date > '2024-10-11'