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
    distinct p.product_id,
    p.product_name,
    ii.facility_id,
    ii.quantity_on_hand_total,
    ii.available_to_promise_total,
    pf.reorder_quantity,
    pf.last_updated_stamp as DateChecked
from
    product p
join inventory_item ii 
    on p.product_id = ii.product_id
join product_facility pf 
    on pf.product_id = p.product_id
where
    ii.available_to_promise_total <= pf.reorder_quantity;

```

Reasoning:

Here, we are required to find products which have fallen below a certain threshold, for this we started from product joined with inventory_item and then with product_facility to find reorder_quantity. Also, applied a check to show only those products for which reorder_quantity is always higher than the available_to_promise_total.

```
Query Cost: 155,195.43
```

