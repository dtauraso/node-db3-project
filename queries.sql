-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select p.ProductName, c.CategoryName
from product as p
inner join category as c on p.CategoryId=c.id;
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
select o.Id, s.CompanyName, o.OrderDate
from [order] as o
inner join shipper as s on o.ShipVia=s.id
where o.OrderDate < "2012-08-09"
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
-- merge
select p.ProductName, od.Quantity, od.OrderId
from [order] as o
inner join OrderDetail as od on o.id = od.OrderId
inner join product as p on od.ProductId=p.id
where od.OrderId = 10251
order by p.ProductName;
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

select o.Id as OrderId, c.CompanyName, e.LastName
from [order] as o
inner join Employee as e on e.id=o.EmployeeId
inner join Customer as c on c.id=o.CustomerId;