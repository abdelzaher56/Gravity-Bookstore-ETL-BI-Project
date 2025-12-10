SELECT TOP 10
    b.title,
    SUM(f.price) AS Total_Revenue
FROM Fact_Book_sales f
JOIN book b 
    ON f.book_id_fk = b.Book_id_sk
JOIN dim_order_history2 h 
    ON f.order_id_Bk = h.order_id
WHERE h.status_value = 'Order Received'
  --AND f.order_id_Bk NOT IN (
       -- SELECT order_id
      --  FROM dim_order_history2
        --WHERE status_value IN ('Cancelled', 'Returned')
  --  )
GROUP BY b.title
ORDER BY Total_Revenue DESC;

SELECT TOP 5 
    b.title,
    COUNT(f.order_id_Bk) AS Total_Sales
FROM Fact_Book_sales f
JOIN book b 
    ON f.book_id_fk = b.Book_id_sk
JOIN dim_order_history2 h 
    ON f.order_id_Bk = h.order_id
WHERE h.status_value = 'Order Received'
  --AND f.order_id_Bk NOT IN (
   --     SELECT order_id
   --     FROM dim_order_history2
   --     WHERE status_value IN ('Cancelled', 'Returned')
   -- )
GROUP BY b.title
ORDER BY Total_Sales DESC;
SELECT TOP 5 
    b.title,
    COUNT(f.order_id_Bk) AS Total_Sales
FROM Fact_Book_sales f
JOIN book b 
    ON f.book_id_fk = b.Book_id_sk
JOIN dim_order_history2 h 
    ON f.order_id_Bk = h.order_id
WHERE h.status_value = 'Order Received'
  AND f.order_id_Bk NOT IN (
       SELECT order_id
       FROM dim_order_history2
      WHERE status_value IN ('Cancelled', 'Returned')
   )
GROUP BY b.title
ORDER BY Total_Sales DESC;