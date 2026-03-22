with src AS
(select * from {{ ref('product_delivery_info') }})
select
product_id,
product_name,
category,
unit_price,
delivery_date,
case when delivery_status='Delivered on time' THEN 'Yes'
else 'No' end as is_delivered
from src
where delivery_status <> 'pending'
order by delivery_date desc