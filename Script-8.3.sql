
select
	oh.order_id,
	oh.status_id,
	f.facility_id,
	f.facility_name,
	f.facility_type_id,
	ft.parent_type_id
from order_header oh
join order_shipment os
	on os.order_id = oh.order_id
join shipment s
	on s.shipment_id = os.shipment_id 
join facility f 
	on f.facility_id=s.origin_facility_id
join facility_type ft on ft.facility_type_id = f.facility_type_id
	where oh.status_id="ORDER_CREATED" or oh.status_id="ORDER_APPROVED";

