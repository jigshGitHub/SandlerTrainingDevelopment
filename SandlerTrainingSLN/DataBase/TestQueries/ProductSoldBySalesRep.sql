Select vw.Value,vw.ProductTypeName, vw.[Status],vw.companyid,vw.companyname
FROM [vw_Opportunities] vw
WHERE DATEPART(MONTH,vw.CloseDate) = 10  AND DATEPART(YEAR,vw.CloseDate) = 2012 AND vw.FranchiseeId = 8;

Select sum(vw.Value),vw.ProductTypeName
FROM [vw_Opportunities] vw
WHERE DATEPART(MONTH,vw.CloseDate) = 10 AND  vw.companyid = 2941 AND DATEPART(YEAR,vw.CloseDate) = 2012 AND vw.FranchiseeId = 8
group by vw.ProductTypeName;
