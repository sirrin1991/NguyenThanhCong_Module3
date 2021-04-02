-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau). 
--  
create view countview as
select count(ctd.accompanied_service_id) as coid
from contract_detail ctd
group by ctd.accompanied_service_id;

select * from countview;

select asv.accompanied_service_name, asv.price, asv.status_accompanied_service , count(ctd.accompanied_service_id) as total_booking
from accompanied_service asv
join contract_detail ctd on ctd.accompanied_service_id = asv.accompanied_service_id
join contracts c on c.contract_id = ctd.contract_id
join customers ctm on c.customer_id = ctm.customer_id
group by ctd.accompanied_service_id
having count(ctd.accompanied_service_id) = ( select max(cv.coid) from countview cv);

