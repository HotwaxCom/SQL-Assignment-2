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
SELECT
    os.order_id,
    os.order_item_seq_id,
    os.status_id AS current_status_id,
    os.status_datetime AS status_change_datetime,
    os.status_user_login AS changed_by
FROM order_status os
WHERE os.order_item_seq_id IS NOT NULL
  AND os.status_datetime = (
      SELECT MAX(os2.status_datetime)
      FROM order_status os2
      WHERE os2.order_id = os.order_id
        AND os2.order_item_seq_id = os.order_item_seq_id
  )
ORDER BY os.order_id;
```
Reasoning:

Here, we are required to find when an order's status was last changed to keep a record, so in this case we need the most recent change datetimeand for this a subquery has been used to get the most recend status change by date

```
Query Cost: 656,158.73
```
