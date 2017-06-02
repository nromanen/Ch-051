use `order`;

-- 2.Show the list of first and last names of the employees from London.

select  employee.FIRST_NAME, employee.LAST_NAME, city.CITY
from employee
join
city on employee.ID_CITY=city.ID_CITY
where CITY='London'
order by employee.FIRST_NAME;

-- 7.Calculate the greatest, the smallest and the average age of the employees for each city.

select  city.CITY as City,
 round(max(TIMESTAMPDIFF(year, employee.BIRTH_DATE, curdate()))) as MaxAge, 
 round(min(TIMESTAMPDIFF(year, employee.BIRTH_DATE, curdate()))) as MinAge,
 round(avg(TIMESTAMPDIFF(year, employee.BIRTH_DATE, curdate()))) as AvgAge
from employee
join
city on employee.id_city=city.id_city
group by city.city;

-- 12.Show first, last names and dates of birth of the employees who celebrate their birthdays this month.

select employee.FIRST_NAME as FirstName, employee.LAST_NAME as LastName, employee.BIRTH_DATE as BirthDay
from employee
where employee.BIRTH_DATE like ('____-05-__')
order by employee.FIRST_NAME;

-- 17.	Show the count of orders made by each customer from France.

select  `order`.id_customer, 
count(distinct`order`.ID_order) as TotalOrders
from `order`
join customer
on customer.ID_CUSTOMER=`order`.ID_CUSTOMER
where customer.ID_COUNTRY=4
group by `order`.id_customer;

-- 22.	*Show the list of french customers’ names who used to order non-french products (use left join).

select distinct customer.FIRST_NAME, customer.LAST_NAME 
from customer
left join 
`order` on customer.ID_CUSTOMER=`order`.ID_CUSTOMER
left join
order_item on `order`.ID_ORDER=order_item.ID_ORDER
left join
product on order_item.ID_PRODUCT=product.ID_PRODUCT
where customer.ID_COUNTRY=4 and product.ID_COUNTRY<>4;

-- 27.	*Show the list of product categories along with total ordering sums calculated for the orders made for the products of each category, during the year 1997.

select  product.ID_CATEGORY,
sum(order_item.Quantity*product.price) as TotalSum
FROM product
inner join  order_item  on product.ID_PRODUCT=order_item.ID_PRODUCT
inner join `order` on `order`.ID_ORDER= order_item.ID_ORDER
where `order`.REC_DATE like ('2017-__-__')
group by product.ID_CATEGORY;

-- 32.	*Fetch the records you have inserted by the SELECT statement

select * from product
where price>=10
limit 4; 

