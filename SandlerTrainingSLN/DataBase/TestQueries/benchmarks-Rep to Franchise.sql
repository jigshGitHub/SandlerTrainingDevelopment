declare @month int
declare @year int 
declare @franchiseeId int

set @year = 2012
set @franchiseeId = 8

Select vw.Value, vw.[Status],vw.companyid,vw.companyname,vw.SALESREPFIRSTNAME + ' ' + vw.SALESREPLASTNAME As SalesRep
FROM [vw_Opportunities] vw
WHERE DATEPART(MONTH,vw.CloseDate) IN (8,9,10) AND DATEPART(YEAR,vw.CloseDate) = @year AND vw.FranchiseeId = @franchiseeId

set @month = 8

Select sum(vw.value) as TotalValue, count(vw.id) as TotalQty,vw.SALESREPFIRSTNAME + ' ' + vw.SALESREPLASTNAME As SalesRep
FROM [vw_Opportunities] vw
WHERE DATEPART(MONTH,vw.CloseDate) = @month AND  DATEPART(YEAR,vw.CloseDate) = @year AND vw.FranchiseeId = @franchiseeId
group by vw.SALESREPFIRSTNAME + ' ' + vw.SALESREPLASTNAME;

set @month = 9

Select sum(vw.value) as TotalValue, count(vw.id) as TotalQty,vw.SALESREPFIRSTNAME + ' ' + vw.SALESREPLASTNAME As SalesRep
FROM [vw_Opportunities] vw
WHERE DATEPART(MONTH,vw.CloseDate) = @month AND  DATEPART(YEAR,vw.CloseDate) = @year AND vw.FranchiseeId = @franchiseeId
group by vw.SALESREPFIRSTNAME + ' ' + vw.SALESREPLASTNAME;

set @month = 10

Select sum(vw.value) as TotalValue, count(vw.id) as TotalQty,vw.SALESREPFIRSTNAME + ' ' + vw.SALESREPLASTNAME As SalesRep
FROM [vw_Opportunities] vw
WHERE DATEPART(MONTH,vw.CloseDate) = @month AND  DATEPART(YEAR,vw.CloseDate) = @year AND vw.FranchiseeId = @franchiseeId
group by vw.SALESREPFIRSTNAME + ' ' + vw.SALESREPLASTNAME;


exec sp_GetBenchMarkSalesFranchisee 11,2012,8