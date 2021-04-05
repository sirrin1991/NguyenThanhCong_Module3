select *
from employees e
where (substring_index(e.employee_name,' ', -1) like 'T%' or
		substring_index(e.employee_name,' ', -1) like 'H%' or
        substring_index(e.employee_name,' ', -1) like 'K%') and char_length(employee_name) < 15 ;

