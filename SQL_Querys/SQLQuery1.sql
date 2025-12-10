select p.ProductID, pom.*
from Production.Product p inner join Production.BillOfMaterials  pom 
on p.ProductID = pom.ProductAssemblyID inner joi
--productassemblyid = new peoducts that we assemblyed using other products
--is added in product table as product as productid
--componentid = productid received from table product on productid column that is used as componeent in other products assembly
go
select wo.productid,count (wo.ScrappedQty),r.Name
from Production.WorkOrder wo join Production.ScrapReason r on wo.ScrapReasonID=r.ScrapReasonID
--order by r.ScrapReasonID desc
group by name
go
select count (Pri),
from Production.ScrapReason
select 
    count(wo.ScrappedQty) as ScrapCount, 
    r.Name
from Production.WorkOrder wo
join Production.ScrapReason r 
    on wo.ScrapReasonID = r.ScrapReasonID
group by  r.Name
order by ScrapCount desc
SELECT 
    th.ProductID,
    COUNT(CASE WHEN pi.Quantity < th.Quantity THEN 1 END) AS StockoutCount,
    COUNT(th.TransactionID) AS TotalOrders,
    CAST(COUNT(CASE WHEN pi.Quantity < th.Quantity THEN 1 END) AS FLOAT) 
        / COUNT(th.TransactionID) * 100 AS StockoutRate
FROM Production.TransactionHistory th
INNER JOIN Production.ProductInventory pi
    ON th.ProductID = pi.ProductID
GROUP BY th.ProductID;
select*
from Production.BillOfMaterials
select *
from Production.UnitMeasure
select count( ProductID),UnitPriceDiscount
from Sales.SalesOrderDetail
where UnitPriceDiscount>0
group by UnitPriceDiscount

select *
from Sales.SalesOrderDetail
/*
select top 5 count(sd.UnitPriceDiscount) as number_of_discount, sd.ProductID , p.Name
from Sales.SalesOrderDetail sd join Production.Product p on sd.ProductID= p.ProductID
group by sd.ProductID ,p.Name 
having count(sd.UnitPriceDiscount) >0
order by number_of_discount desc
*/
-- the most item has discount 
select top 5 
    count(case when sd.UnitPriceDiscount > 0 then 1 end) as number_of_discount,
    sd.ProductID,
    p.Name
from Sales.SalesOrderDetail sd
join Production.Product p 
    on sd.ProductID = p.ProductID
group by sd.ProductID, p.Name
having count(case when sd.UnitPriceDiscount > 0 then 1 end) > 0
order by number_of_discount desc;
