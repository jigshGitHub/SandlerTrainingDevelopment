declare @month int
declare @year int 


set @year = 2012

Select vw.Value, vw.[Status],r.Name, c.ID AS CountryID
FROM [vw_Opportunities] vw INNER JOIN TBL_REGION r INNER JOIN TBL_COUNTRY c ON r.CountryID = c.ID ON r.ID = vw.RegionID
WHERE DATEPART(MONTH,vw.CloseDate) IN (9,10,11) AND DATEPART(YEAR,vw.CloseDate) = @year


set @month = 9

Select sum(vw.value) as TotalValue, count(vw.id) as TotalQty, c.ID AS CountryID
FROM [vw_Opportunities] vw INNER JOIN TBL_REGION r INNER JOIN TBL_COUNTRY c ON r.CountryID = c.ID ON r.ID = vw.RegionID
WHERE DATEPART(MONTH,vw.CloseDate) = @month AND  DATEPART(YEAR,vw.CloseDate) = @year
group by c.ID;

set @month = 10

Select sum(vw.value) as TotalValue, count(vw.id) as TotalQty, c.ID AS CountryID
FROM [vw_Opportunities] vw INNER JOIN TBL_REGION r INNER JOIN TBL_COUNTRY c ON r.CountryID = c.ID ON r.ID = vw.RegionID
WHERE DATEPART(MONTH,vw.CloseDate) = @month AND  DATEPART(YEAR,vw.CloseDate) = @year
group by c.ID;

set @month = 11

Select sum(vw.value) as TotalValue, count(vw.id) as TotalQty, c.ID AS CountryID
FROM [vw_Opportunities] vw INNER JOIN TBL_REGION r INNER JOIN TBL_COUNTRY c ON r.CountryID = c.ID ON r.ID = vw.RegionID
WHERE DATEPART(MONTH,vw.CloseDate) = @month AND  DATEPART(YEAR,vw.CloseDate) = @year
group by c.ID;

exec [sp_GetBenchMarkCountryAll] 9,2012
exec [sp_GetBenchMarkCountryAll] 10,2012
exec [sp_GetBenchMarkCountryAll] 11,2012
