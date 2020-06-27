------------------------------------------------------------------------------
/*
 *  get   * Total sales,  * Total profit,  * Total Ratio per years
 */
select 
distinct (extract ("year" from o.order_date) ) as _year,
sum (o.sales ) as total_sales,
sum (o.profit ) as total_profit,
round(sum (o.profit / o.sales *100),2) as profit_ratio
from orders o
group by _year  

------------------------------------------------------------------------------

------------------------------------------------------------------------------
/*  get Profit per order 
 * 
 */
 
  select order_id,
  round(sum (o.profit ),2) as profit_by_order
  from orders o 
  group by o.order_id 

------------------------------------------------------------------------------

  /*
   * Profit per customer
   * 
   */
  
select 
distinct (o.customer_id),
o.customer_name, 
round(sum (o.sales ),2) as sales 
from  orders as o
group by o.customer_id, o.customer_name 
order by sales  desc
------------------------------------------------------------------------------
/*
 * avg discount
 * 
 */

select 
avg(o.discount )
from orders o 

------------------------------------------------------------------------------
/*
 * monthly sales by segment
 */

select o.segment, 
extract ("month" from o.order_date ) as month,
sum (o.sales) as sales 
from orders as o 
group by o.segment, o.order_date 

------------------------------------------------------------------------------
/*
 * monthly sales by Product Category
 */

select o.category , 
extract ("month" from o.order_date ) as month,
sum (o.sales) as sales 
from orders as o 
group by o.category, o.order_date 




