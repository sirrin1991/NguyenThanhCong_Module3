create view total_accompanied_service_price as 
select ctd.contract_id , sum(asv.price * ctd.amounts) as total_price_of_accompanied_service
from contract_detail ctd
join accompanied_service asv on asv.accompanied_service_id = ctd.accompanied_service_id
group by ctd.contract_id;


select * from total_accompanied_service_price;


select distinct c.customer_id, c.customer_name , ct.customer_type_name,ctr.contract_id, 
		svt.service_type_name ,ctr.start_day , ctr.end_day,
	 (sv.rent_cost*(datediff(curdate(),ctr.start_day)-datediff(curdate(),ctr.end_day)) + ifnull(t.total_price_of_accompanied_service,0)) as total_price 
from customers c
inner join customer_type ct on ct.type_id = c.type_id
left join contracts ctr on ctr.customer_id = c.customer_id
left join services sv on ctr.service_id = sv.service_id
left join service_type svt on svt.service_type_id = sv.service_type_id
left join contract_detail cdt on cdt.contract_id = ctr.contract_id
left join accompanied_service asv on asv.accompanied_service_id = cdt.accompanied_service_id
left join total_accompanied_service_price t on t.contract_id = cdt.contract_id
order by c.customer_id;

