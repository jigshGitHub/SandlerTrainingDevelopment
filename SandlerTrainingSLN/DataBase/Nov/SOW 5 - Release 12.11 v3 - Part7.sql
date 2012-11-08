/*
Executed in server 139 on 11/2 at 6:49PM
*/

INSERT INTO [SandlerDB].[dbo].[TBL_CHART] ([Caption],[SWFile], [ChartID], [NumberSuffix], [TypeOfChart] ,[YaxisName] ,[CanvasBgColor] ,[BgColor] ,[CanvasBgAlpha] ,[BgAlpha], [DrillLevelChartIDs]) VALUES ('Benchmark - Sales Rep to Franchisee Name (By Month)' ,'StackedColumn3D.swf','BenchmarkSalesRepFranchisee', N'%','Chart','' ,'FFFFFF' ,'FFFFFF' ,'100' ,'100','BenchmarkSalesRepFranchiseeQty_BenchmarkSalesRepFranchiseeValue' );
GO
INSERT [dbo].[TBL_CHART] ([TypeOfChart], [Caption], [SWFile], [ChartID], [NumberSuffix], [SNumberSuffix], [XaxisName], [YaxisName], [CanvasBgColor], [BgColor], [CanvasBgAlpha], [BgAlpha], [PieRadius], [EnableRotation], [ShowLegend], [ShowLabels], [PlotGradientColor], [DrillLevelChartIDs], [IsActive], [LastUpdatedDate], [LastCreatedDate], [LastUpdatedBy], [LastCreatedBy]) VALUES ( N'PieChart', N'Sales Rep to Franchisee Name Quantity', N'Pie3D.swf', N'BenchmarkSalesRepFranchiseeQty', N'%', NULL, NULL, NULL, N'FFFFFF', NULL, N'100', NULL, N'100', N'1', N'1', N'0', NULL, NULL, 1, GetDate(), GetDate(), NULL, NULL)
GO
INSERT [dbo].[TBL_CHART] ([TypeOfChart], [Caption], [SWFile], [ChartID], [NumberSuffix], [SNumberSuffix], [XaxisName], [YaxisName], [CanvasBgColor], [BgColor], [CanvasBgAlpha], [BgAlpha], [PieRadius], [EnableRotation], [ShowLegend], [ShowLabels], [PlotGradientColor], [DrillLevelChartIDs], [IsActive], [LastUpdatedDate], [LastCreatedDate], [LastUpdatedBy], [LastCreatedBy]) VALUES ( N'PieChart', N'Sales Rep to Franchisee Name Value', N'Pie3D.swf', N'BenchmarkSalesRepFranchiseeValue', N'%', NULL, NULL, NULL, N'FFFFFF', NULL, N'100', NULL, N'100', N'1', N'1', N'0', NULL, NULL, 1, GetDate(), GetDate(), NULL, NULL)
GO


INSERT INTO [SandlerDB].[dbo].[TBL_CHART] ([Caption],[SWFile], [ChartID], [NumberSuffix], [TypeOfChart] ,[YaxisName] ,[CanvasBgColor] ,[BgColor] ,[CanvasBgAlpha] ,[BgAlpha], [DrillLevelChartIDs]) VALUES ('Benchmark - Franchisee Name to Region Name(By Month)' ,'StackedColumn3D.swf','BenchmarkFranchiseeRegion', N'%','Chart','' ,'FFFFFF' ,'FFFFFF' ,'100' ,'100','BenchmarkFranchiseeRegionQty_BenchmarkFranchiseeRegionValue' );
GO
INSERT [dbo].[TBL_CHART] ([TypeOfChart], [Caption], [SWFile], [ChartID], [NumberSuffix], [SNumberSuffix], [XaxisName], [YaxisName], [CanvasBgColor], [BgColor], [CanvasBgAlpha], [BgAlpha], [PieRadius], [EnableRotation], [ShowLegend], [ShowLabels], [PlotGradientColor], [DrillLevelChartIDs], [IsActive], [LastUpdatedDate], [LastCreatedDate], [LastUpdatedBy], [LastCreatedBy]) VALUES ( N'PieChart', N'Franchisee Name to Region Name Quantity', N'Pie3D.swf', N'BenchmarkFranchiseeRegionQty', N'%', NULL, NULL, NULL, N'FFFFFF', NULL, N'100', NULL, N'100', N'1', N'1', N'0', NULL, NULL, 1, GetDate(), GetDate(), NULL, NULL)
GO
INSERT [dbo].[TBL_CHART] ([TypeOfChart], [Caption], [SWFile], [ChartID], [NumberSuffix], [SNumberSuffix], [XaxisName], [YaxisName], [CanvasBgColor], [BgColor], [CanvasBgAlpha], [BgAlpha], [PieRadius], [EnableRotation], [ShowLegend], [ShowLabels], [PlotGradientColor], [DrillLevelChartIDs], [IsActive], [LastUpdatedDate], [LastCreatedDate], [LastUpdatedBy], [LastCreatedBy]) VALUES ( N'PieChart', N'Franchisee Name to Region Name Value', N'Pie3D.swf', N'BenchmarkFranchiseeRegionValue', N'%', NULL, NULL, NULL, N'FFFFFF', NULL, N'100', NULL, N'100', N'1', N'1', N'0', NULL, NULL, 1, GetDate(), GetDate(), NULL, NULL)
GO

