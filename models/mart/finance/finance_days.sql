
SELECT
date_date
, ROUND(SUM(margin),2) as margin
, ROUND(SUM(ship_cost),2) as ship_cost
, ROUND(COUNT(orders_id),2) AS nb_transactions
, ROUND(SUM(revenue),2) AS total_revenue
, ROUND(SUM(revenue)/COUNT(orders_id),2) AS average_basket
, ROUND(SUM(purchase_cost),2) AS total_purchase_cost
, ROUND(SUM(shipping_fee),2) AS total_shipping_fee
, ROUND(SUM(logcost),2) AS total_log_cost
, ROUND(SUM(quantity),2) AS total_quantity
, ROUND(SUM(operational_margin),2) AS operational_margin
FROM {{ ref('int_orders_operational') }}
GROUP BY date_date

