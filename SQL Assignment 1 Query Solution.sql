-- create salesman table
create table salesman (
Salesmanid int,
Name varchar(255),
Commission decimal (10,2),
City varchar (255),
age int
)

insert into salesman values
(101, 'Joe', 50, 'California', 17),
    (102, 'Simon', 75, 'Texas', 25),
    (103, 'Jessie', 105, 'Florida', 35),
    (104, 'Danny', 100, 'Texas', 22),
    (105, 'Lia', 65, 'New Jersey', 30),
	(107, 'Lisa', 66, 'New York', 32),
    (110, 'Max', 667, 'Colambia', 36);

-- create customer table

	Create table customer (
	Salesmanid int,
	Customerid int,
	CustomerName varchar(255),
	PurchaseAmount int,
	);

	insert into customer values
	    (101, 2345, 'Andrew', 550),
    (102, 1575, 'Lucky', 4500),
	(103, 1565, 'Lucy', 4550),
    (104, 2345, 'Andrew', 4000),
	(105, 2305, 'Mark', 4100)
   

-- create orders table

	create table orders(
	Orderid int,
	Customerid int,
	Salesmanid int,
	Orderdate Date,
	Amount money )

	insert into orders values 
	(5001,2345,101,'2021-07-01',550),
(5003,1234,105,'2022-02-15',1500)

-- open all tables
select * from customer
select * from salesman
select * from orders

-- insert new record in order table ( question 1)

select * from orders

insert into orders values  ( 5004,2345,104,'2021-08-01',600)

-- Question 2, Add constraint
select * from salesman
alter table salesman
alter column Salesmanid int not null
alter table salesman
add constraint PK_Salesman PRIMARY KEY (Salesmanid)
-- default table
ALTER TABLE salesman
ADD CONSTRAINT DF_Salesman_City DEFAULT 'Haridwar' FOR city;

--froeign key constraint
ALTER TABLE customer
ADD CONSTRAINT FK
FOREIGN KEY (Salesmanid)
REFERENCES salesman (Salesmanid);
-- not null constraint
alter table customer
alter column CustomerName varchar (255) NOT NULL

---Question 3
select * from customer where CustomerName Like '%N' and PurchaseAmount > 500

--Question 4
-- first result
select TOP 1 Salesmanid from customer
UNION
select TOP 1 Salesmanid from orders

--second result
SELECT DISTINCT Salesmanid from (
select Salesmanid from customer
UNION ALL
select Salesmanid from orders
) AS unique_salesM_ID


--Question 5
select O.Orderdate, S.Name, C.CustomerName, S.Commission,S.City from salesman as S
left join orders as O on S.Salesmanid = O.Salesmanid
left join customer as C on S.Salesmanid = C.Customerid
where C.PurchaseAmount between 1500 and 3000

--Question 6

select * from salesman as S right join orders as O
on S.Salesmanid = o.Salesmanid




