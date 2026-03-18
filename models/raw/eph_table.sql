{{
    config(
        materialized='ephemeral'
    )
}}

SELECT
    c.CUSTOMER_ID,
    c.FIRST_NAME,
    c.LAST_NAME,
    c.EMAIL,
    p.PRODUCT_ID,
    p.PRODUCT_NAME,
    p.CATEGORY,
    p.PRICE,
    p.PURCHASE_DATE
FROM snowflake_dbt_data.sf_schema.customer c
JOIN snowflake_dbt_data.prod_sch.product p
    ON c.CUSTOMER_ID = p.CUSTOMER_ID