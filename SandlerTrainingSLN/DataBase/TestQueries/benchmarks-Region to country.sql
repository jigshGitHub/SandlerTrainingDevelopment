declare @month int
declare @year int 
declare @regionId int


set @year = 2012
set @regionId = 10


declare @countryId int
Select @countryId = c.Id From TBL_Country c  
INNER JOIN TBL_REGION r ON c.ID = r.CountryID
Where r.ID = @regionId;

print CAST(@countryId as varchar(10));


Select vw.Value, vw.[Status],r.Name, vw.RegionID
FROM [vw_Opportunities] vw INNER JOIN TBL_REGION r ON r.ID = vw.RegionID
WHERE DATEPART(MONTH,vw.CloseDate) IN (9,10,11) AND DATEPART(YEAR,vw.CloseDate) = @year AND r.CountryID = @countryId


set @month = 9

Select sum(vw.value) as TotalValue, count(vw.id) as TotalQty,vw.RegionID
FROM [vw_Opportunities] vw INNER JOIN TBL_REGION r ON r.ID = vw.RegionID
WHERE DATEPART(MONTH,vw.CloseDate) = @month AND  DATEPART(YEAR,vw.CloseDate) = @year AND  r.CountryID = @countryId
group by vw.RegionID;

set @month = 10

Select sum(vw.value) as TotalValue, count(vw.id) as TotalQty,vw.RegionID
FROM [vw_Opportunities] vw INNER JOIN TBL_REGION r ON r.ID = vw.RegionID
WHERE DATEPART(MONTH,vw.CloseDate) = @month AND  DATEPART(YEAR,vw.CloseDate) = @year AND  r.CountryID = @countryId
group by vw.RegionID;

set @month = 11

Select sum(vw.value) as TotalValue, count(vw.id) as TotalQty,vw.RegionID
FROM [vw_Opportunities] vw INNER JOIN TBL_REGION r ON r.ID = vw.RegionID
WHERE DATEPART(MONTH,vw.CloseDate) = @month AND  DATEPART(YEAR,vw.CloseDate) = @year AND  r.CountryID = @countryId
group by vw.RegionID;

exec [sp_GetBenchMarkRegionCountry] 9,2012,10;
exec [sp_GetBenchMarkRegionCountry] 10,2012,10;
exec [sp_GetBenchMarkRegionCountry] 11,2012,10;