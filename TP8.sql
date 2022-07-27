/*TP8*/
#1. Show first name and last name of customer from France.
SELECT contactLastname, contactFirstname
FROM customers;

#2. Show the first name and last name of employee who is a sale manager.
SELECT firstname, lastname
FROM employees WHERE employees.jobTitle LIKE 'sale% Manager%';

#3. Show all product which is in “classic car” product line.
SELECT products.*
from products
WHERE products.productLine LIKE 'classic car%';

#4. Show all products containing “Toyota” in its name.
SELECT products.*
FROM products
WHERE products.productName LIKE '%Toyota%';

#5. Show all products with the scale smaller than 1:24.

/*SELECT CAST(SUBSTR("1:24",3) AS UNSIGNED);
SELECT CAST(SUBSTR(productScale,3) AS UNSIGNED) FROM products;
SELECT *FROM products 
WHERE productScale > "1:24"; 
SELECT "24" < "100";
SELECT CAST("24" AS UNSIGNED);
SELECT SUBSTR("1:24",3);*/


SELECT products.*
FROM products
WHERE CAST(SUBSTR(productscale,3) AS UNSIGNED) > 24;

#6.Show all products from the vendor “Autoart Studio Design”

SELECT *
FROM products
WHERE products.productVendor LIKE 'Autoart studio Design';

#7.Show all products with MSRP (the manufacturer’s suggested retail price) higher than 
#twice the cost of buyPrice.

SELECT *
FROM products
WHERE MSRP > buyPrice*2;

#8. Show information of sale representative of the customer “Land of toys Inc.”

SELECT employees.*
FROM customers JOIN employees ON customers.salesRepEmployeeNumber= employeeNumber
WHERE customerName LIKE '%Land of toys Inc%';

#9. Show information about order that is shipped later than the required date.

SELECT *
FROM orders
WHERE shippedDate > requiredDate;

#10. Show all orders made by “La Rochelle Gifts”.

SELECT orders.*
FROM orders Natural JOIN customers
WHERE customerName = 'La Rochelle Gifts';

#11. Show all products ordered by “La Rochelle Gifts”
SELECT customers.*
FROM customers NATURAL JOIN products
WHERE customerName = 'La Rochelle Gifts';

#12. Show customer’s name who has ordered more than 15 products in once.
SELECT customerName ,COUNT(productCode) as CountOrder FROM customers NATURAL JOIN orderdetails NATURAL JOIN orders 
	GROUP BY orderNumber
	HAVING CountOrder > 15;
	
#13.Show the best-selling product in “2004-02”.
CREATE VIEW bestSellingProduct as SELECT *, sum(quantityOrdered) as sum 
FROM products NATURAL JOIN orders NATURAL JOIN orderdetails 
WHERE orderDate LIKE "2004-02-%" GROUP BY productCode;
SELECT ProductName, MAX(sum) as highestQuantityOrdered FROM bestSellingProduct;


 