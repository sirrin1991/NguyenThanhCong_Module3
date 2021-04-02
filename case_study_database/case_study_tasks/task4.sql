select cs.customer_name ,count(ct.customer_type_name) as total_booking
from contracts c
inner join customers cs on c.customer_id = cs.customer_id
inner join customer_type ct on ct.type_id = cs.type_id and ct.customer_type_name = 'Diamond'
group by cs.customer_name
order by total_booking