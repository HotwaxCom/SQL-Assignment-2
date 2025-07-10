Question:

Customer Service might need to verify addresses for orders placed or completed in October 2023. This helps ensure shipments are delivered correctly and prevents address-related issues.

Solution:

```

select
	oh.order_id,
	oro.party_id as customer_id,
	per.first_name,
	per.last_name,
	pa.address1 as street_address,
	pa.state_province_geo_id as state_province,
	pa.city,
	pa.postal_code,
	pa.country_geo_id,
	oh.status_id,
	oh.created_stamp as order_date
from order_header oh
join order_role oro on oro.order_id=oh.order_id
join order_contact_mech ocm on ocm.order_id=oh.order_id
join party p on p.party_id=oro.party_id
join person per on per.party_id=p.party_id
join postal_address pa on pa.contact_mech_id=OCM.CONTACT_MECH_ID
	where oh.status_id!="ORDER_CANCELLED"
	and oh.created_stamp between '2023-10-01' and '2023-10-31'
	and oro.ROLE_TYPE_ID like 'BILL_TO_CUSTOMER'
	and ocm.CONTACT_MECH_PURPOSE_TYPE_ID ="SHIPPING_LOCATION";
```
Reasoning:

In the given query we are required to verify addresses for orders placed or completed in october 2023, so for that we took the fields that we were asked to take and then on this we took all the status and left just the status of order cancelled since addresses were to be verified so the role_type_id = "BILL_TO_CUSTOMER" and the addresses given should be at the "SHIPPING_LOCATION"

Query Cost: 39,734.5

