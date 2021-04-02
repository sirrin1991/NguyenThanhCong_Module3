select c.contract_id id , c.start_day start_day, c.end_day end_day, c.deposit deposit,
		count(ct.contract_detail_id) as amounts_of_accompanied_service
from contracts c
inner join contract_detail ct on ct.contract_id = c.contract_id
group by c.contract_id;