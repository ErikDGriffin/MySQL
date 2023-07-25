/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
select * from products;
select * from categories;
select name, name
from products
inner join categories on products.categoryID = categories.categoryID
where categories.name = 'computers';
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
select products.name, product.price, reviews.ragting
from products
left join reviews on products.productid = reviews.productid
where rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select emplohyees.employeeid, sales.quantity
from employees
inner join sales on employees.employeeid = sales.employeeid;
select sales.employeeid, firstname, lastname, title, SUM(qunatity)
from sales
inner join employees on sales.employeeid = employees.employeeid
group by sales.employeeid
order by SUM(quantity) desc;
select SUM(qunatity)
from sales
group by sales.employeeid
order by SUM(qunatity) desc
limit 1;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
select separtments.name, categories.name
from departments
inner join categories on departments.id = categories.name = 'games';
/* joins: find the product name, total # sold, and total price sold,
for Eagles: Hotel California --You may need to use SUM() */
select products.name, sales.quantity, sales.PricePerUnit from sales inner join products on products = productid
where products.name = 'eagles: hotel california';

select products.name, SUM(sales.quantity), SUM(sales.PricePerUnit * sales.quantity)
from sales
inner join products
on products.productid = sales.productid
where products.name = 'eagles: hotel california';

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select reviewer, rating, comment
from reviews
inner join products on products.productid = reviews.productid
where review.rating = 1 and name like '%vizio%tv%';
-- ------------------------------------------ Extra - May be difficult

/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
select employees.employeeid, firstname, lastname, SUM(quantity) as total_quantity
from employees
inner join sales on employees.employeeid = sales.employeeid
inner join products on sales.productid = products.productid
group by employees.employeeid, firstname, lastname;
