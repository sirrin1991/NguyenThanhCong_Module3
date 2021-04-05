update employees e
set e.employee_address = 'Liên Chiểu'
where e.employee_id in (select temp.nvid from( select nv.employee_id nvid from v_nhanvien nv ) as temp);
