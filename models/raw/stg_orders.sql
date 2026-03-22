with src_tbl_2 AS
(select id,user_id,order_date from {{ source('data_feed', 'orders') }})
select * from src_tbl_2