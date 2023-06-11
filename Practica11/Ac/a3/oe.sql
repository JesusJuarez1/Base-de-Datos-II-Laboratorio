
Select count(*), sum(list_price), product_status from Product_Information where product_status != 'orderable'
group by product_status having sum(list_price) > 4000;