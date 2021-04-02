create view v_nhanvien as
select *
from employees e
where e.employee_address = 'Hải Châu' and e.employee_id 
in (
	select c.employee_id
    from contracts c
    join employees e on e.employee_id = c.employee_id
    where c.start_day = '2019/12/12'
);

select * from v_nhanvien;