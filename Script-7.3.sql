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

