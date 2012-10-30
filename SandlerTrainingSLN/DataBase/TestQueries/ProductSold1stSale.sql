Select vw.Value,vw.ProductTypeName, vw.[Status],vw.StatusId
FROM [vw_Opportunities] vw
WHERE DATEPART(MONTH,vw.CloseDate) = 9 AND vw.IsNewCompany=1 AND DATEPART(YEAR,vw.CloseDate) = 2012 AND vw.FranchiseeId = 8;

Select sum(vw.Value),vw.ProductTypeName
FROM [vw_Opportunities] vw
WHERE DATEPART(MONTH,vw.CloseDate) = 9 AND vw.IsNewCompany=1 AND  DATEPART(YEAR,vw.CloseDate) = 2012 AND vw.FranchiseeId = 8
group by vw.ProductTypeName;

Select vw.id,vw.ProductTypeName, vw.[Status],vw.StatusId
FROM [vw_Opportunities] vw
WHERE DATEPART(MONTH,vw.CloseDate) = 9 AND vw.IsNewCompany=1 AND  DATEPART(YEAR,vw.CloseDate) = 2012 AND vw.FranchiseeId = 8;

Select count(vw.id),vw.ProductTypeName
FROM [vw_Opportunities] vw
WHERE DATEPART(MONTH,vw.CloseDate) = 9 AND vw.IsNewCompany=1 AND  DATEPART(YEAR,vw.CloseDate) = 2012 AND vw.FranchiseeId = 8
group by vw.ProductTypeName;