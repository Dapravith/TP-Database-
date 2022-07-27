/*TP3*/

#2/.
#1. List all customers‟ name and city.
SELECT name,city
FROM customer_t;

#2.List the information of customer from „CA‟ (state)
SELECT * FROM customer_t WHERE state='ca';

#3.List ID, description and standard price of products made from “ash”.
SELECT ID, description, standard_price
FROM product_t
WHERE finish LIKE '%ash'; 

#4.List the information of product that is made from “ash” and costs between 15 and 80.
SELECT *
FROM product_t 
WHERE finish LIKE '%ash' AND (standard_price >=15 AND standard_price <=80);

#5.Show all products and sort the result by stand price (from the cheapest to the most expensive).
SELECT *
FROM product_t
ORDER BY standard_price;  #sorting the value from low to hight

#6.Show the cross product between customer and order.
SELECT *
FROM product_t JOIN customer_t ;

#6.Show the information of customer who has made order on “2004-04-01”
SELECT customer_t.*
FROM customer_t JOIN order_t
  ON customer_t.ID = customer_ID
WHERE order_date = '2004-04-01';

#7.Show information of products in the order number 106
SELECT product_t.*
FROM product_t JOIN order_line_t
  ON product_t.ID = order_line_t.product_ID
WHERE  order_id=106;
# method2
SELECT * FROM product_t JOIN order_line_t 
WHERE PRODUCT_t.id = order_line_t.product_id AND  order_id = 106;

#8.show the information of product in the number 106.
SELECT customer_t.*
FROM customer_t JOIN order_t
	ON customer_t.ID = order_t.customer_ID
WHERE order_t.ID = 106;

#9. Show the information of customer who has made order number 106.
SELECT *
FROM customer_t AS c JOIN order_t AS o
ON c.ID=o.customer_ID
WHERE o.ID=106;
#10. Show the order which contains book shelf.
SELECT *
FROM order_t AS order_t JOIN order_line_t AS ol JOIN product_t AS p
ON order_t.ID=order_id AND p.ID=product_id
WHERE description='book shelf';

#11. show the order which contain table lamp.
SELECT *
FROM product_t p JOIN order_line_t ol 
ON p.ID = ol.product_ID
WHERE description = 'Table Lamp';

#12.show the order which contain book shelf or table lamp
SELECT *
FROM product_t p JOIN order_line_t ol
ON p.ID = ol.product_ID
WHERE description = 'Book shelf' OR description = 'Table Lamp';

#13.show the order which contain book shlef and table lamp
SELECT *
FROM product_t p JOIN order_line_t ol
ON ID = Product_ID
WHERE description = 'Book shelf' AND order_ID 
IN (SELECT order_ID FROM product_t JOIN order_line_t ON ID = product_ID 
WHERE description ='Table Lamp'); 

#14.show the order which contain book shelf but not table lamp
SELECT o.*
FROM order_t AS o JOIN order_line_t AS ol JOIN product_t AS p
	ON o.ID = order_id AND p.id = product_id
WHERE description = 'book shelf' AND o.id NOT IN 
(
	SELECT order_id
	FROM order_t AS o JOIN order_line_t AS ol JOIN product_t AS p
		ON o.id = order_id AND p.id = product_id
	WHERE description = 'table Lamp'
)
;

/*TP4*/

#1. Show id and name of customer along with order id and oder_date of the order they have  made. 
SELECT customer_t.ID,customer_t.name,order_t.ID,order_t.order_date 
FROM customer_t JOIN order_t 
On customer_t.ID = order_t.customer_id;

#2. Show id and description of product and its quantity in each order. 
SELECT product_t.ID,product_t.description,order_line_t.quantity
FROM product_t JOIN order_line_t ON product_t.ID=order_line_t.product_ID;

#3. Show id and name of customer along with id and description of product they have  ordered. 
SELECT customer_t.ID, customer_t.name,product_t.ID,product_t.description
FROM customer_t JOIN order_t JOIN  product_t JOIN order_line_t 
ON customer_t.id=order_t.customer_ID AND order_t.ID=order_line_t.order_ID AND order_line_t.product_ID=product_t.ID;

#4. Repeat 1. and include the customers who has never made any order to the result (by using  outer join).
#=>Show id and name of customer along with order id and order_date who has never made any order. 
SELECT customer_t.ID,customer_t.name,order_t.ID,order_t.order_date
FROM customer_t LEFT JOIN order_t
ON order_t.customer_ID=customer_t.ID;

