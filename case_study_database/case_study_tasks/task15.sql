-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi 
-- mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019.

select e.employee_id, e.employee_name, el.level_name, d.department_name, e.employee_phone, e.employee_address
from employees e
join employee_level el on el.level_id = e.level_id
join departments d on d.department_id = e.department_id
where e.employee_id 
in 
	(select c.employee_id 
	from contracts c
    where year(c.start_day) > '2017' and year(c.start_day) <'2020'
    group by c.employee_id 
    having count(c.contract_id) <= 3 )
or e.employee_id not in ( select c.employee_id from contracts c)
order by e.employee_id
