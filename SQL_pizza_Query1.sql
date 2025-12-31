select * from pizza_sales;

select sum(total_price) as total_revenue from pizza_sales;

select SUM(total_price)/ COUNT(distinct order_id) as avg_order_value from pizza_sales;

select SUM(quantity) as total_pizza_sold from pizza_sales;

select count(distinct order_id) as total_orders from pizza_sales;

select cast(cast(sum(quantity) as decimal(10,2)) / 
	cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) 
	as Avg_pizzas_per_order from pizza_sales;

select DATENAME(DW, order_date) AS order_day, COUNT(distinct order_id) AS Total_orders
from pizza_sales
group by DATENAME(DW, order_date);

select DATENAME(MONTH, order_date) AS Month_names, COUNT(distinct order_id) AS Total_orders
from pizza_sales
group by DATENAME(MONTH, order_date)
order by Total_orders DESC;

select pizza_category, SUM(total_price) as Total_sales, SUM(total_price) * 100 / (select SUM(total_price) 
from pizza_sales where MONTH(order_date) = 1)
AS PCT from pizza_sales
where MONTH(order_date) = 1
group by pizza_category;

select pizza_size, cast(SUM(total_price) as decimal(10,2)) as Total_sales, cast(SUM(total_price) * 100 / (select SUM(total_price) 
from pizza_sales where datepart(quarter, order_date) = 1) AS decimal(10,2)) AS PCT from pizza_sales
where datepart(quarter, order_date) = 1
group by pizza_size
order by PCT desc;

select TOP 5 pizza_name, SUM(total_price) as Total_revenue from pizza_sales
group by pizza_name
order by Total_revenue DESC;

select TOP 5 pizza_name, SUM(total_price) as Total_revenue from pizza_sales
group by pizza_name
order by Total_revenue ASC;

select TOP 5 pizza_name, SUM(quantity) as Total_quantity from pizza_sales
group by pizza_name
order by Total_quantity desc;

select TOP 5 pizza_name, SUM(quantity) as Total_quantity from pizza_sales
group by pizza_name
order by Total_quantity asc;

select TOP 5 pizza_name, count(distinct order_id) as Total_orders from pizza_sales
group by pizza_name
order by Total_orders desc;

select TOP 5 pizza_name, count(distinct order_id) as Total_orders from pizza_sales
group by pizza_name
order by Total_orders asc;