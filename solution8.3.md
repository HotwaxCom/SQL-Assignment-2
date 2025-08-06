Question:

The business wants to know where open orders are currently assigned, whether in a physical store or a virtual facility (e.g., a distribution center or online fulfillment location).

Fields to retrieve:

ORDER_ID

ORDER_STATUS

FACILITY_ID

FACILITY_NAME

FACILITY_TYPE_ID


Solution:
```
select
	oh.ORDER_ID ,
	oh.STATUS_ID ,
	ii.FACILITY_ID ,
	f.FACILITY_NAME ,
	f.FACILITY_TYPE_ID
from
	order_header oh
join inventory_item_detail iid on
	iid.ORDER_ID = oh.ORDER_ID
join inventory_item ii on
	ii.INVENTORY_ITEM_ID = iid.INVENTORY_ITEM_ID
join facility f on
	f.FACILITY_ID = ii.FACILITY_ID
where
	oh.STATUS_ID in ('ORDER_APPROVED', 'ORDER_CREATED');
```
Reasoning:

Since we were asked for open orders therefore we took all order whose status were ORDER_APPROVED, ORDER_CREATED and rest retrieved the fields as asked 

```
Query Cost: 5,614,238.82
```
