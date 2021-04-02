-- 20.	Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống, 
--  thông tin hiển thị bao gồm ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi.

select e.employee_id, e.employee_name, e.employee_email, e.employee_phone, e.employee_birthday , e.employee_address, 1 'type_person'
from employees e
union
select c.customer_id, c.customer_name, c.customer_email, c.customer_phone_number,c.customer_birthday, c.customer_address , 0 'type_person'
from customers c