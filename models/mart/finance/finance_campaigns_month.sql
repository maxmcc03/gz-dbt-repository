SELECT 
 EXTRACT(MONTH FROM date_date) AS date_month
 , ROUND(SUM(ads_margin),2) AS ads_margin
 , ROUND(SUM(average_basket),2) AS average_basket
 , ROUND(SUM(operational_margin),2) AS operational_margin
 , SUM(ads_cost) AS ads_cost
 , SUM(ads_impression) AS ads_impression
 , SUM(ads_click) AS ads_click
 , SUM(total_quantity) AS total_quantity
 , ROUND(SUM(total_revenue),2) AS total_revenue
 , ROUND(SUM(total_purchase_cost),2) AS total_purchase_cost
 , ROUND(SUM(margin),2) AS margin
 , ROUND(SUM(total_shipping_fee),2) AS total_shipping_fee
 , ROUND(SUM(total_log_cost),2) AS total_log_cost
 , SUM(ship_cost) AS ship_cost
FROM {{ ref('finance_campaigns_day') }}
GROUP BY date_month 