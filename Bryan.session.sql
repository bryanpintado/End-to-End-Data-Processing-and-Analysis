select *
from retail_orders -- find top 10 highest revenue generating products
select product_id,
    sum(sale_price) as sales
from retail_orders
GROUP BY product_id
order by sales desc -- find top 5 highest selling products in each region
select region,
    product_id,
    sum(sale_price)
from retail_orders
group by region,
    product_id
order by region,
    sum(sale_price) desc -- find month over montyh growth comparison for 2022 and 2023 sales
select year(order_date) as year,
    month(order_date) as month,
    sum(sale_price) as sales
from retail_orders
group by year,
    month
order by month,
    year desc -- for each category which month had the highest sales
select category,
    sum(sale_price) as sales,
    month(order_date) as month
from retail_orders
group by category,
    month
order by category,
    sales desc