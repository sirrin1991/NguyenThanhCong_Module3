update customers 
set type_id = 1
where customers.customer_id
= (
select temp.tuan
from
(
select c.customer_id tuan
from customers c
inner join customer_type ct on ct.type_id = c.type_id
left join contracts ctr on ctr.customer_id = c.customer_id
left join services sv on ctr.service_id = sv.service_id
left join service_type svt on svt.service_type_id = sv.service_type_id
left join contract_detail cdt on cdt.contract_id = ctr.contract_id
left join accompanied_service asv on asv.accompanied_service_id = cdt.accompanied_service_id
left join total_accompanied_service_price t on t.contract_id = cdt.contract_id
where year(ctr.start_day) = 2019
group by c.customer_id
having  sum((sv.rent_cost*(datediff(curdate(),ctr.start_day)-datediff(curdate(),ctr.end_day)) + ifnull(t.total_price_of_accompanied_service,0))) > 1
order by c.customer_id
) as temp);


