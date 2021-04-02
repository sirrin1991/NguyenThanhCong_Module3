select month(c.start_day) as `month` , count( c.customer_id)
from contracts c
where year(c.start_day) = '2019'
group by month(c.start_day)
order by `month`;