/****** Object:  StoredProcedure [dbo].[sp_GetBenchMarkSalesFranchisee]    Script Date: 11/02/2012 13:25:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetBenchMarkRegionCountry]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetBenchMarkRegionCountry]
GO


Create Procedure [dbo].[sp_GetBenchMarkRegionCountry]
(
@month int,
@year int ,
@regionId int
)

As
declare @countryId int

Select @countryId = c.Id From TBL_Country c INNER JOIN TBL_REGION r ON c.ID = r.CountryID
Where r.ID = @regionId;


Select sum(vw.value) as TotalValue, count(vw.id) as TotalQty,vw.RegionID
FROM [vw_Opportunities] vw INNER JOIN TBL_REGION r ON r.ID = vw.RegionID
WHERE DATEPART(MONTH,vw.CloseDate) = @month AND  DATEPART(YEAR,vw.CloseDate) = @year AND  r.CountryID = @countryId
group by vw.RegionID;

GO


/****** Object:  StoredProcedure [dbo].[sp_GetBenchMarkSalesFranchisee]    Script Date: 11/02/2012 13:25:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetBenchMarkFranchiseeRegions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetBenchMarkFranchiseeRegions]
GO


Create Procedure [dbo].[sp_GetBenchMarkFranchiseeRegions]
(
@month int,
@year int ,
@franchiseeId int
)

As
declare @regionId int

Select @regionId = r.Id From TBL_REGION r INNER JOIN TBL_COACH c INNER JOIN TBL_FRANCHISEE f ON f.CoachID = c.ID ON c.RegionID = r.ID
Where f.ID = @franchiseeId;


Select sum(vw.value) as TotalValue, count(vw.id) as TotalQty,vw.FranchiseeId
FROM [vw_Opportunities] vw
WHERE DATEPART(MONTH,vw.CloseDate) = @month AND  DATEPART(YEAR,vw.CloseDate) = @year AND vw.RegionID = @regionId
group by vw.FranchiseeId;

GO

/****** Object:  StoredProcedure [dbo].[sp_GetBenchMarkSalesFranchisee]    Script Date: 11/02/2012 13:25:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetBenchMarkSalesFranchisee]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetBenchMarkSalesFranchisee]
GO


Create Procedure [dbo].[sp_GetBenchMarkSalesFranchisee]
(
@month int,
@year int ,
@franchiseeId int
)

As

Select sum(vw.value) as TotalValue, count(vw.id) as TotalQty,vw.SALESREPFIRSTNAME + ' ' + vw.SALESREPLASTNAME As SalesRep
FROM [vw_Opportunities] vw
WHERE DATEPART(MONTH,vw.CloseDate) = @month AND  DATEPART(YEAR,vw.CloseDate) = @year AND vw.FranchiseeId = @franchiseeId
group by vw.SALESREPFIRSTNAME + ' ' + vw.SALESREPLASTNAME;

GO

/****** Object:  StoredProcedure [dbo].[sp_GetContactsByUser]    Script Date: 11/02/2012 14:05:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetContactsByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetContactsByUser]
GO


CREATE Procedure [dbo].[sp_GetContactsByUser]
@userId UniqueIdentifier	

AS 
Begin

	DECLARE @RoleName VARCHAR(256)
    DECLARE @franchiseeId int
    
    Select @RoleName = RoleName From vw_aspnet_Roles r
    INNER JOIN vw_aspnet_UsersInRoles ur ON ur.RoleId = r.RoleId
    WHERE ur.UserId = @userId;
    
    PRINT @RoleName;
    
    IF @RoleName = 'Corporate'
	Begin
    
		Select *  
		FROM [vw_Contacts];
		
		Return;
	END
	
	IF @RoleName = 'Coach'
	BEGIN
		
		Select vw.*  
		FROM [vw_Contacts] vw
		INNER JOIN TBL_COACH ch WITH(NOLOCK) ON ch.ID = vw.CoachId
		WHERE ch.UserID = @userId;
		
	END 
	
	IF (@RoleName = 'FranchiseeOwner' OR @RoleName = 'Client')
	Begin
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		PRINT '@franchiseeId=' + CAST(@franchiseeId as varchar(10));
		
		Select vw.*  
		FROM [vw_Contacts] vw
		INNER JOIN TBL_Franchisee f WITH(NOLOCK) ON f.ID = vw.FranchiseeID
		WHERE vw.FranchiseeID = @franchiseeId;
		Return;
	END
	
	IF @RoleName = 'FranchiseeUser'
	BEGIN
		
		Select vw.*  
		FROM [vw_Contacts] vw
		WHERE vw.CreatedBy = CAST(@userId AS VARCHAR(100));
		
	END 
	
	
	
End


GO



/****** Object:  StoredProcedure [dbo].[sp_GetNewAppointmentsWithAppointmentSource]    Script Date: 11/02/2012 14:10:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetNewAppointmentsWithAppointmentSource]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetNewAppointmentsWithAppointmentSource]
GO

CREATE PROCEDURE [dbo].[sp_GetNewAppointmentsWithAppointmentSource]
    @month int,
	@year int,
	@userId UniqueIdentifier
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
    
		Select Count(CONTACTSID) AS ContactsCount, ApptSourceName 
		FROM [vw_NewAppointmentsWithAppointmentSource]
		WHERE DATEPART(MONTH,CreationDate) = @month
		AND DATEPART(YEAR,CreationDate) = @year
		Group By ApptSourceName;
		
		Return;
	END
	
	IF @RoleName = 'Coach'
	BEGIN
		
		Select Count(vw.CONTACTSID) AS ContactsCount, vw.ApptSourceName 
		FROM [vw_NewAppointmentsWithAppointmentSource] vw
		INNER JOIN TBL_FRANCHISEE f WITH(NOLOCK) ON f.ID = vw.FranchiseeId
		INNER JOIN TBL_COACH ch WITH(NOLOCK) ON ch.ID = f.CoachId
		WHERE DATEPART(MONTH,vw.CreationDate) = @month
		AND DATEPART(YEAR,vw.CreationDate) = @year
		AND ch.UserID = @userId
		Group By vw.ApptSourceName;
		
	END 
	
	IF(@RoleName = 'FranchiseeOwner' OR @RoleName = 'Client')
	Begin
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		PRINT '@franchiseeId=' + CAST(@franchiseeId as varchar(10));
		
		Select Count(CONTACTSID) AS ContactsCount, ApptSourceName 
		FROM [vw_NewAppointmentsWithAppointmentSource]
		WHERE DATEPART(MONTH,CreationDate) = @month
		AND DATEPART(YEAR,CreationDate) = @year
		AND FranchiseeId = @franchiseeId
		Group By ApptSourceName;
		
		Return;
	END
	
	IF @RoleName = 'FranchiseeUser'
	BEGIN
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		Select Count(CONTACTSID) AS ContactsCount, ApptSourceName 
		FROM [vw_NewAppointmentsWithAppointmentSource]
		WHERE DATEPART(MONTH,CreationDate) = @month
		AND DATEPART(YEAR,CreationDate) = @year
		AND FranchiseeId = @franchiseeId
		AND CreatedBy = CAST(@userId AS VARCHAR(100))
		Group By ApptSourceName;
		
	END 
END


GO

