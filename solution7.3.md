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
join order_shipment os on os.order_id=oi.order_id and os.order_item_seq_id=oi.order_item_seq_id
join shipment s on s.shipment_id = os.shipment_id
join facility f on f.facility_id = s.origin_facility_id
left join order_header oh on  oh.order_id = oi.order_id 
	group by f.facility_id,f.facility_name;
```
Reasoning:

Since here we were required to find the performance of different facilities so we were to find the best selling products and the revenue that each generated. For this I retrieved the facility_id and its facility_name. Now we are required to find count of order that it can fulfil, what revenue it generates and within what duration so did as instructed.
Order item and the facility which serves it is required so we started from order_item then order_shipment, shipmemt and then facility.

```
Query Cost: 93,437.24
```
