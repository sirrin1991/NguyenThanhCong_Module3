select c.contract_id , e.employee_name, cs.customer_name, cs.customer_phone_number, s.service_name, count(ctd.contract_detail_id) as amounts_of_accompanied_service , c.start_day
from contracts c
inner join employees e on e.employee_id = c.employee_id
join customers cs on c.customer_id = cs.customer_id
join services s on s.service_id = c.service_id
join contract_detail ctd on ctd.contract_id = c.contract_id
where c.start_day in ( select c.start_day from contracts where c.start_day >= '2019-10-01') and 
		c.start_day not in ( select c.start_day from contracts where c.start_day between '2019-01-01' and '2019-06-30')
group by c.contract_id

