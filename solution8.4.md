Question:

Sometimes the Quantity on Hand (QOH) doesn’t match the Available to Promise (ATP) due to pending orders, reservations, or data discrepancies. This needs review for accurate fulfillment planning.

Fields to retrieve:

PRODUCT_ID

FACILITY_ID

QOH (Quantity on Hand)

ATP (Available to Promise)

DIFFERENCE (QOH - ATP)

Solution:
```
SELECT
  i.product_id,
  i.facility_id,
  i.quantity_on_hand      AS qoh,
  i.available_to_promise  AS atp,
  (i.quantity_on_hand - i.available_to_promise) AS difference
FROM inventory_item i
WHERE (i.quantity_on_hand - i.available_to_promise) <> 0;
```

Reasoning:

By quantity_on_hand-available_to_promise we got the difference here and the one where where the difference is not equal to zero, this means there is discrepency between QOH and ATP and we were to show this only.

```
Query Cost: 222,042.51
```
