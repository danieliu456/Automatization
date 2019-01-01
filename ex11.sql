CREATE TABLE Publisher(
	NAME VARCHAR (30) PRIMARY KEY,
	ADDRESS VARCHAR (30),
	PHONE VARCHAR (30)
);

INSERT INTO Publisher VALUES(
'Alma Littera', 'Mokslininku g. 3', '+37090198772');

INSERT INTO Publisher VALUES(
'Baltos Lankos', 'Litertatu g. 6', '+3709732837');

CREATE TABLE Book (
	BOOKID NUMERIC PRIMARY KEY,
	TITLE VARCHAR (60),
	PUBLISHERNAME VARCHAR (50) REFERENCES Publisher(NAME) 
);

INSERT INTO Book VALUES(
12, 'Caligula', 'Baltos Lankos');

INSERT INTO Book VALUES(
34, 'The Fall', 'Baltos Lankos');

INSERT INTO Book VALUES(
45, 'Metai', 'Baltos Lankos');

INSERT INTO Book VALUES(
67, 'Harry Poter and the Prisoner of Azkaban', 'Alma Littera');

INSERT INTO Book VALUES(
89, 'IT Basics 5-6', 'Alma Littera');

INSERT INTO Book VALUES(
10, 'IT 7-8', 'Alma Littera');


CREATE TABLE Book_authors(
	BOOKID NUMERIC REFERENCES Book(BOOKID),
	AUTHORNAME VARCHAR(30), 
	PRIMARY KEY (BOOKID, AUTHORNAME)
	
);

INSERT INTO Book_authors VALUES(
12, 'Albert Camus');

INSERT INTO Book_authors VALUES(
34, 'Albert Camus');

INSERT INTO Book_authors VALUES(
45, 'Kristijonas Donelaitis');

INSERT INTO Book_authors VALUES(
67, 'J. K. Rowling');

INSERT INTO Book_authors VALUES(
89, 'Vaino Brazdeikis');

INSERT INTO Book_authors VALUES(	
89, 'Arvydas Verseckas');

INSERT INTO Book_authors VALUES(
89, 'Raimundas Zabrauskas');

INSERT INTO Book_authors VALUES(
10, 'Vaino Brazdeikis');

INSERT INTO Book_authors VALUES(
10, 'Arvydas Verseckas');

CREATE TABLE Library_branch(
	BRANCHID NUMERIC PRIMARY KEY,
	BRANCHNAME VARCHAR(30),
	ADDRESS VARCHAR(25)
);

INSERT INTO Library_branch VALUES(
123,  'Center', 'Universiteto g. 8');

INSERT INTO Library_branch VALUES(
456, 'Old', 'Sauletekio al. 2');

INSERT INTO Library_branch VALUES(
789, 'New', 'Didlaukio g. 4');

CREATE TABLE Book_copies(
	BOOKID NUMERIC REFERENCES Book(BOOKID),
	BRANCHID NUMERIC REFERENCES Library_branch(BRANCHID),
	PRIMARY KEY(BOOKID, BRANCHID),
	NO_OF_COPIES NUMERIC DEFAULT 10
);

INSERT INTO Book_copies VALUES(
12, 123, 1);

INSERT INTO Book_copies VALUES(
12, 456, 2);

INSERT INTO Book_copies VALUES(
34, 123, 2);

INSERT INTO Book_copies VALUES(
34, 456, 2);

INSERT INTO Book_copies VALUES(
34, 789, 2);

INSERT INTO Book_copies VALUES(
45, 123, 1);

INSERT INTO Book_copies VALUES(
45, 456, 1);

INSERT INTO Book_copies VALUES(
45, 789, 1);

INSERT INTO Book_copies VALUES(
67, 123, 1);

INSERT INTO Book_copies VALUES(
89, 123, 1);

INSERT INTO Book_copies VALUES(
89, 456, 1);

INSERT INTO Book_copies VALUES(
89, 789, 1);

INSERT INTO Book_copies VALUES(
10, 123, 2);

INSERT INTO Book_copies VALUES(
10, 456, 2);

INSERT INTO Book_copies VALUES(
10, 789, 2);

CREATE TABLE Borrower(
	CARDNO NUMERIC PRIMARY KEY,
	NAME VARCHAR(50),
	ADDRESS VARCHAR(25),
	PHONE VARCHAR(15)
);

INSERT INTO Borrower VALUES(
135, 'Petras Petraitis', 'Zirmunu g. 50', '+370897249');

INSERT INTO Borrower VALUES(
246, 'Simas Simaitis', 'Gabijos g. 34', '+3709972468');

INSERT INTO Borrower VALUES(
748, 'Jonas Jonaitis', 'Ignalinos g. 1', '+370997499');


CREATE TABLE Book_loans(
	BOOKID NUMERIC REFERENCES Book(BOOKID),
	BRANCHID NUMERIC REFERENCES Library_branch(BRANCHID),
	CARDNO NUMERIC REFERENCES Borrower(CARDNO),
	PRIMARY KEY(BOOKID, BRANCHID, CARDNO),
	DATEOUT DATE,
	DUEDATE INTERVAL ,
	CHECK (DATEOUT < (DATEOUT + DUEDATE)),
	CHECK (DUEDATE > '3 day' AND DUEDATE < '3 month')
);

INSERT INTO Book_loans VALUES(
12, 123, 746,  '2018-11-03', '1 month');

INSERT INTO Book_loans VALUES(
34, 456, 246, '2018-11-01', '2 month');

INSERT INTO Book_loans VALUES(
89, 456, 246, '2018-11-01', '2 month');

INSERT INTO Book_loans VALUES(
45, 789, 135, '2018-10-30' , '1 month');

INSERT INTO Book_loans VALUES(
34, 789, 135, '2018-10-30' , '1 month');

INSERT INTO Book_loans VALUES(
10, 123, 135, '2018-09-04', '20 day');


