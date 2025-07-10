Question:

Companies often want region-specific analysis to plan local marketing, staffing, or promotions in certain areas—here, specifically, New York.

Solution:
```
SELECT DISTINCT
    oh.order_id,
    per.first_name,
    per.last_name,
    pa.address1 AS street_address,
    pa.state_province_geo_id AS state_province,
    pa.city,
    pa.postal_code,
    oh.grand_total AS total_amount,
    oh.order_date AS order_date,
    oh.status_id
FROM order_header oh
JOIN order_role oro 
    ON oro.order_id = oh.order_id AND oro.role_type_id = 'BILL_TO_CUSTOMER'
JOIN party p 
    ON p.party_id = oro.party_id
JOIN person per 
    ON per.party_id = p.party_id
JOIN order_contact_mech ocm 
    ON ocm.order_id = oh.order_id AND ocm.contact_mech_purpose_type_id = 'SHIPPING_LOCATION'
JOIN postal_address pa 
    ON pa.contact_mech_id = ocm.contact_mech_id
WHERE 
    (pa.state_province_geo_id = 'NY' OR pa.city = 'New York')
ORDER BY oh.grand_total DESC;

```
Reasoning:

Here, we needed region-specefic analysis specifically New York. So for this we took state_province_geo_id = "NY" or city ="New York" and applied joins as required in the question.

```
Query Cost: 77,126.12
```
