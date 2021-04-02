-- 19.	Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.

update accompanied_service asv
set asv.price = asv.price * 2
where asv.accompanied_service_id 
in (select temp.asv_id from(
select asv.accompanied_service_id asv_id
from accompanied_service asv
join contract_detail cd on cd.accompanied_service_id = asv.accompanied_service_id
join contracts c on c.contract_id = cd.contract_id
where year(c.start_day) = 2019
group by asv.accompanied_service_id
having sum(cd.amounts) >= 10
) as temp )