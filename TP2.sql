/*TP2*/
# 2.a
SELECT sname FROM sailors WHERE rating > 7;
# 2.b
SELECT sname,rating FROM sailors WHERE rating > 7 AND age < 50;
# 2.c
SELECT * FROM sailors WHERE sname = 'Horatio';
# 2.d
SELECT * FROM sailors WHERE sname LIKE "A%";
# 2.e
SELECT * FROM sailors WHERE sname LIKE "A%Y";
# 2.f
SELECT * FROM boats WHERE color = 'red';
# 2.g
SELECT * FROM boats AS b, reserves AS r WHERE b.bid = r.bid AND (day >= 19981000 AND day <= 19981031);
# 2.g
SELECT * FROM boats AS b NATURAL JOIN reserves AS r WHERE day >= 19981000 AND day <= 19981031;
# 2.h
SELECT sname FROM sailors AS s NATURAL JOIN reserves AS r WHERE r.bid = 103;
# 2.i
SELECT * FROM sailors AS s NATURAL JOIN reserves AS r NATURAL JOIN boats AS b WHERE color = 'red';
SELECT VERSION();
# 2.i
SELECT * FROM sailors s JOIN reserves r JOIN boats b
ON s.sid = r.sid AND b.bid = r.bid
WHERE color = "red";
# 2.j
SELECT DISTINCT sname FROM sailors s JOIN reserves r
WHERE s.sid = r.sid; 
# 2.k

SELECT sname FROM sailors s NATURAL JOIN reserves r NATURAL JOIN boats b WHERE color = "red" OR color = "green";
# 2.l Find the names of sailors who have reserved a red and a green boat.
SELECT sname FROM sailors NATURAL JOIN reserves NATURAL JOIN boats WHERE color = "red" AND sailors.sid IN (SELECT sid FROM sailors NATURAL JOIN reserves NATURAL JOIN boats WHERE color = "green");
# 2.m
SELECT * FROM boats b1 JOIN boats b2 ON b1.bname = b2.bname AND b1.bid != b2.bid;