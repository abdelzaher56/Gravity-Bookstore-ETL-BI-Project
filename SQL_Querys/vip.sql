SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY order_id_Bk ORDER BY status_value) AS rn 
    FROM Fact_Book_sales f join order_history_status oh on f.history_fk=oh.history_sk
) t
WHERE rn = 1 and status_value like'%deil'
--book_id_fk=10267




use gravity_books
select *
from order_history
--where history_sk=21273
use Book_sales_DWH
select f.order_id_Bk,ohs.history_Bk,
ohs.status_value,ohs.status_date,ohs.status_time,
b.Book_id_Bk
from order_history_status ohs join Fact_Book_sales f 
on f.history_fk=ohs.history_Bk join Book b
on f.book_id_fk=b.Book_id_sk
--where Book_id_Bk=7982
where status_value='cancelled'
--order by order_id_Bk

 use gravity_books
SELECT  
    COUNT(DISTINCT f.order_id) AS Net_Received_Orders
FROM order_history f
JOIN order_status h 
    ON f.status_id	 = h.status_id
WHERE h.status_value = 'Order Received'
  AND f.order_id NOT IN (
        SELECT order_id
        FROM order_history
        WHERE h.status_value IN ('Cancelled', 'Returned','Order Deprecated')
    );
use Book_sales_DWH
select distinct f.order_id_Bk,status_value
from Fact_Book_sales f join order_history_status ohs 
on f.history_fk=ohs.history_sk
--group by status_value
where status_value like 'Order Deprecated'
-----------------------------
use Book_sales_DWH
-- ﬂ· «·‹ Orders «·„ Êﬁ⁄ Ìÿ·⁄Ê« (7544 - 494 = 7050)
WITH Expected_Net AS (
    SELECT DISTINCT h.order_id
    FROM dbo. h
    WHERE h.status_value = 'Order Received'
      AND h.order_id NOT IN (
            SELECT order_id
            FROM dim_order_history2
            WHERE status_value IN ('Cancelled', 'Returned')
        )
),
Actual_Net AS (
    SELECT DISTINCT f.order_id_Bk
    FROM Fact_Book_sales f
    JOIN dim_order_history2 h 
        ON f.order_id_Bk = h.order_id
    WHERE h.status_value = 'Order Received'
      AND f.order_id_Bk NOT IN (
            SELECT order_id
            FROM dim_order_history2
            WHERE status_value IN ('Cancelled', 'Returned')
        )
)
-- ‘Ê› «·›—ﬁ »Ì‰ «·„ Êﬁ⁄ Ê«··Ì ÿ·⁄ ›⁄·«
SELECT order_id
FROM Actual_Net
EXCEPT
SELECT order_id
FROM Expected_Net;
