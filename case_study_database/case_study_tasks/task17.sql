update customers
set customers.type_id = 1
where customers.type_id = 2 and customers.customer_id
= ( select customers.customer_id from (
select c.customer_id
from customers c
inner join customer_type ct on ct.type_id = c.type_id
left join contracts ctr on ctr.customer_id = c.customer_id
left join services sv on ctr.service_id = sv.service_id
left join contract_detail cdt on cdt.contract_id = ctr.contract_id
left join total_accompanied_service_price t on t.contract_id = cdt.contract_id
where year(ctr.start_day) = 2019
group by ctr.customer_id
having sum((sv.rent_cost*(datediff(curdate(),ctr.start_day)-datediff(curdate(),ctr.end_day)) + ifnull(t.total_price_of_accompanied_service,0))) >=500
order by c.customer_id
) temp) 