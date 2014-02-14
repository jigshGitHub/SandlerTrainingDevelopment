


/****** Object:  StoredProcedure [dbo].[sp_PipelineOpportunityAnalysis]    Script Date: 01/30/2014 06:11:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_PipelineOpportunityAnalysis]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_PipelineOpportunityAnalysis]
GO

/****** Object:  StoredProcedure [dbo].[sp_PipelineOpportunityAnalysis]    Script Date: 01/30/2014 06:11:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[sp_PipelineOpportunityAnalysis] 
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
	SET @sqlSelectClause = @sqlSelectClause + 'Select SUM(vw.Value) AS SalesValue, vw.ProductTypeName ';
	SET @sqlGrpByClause = ' Group By vw.ProductTypeName';
END
If @analysisType = 'ProductsSoldBySalesQuantity' 
Begin
	SET @sqlSelectClause = @sqlSelectClause + 'Select Count(vw.CompanyId) AS SalesQuantity, vw.ProductTypeName ';
	SET @sqlGrpByClause = ' Group By vw.ProductTypeName'; 
END
If @analysisType = 'SalesValueOppSource' 
Begin 
	SET @sqlSelectClause = @sqlSelectClause + 'Select SUM(vw.Value) AS SalesValue, vw.Source ';
	SET @sqlGrpByClause = ' Group By vw.Source';
END
If @analysisType = 'SalesQuantityOppSource' 
Begin 
	SET @sqlSelectClause = @sqlSelectClause + 'Select Count(vw.CompanyId) AS SalesQuantity, vw.Source ';
	SET  @sqlGrpByClause = ' Group By vw.Source';
END
If @analysisType = 'SalesValueOpportunityType' 
Begin 
	SET @sqlSelectClause = @sqlSelectClause + 'Select SUM(vw.Value) AS SalesQuantity, vw.[Type] ';
	SET  @sqlGrpByClause = ' Group By vw.[Type]';
END
If @analysisType = 'SalesQuantityOpportunityType' 
Begin 
	SET @sqlSelectClause = @sqlSelectClause + 'Select Count(vw.CompanyId) AS SalesQuantity, vw.[Type] ';
	SET  @sqlGrpByClause = ' Group By vw.[Type]';
END
IF @RoleName = 'Corporate' 
Begin 
	SET @sqlFromClause = @sqlFromClause + ' FROM [vw_Opportunities] vw' ;	
	SET @sqlWhereClause = ' WHERE   DATEPART(MONTH,CloseDate) = ' + CAST(@month AS VARCHAR(2)) + ' AND DATEPART(YEAR,CloseDate) = ' + CAST(@year AS VARCHAR(4)); 	
END
IF @RoleName = 'Coach' 
Begin
	SET @sqlFromClause = @sqlFromClause + ' FROM [vw_Opportunities] vw INNER JOIN TBL_FRANCHISEE f WITH(NOLOCK) ON f.ID = vw.FranchiseeId INNER JOIN TBL_COACH ch WITH(NOLOCK) ON ch.ID = f.CoachId  ';
	SET @sqlWhereClause = ' WHERE   DATEPART(MONTH,vw.CreationDate) = ' + CAST(@month AS VARCHAR(2)) + ' AND DATEPART(YEAR,vw.CreationDate) = ' + CAST(@year AS VARCHAR(4)) + ' AND ch.UserID = ''' + CAST(@userId AS VARCHAR(100)) + '''';
END
IF (@RoleName = 'FranchiseeOwner' OR @RoleName = 'FranchiseeUser' OR @RoleName = 'Client' )
Begin 
	Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK) WHERE UserID = @userId; 
	SET @sqlFromClause = @sqlFromClause + ' FROM [vw_Opportunities] vw ';
	SET @sqlWhereClause = ' WHERE   DATEPART(MONTH,vw.CloseDate) = ' + CAST(@month AS VARCHAR(2))  + ' AND DATEPART(YEAR,vw.CloseDate) = ' + CAST(@year AS VARCHAR(4)) + ' AND vw.FranchiseeId = ' + CAST(@franchiseeId  AS VARCHAR(6));
END

IF @searchNewCompany IS NOT NULL
BEGIN
	SET @sqlWhereClause = @sqlWhereClause + ' AND vw.IsNewCompany = ' + CAST(@searchNewCompany AS VARCHAR(5));
END
IF @companyIds IS NOT NULL
BEGIN
	SET @sqlWhereClause = @sqlWhereClause + ' AND vw.CompanyId IN (' +  @companyIds +  ')';
END
Create Table #tmpData(Value varchar(10), AnalysisType Varchar(100));
--SET @sqlQuery = 'WITH data_cte (Value, AnalysisType) AS ( ';
SET @sqlQuery = @sqlQuery + @sqlSelectClause + @sqlFromClause + @sqlWhereClause + @sqlGrpByClause;
--SET @sqlQuery = @sqlQuery + ' ) SELECT * FROM data_cte '
PRINT @sqlQuery;

INSERT INTO #tmpData EXEC (@sqlQuery)
SELECT * FROM #tmpData
DROP table #tmpData;
END
 



GO


