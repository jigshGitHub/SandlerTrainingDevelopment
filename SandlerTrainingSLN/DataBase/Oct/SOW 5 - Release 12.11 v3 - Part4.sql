/****** Object:  StoredProcedure [dbo].[sp_GetClosedSalesAnalysis]    Script Date: 10/27/2012 07:57:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetClosedSalesAnalysis]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetClosedSalesAnalysis]
GO

CREATE  PROCEDURE [dbo].[sp_GetClosedSalesAnalysis] 
	@month int, 
	@year int, 
	@userId UniqueIdentifier, 
	@analysisType varchar(100),
	@searchNewCompany bit = NULL,
	@companyIds varchar(500) = NULL
AS
 
BEGIN
 

DECLARE @RoleName VARCHAR(256) 
DECLARE @franchiseeId int 

Select @RoleName = RoleName From vw_aspnet_Roles r 
INNER JOIN vw_aspnet_UsersInRoles ur ON ur.RoleId = r.RoleId 
WHERE ur.UserId = @userId; 

DECLARE @sqlSelectClause VARCHAR(MAX);
DECLARE @sqlFromClause VARCHAR(MAX);
DECLARE @sqlGrpByClause VARCHAR(MAX);
DECLARE @sqlWhereClause VARCHAR(MAX);
DECLARE @sqlQuery VARCHAR(MAX);

SET @sqlSelectClause = '';
SET @sqlFromClause = '';
SET @sqlGrpByClause = '';
SET @sqlWhereClause = '';
SET @sqlQuery = '';

If @analysisType = 'ProductsSoldBySalesValue' 
Begin 
	SET @sqlSelectClause = @sqlSelectClause + 'Select SUM(vw.WeightedValue) AS SalesValue, vw.ProductTypeName ';
	SET @sqlGrpByClause = ' Group By vw.ProductTypeName';
END
If @analysisType = 'ProductsSoldBySalesQuantity' 
Begin
	SET @sqlSelectClause = @sqlSelectClause + 'Select Count(vw.CompanyId) AS SalesQuantity, vw.ProductTypeName ';
	SET @sqlGrpByClause = ' Group By vw.ProductTypeName'; 
END
If @analysisType = 'SalesValueOppSource' 
Begin 
	SET @sqlSelectClause = @sqlSelectClause + 'Select SUM(vw.WeightedValue) AS SalesValue, vw.Source ';
	SET @sqlGrpByClause = ' Group By vw.Source';
END
If @analysisType = 'SalesQuantityOppSource' 
Begin 
	SET @sqlSelectClause = @sqlSelectClause + 'Select Count(vw.CompanyId) AS SalesQuantity, vw.Source ';
	SET  @sqlGrpByClause = ' Group By vw.Source';
END

IF @RoleName = 'Corporate' 
Begin 
	SET @sqlFromClause = @sqlFromClause + ' FROM [vw_Opportunities] vw' ;	
	SET @sqlWhereClause = ' WHERE DATEPART(MONTH,CloseDate) = ' + CAST(@month AS VARCHAR(2)) + ' AND DATEPART(YEAR,CloseDate) = ' + CAST(@year AS VARCHAR(4)); 	
END
IF @RoleName = 'Coach' 
Begin
	SET @sqlFromClause = @sqlFromClause + ' FROM [vw_Opportunities] vw INNER JOIN TBL_FRANCHISEE f WITH(NOLOCK) ON f.ID = vw.FranchiseeId INNER JOIN TBL_COACH ch WITH(NOLOCK) ON ch.ID = f.CoachId  ';
	SET @sqlWhereClause = ' WHERE DATEPART(MONTH,vw.CreationDate) = ' + CAST(@month AS VARCHAR(2)) + ' AND DATEPART(YEAR,vw.CreationDate) = ' + CAST(@year AS VARCHAR(4)) + ' AND ch.UserID = ''' + CAST(@userId AS VARCHAR(100)) + '''';
END
IF (@RoleName = 'FranchiseeOwner' OR @RoleName = 'FranchiseeUser' OR @RoleName = 'Client' )
Begin 
	Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK) WHERE UserID = @userId; 
	SET @sqlFromClause = @sqlFromClause + ' FROM [vw_Opportunities] vw ';
	SET @sqlWhereClause = ' WHERE DATEPART(MONTH,vw.CloseDate) = ' + CAST(@month AS VARCHAR(2))  + ' AND DATEPART(YEAR,vw.CloseDate) = ' + CAST(@year AS VARCHAR(4)) + ' AND vw.FranchiseeId = ' + CAST(@franchiseeId  AS VARCHAR(6));
END

IF @searchNewCompany IS NOT NULL
BEGIN
	SET @sqlWhereClause = @sqlWhereClause + ' AND vw.IsNewCompany = ' + CAST(@searchNewCompany AS VARCHAR(5));
END
IF @companyIds IS NOT NULL
BEGIN
	SET @sqlWhereClause = @sqlWhereClause + ' AND vw.CompanyId IN (' +  @companyIds +  ')';
END
SET @sqlQuery = @sqlQuery + @sqlSelectClause + @sqlFromClause + @sqlWhereClause + @sqlGrpByClause;
PRINT @sqlQuery;

EXEC (@sqlQuery)
/*
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

*/
END
 


GO

