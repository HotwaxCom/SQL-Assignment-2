Question:

Operations teams need to audit when an order item’s status (e.g., from “Pending” to “Shipped”) was last changed, for shipment tracking or dispute resolution.

Fields to retrieve:

ORDER_ID

ORDER_ITEM_SEQ_ID

CURRENT_STATUS_ID

STATUS_CHANGE_DATETIME

CHANGED_BY

Solution:

```
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
```
Reasoning:

Here, we are required to find when an order's status was last changed to keep a record, so in this case we need the most recent change datetimeand for this a subquery has been used to get the most recend status change by date

```
Query Cost: 84,570.27
```