#UNION
 
SELECT customer_t.ID,customer_t.name,order_t.ID,order_t.order_date
FROM customer_t RIGHT JOIN order_t
ON order_t.customer_ID=customer_t.ID;
 
#5. Show product with the lowest standard price. 
SELECT*FROM product_t p 
WHERE p.standard_price =(SELECT MIN(p.standard_price) FROM product_t p);

#6. Show product with the same name.
SELECT *FROM product_t p1 JOIN product_t p2
ON p1.ID != p2.ID
WHERE p1.description=p2.description;

/*TP5*/

#1. Find all product order by "John Doe".
SELECT DISTINCT p.*
FROM order_t o JOIN customer_t c JOIN order_line_t ol JOIN product_t p
ON c.ID = customer_ID AND  o.ID = order_ID AND p.ID = product_ID
WHERE c.name = "John Doe";

# find customer who has ordered product 3000
SELECT DISTINCT c.*
FROM customer_t c JOIN order_t o JOIN order_line_t ol JOIN product_t p
ON c.ID = customer_ID AND o.ID = order_ID AND p.ID = product_ID
WHERE product_ID = 3000;

#2. Find customer who has ordered any products ordered by “John Doe”
SELECT DISTINCT c.*
FROM customer_t c JOIN order_t o JOIN order_line_t ol JOIN product_t p
ON c.ID = customer_ID AND o.ID = order_ID AND p.ID = product_ID 
WHERE p.ID IN (SELECT DISTINCT p.ID FROM customer_t c JOIN order_t o JOIN order_line_t ol
JOIN product_t p
ON c.ID = customer_ID AND o.ID = order_ID AND p.ID = product_ID
WHERE NAME = "John Doe")
AND NAME != "John Doe";

#3. Find customer who has ordered any products finished in “Natural Ash”.
 SELECT c.*
FROM product_t p join order_line_t ol JOIN order_t o JOIN customer_t c 
	ON c.ID = customer_id AND o.ID = order_id AND p.ID = product_id
WHERE finish = 'Natural Ash';
#4. Find order that contains more than 2 products.
SELECT order_id, COUNT(product_id)
FROM order_line_t
GROUP BY order_id
HAVING COUNT(product_id) > 2;

#5. Find customer who has made more than 1 order.
SELECT customer_t.*
FROM customer_t JOIN order_t JOIN order_line_t 
	ON customer_t.ID = customer_id AND order_t.ID = order_id
WHERE quantity > 1;

#6. Pair customer and his/her total number of orders.
SELECT customer_t.*,COUNT(order_t.ID) AS totalOrder
FROM customer_t JOIN order_t
	ON customer_t.ID = customer_id
GROUP BY order_t.customer_ID;
#7. Find the total number of unit of “office chair” sold in April, 2004.
SELECT count(product_id) AS total_number
FROM product_t JOIN order_t JOIN order_line_t
	ON product_t.ID = product_id AND order_t.ID = order_id
GROUP BY product_t.ID
WHERE  COUNT(product_t.ID) = 'office chair';
#8. Find the total cost of order made by “John Doe”.
SELECT order_id, standard_price*quantity AS total
FROM customer_t c JOIN order_t o JOIN order_line_t ol JOIN product_t p
	ON c.ID = customer_id AND o.ID = order_id AND p.id = product_id
WHERE NAME = "john doe"
;
#9. Find the average cost of order made by “John Doe”.

#10. Find the order that contain all products made from cherry.

#11. Find the customer who has ordered all kind of table lamp.






#find the number of of cherry product in product_t
SELECT COUNT(*)
FROM product_t
WHERE finish = "cherry";

#find order_id that contains any cherry product
SELECT *
FROM product_t p JOIN order_line_t ol
	ON p.ID = product_id
WHERE finish = "cherry";	


# count the number of cherry product in each other
SELECT COUNT(product_id) AS numCherryPro, order_id
FROM product_t p JOIN order_line_t ol
	ON p.ID = product_id
WHERE finish = "cherry";
GROUP BY order_id
HAVING numCherryPro = (SELECT COUNT(*)
								FROM product_t
								WHERE finish = "cherry")
;

#find sailor who has reserved all boat
SELECT COUNT(*) FROM boats;

#find the total number of boats reserved by each sailor
SELECT sid, COUNT(distinct bid), COUNT(bid)
FROM reserves
GROUP BY sid
;
