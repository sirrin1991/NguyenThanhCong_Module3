select distinct customer_name from customers;

select * from customers group by customer_name;

select customer_name from customers
union
select customer_name from customers;