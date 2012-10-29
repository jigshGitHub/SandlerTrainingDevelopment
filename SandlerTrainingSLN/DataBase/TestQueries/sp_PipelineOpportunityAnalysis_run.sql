Select vw.COMPANYID,vw.COMPANYNAME, vw.Value,vw.IsNewCompany, vw.ProductTypeName  
FROM [vw_Opportunities] vw  
WHERE DATEPART(MONTH,vw.CloseDate) = 10 AND DATEPART(YEAR,vw.CloseDate) = 2012 AND vw.FranchiseeId = 8

exec [sp_PipelineOpportunityAnalysis] 10,2012, '7f31e699-0ec2-46b7-b1ef-c66e1178f726','ProductsSoldBySalesValue' --MSIRegion1Fr1Owner 
