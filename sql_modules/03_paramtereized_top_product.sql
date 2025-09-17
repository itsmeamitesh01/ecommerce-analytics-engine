/*************************************************************************************************
-- PROJECT: E-commerce SQL Analysis
-- SCRIPT: 03_parameterized_hero_products.sql
-- DESCRIPTION: This advanced script identifies the top M "hero products" within each of the
--              top N highest-revenue product categories. The output is a prioritized list
--              of items perfect for targeted marketing and inventory management.
-- PARAMETERS:
--  - top_n_categories (INT64): The number of top categories to analyze (e.g., 5 for top 5).
--  - top_m_products (INT64): The number of top products to rank within each category (e.g., 3 for top 3).
*************************************************************************************************/


-- =================================================================================
--                              CONFIGURATION
-- =================================================================================
DECLARE top_n_categories INT64 DEFAULT 5;
DECLARE top_m_products INT64 DEFAULT 3;
-- =================================================================================


WITH top_categories AS (
    -- Step 1: Dynamically identify the top N product categories by total net revenue.
    SELECT
        p.product_category_name,
        SUM(oi.price + oi.freight_value) AS net_revenue
    FROM
        `e-com-469109.olist_project.order_items` oi
    JOIN
        `e-com-469109.olist_project.products` p USING (product_id)
    JOIN
        `e-com-469109.olist_project.orders` o USING (order_id)
    WHERE
        p.product_category_name IS NOT NULL
        AND o.order_status = 'delivered'
    GROUP BY
        p.product_category_name
    ORDER BY
        net_revenue DESC
    LIMIT top_n_categories -- Using the parameter here
),

product_ranks AS (
    -- Step 2: Rank all products by sales volume within each of the top categories.
    SELECT
        p.product_category_name,
        p.product_id,
        COUNT(p.product_id) AS total_sold,
        ROW_NUMBER() OVER(PARTITION BY p.product_category_name ORDER BY COUNT(p.product_id) DESC) as product_rank
    FROM
        `e-com-469109.olist_project.products` p
    JOIN
        `e-com-469109.olist_project.order_items` oi USING (product_id)
    WHERE
        p.product_category_name IN (SELECT product_category_name FROM top_categories)
    GROUP BY
        p.product_category_name, p.product_id
)

-- Step 3: Final selection of the top M products from the top N categories.
SELECT
    product_category_name,
    product_id,
    total_sold,
    product_rank
FROM
    product_ranks
WHERE
    product_rank <= top_m_products -- Using the second parameter here
ORDER BY
    product_category_name, product_rank;