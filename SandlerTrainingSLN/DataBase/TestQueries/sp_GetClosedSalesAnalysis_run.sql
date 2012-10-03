exec [sp_GetClosedSalesAnalysis] 9, 2012, '139F3A7C-2D08-4C6A-92A6-4E78D228EF8E' --corporate
exec [sp_GetClosedSalesAnalysis] 8, 2012, '720D27B4-950B-4852-82E8-80E20E0EAFBE' -- coach
exec [sp_GetClosedSalesAnalysis] 8, 2012, '7F31E699-0EC2-46B7-B1EF-C66E1178F726','ProductsSold' --frowner
exec [sp_GetClosedSalesAnalysis] 9, 2012, '62f38ec0-fbd5-448b-b4ed-782f90d5d4bd'--fruser
exec [sp_GetClosedSalesAnalysis] 8, 2012, '7F31E699-0EC2-46B7-B1EF-C66E1178F726','ProductsSoldBySalesValue'
exec [sp_GetClosedSalesAnalysis] 8, 2012, '7F31E699-0EC2-46B7-B1EF-C66E1178F726','ProductsSoldBySalesQuantity'

Select Count(CompanyId) AS SalesQuantity, ProductTypeName 
			FROM [vw_Opportunities]
			WHERE DATEPART(MONTH,CloseDate) = 8
			AND DATEPART(YEAR,CloseDate) = 2012
			AND FranchiseeId = 8
			Group By ProductTypeName;