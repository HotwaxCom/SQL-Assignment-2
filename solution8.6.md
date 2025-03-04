Question:

Marketing and sales teams want to see how many orders come from each channel (e.g., web, mobile app, in-store POS, marketplace) to allocate resources effectively.

Solution:
```
Select 
    oh.sales_channel_enum_id as sales_channel,  
    count(oh.order_id) as total_orders,  
    sum(oh.grand_total) as total_revenue,  
    date_format(oh.order_date, '%Y-%m') AS reporting_period  
from order_header oh  
group by sales_channel, reporting_period  
order by reporting_period desc;
```

Reasoning:

Here, we were required to find that from which sales channel at what date range orders were made and revenue made, for this we retrieved the fields as asked taking all the details from a single table that is order header

```
Query Cost: 8450.55
``` 



