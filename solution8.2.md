Question:

Avoiding out-of-stock situations is critical. This report flags items that have fallen below a certain reorder threshold or have zero available stock.

Fields to retrieve:

PRODUCT_ID

PRODUCT_NAME

FACILITY_ID

QOH (Quantity on Hand)

ATP (Available to Promise)

REORDER_THRESHOLD

DATE_CHECKED


Solution:

```
select
	distinct p.PRODUCT_ID ,
	p.PRODUCT_NAME ,
	ii.FACILITY_ID ,
	ii.QUANTITY_ON_HAND_TOTAL ,
	ii.AVAILABLE_TO_PROMISE_TOTAL,
	pf.REORDER_QUANTITY ,
	pf.LAST_UPDATED_STAMP DateChecked
from
	product p
-- Fetching the inventory details of the product
join inventory_item ii on
	ii.PRODUCT_ID = p.PRODUCT_ID
-- Fetching the reorder quantity and last updated stamp
join product_facility pf on
	pf.PRODUCT_ID = p.PRODUCT_ID;
```

Reasoning:

Here, we are required to find products which have fallen below a certain threshold, for this we started from product joined with inventory_item and then with product_facility to find reorder_quantity

```
Query Cost: 7,025,821.36
```

