SELECT COUNT(FIRST_NAME) AS PARIS FROM employee 
WHERE `ID_CITY`= (SELECT ID_CITY FROM city WHERE CITY = 'PARIS'); -- 5.Calculate the count of employees from Paris.

SELECT employee.FIRST_NAME, employee.LAST_NAME,  employee.BIRTH_DATE, 
TIMESTAMPDIFF(YEAR,employee.BIRTH_DATE, curdate())
AS Age FROM employee 
ORDER BY age DESC LIMIT 3; -- 10.Show first, last names and ages of 3 eldest employees.

SELECT e.FIRST_NAME, e.LAST_NAME, COUNT(o.ID_ORDER) AS COUNT_ORDER FROM employee AS e 
JOIN `order` AS o 
ON e.ID_EMPLOYEE = o.ID_EMPLOYEE 
WHERE o.REC_DATE BETWEEN '2017-05-01' AND '2017-05-31'
GROUP BY e.FIRST_NAME
HAVING COUNT(o.ID_ORDER); -- 15.Show first and last names of the employees as well as the count of orders each of them have received during may 2017 (use a subquery).

SELECT customer.FIRST_NAME, `order`.ID_CUSTOMER FROM customer, `order` 
WHERE customer.ID_CUSTOMER = `order`.ID_CUSTOMER AND `order`.ID_ORDER = (SELECT ID_ORDER FROM order_item WHERE ID_PRODUCT = 6); -- 20.Show the list of customers’ names who used to order the ‘cheese’ product (use a subquery).

SELECT `order`.ID_COUNTRY, SUM(product.PRICE*order_item.QUANTITY) AS ORDER_SUM, customer.ID_COUNTRY AS CUSTOMER_COUNTRY FROM `order` 
JOIN product ON  `order`.ID_COUNTRY = product.ID_COUNTRY 
JOIN order_item ON `order`.ID_ORDER = order_item.ID_ORDER 
JOIN customer ON `order`.ID_CUSTOMER = customer.ID_CUSTOMER 
WHERE `order`.ID_COUNTRY = customer.ID_COUNTRY
GROUP BY `order`.ID_COUNTRY; -- 25.*Show the total ordering sum calculated for each country of customer.

SELECT DISTINCT city.CITY, employee.ID_EMPLOYEE, customer.ID_CUSTOMER, `order`.ID_CITY FROM city 
JOIN employee ON CITY.ID_CITY = employee.ID_CITY 
JOIN customer ON CITY.ID_CITY = customer.ID_CITY 
JOIN `order` ON CITY.ID_CITY = `order`.ID_CITY
GROUP BY CITY; -- 30.*Show the list of cities where employees and customers are from and where orders have been made to. Duplicates should be eliminated.


___________________________




