select * from sales.orders
SELECT * FROM production.products
select * from sales.order_items
select * from sales.stores;
select * from sales.staffs
select * from production.brands;


SELECT
	a.order_id,
	CONCAT(b.first_name, ' ', b.last_name) AS 'Customers',
	b.city,
	b.state,
	a.order_date,
	SUM(c.quantity) as 'total_unit',
	SUM(c.quantity * c.list_price) AS 'revenue',
	d.product_name,
	e.category_name,
	f.store_name,
	CONCAT(g.first_name, ' ', g.last_name) AS 'sales_rep',
	h.brand_name
FROM sales.orders AS a
JOIN sales.customers AS b
on a.customer_id=b.customer_id
JOIN sales.order_items AS c
on a.order_id = c.order_id
JOIN production.products AS d
ON d.product_id = c.product_id
JOIN production.categories AS e
ON e.category_id = d.category_id
JOIN sales.stores AS f
ON f.store_id = a.store_id
JOIN sales.staffs AS g
on g.staff_id = a.staff_id
JOIN production.brands AS h
on h.brand_id = d.brand_id
GROUP BY 
	a.order_id,
	CONCAT(b.first_name, ' ', b.last_name),
	b.city,
	b.state,
	a.order_date,
	d.product_name,
	e.category_name,
	f.store_name,
	CONCAT(g.first_name, ' ', g.last_name),
	h.brand_name
	