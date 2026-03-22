with src_customer AS
(select customer_id,first_name,last_name from {{ ref('stg_customer') }}),
src_order AS
(select id,user_id,order_date,status from {{ source('data_feed', 'orders') }})
select concat(c.first_name,' ',c.last_name) as customer,
min(o.order_date) as first_order_date,
max(o.order_date) as recent_order_date,
count(o.id) no_of_orders from src_customer c
inner join src_order o on c.customer_id=o.user_id
group by 1