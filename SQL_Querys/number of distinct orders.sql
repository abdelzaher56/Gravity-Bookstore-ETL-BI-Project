SELECT  
    DISTINCT f.order_id_Bk AS Net_Received_Orders ,status_value
FROM Fact_Book_sales f
JOIN dim_order_history2 h 
    ON f.order_id_Bk = h.order_id
WHERE h.status_value = 'Order Received'
  AND f.order_id_Bk NOT IN (
        SELECT order_id
        FROM dim_order_history2
        WHERE status_value IN ('Cancelled', 'Returned','Order Deprecated')
    )
	order by Net_Received_Orders
	
-------------------------------------------------------
SELECT  
    SUM(order_total) AS Net_Revenue,count (*) as  Net_Orders
FROM (
    SELECT  
        f.order_id_Bk, 
        SUM(f.price) AS order_total
    FROM Fact_Book_sales f
    JOIN dim_order_history2 h 
        ON f.order_id_Bk = h.order_id
    WHERE h.status_value = 'Order Received'
      AND f.order_id_Bk NOT IN (
            SELECT order_id
            FROM dim_order_history2
            WHERE status_value IN ('Cancelled', 'Returned')
        )
    GROUP BY f.order_id_Bk
) AS sub;

------------------------------------------------------------------
SELECT 
    COUNT(DISTINCT order_id) * 1.0 / 
    (SELECT COUNT(DISTINCT order_id) 
     FROM dim_order_history2
     WHERE status_value = 'Order Received') * 100 
     AS Cancelled_Percentage
FROM dim_order_history2
WHERE status_value = 'Cancelled';
----------------
SELECT  
    SUM(f.price) AS Net_Revenue,
    COUNT(DISTINCT f.order_id_Bk) AS Net_Orders
FROM Fact_Book_sales f
JOIN dim_order_history2 h 
    ON f.order_id_Bk = h.order_id
WHERE h.status_value = 'Order Received'
  AND f.order_id_Bk NOT IN (
        SELECT order_id
        FROM dim_order_history2
        WHERE status_value IN ('Cancelled', 'Returned')
    );
