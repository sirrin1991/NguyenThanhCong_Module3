select *
from customers
where round(datediff(curdate(),customer_birthday)/365,0) > 18 and round(datediff(curdate(),customer_birthday)/365,0) <50 and
	(customer_address='Da nang' or customer_address = 'Quang Tri');