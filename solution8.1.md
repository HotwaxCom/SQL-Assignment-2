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
	iiv.created_stamp as transaction_date
from inventory_item i
join inventory_item_variance iiv 
	on iiv.inventory_item_id = i.inventory_item_id and iiv.variance_reason_id in ('DAMAGED','REJ_RSN_DAMAGED','VAR_DAMAGED','VAR_LOST','VAR_STOLEN')
order by i.product_id;
```

Reasoning:

Here, we are required to find the orders that were lost, damaged or expired so we find these details from the inventory_item_variance, we take quantity_on_hand_var as quantity_lost_or_damaged.Applied an additional check on variance_reason_id to lie in within the specified domains of reason.

```
Query Cost: 626,736.53
```
