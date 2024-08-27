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
    sum(sale_price) desc