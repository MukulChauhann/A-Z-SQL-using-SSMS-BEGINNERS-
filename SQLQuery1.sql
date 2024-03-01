select * from customer

create function cust_name(@Cname varchar(50))
returns table
as
return
(
select * from customer where CustomerName=@Cname
)

select * from dbo.cust_name('Lucy')