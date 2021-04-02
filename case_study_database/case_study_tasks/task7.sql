-- 7.	Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu 
-- của tất cả các loại dịch vụ đã từng được
--  Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019.

select cs.customer_name, s.service_id, s.service_name, s.service_area, s.max_of_people, s.rent_cost ,st.service_type_name
from services s
inner join service_type st on st.service_type_id = s.service_type_id
inner join contracts c on c.service_id = s.service_id
inner join customers cs on cs.customer_id = c.customer_id
where c.customer_id in ( select c.customer_id from contracts c where year(c.start_day) = '2018')
	and c.customer_id not in ( select c.customer_id from contracts c where year(c.start_day) = '2019')

