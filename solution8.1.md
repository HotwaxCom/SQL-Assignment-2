Question:

Warehouse managers need to track “shrinkage” such as lost or damaged inventory to reconcile physical vs. system counts.

Fields to retrieve:

INVENTORY_ITEM_ID

PRODUCT_ID

FACILITY_ID

QUANTITY_LOST_OR_DAMAGED

REASON_CODE (Lost, Damaged, Expired, etc.)

TRANSACTION_DATE

Solution:

```
select 
	i.inventory_item_id,
	i.product_id,
	i.facility_id,
	abs(iiv.quantity_on_hand_var) as quantity_lost_or_damaged,
	iiv.variance_reason_id as reason_code,
	iid.effective_date as transaction_date
from inventory_item_detail iid 
join inventory_item_variance iiv 
	on iid.inventory_item_id = iiv.inventory_item_id	
join inventory_item i 
	on i.inventory_item_id = iiv.inventory_item_id
	where iid.reason_enum_id is not null
order by i.product_id;
```

Reasoning:

Here, we are required to find the orders that were lost or damaged so we find these details from the inventory_item_variance, we take quantity_on_hand_var as quantity_lost_or_damaged. I took fields like inventory_item_id, product_id and facility_id from the inventory_item table.

```
Query Cost: 10,388,701.53
```
