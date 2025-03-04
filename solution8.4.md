Question:

Sometimes the Quantity on Hand (QOH) doesn’t match the Available to Promise (ATP) due to pending orders, reservations, or data discrepancies. This needs review for accurate fulfillment planning.

Solution:
```
select
	i.product_id,
	i.facility_id,
	i.quantity_on_hand,
	i.available_to_promise,
	(i.quantity_on_hand-i.available_to_promise) as difference 
from inventory_item i;
```

Reasoning:

By quantity_on_hand-available_to_promise we got the difference here that is the case when the QOH and ATP does not match

```
Query Cost: 217,168.9
```
