Question:

Customer Service might need to verify addresses for orders placed or completed in October 2023. This helps ensure shipments are delivered correctly and prevents address-related issues.

Fields to retrieve:

ORDER_ID

PARTY_ID (Customer ID)

CUSTOMER_NAME (or FIRST_NAME / LAST_NAME)

STREET_ADDRESS

CITY

STATE_PROVINCE

POSTAL_CODE

COUNTRY_CODE

ORDER_STATUS

ORDER_DATE

Solution:

```

select
	oh.order_id,
	oro.party_id as customer_id,
	pe.first_name,
	pe.last_name,
	pa.address1 as street_address,
	pa.state_province_geo_id as state_province,
	pa.city,
	pa.postal_code,
	pa.country_geo_id,
	oh.status_id,
	oh.order_date as order_date
from order_header oh
join order_role oro on oro.order_id=oh.order_id and oro.ROLE_TYPE_ID like '%customer'
join order_contact_mech ocm on ocm.order_id=oh.order_id and ocm.CONTACT_MECH_PURPOSE_TYPE_ID ="SHIPPING_LOCATION"
join order_status os on os.order_id = oh.order_id
join party p on p.party_id=oro.party_id
join person pe on pe.party_id=p.party_id
join postal_address pa on pa.contact_mech_id=OCM.CONTACT_MECH_ID
	where oh.status_id!="ORDER_CANCELLED"
	and DATE(os.status_datetime) between DATE('2023-10-01') and DATE('2023-10-31') group by  oh.order_id;

```
Reasoning:

In the given query we are required to verify addresses for orders placed or completed in october 2023, so for that we took the fields that we were asked to take and then on this we applied a check to rule out the orders with status as "ORDER_CANCELLED".  eft just the status of order cancelled since addresses for a customer were to be verified so role_type_id has to match with customer and the addresses given should be at the "SHIPPING_LOCATION".

Query Cost: 190,529.9

