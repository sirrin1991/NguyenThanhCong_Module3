select sv.service_id, sv.service_name, sv.service_area, sv.rent_cost, svt.service_type_name, c.start_day, c.end_day
from services sv
left join service_type svt on svt.service_type_id = sv.service_type_id
left join contracts c on c.service_id = sv.service_id
where sv.service_id not in ( select service_id from contracts c where c.start_day >= '2019-01-01' and c.end_day <= '2019-03-31');

