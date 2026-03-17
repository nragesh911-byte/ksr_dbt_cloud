{{
    config(
        materialized='table',
        transient = false,
        database = 'DBT_DB',
        schemaa = 'RAW_SCHEMA',
        query_tag = 'DBT'
    )
}}

select * from {{ ref('demo') }}
where joining_date > '2024-10-11'