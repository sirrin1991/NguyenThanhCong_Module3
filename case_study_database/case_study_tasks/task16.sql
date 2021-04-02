-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.


delete from employees e
where e.employee_id
not in ( select c.employee_id 
		from contracts c 
        where c.start_day > '2017-01-01' and c.start_day < '2019-12-31' )