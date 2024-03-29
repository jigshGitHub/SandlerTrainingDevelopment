/*
Executed on 139 at 10/3 1:45AM
*/

USE [SandlerDB]
GO
/****** Object:  Table [dbo].[TBL_GA_TrngBenefits]    Script Date: 10/02/2012 15:21:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_GA_TrngBenefits]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_GA_TrngBenefits]
GO
/****** Object:  Table [dbo].[TBL_GA_SalesRepRetention]    Script Date: 10/02/2012 15:21:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_GA_SalesRepRetention]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_GA_SalesRepRetention]
GO
/****** Object:  Table [dbo].[TBL_GA_SalesRepRetention]    Script Date: 10/02/2012 15:21:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_GA_SalesRepRetention]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TBL_GA_SalesRepRetention](
	[SalesRepRetention] [nvarchar](255) NULL,
	[PercentOfIndustryAve] [int] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_TBL_GA_SalesRepRetention] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[TBL_GA_SalesRepRetention] ON
INSERT [dbo].[TBL_GA_SalesRepRetention] ([SalesRepRetention], [PercentOfIndustryAve], [Id]) VALUES (N'Less than 5%', 5, 1)
INSERT [dbo].[TBL_GA_SalesRepRetention] ([SalesRepRetention], [PercentOfIndustryAve], [Id]) VALUES (N'5% to 10%', 20, 2)
INSERT [dbo].[TBL_GA_SalesRepRetention] ([SalesRepRetention], [PercentOfIndustryAve], [Id]) VALUES (N'10% to 15%', 45, 3)
INSERT [dbo].[TBL_GA_SalesRepRetention] ([SalesRepRetention], [PercentOfIndustryAve], [Id]) VALUES (N'15% to 20%', 70, 4)
INSERT [dbo].[TBL_GA_SalesRepRetention] ([SalesRepRetention], [PercentOfIndustryAve], [Id]) VALUES (N'20%+', 100, 5)
SET IDENTITY_INSERT [dbo].[TBL_GA_SalesRepRetention] OFF
/****** Object:  Table [dbo].[TBL_GA_TrngBenefits]    Script Date: 10/02/2012 15:21:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_GA_TrngBenefits]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TBL_GA_TrngBenefits](
	[TrngBenefits] [nvarchar](255) NULL,
	[PercentOfIndustryAve] [int] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_TBL_GA_TrngBenefits] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[TBL_GA_TrngBenefits] ON
INSERT [dbo].[TBL_GA_TrngBenefits] ([TrngBenefits], [PercentOfIndustryAve], [Id]) VALUES (N'Less than 50%', 5, 1)
INSERT [dbo].[TBL_GA_TrngBenefits] ([TrngBenefits], [PercentOfIndustryAve], [Id]) VALUES (N'50% to 55%', 15, 2)
INSERT [dbo].[TBL_GA_TrngBenefits] ([TrngBenefits], [PercentOfIndustryAve], [Id]) VALUES (N'55% to 60%', 25, 3)
INSERT [dbo].[TBL_GA_TrngBenefits] ([TrngBenefits], [PercentOfIndustryAve], [Id]) VALUES (N'60% to 65%', 40, 4)
INSERT [dbo].[TBL_GA_TrngBenefits] ([TrngBenefits], [PercentOfIndustryAve], [Id]) VALUES (N'65% to 70%', 65, 5)
INSERT [dbo].[TBL_GA_TrngBenefits] ([TrngBenefits], [PercentOfIndustryAve], [Id]) VALUES (N'70% to 75%', 80, 6)
INSERT [dbo].[TBL_GA_TrngBenefits] ([TrngBenefits], [PercentOfIndustryAve], [Id]) VALUES (N'75% to 80%', 100, 7)
INSERT [dbo].[TBL_GA_TrngBenefits] ([TrngBenefits], [PercentOfIndustryAve], [Id]) VALUES (N'80%+', 110, 8)
SET IDENTITY_INSERT [dbo].[TBL_GA_TrngBenefits] OFF
GO

ALTER TABLE TBL_GA_TRACKER ADD AsIsSalesRepRetnId INT NULL
GO
ALTER TABLE TBL_GA_TRACKER ADD ToBeSalesRepRetnId INT NULL
GO
ALTER TABLE TBL_GA_TRACKER ADD AsIsTrngBenefitsId INT NULL
GO
ALTER TABLE TBL_GA_TRACKER ADD ToBeTrngBenefitsId INT NULL
GO
ALTER TABLE TBL_GA_TRACKER ADD DesiredAnnualImptSalesRepRetention VARCHAR(50) NULL
GO
ALTER TABLE TBL_GA_TRACKER ADD DesiredAnnualImptTrngBenefits  VARCHAR(50) NULL
GO

ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesRepRetention] FOREIGN KEY([AsIsSalesRepRetnId])
REFERENCES [dbo].[TBL_GA_SalesRepRetention] ([Id])
GO

ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesRepRetention]
GO

ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesRepRetention1] FOREIGN KEY([ToBeSalesRepRetnId])
REFERENCES [dbo].[TBL_GA_SalesRepRetention] ([Id])
GO

ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesRepRetention1]
GO

ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_TrngBenefits] FOREIGN KEY([AsIsTrngBenefitsId])
REFERENCES [dbo].[TBL_GA_TrngBenefits] ([Id])
GO

ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_TrngBenefits]
GO

ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_TrngBenefits1] FOREIGN KEY([ToBeTrngBenefitsId])
REFERENCES [dbo].[TBL_GA_TrngBenefits] ([Id])
GO

ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_TrngBenefits1]
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_GATracker]'))
DROP VIEW [dbo].[vw_GATracker]
GO

Create View [dbo].[vw_GATracker]
AS
Select 
--asisestbg.EstBenefitsGained AS AsIsEstBenefitsGained, asisestbg.PercentOfIndustryAve As AsIsEstBenefitsGainedPercentVal, 
--toBeESTBG.EstBenefitsGained AS ToBeEstBenefitsGained, toBeESTBG.PercentOfIndustryAve As ToBeEstBenefitsGainedPercentVal, 
asIsQA.QuotaAchievement AS AsIsQuotaAchievement, asIsQA.PercentOfIndustryAve As AsIsQuotaAchievementPercentVal, 
toBeQA.QuotaAchievement AS ToBeQuotaAchievement, toBeQA.PercentOfIndustryAve As ToBeQuotaAchievementPercentVal,
asIsSCT.SalesCycleTime AS AsIsSalesCycleTime, asIsSCT.PercentOfIndustryAve As AsIsSalesCycleTimePercentVal, 
toBeSCT.SalesCycleTime AS ToBeSalesCycleTime, toBeSCT.PercentOfIndustryAve As ToBeSalesCycleTimePercentVal,
asIsSE.SalesEfficiency AS AsIsSalesEfficiency, asIsSE.PercentOfIndustryAve As AsIsSalesEfficiencyPercentVal, 
toBeSE.SalesEfficiency AS ToBeSalesEfficiency, toBeSE.PercentOfIndustryAve As ToBeSalesEfficiencyPercentVal,
asIsSQ.SalesQualification AS AsIsSalesQualification, asIsSQ.PercentOfIndustryAve As AsIsSalesQualificationPercentVal, 
toBeSQ.SalesQualification AS ToBeSalesQualification, toBeSQ.PercentOfIndustryAve As ToBeSalesQualificationPercentVal,
--asIsTCS.TrngCostSavings AS AsIsTrngCostSavings, asIsTCS.PercentOfIndustryAve As AsIsTrngCostSavingsPercentVal, 
--toBeTCS.TrngCostSavings AS ToBeTrngCostSavings, toBeTCS.PercentOfIndustryAve As ToBeTrngCostSavingsPercentVal,
asIsSRR.SalesRepRetention AS AsIsSalesRepRetention, asIsSRR.PercentOfIndustryAve As AsIsSalesRepRetentionPercentVal, 
toBeSRR.SalesRepRetention AS ToBeSalesRepRetention, toBeSRR.PercentOfIndustryAve As ToBeSalesRepRetentionPercentVal,
asIsTB.TrngBenefits AS AsIsTrngBenefits, asIsTB.PercentOfIndustryAve As AsIsTrngBenefitsPercentVal, 
toBeTB.TrngBenefits AS ToBeTrngBenefits, toBeTB.PercentOfIndustryAve As ToBeTrngBenefitsPercentVal,
T.* From TBL_GA_Tracker T WITH (NOLOCK)
--INNER JOIN TBL_GA_EstBenefitsGained asIsESTBG WITH(NOLOCK) ON asisestbg.Id = T.AsIsEstBenGainedId
--INNER JOIN TBL_GA_EstBenefitsGained toBeESTBG WITH(NOLOCK) ON toBeESTBG.Id = T.ToBeEstBenGainedId
INNER JOIN TBL_GA_QuotaAchievement asIsQA WITH(NOLOCK) ON asIsQA.Id = T.AsIsQuotaAchtId
INNER JOIN TBL_GA_QuotaAchievement toBeQA WITH(NOLOCK) ON toBeQA.Id = T.ToBeQuotaAchtId
INNER JOIN TBL_GA_SalesCycleTime asIsSCT WITH(NOLOCK) ON asIsSCT.Id = T.AsIsSalesCycleTimeId
INNER JOIN TBL_GA_SalesCycleTime toBeSCT WITH(NOLOCK) ON toBeSCT.Id = T.ToBeSalesCycleTimeId
INNER JOIN TBL_GA_SalesEfficiency asIsSE WITH(NOLOCK) ON asIsSE.Id = T.AsIsSalesEffId
INNER JOIN TBL_GA_SalesEfficiency toBeSE WITH(NOLOCK) ON toBeSE.Id = T.ToBeSalesEffId
INNER JOIN TBL_GA_SalesQualification asIsSQ WITH(NOLOCK) ON asIsSQ.Id = T.AsIsSalesQualificationId
INNER JOIN TBL_GA_SalesQualification toBeSQ WITH(NOLOCK) ON toBeSQ.Id = T.ToBeSalesQualificationId
--INNER JOIN TBL_GA_TrainingCostSavings asIsTCS WITH(NOLOCK) ON asIsTCS.Id = T.AsIsTrgCostSavingsId
--INNER JOIN TBL_GA_TrainingCostSavings toBeTCS WITH(NOLOCK) ON toBeTCS.Id = T.ToBeTrgCostSavingsId
INNER JOIN TBL_GA_SalesRepRetention asIsSRR WITH(NOLOCK) ON asIsSRR.Id = T.AsIsSalesRepRetnId
INNER JOIN TBL_GA_SalesRepRetention toBeSRR WITH(NOLOCK) ON toBeSRR.Id = T.ToBeSalesRepRetnId
INNER JOIN TBL_GA_TrngBenefits asIsTB WITH(NOLOCK) ON asIsTB.Id = T.AsIsTrngBenefitsId
INNER JOIN TBL_GA_TrngBenefits toBeTB WITH(NOLOCK) ON toBeTB.Id = T.ToBeTrngBenefitsId

GO

UPDATE TBL_GA_TRACKER 
SET 
AsIsSalesRepRetnId = updateTable.AsIsTrgCostSavingsId,
ToBeSalesRepRetnId = updateTable.ToBeTrgCostSavingsId,
AsIsTrngBenefitsId = updateTable.AsIsEstBenGainedId,
ToBeTrngBenefitsId = updateTable.ToBeEstBenGainedId,
DesiredAnnualImptSalesRepRetention = updateTable.DesiredAnnualImptTrgCstSvgs,
DesiredAnnualImptTrngBenefits = updateTable.DesiredAnnualImptEstBenefitsGained
FROM TBL_GA_TRACKER updateTable
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_EstBenefitsGained]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_EstBenefitsGained]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_EstBenefitsGained1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_EstBenefitsGained1]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings1]
GO

ALTER TABLE TBL_GA_Tracker DROP COLUMN AsIsTrgCostSavingsId
GO

ALTER TABLE TBL_GA_Tracker DROP COLUMN AsIsEstBenGainedId
GO

ALTER TABLE TBL_GA_Tracker DROP COLUMN ToBeTrgCostSavingsId
GO

ALTER TABLE TBL_GA_Tracker DROP COLUMN ToBeEstBenGainedId
GO

ALTER TABLE TBL_GA_Tracker DROP COLUMN DesiredAnnualImptTrgCstSvgs
GO

ALTER TABLE TBL_GA_Tracker DROP COLUMN DesiredAnnualImptEstBenefitsGained
GO

INSERT INTO [SandlerDB].[dbo].[TBL_CHART] ([Caption],[SWFile], [ChartID], [TypeOfChart] ,[YaxisName] ,[CanvasBgColor] ,[BgColor] ,[CanvasBgAlpha] ,[BgAlpha], [DrillLevelChartIDs])      
VALUES ('Closed Sales Analysis (By Month)' ,'MSColumn3D.swf','ClosedSalesAnalysis','Chart','Sales Value' ,'FFFFFF' ,'FFFFFF' ,'100' ,'100', 'ClosedSalesAnalysisBySource' );
GO
INSERT INTO [SandlerDB].[dbo].[TBL_CHART] ([Caption],[SWFile], [ChartID], [TypeOfChart] ,[CanvasBgColor] ,[CanvasBgAlpha] ,[ShowLegend] ,[NumberSuffix] ,[PieRadius] ,[EnableRotation] )
VALUES ('Closed Sales Analysis By Source','Pie3D.swf','ClosedSalesAnalysisBySource','PieChart', 'FFFFFF' ,'100' ,'1' ,'%' ,'100' ,'1' );
GO

/****** Object:  StoredProcedure [dbo].[sp_GetClosedSalesAnalysis]    Script Date: 10/02/2012 23:22:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetClosedSalesAnalysis]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetClosedSalesAnalysis]
GO

CREATE PROCEDURE [dbo].[sp_GetClosedSalesAnalysis]
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
    
 --   IF @RoleName = 'Corporate'
	--Begin
    
	--	Select Count(COMPANIESID) AS CompaniesCount, ProductTypeName 
	--	FROM [vw_Opportunities]
	--	WHERE DATEPART(MONTH,CreationDate) = @month
	--	AND DATEPART(YEAR,CreationDate) = @year
	--	Group By ProductTypeName;
		
	--	Return;
	--END
	
	--IF @RoleName = 'Coach'
	--BEGIN
		
	--	Select Count(vw.COMPANIESID) AS ContactsCount, vw.ProductTypeName 
	--	FROM [vw_Opportunities] vw
	--	INNER JOIN TBL_FRANCHISEE f WITH(NOLOCK) ON f.ID = vw.FranchiseeId
	--	INNER JOIN TBL_COACH ch WITH(NOLOCK) ON ch.ID = f.CoachId
	--	WHERE DATEPART(MONTH,vw.CreationDate) = @month
	--	AND DATEPART(YEAR,vw.CreationDate) = @year
	--	AND ch.UserID = @userId
	--	Group By vw.ProductTypeName;
		
	--END 
	
	IF @RoleName = 'FranchiseeOwner'
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
			Group By ProductTypeName;
		ENd
		If @analysisType = 'ProductsSoldBySalesQuantity'
		Begin
			Select Count(CompanyId) AS SalesQuantity, ProductTypeName 
			FROM [vw_Opportunities]
			WHERE DATEPART(MONTH,CloseDate) = @month
			AND DATEPART(YEAR,CloseDate) = @year
			AND FranchiseeId = @franchiseeId
			Group By ProductTypeName;
		ENd
		Return;
	END
	
	IF @RoleName = 'FranchiseeUser'
	BEGIN
		
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		Select Count(COMPANYID) AS ContactsCount, ProductTypeName 
		FROM [vw_Opportunities]
		WHERE DATEPART(MONTH,CreationDate) = @month
		AND DATEPART(YEAR,CreationDate) = @year
		AND FranchiseeId = @franchiseeId
		AND CreatedBy = @userId
		Group By ProductTypeName;
		
	END 
END

GO


