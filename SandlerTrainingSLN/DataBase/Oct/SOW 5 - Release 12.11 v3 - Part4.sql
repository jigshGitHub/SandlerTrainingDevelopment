/*
Executed on 139 @ 10/29 1:53PM
*/
INSERT [dbo].[TBL_CHART] ([TypeOfChart], [Caption], [SWFile], [ChartID], [NumberSuffix], [SNumberSuffix], [XaxisName], [YaxisName], [CanvasBgColor], [BgColor], [CanvasBgAlpha], [BgAlpha], [PieRadius], [EnableRotation], [ShowLegend], [ShowLabels], [PlotGradientColor], [DrillLevelChartIDs], [IsActive], [LastUpdatedDate], [LastCreatedDate], [LastUpdatedBy], [LastCreatedBy]) VALUES (N'Chart', N'Pipeline Opportunity Analysis (By Month)', N'MSColumn3D.swf', N'PipelineOpportunityAnalysis', NULL, NULL, NULL, N'Sales Value', N'FFFFFF', N'FFFFFF', N'100', N'100', NULL, N'0', N'0', N'0', NULL, N'PipelineOpportunityAnalysisBySource', 1, GetDate(), GetDate(), NULL, NULL)
GO
INSERT [dbo].[TBL_CHART] ([TypeOfChart], [Caption], [SWFile], [ChartID], [NumberSuffix], [SNumberSuffix], [XaxisName], [YaxisName], [CanvasBgColor], [BgColor], [CanvasBgAlpha], [BgAlpha], [PieRadius], [EnableRotation], [ShowLegend], [ShowLabels], [PlotGradientColor], [DrillLevelChartIDs], [IsActive], [LastUpdatedDate], [LastCreatedDate], [LastUpdatedBy], [LastCreatedBy]) VALUES (N'PieChart', N'Pipeline Opportunity Analysis By Source', N'Pie3D.swf', N'PipelineOpportunityAnalysisBySource', N'%', NULL, NULL, NULL, N'FFFFFF', NULL, N'100', NULL, N'100', N'1', N'1', N'0', NULL, NULL, 1, GetDate(), GetDate(), NULL, NULL)
GO

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
	SET @sqlWhereClause = ' WHERE StatusID = 7 AND  DATEPART(MONTH,CloseDate) = ' + CAST(@month AS VARCHAR(2)) + ' AND DATEPART(YEAR,CloseDate) = ' + CAST(@year AS VARCHAR(4)); 	
END
IF @RoleName = 'Coach' 
Begin
	SET @sqlFromClause = @sqlFromClause + ' FROM [vw_Opportunities] vw INNER JOIN TBL_FRANCHISEE f WITH(NOLOCK) ON f.ID = vw.FranchiseeId INNER JOIN TBL_COACH ch WITH(NOLOCK) ON ch.ID = f.CoachId  ';
	SET @sqlWhereClause = ' WHERE StatusID = 7 AND  DATEPART(MONTH,vw.CreationDate) = ' + CAST(@month AS VARCHAR(2)) + ' AND DATEPART(YEAR,vw.CreationDate) = ' + CAST(@year AS VARCHAR(4)) + ' AND ch.UserID = ''' + CAST(@userId AS VARCHAR(100)) + '''';
END
IF (@RoleName = 'FranchiseeOwner' OR @RoleName = 'FranchiseeUser' OR @RoleName = 'Client' )
Begin 
	Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK) WHERE UserID = @userId; 
	SET @sqlFromClause = @sqlFromClause + ' FROM [vw_Opportunities] vw ';
	SET @sqlWhereClause = ' WHERE StatusID = 7 AND  DATEPART(MONTH,vw.CloseDate) = ' + CAST(@month AS VARCHAR(2))  + ' AND DATEPART(YEAR,vw.CloseDate) = ' + CAST(@year AS VARCHAR(4)) + ' AND vw.FranchiseeId = ' + CAST(@franchiseeId  AS VARCHAR(6));
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
END

GO
/****** Object:  StoredProcedure [dbo].[sp_PipelineOpportunityAnalysis]    Script Date: 10/27/2012 07:57:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_PipelineOpportunityAnalysis]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_PipelineOpportunityAnalysis]
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
SET @sqlQuery = @sqlQuery + @sqlSelectClause + @sqlFromClause + @sqlWhereClause + @sqlGrpByClause;
PRINT @sqlQuery;

EXEC (@sqlQuery)

END
 


GO


