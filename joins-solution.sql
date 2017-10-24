-- 1. Get all customer and their addresses
SELECT *
FROM "customers" c
	INNER JOIN "addresses" a ON c."id" = a."id";


--2. Get all orders and their line items.
SELECT *
FROM "orders" o
	INNER JOIN "line_items" l ON o."id" = l."order_id";
	
--3. Which warehouses have cheetos?
SELECT *
FROM "warehouse" w
	INNER JOIN "warehouse_product" wp ON w."id" = wp."warehouse_id" 
	INNER JOIN "products" p ON wp."product_id" = p."id" 
	WHERE p."description" = 'cheetos';

--4. Which warehouses have diet pepsi?
SELECT *
FROM "warehouse" w
	INNER JOIN "warehouse_product" wp ON w."id" = wp."warehouse_id" 
	INNER JOIN "products" p ON wp."product_id" = p."id" 
	WHERE p."description" = 'diet pepsi';
	
--5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT COUNT(o."id"), c."id"
FROM "customers" c
	INNER JOIN "addresses" a ON c."id" = a."customer_id" 
	INNER JOIN "orders" o ON a."id" = o."address_id" 
GROUP BY c."id";

-- 6. How many customer do we have

SELECT COUNT(*)
FROM "customers";

--7. How many products do we carry?

SELECT SUM(wp."on_hand")
FROM "warehouse_product" wp;

--8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM(wp."on_hand")
FROM "warehouse_product" wp
INNER JOIN "products" p ON wp."product_id" = p."id"
WHERE p."description" = 'diet pepsi';
