select
	i.product_id,
	i.facility_id,
	i.quantity_on_hand,
	i.available_to_promise,
	(i.quantity_on_hand-i.available_to_promise) as difference
from inventory_item i;
	