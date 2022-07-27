#Name : Rotha Dapravith
#ID : e20190915
#Group: I3 GIC(C)

#================== TP noté ===================#

#1.list address and clientID of client named Adam.

SELECT clientID,clientaddress
FROM client
WHERE NAME = 'Adam';

#2. List information of rent that costs more than 1000.

SELECT * FROM rent
WHERE price > 1000;

#3. List information of rent that started in 2018.

SELECT * FROM rent 
WHERE year(rent_date) = 2018;

#4.List information of properties rented by client C1.

SELECT property.*
FROM property NATURAL JOIN rent 
WHERE clientID = 'C1';

#5. List information of property rented by Adam.

SELECT property.*
FROM property NATURAL JOIN client NATURAL JOIN rent
WHERE NAME = 'Adam';

#6.List information of client who has rented any property of type house.

SELECT client.*
FROM client NATURAL JOIN property NATURAL JOIN rent
WHERE type = 'house';

#7.List information of client who has never rented any property.

SELECT client.*
FROM client 
WHERE client.clientID NOT IN(SELECT DISTINCT clientID FROM rent);

#8. Show the total number of property for each type of property, 
#for example, there are 3 flats, 2 houses and #1 apartment in the database.

SELECT property.type,count(property.type)
FROM property GROUP BY property.type;

#9.Knowing that client need to pay an extra 1% per day for late payment of property with id 3, 
#calculate the total amount of payment for 1 week late.

SELECT clientID,SUM((price*0.01)*7) AS fee FROM rent
WHERE clientID = 'C3';

#10.For each property, show the highest rent (cost) and the rent period.

SELECT propertyID,rent_date,end_date,MAX(price)
FROM rent
GROUP BY propertyID;