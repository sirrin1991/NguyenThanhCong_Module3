-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.

create view countview as
select count(ctd.accompanied_service_id) as coid
from contract_detail ctd
group by ctd.accompanied_service_id;

select c.contract_id, svt.service_type_name, asv.accompanied_service_name, count(ctd.accompanied_service_id) as total_booking
from contracts c 
inner join services sv on sv.service_id = c.service_id
join service_type svt on svt.service_type_id = sv.service_type_id
join contract_detail ctd on ctd.contract_id = c.contract_id
join accompanied_service asv on asv.accompanied_service_id = ctd.accompanied_service_id
group by ctd.accompanied_service_id
having count(ctd.accompanied_service_id) = ( select min(cv.coid) from countview cv);