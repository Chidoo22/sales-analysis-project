-- =====================================
-- PROJECT 1: Retail Sales Analytics
-- Database: sales_project
-- =====================================

USE sales_project;

-- total revenue per month
select month(order_date), sum(quantity * unit_price) as total_revenue_per_month
from orders o
join products p
on o.product_id = p.product_id
group by month(order_date);

-- total orders per customer
select first_name, last_name, count(order_id) as total_orders
from customers c
join orders o 
on c.customer_id = o.customer_id
group by first_name, last_name;


-- revenue by product category
select category, sum(o.quantity * p.unit_price) as revenue
from orders o
join products p
on o.product_id = p.product_id
group by category;

-- avg order value per channel
select chanel, avg(quantity * unit_price) as avg_order_value
from orders o
join products p
on o.product_id = p.product_id
group by chanel;

-- top 10 customers by lifetime spend
select first_name, last_name, sum(o.quantity * p.unit_price) as lifetime_spend
from customers c
join orders o
on c.customer_id = o.customer_id
join products p
on o.product_id = p.product_id
group by first_name, last_name
order by lifetime_spend desc
limit 10;
