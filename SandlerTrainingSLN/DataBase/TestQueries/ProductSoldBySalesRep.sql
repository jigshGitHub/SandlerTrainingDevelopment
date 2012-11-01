declare @month int
declare @year int 
declare @franchiseeId int
declare @salesRepName varchar(100);
set @month = 8
set @year = 2012
set @franchiseeId = 8
set @salesRepName = 'Jackson Brown'

Select vw.Value,vw.ProductTypeName, vw.[Status],vw.companyid,vw.companyname,vw.SALESREPFIRSTNAME + ' ' + vw.SALESREPLASTNAME
FROM [vw_Opportunities] vw
WHERE DATEPART(YEAR,vw.CloseDate) = @year AND vw.FranchiseeId = @franchiseeId


Select count(vw.id),vw.ProductTypeName
FROM [vw_Opportunities] vw
WHERE DATEPART(MONTH,vw.CloseDate) = @month AND  DATEPART(YEAR,vw.CloseDate) = @year AND vw.FranchiseeId = @franchiseeId
AND vw.SALESREPFIRSTNAME + ' ' + vw.SALESREPLASTNAME = @salesRepName
group by vw.ProductTypeName;

set @month = 9

Select count(vw.id),vw.ProductTypeName
FROM [vw_Opportunities] vw
WHERE DATEPART(MONTH,vw.CloseDate) = @month AND  DATEPART(YEAR,vw.CloseDate) = @year AND vw.FranchiseeId = @franchiseeId
AND vw.SALESREPFIRSTNAME + ' ' + vw.SALESREPLASTNAME = @salesRepName
group by vw.ProductTypeName;

set @month = 10

Select count(vw.id),vw.ProductTypeName
FROM [vw_Opportunities] vw
WHERE DATEPART(MONTH,vw.CloseDate) = @month AND  DATEPART(YEAR,vw.CloseDate) = @year AND vw.FranchiseeId = @franchiseeId
AND vw.SALESREPFIRSTNAME + ' ' + vw.SALESREPLASTNAME = @salesRepName
group by vw.ProductTypeName;
