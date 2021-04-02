select ctm.customer_name as `name`, ct.customer_type_name as type_name, asv.accompanied_service_name as name_of_accompanied_service
from contracts c
inner join customers ctm on ctm.customer_id = c.customer_id
inner join customer_type ct on ctm.type_id = ct.type_id
inner join contract_detail cdt on cdt.contract_id = c.contract_id
inner join accompanied_service asv on asv.accompanied_service_id = cdt.accompanied_service_id
where ct.customer_type_name = 'Diamond'