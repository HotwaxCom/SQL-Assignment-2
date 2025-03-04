Question:

 Merchandising teams need to identify the best-selling product(s) in a specific region (New York) for targeted restocking or promotions.

Solution:

```
select 
	p.product_id,
	p.internal_name,
	sum(oi.quantity) as total_quantity_sold,
	pa.city,
	sum(oi.quantity*oi.unit_price) as total_revenue
from product p 
join order_item oi on oi.product_id=p.product_id 
join order_header oh on oi.order_id=oh.ORDER_ID
join order_contact_mech ocm on ocm.order_id=oh.order_id
join postal_address pa on pa.contact_mech_id=ocm.contact_mech_id
	where pa.city="New York" group by pa.city,p.PRODUCT_ID order by total_quantity_sold desc;
```

Reasoning:

Since we were required to find the best-selling products in New York that is we wanted products and its corresponding order quantity in order to find the best-selling product and to calculate the total revenue multiplied the quantity with its unit price.
Also, it was region-specefic so I took the city="New York".

```
Query Cost: 65,747.93
