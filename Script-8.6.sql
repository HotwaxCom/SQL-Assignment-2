Select 
    oh.sales_channel_enum_id as sales_channel,  
    count(oh.order_id) as total_orders,  
    sum(oh.grand_total) as total_revenue,  
    date_format(oh.order_date, '%Y-%m') AS reporting_period  
from order_header oh  
group by sales_channel, reporting_period  
order by reporting_period desc;
