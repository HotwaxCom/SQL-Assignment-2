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

	
