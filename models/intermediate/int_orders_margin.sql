WITH product_sales_join AS (
SELECT
orders_id
,date_date
,ROUND(SUM(revenue),2) AS revenue
,ROUND(SUM(quantity),2) AS quantity
,ROUND(SUM(quantity * purchase_price),2) AS purchase_cost
FROM {{ ref('stg_gz_data__sales') }}
INNER JOIN {{ ref('stg_gz_data__product') }}
USING (products_id)
GROUP BY orders_id, date_date
ORDER BY date_date DESC
)
SELECT
*
,ROUND(revenue - purchase_cost,2) AS margin
FROM product_sales_join
