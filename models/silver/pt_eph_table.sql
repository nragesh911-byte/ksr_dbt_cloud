select     CUSTOMER_ID,
    FIRST_NAME,
    LAST_NAME
    from {{ ref('eph_table') }}