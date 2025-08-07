Question:

Different physical or online stores (facilities) may have varying levels of performance. The business wants to compare revenue across facilities for sales planning and budgeting.

Fields to retrieve:

FACILITY_ID

FACILITY_NAME

TOTAL_ORDERS

TOTAL_REVENUE

DATE_RANGE

Solution:
```
select
	f.facility_id,
	f.facility_name,
	count(oi.order_id) as total_orders,
	sum(oi.unit_price * oi.quantity) as total_revenue,
	CONCAT(MIN(oh.order_date), ' to ', MAX(oh.order_date)) AS date_range
from order_item oi
join order_header oh on  oh.order_id = oi.order_id and oh.status_id = "ORDER_COMPLETED"
join shipment s on s.primary_order_id = oh.order_id
join facility f on f.facility_id = s.origin_facility_id
	group by f.facility_id;
```
Reasoning:

Since here we were required to find the performance of each facilities so we were to compare the performance of the product and revenue that each generated. For this I retrieved the facility_id and its facility_name. Now we are required to find count of order that it can fulfil, what revenue it generates and within what duration so did as instructed.Lastly, applied a check for status to be "ORDER_COMPLETED" to calculate the performance of only those products which have been completed.

Query Cost: 47,926.73
```
