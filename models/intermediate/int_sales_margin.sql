
WITH produc_sales_join AS (
SELECT
products_id
,SUM(revenue) AS revenue
,SUM(quantity) AS quantity
,SUM(quantity * purchase_price) AS purchase_cost
FROM {{ ref('stg_gz_data__sales') }}
INNER JOIN {{ ref('stg_gz_data__product') }}
USING (products_id)
GROUP BY products_id
)
SELECT
*
,revenue - purchase_cost AS margin
FROM produc_sales_join