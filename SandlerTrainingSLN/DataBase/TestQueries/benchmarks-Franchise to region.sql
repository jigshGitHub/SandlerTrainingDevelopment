declare @month int
declare @year int 
declare @franchiseeId int


set @year = 2012
set @franchiseeId = 8


declare @regionId int
Select @regionId = r.Id From TBL_REGION r 
INNER JOIN TBL_COACH c INNER JOIN TBL_FRANCHISEE f
ON f.CoachID = c.ID
ON c.RegionID = r.ID
Where f.ID = @franchiseeId;

print CAST(@regionId as varchar(10));


Select vw.Value, vw.[Status],vw.FranchiseeName, vw.FranchiseeId,  vw.FranchiseeName
FROM [vw_Opportunities] vw
WHERE DATEPART(MONTH,vw.CloseDate) IN (9,10,11) AND DATEPART(YEAR,vw.CloseDate) = @year AND vw.RegionID = @regionId


set @month = 9

Select sum(vw.value) as TotalValue, count(vw.id) as TotalQty,vw.FranchiseeId, vw.FranchiseeName
FROM [vw_Opportunities] vw
WHERE DATEPART(MONTH,vw.CloseDate) = @month AND  DATEPART(YEAR,vw.CloseDate) = @year AND vw.RegionID = @regionId
group by vw.FranchiseeId, vw.FranchiseeName;

set @month = 10

Select sum(vw.value) as TotalValue, count(vw.id) as TotalQty,vw.FranchiseeId, vw.FranchiseeName
FROM [vw_Opportunities] vw
WHERE DATEPART(MONTH,vw.CloseDate) = @month AND  DATEPART(YEAR,vw.CloseDate) = @year AND vw.RegionID = @regionId
group by vw.FranchiseeId, vw.FranchiseeName;

set @month = 11

Select sum(vw.value) as TotalValue, count(vw.id) as TotalQty,vw.FranchiseeId, vw.FranchiseeName
FROM [vw_Opportunities] vw
WHERE DATEPART(MONTH,vw.CloseDate) = @month AND  DATEPART(YEAR,vw.CloseDate) = @year AND vw.RegionID = @regionId
group by vw.FranchiseeId, vw.FranchiseeName;


exec sp_GetBenchMarkFranchiseeRegions 9,2012,8;