with cust AS
(select * from {{ source('SF_SCHEMA', 'cust') }}),
prod AS
(select * from {{ source('PROD_SCH', 'product') }}),
delivery AS
(select * from {{ source('PROD_SCH', 'delivery_status_fact') }})
select c.customer_id,c.customer_name,
p.product_id,p.product_name,upper(p.category) as category,p.price as unit_price,
d.delivery_id,TO_DATE(TO_CHAR(d.delivery_date, 'DD-MM-YYYY'), 'DD-MM-YYYY') as delivery_date,
d.courier_name,d.delivery_status,current_timestamp() as loaded_at
from 
cust c 
inner join prod p ON c.customer_id=p.customer_id
inner join delivery d ON p.product_id=d.product_id
