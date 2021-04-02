delete from customers c
where c.customer_id
in (select temp.cid from(
select ctr.customer_id cid
from contracts ctr
join customers c on c.customer_id = ctr.customer_id
where year(ctr.start_day) = 2016
) as temp );