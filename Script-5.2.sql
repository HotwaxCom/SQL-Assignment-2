select
	oh.order_id,
	per.first_name,
	per.last_name,
	pa.address1 as street_address,
	pa.state_province_geo_id as state_province,
	pa.city,
	pa.postal_code,
	oh.grand_total as total_amount,
	oh.created_stamp as order_date,
	oh.status_id
from order_header oh
join order_role oro on oro.order_id=oh.order_id
join order_contact_mech ocm on ocm.order_id=oh.order_id
join party p on p.party_id=oro.party_id
join person per on per.party_id=p.party_id
join postal_address pa on pa.contact_mech_id=OCM.CONTACT_MECH_ID
	where pa.state_province_geo_id="NY" or pa.city="New York" 
	and oro.ROLE_TYPE_ID = 'BILL_TO_CUSTOMER'
	and ocm.CONTACT_MECH_PURPOSE_TYPE_ID ="SHIPPING_LOCATION" 
order by oh.GRAND_TOTAL  desc;

