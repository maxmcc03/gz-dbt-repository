SELECT 
 date_date
 , ROUND(operational_margin - ads_cost,2) AS ads_margin
 , average_basket
 , operational_margin
 , ads_cost
 , ads_impression
 , ads_click
 , total_quantity
 , total_revenue
 , total_purchase_cost
 , margin
 , total_shipping_fee
 , total_log_cost
 , ship_cost
FROM {{ ref('int_campaigns_day') }}
LEFT JOIN {{ ref('finance_days') }}
USING(date_date)
ORDER BY date_date DESC