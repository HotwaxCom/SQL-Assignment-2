Select
    os.order_id,
    os.order_item_seq_id,
    s.status_id AS current_status_id,
    ss.status_date AS status_change_datetime,
    ss.change_by_user_login_id AS changed_by
from order_shipment os
join shipment_status ss ON os.shipment_id = ss.shipment_id
join shipment s ON s.shipment_id = ss.shipment_id
where ss.status_date = (
    select MAX(ss2.status_date) 
    from shipment_status ss2 
    where ss2.shipment_id = ss.shipment_id
)
order by os.order_id;