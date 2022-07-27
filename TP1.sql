#Create Database SAILOR
test
CREATE TABLE Boats(
  bid INT,
  bname VARCHAR(30) NOT NULL,
  color VARCHAR(15) NOT NULL,
  CONSTRAINT pk2 PRIMARY KEY (bid)
);
CREATE TABLE Reserves(
  sid INT,
  bid INT,
  day DATE NOT NULL,
  CONSTRAINT pk3 PRIMARY KEY (sid, bid),
  CONSTRAINT fk1 FOREIGN KEY (sid) REFERENCES Sailors (sid),
  CONSTRAINT fk2 FOREIGN KEY (bid) REFERENCES Boats (bid)
);

INSERT INTO `sailor22`.sailors
VALUE (22, 'Dustin', 7, 45),(29, 'Brutus', 1, 33),(31, 'Lubber', 8, 55.5),(32, 'Andy', 8, 25.5),(58, 'Rusty', 10, 35),
(64, 'Horatio', 7, 35),(71, 'Zorba', 10, 16),(74, 'Horatio', 9, 35),(85, 'Art', 3, 25.5),(95, 'Bob', 3, 63.5);

INSERT INTO `sailor22`.boats
VALUE (101, 'Interlake', 'blue'),
(102, 'Interlake', 'red'),
(103, 'Clipper', 'green'),
(104, 'Maine', 'red');

#insert data into table sailors
insert into sailors VALUES(23,"Dustin",7,45),
(30,"Brustus",1,33),
(31,"Lubber",8,55.5),
(32,"Andy",8,25.5),
(58,"Rusty",10,35),
(64,"Horatio",7,35),
(71,"Zorba",10,16),
(74,"Horatio",9,35),
(85,"Art",3,25.5),
(95,"Bob",3,63.5);

#insert data into table boats
insert into boats values (101, 'interlake', 'blue'),
	(102, 'interlake', 'red'),
	(103, 'Clipper', 'green'),
	(104, 'Marine', 'red');


#insert data into table reserves
insert into reserves 
values(22, 101, '1998-10-10'),
	(22, 102, '1998-10-10'),
	(22, 103, '1998-08-10'),
	(22, 104, '1998-07-10'),
	(31, 102, '1998-10-11'),
	(31, 103, '1998-06-11'),
	(31, 104, '1998-12-11'),
	(64, 101, '1998-05-09'),
	(64, 102, '1998-08-09'),
	(74, 103, '1998-08-09');
	








