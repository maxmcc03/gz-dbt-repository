
WITH product_sales_join AS (
SELECT
products_id
,orders_id
,date_date
,ROUND(revenue,2) AS revenue
,ROUND(quantity,2) AS quantity
,ROUND(quantity * purchase_price,2) AS purchase_cost
FROM {{ ref('stg_gz_data__sales') }}
INNER JOIN {{ ref('stg_gz_data__product') }}
USING (products_id)
)
SELECT
*
,ROUND(revenue - purchase_cost,2) AS margin
FROM product_sales_join