-- 1. Cohort Analysis
WITH cte AS (SELECT
*,
TO_DATE(TO_CHAR(sale_date, 'YYYY-MM') || '-01', 'YYYY-MM-DD') AS sale_month,
MIN(TO_DATE(TO_CHAR(sale_date, 'YYYY-MM') || '-01', 'YYYY-MM-DD')) OVER(PARTITION BY customer_id) AS cohort_month
FROM retail_sales),

cohort_data AS (SELECT
cohort_month, 
EXTRACT(YEAR FROM AGE(sale_month, cohort_month)) * 12 +
EXTRACT(MONTH FROM AGE(sale_month, cohort_month)) +1 AS cohort_index, 
COUNT(DISTINCT customer_id) AS unique_customers
FROM cte
GROUP BY 1, 2),


cohort_analysis AS (SELECT
cohort_month, 
SUM(CASE WHEN cohort_index = 1 THEN unique_customers ELSE 0 END) AS index_1,
SUM(CASE WHEN cohort_index = 2 THEN unique_customers ELSE 0 END) AS index_2,
SUM(CASE WHEN cohort_index = 3 THEN unique_customers ELSE 0 END) AS index_3,
SUM(CASE WHEN cohort_index = 4 THEN unique_customers ELSE 0 END) AS index_4,
SUM(CASE WHEN cohort_index = 5 THEN unique_customers ELSE 0  END) AS index_5,
SUM(CASE WHEN cohort_index = 6 THEN unique_customers ELSE 0 END) AS index_6,
SUM(CASE WHEN cohort_index = 7 THEN unique_customers ELSE 0 END) AS index_7,
SUM(CASE WHEN cohort_index = 8 THEN unique_customers ELSE 0 END) AS index_8,
SUM(CASE WHEN cohort_index = 9 THEN unique_customers ELSE 0 END) AS index_9,
SUM(CASE WHEN cohort_index = 10 THEN unique_customers ELSE 0 END) AS index_10,
SUM(CASE WHEN cohort_index = 11 THEN unique_customers ELSE 0 END) AS index_11,
SUM(CASE WHEN cohort_index = 12 THEN unique_customers ELSE 0 END) AS index_12,
SUM(CASE WHEN cohort_index = 13 THEN unique_customers ELSE 0 END) AS index_13,
SUM(CASE WHEN cohort_index = 14 THEN unique_customers ELSE 0 END) AS index_14,
SUM(CASE WHEN cohort_index = 15 THEN unique_customers ELSE 0 END) AS index_15,
SUM(CASE WHEN cohort_index = 16 THEN unique_customers ELSE 0 END) AS index_16,
SUM(CASE WHEN cohort_index = 17 THEN unique_customers ELSE 0 END) AS index_17,
SUM(CASE WHEN cohort_index = 18 THEN unique_customers ELSE 0 END) AS index_18,
SUM(CASE WHEN cohort_index = 19 THEN unique_customers ELSE 0 END) AS index_19,
SUM(CASE WHEN cohort_index = 20 THEN unique_customers ELSE 0 END) AS index_20,
SUM(CASE WHEN cohort_index = 21 THEN unique_customers ELSE 0 END) AS index_21,
SUM(CASE WHEN cohort_index = 22 THEN unique_customers ELSE 0 END) AS index_22,
SUM(CASE WHEN cohort_index = 23 THEN unique_customers ELSE 0 END) AS index_23,
SUM(CASE WHEN cohort_index = 24 THEN unique_customers ELSE 0 END) AS index_24
FROM cohort_data
GROUP BY 1),

-- 2. Time Sales Growth
monthly_sales AS (SELECT
TO_CHAR(sale_date, 'YYYY-MM') AS month, 
SUM(total_sale)
FROM retail_sales
GROUP BY 1
ORDER BY 1, 2 DESC)


SELECT
*
FROM retail_sales





