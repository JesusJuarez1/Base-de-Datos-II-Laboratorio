--1
describe Product_information;
describe orders;
--2
Select unique sales_rep_id from Orders;
--3
Select order_id,order_date,order_total from Orders;
Select start_date,end_date from hr.job_history;
--4
Select (product_name || ' with code: ' || product_id || ' has status of: ' || product_status) as "Product",
list_price, min_price,(list_price-min_price) as "Max Actual Savings",(((list_price-min_price)/list_price)*100) as "Max Discount %"
from Product_Information;
--5
Select (4*(22/7)*power(3958.759,2)) as "Earth's Area" from Dual;