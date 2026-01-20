---1. Get first_name, last_name, phone & address of all customer & export as csv
select 
first_name,
last_name,
mobile_number,
address from customer;

---2.List all the products with price greater than 500
select * 
from product
where unit_price >500;

--- 3.List all the transaction that happen in month of June, 2025
select *
from transaction
where transaction_date >= '2025-06-01' and transaction_date  < '2025-07-01';

---4.List Name, Address, Email of customer from Kathmandu / Pokhara. If there is
---no email of customer, you have to display ‘-’. Sort result by name & address
select 
first_name,
last_name,
coalesce(email, '_') as email,
address
from customer
where
address in ('Kathmandu','Pokhara')
order by first_name , last_name,email ;
#
---5. List HR employees who have already resigned from the mart
select *
from employee
where is_active =false
and department ='HR';

--6.List first three customer matching your lecturer's name ordered by last name
select *
from customer
where first_name ='Rabindra'
order by last_name limit 3;

---7.Find top 5 expensive product. Exclude brands ElectroVision, BeanBrew
select *
from product
where brand_name in ('ElectroVision','BeanBrew')
order by unit_price desc limit 5;

---8.List customer who uses Gmail

select first_name, last_name,email
from customer
where email is not null and email like ('%gmail%');



--9. Show all the unique locations where customer reside
select distinct address
from customer;

--10. Find the customer from Rasuwa who don’t have email address

select *
from customer
where address ='Rasuwa' and email is null;

--11. Find the employee who don’t have supervisor

select *
from employee 
where supervisor_id is null;

--12. Find Name, Email and Phone number of customer from Dhangadi.

select 
first_name,
last_name,
email,
address,
mobile_number 
from customer
where address ='Dhangadi';

--13. Find Name, Department of top 10 highest paid employee

select
first_name,
last_name ,
department,
salary
from employee
order by salary desc  limit 10;

--14. Get top 10 product that are low in stock excluding brand ComfortSit

select 
name,
unit_price,
brand_name 
from product
WHERE brand_name <> 'ComfortSit'
order by stock asc 
limit 10;

--15. Find customer whose number doesn’t start with 98

select *
from customer 
where mobile_number not like ('98%')
;



---exec  ktm ko manche ko txn 
select 
customer_id,
quantity ,
transaction_date 
from transaction
where customer_id in (
select customer_id
from customer
where address ='kathmandu'
);
---- transction and empyloyee table
select *
from employee as e
inner join transaction as a
on e.id=a.employee_id;



--1. Get the total number of customers.
select  count(id) as total_customer
from customer;
--2. Find total expenditure on salary by mart on 3 month.

select 
sum(salary)*3 as total_salary
from employee;

--3.Total number of customer on each city.

select address, 
count(id) as Result
from customer
group by address;

--4. Find the total transaction amount and monetory value handled by each
--employee for july. TO DO
select 
--5. Calculate the average salary of employees in each department. -- TO DO
--6. Find employee that gets second highest salary -- TO DO
--7. For each product, find total transaction, total item sold, txn amount
--(without discount) & total discount. -- TO DO

--8 Show customer name, product name, cashier name and quantity for
--each transaction done by user of kathmandu after 2025
select
c.first_name ,
p.name,
e.first_name ,
t.quantity
from transaction as t
join customer as c 
on t.customer_id =c.id
join employee as e
on t.employee_id =e.id
join product as p
on t.product_id=p.id
where c.address ='Kathmandu'
and t.transaction_date >= '2025-01-01';


-- 9 -- TO DO
-- 10 -- TO DO

--11 List employees who haven’t handled any transaction.
SELECT e.*
FROM employee e
left join transaction t
on e.id = t.employee_id
where t.employee_id is null;

-- 12 TO DO

--13 Find products that were never sold
select p.*
from product as p
left join transaction as t
on p.id =t.product_id 
where t.product_id is null;

--14 List transactions where the discount was more than 50% of the product's
--unit price.
select t.* 
from transaction as t
join product as p
on t.product_id =p.id 
where t.discount_amount>=(p.unit_price *0.5);

-- 15 : to do
-- REDO from 16 and below

--16Find the top 3 customers based on total reward points.
select c.*, t.reward_point 
from customer as c
join transaction as t
on c.id =t.reward_point 
order by t.reward_point desc limit 3;-- to do

--17.Find customers whose first transaction happened before registration.

select c.*,t.transaction_date
from customer as c
left join "transaction" as t
on c.created_at =t.transaction_date 
where  (c.created_at) <(t.transaction_date) ;


--20.List employee name and their manager's name


--22.Identify if an inactive employee has performed transactions.

--23.Find customer who haven’t bought any Smartphone

--25.Find active employee for each department

--27. List name, address of employee who have never received discount

--28. Find list of churn customer in 2025, June

--29.Find churn customer in 2025, June for category water bottle

--30.Find customer who bought notebook on May & June but yet to buy on July
