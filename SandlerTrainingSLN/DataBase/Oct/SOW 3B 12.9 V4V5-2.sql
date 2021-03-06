/*
Executed on 139 Dt:10/22 11:41PM
*/

USE [SandlerDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetClosedSalesAnalysis]    Script Date: 10/03/2012 21:38:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetClosedSalesAnalysis]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetClosedSalesAnalysis]
GO

USE [SandlerDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetClosedSalesAnalysis]    Script Date: 10/03/2012 21:38:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

 
CREATE  PROCEDURE [dbo].[sp_GetClosedSalesAnalysis] 
	@month int, 
	@year int, 
	@userId UniqueIdentifier, 
	@analysisType varchar(100) 
AS
 
BEGIN
 

DECLARE @RoleName VARCHAR(256) 
DECLARE @franchiseeId int 

Select @RoleName = RoleName From vw_aspnet_Roles r 
INNER JOIN vw_aspnet_UsersInRoles ur ON ur.RoleId = r.RoleId 
WHERE ur.UserId = @userId; 

PRINT @RoleName; 

IF @RoleName = 'Corporate' 
Begin 

	If @analysisType = 'ProductsSoldBySalesValue' 
	Begin 
		Select SUM(WeightedValue) AS SalesValue, ProductTypeName 
		FROM [vw_Opportunities] 
		WHERE DATEPART(MONTH,CloseDate) = @month 
		AND DATEPART(YEAR,CloseDate) = @year 
		AND StatusID = 7
		Group By ProductTypeName; 
	ENd 
	If @analysisType = 'SalesValueOppSource' 
	Begin 
		Select SUM(WeightedValue) AS SalesValue, [Source] 
		FROM [vw_Opportunities] 
		WHERE DATEPART(MONTH,CloseDate) = @month 
		AND DATEPART(YEAR,CloseDate) = @year 
		AND StatusID = 7
		Group By [Source]; 
	ENd 
	If @analysisType = 'ProductsSoldBySalesQuantity' 
	Begin 
		Select Count(CompanyId) AS SalesQuantity, ProductTypeName 
		FROM [vw_Opportunities] 
		WHERE DATEPART(MONTH,CloseDate) = @month 
		AND DATEPART(YEAR,CloseDate) = @year 
		AND StatusID = 7
		Group By ProductTypeName; 
	ENd 
	If @analysisType = 'SalesQuantityOppSource' 
	Begin 
		Select Count(CompanyId) AS SalesQuantity, [Source] 
		FROM [vw_Opportunities] 
		WHERE DATEPART(MONTH,CloseDate) = @month 
		AND DATEPART(YEAR,CloseDate) = @year 
		AND StatusID = 7
		Group By [Source]; 
	ENd 
	Return; 
END 

IF @RoleName = 'Coach' 
BEGIN 

	If @analysisType = 'ProductsSoldBySalesValue' 
	Begin 
		Select SUM(WeightedValue) AS SalesValue, ProductTypeName 
		FROM [vw_Opportunities] vw 
		INNER JOIN TBL_FRANCHISEE f WITH(NOLOCK) ON f.ID = vw.FranchiseeId 
		INNER JOIN TBL_COACH ch WITH(NOLOCK) ON ch.ID = f.CoachId 
		WHERE DATEPART(MONTH,vw.CreationDate) = @month 
		AND DATEPART(YEAR,vw.CreationDate) = @year 
		AND ch.UserID = @userId 
		AND StatusID = 7
		Group By vw.ProductTypeName; 
	ENd 
	If @analysisType = 'SalesValueOppSource' 
	Begin 
		Select SUM(WeightedValue) AS SalesValue, [Source] 
		FROM [vw_Opportunities] vw 
		INNER JOIN TBL_FRANCHISEE f WITH(NOLOCK) ON f.ID = vw.FranchiseeId 
		INNER JOIN TBL_COACH ch WITH(NOLOCK) ON ch.ID = f.CoachId 
		WHERE DATEPART(MONTH,vw.CreationDate) = @month 
		AND DATEPART(YEAR,vw.CreationDate) = @year 
		AND ch.UserID = @userId 
		AND StatusID = 7
		Group By [Source]; 
	ENd 
	If @analysisType = 'ProductsSoldBySalesQuantity' 
	Begin 
		Select Count(CompanyId) AS SalesQuantity, ProductTypeName 
		FROM [vw_Opportunities] vw 
		INNER JOIN TBL_FRANCHISEE f WITH(NOLOCK) ON f.ID = vw.FranchiseeId 
		INNER JOIN TBL_COACH ch WITH(NOLOCK) ON ch.ID = f.CoachId 
		WHERE DATEPART(MONTH,vw.CreationDate) = @month 
		AND DATEPART(YEAR,vw.CreationDate) = @year 
		AND ch.UserID = @userId 
		AND StatusID = 7
		Group By vw.ProductTypeName; 
	ENd 
	If @analysisType = 'SalesQuantityOppSource' 
	Begin 
		Select Count(CompanyId) AS SalesQuantity, [Source] 
		FROM [vw_Opportunities] vw 
		INNER JOIN TBL_FRANCHISEE f WITH(NOLOCK) ON f.ID = vw.FranchiseeId 
		INNER JOIN TBL_COACH ch WITH(NOLOCK) ON ch.ID = f.CoachId 
		WHERE DATEPART(MONTH,vw.CreationDate) = @month 
		AND DATEPART(YEAR,vw.CreationDate) = @year 
		AND ch.UserID = @userId 
		AND StatusID = 7
	Group By [Source]; 
	ENd 
	Return; 

END
 
IF (@RoleName = 'FranchiseeOwner' OR @RoleName = 'FranchiseeUser' )
Begin 
	Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK) 
	WHERE UserID = @userId; 

	PRINT '@franchiseeId=' + CAST(@franchiseeId as varchar(10)); 

	If @analysisType = 'ProductsSoldBySalesValue' 
	Begin 
		Select SUM(WeightedValue) AS SalesValue, ProductTypeName 
		FROM [vw_Opportunities] 
		WHERE DATEPART(MONTH,CloseDate) = @month 
		AND DATEPART(YEAR,CloseDate) = @year 
		AND FranchiseeId = @franchiseeId 
		AND StatusID = 7
		Group By ProductTypeName; 
	ENd 
	If @analysisType = 'SalesValueOppSource' 
	Begin 
		Select SUM(WeightedValue) AS SalesValue, [Source] 
		FROM [vw_Opportunities] 
		WHERE DATEPART(MONTH,CloseDate) = @month 
		AND DATEPART(YEAR,CloseDate) = @year 
		AND FranchiseeId = @franchiseeId 
		AND StatusID = 7
		Group By [Source]; 
	ENd 
	If @analysisType = 'ProductsSoldBySalesQuantity' 
	Begin 
		Select Count(CompanyId) AS SalesQuantity, ProductTypeName 
		FROM [vw_Opportunities] 
		WHERE DATEPART(MONTH,CloseDate) = @month 
		AND DATEPART(YEAR,CloseDate) = @year 
		AND FranchiseeId = @franchiseeId 
		AND StatusID = 7
		Group By ProductTypeName; 
	ENd 
	If @analysisType = 'SalesQuantityOppSource' 
	Begin 
		Select Count(CompanyId) AS SalesQuantity, [Source] 
		FROM [vw_Opportunities] 
		WHERE DATEPART(MONTH,CloseDate) = @month 
		AND DATEPART(YEAR,CloseDate) = @year 
		AND FranchiseeId = @franchiseeId 
		AND StatusID = 7
		Group By [Source]; 
	ENd 
	Return; 
	END 


END
 

GO


