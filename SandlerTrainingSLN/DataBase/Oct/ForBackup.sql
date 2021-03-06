USE [SandlerDB]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_COMPANIES]    Script Date: 10/02/2012 16:20:07 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_COMPANIES]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_COMPANIES]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_CONTACTS]    Script Date: 10/02/2012 16:20:07 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_CONTACTS]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_CONTACTS]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_EstBenefitsGained]    Script Date: 10/02/2012 16:20:07 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_EstBenefitsGained]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_EstBenefitsGained]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_EstBenefitsGained1]    Script Date: 10/02/2012 16:20:07 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_EstBenefitsGained1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_EstBenefitsGained1]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_QuotaAchievement]    Script Date: 10/02/2012 16:20:07 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_QuotaAchievement]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_QuotaAchievement]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_QuotaAchievement1]    Script Date: 10/02/2012 16:20:07 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_QuotaAchievement1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_QuotaAchievement1]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_SalesCycleTime]    Script Date: 10/02/2012 16:20:07 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesCycleTime]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesCycleTime]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_SalesCycleTime1]    Script Date: 10/02/2012 16:20:07 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesCycleTime1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesCycleTime1]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_SalesEfficiency]    Script Date: 10/02/2012 16:20:07 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesEfficiency]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesEfficiency]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_SalesEfficiency1]    Script Date: 10/02/2012 16:20:07 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesEfficiency1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesEfficiency1]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_SalesQualification]    Script Date: 10/02/2012 16:20:07 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesQualification]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesQualification]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_SalesQualification1]    Script Date: 10/02/2012 16:20:07 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesQualification1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesQualification1]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_SalesRepRetention]    Script Date: 10/02/2012 16:20:07 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesRepRetention]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesRepRetention]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_SalesRepRetention1]    Script Date: 10/02/2012 16:20:07 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesRepRetention1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesRepRetention1]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings]    Script Date: 10/02/2012 16:20:07 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings1]    Script Date: 10/02/2012 16:20:07 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings1]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_TrngBenefits]    Script Date: 10/02/2012 16:20:07 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_TrngBenefits]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_TrngBenefits]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_TrngBenefits1]    Script Date: 10/02/2012 16:20:07 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_TrngBenefits1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_TrngBenefits1]
GO
/****** Object:  Table [dbo].[TBL_GA_Tracker]    Script Date: 10/02/2012 16:20:07 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_COMPANIES]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_COMPANIES]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_CONTACTS]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_CONTACTS]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_EstBenefitsGained]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_EstBenefitsGained]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_EstBenefitsGained1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_EstBenefitsGained1]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_QuotaAchievement]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_QuotaAchievement]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_QuotaAchievement1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_QuotaAchievement1]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesCycleTime]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesCycleTime]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesCycleTime1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesCycleTime1]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesEfficiency]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesEfficiency]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesEfficiency1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesEfficiency1]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesQualification]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesQualification]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesQualification1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesQualification1]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesRepRetention]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesRepRetention]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesRepRetention1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesRepRetention1]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings1]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_TrngBenefits]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_TrngBenefits]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_TrngBenefits1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_TrngBenefits1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_GA_Tracker]
GO
/****** Object:  Table [dbo].[TBL_GA_TrainingCostSavings]    Script Date: 10/02/2012 16:20:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_GA_TrainingCostSavings]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_GA_TrainingCostSavings]
GO
/****** Object:  Table [dbo].[TBL_GA_EstBenefitsGained]    Script Date: 10/02/2012 16:20:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_GA_EstBenefitsGained]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_GA_EstBenefitsGained]
GO
/****** Object:  Table [dbo].[TBL_GA_EstBenefitsGained]    Script Date: 10/02/2012 16:20:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_GA_EstBenefitsGained]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TBL_GA_EstBenefitsGained](
	[EstBenefitsGained] [nvarchar](255) NULL,
	[PercentOfIndustryAve] [int] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_TBL_GA_EstBenefitsGained] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[TBL_GA_EstBenefitsGained] ON
INSERT [dbo].[TBL_GA_EstBenefitsGained] ([EstBenefitsGained], [PercentOfIndustryAve], [Id]) VALUES (N'Less than 50%', 5, 1)
INSERT [dbo].[TBL_GA_EstBenefitsGained] ([EstBenefitsGained], [PercentOfIndustryAve], [Id]) VALUES (N'50% to 55%', 15, 2)
INSERT [dbo].[TBL_GA_EstBenefitsGained] ([EstBenefitsGained], [PercentOfIndustryAve], [Id]) VALUES (N'55% to 60%', 25, 3)
INSERT [dbo].[TBL_GA_EstBenefitsGained] ([EstBenefitsGained], [PercentOfIndustryAve], [Id]) VALUES (N'60% to 65%', 40, 4)
INSERT [dbo].[TBL_GA_EstBenefitsGained] ([EstBenefitsGained], [PercentOfIndustryAve], [Id]) VALUES (N'65% to 70%', 65, 5)
INSERT [dbo].[TBL_GA_EstBenefitsGained] ([EstBenefitsGained], [PercentOfIndustryAve], [Id]) VALUES (N'70% to 75%', 80, 6)
INSERT [dbo].[TBL_GA_EstBenefitsGained] ([EstBenefitsGained], [PercentOfIndustryAve], [Id]) VALUES (N'75% to 80%', 100, 7)
INSERT [dbo].[TBL_GA_EstBenefitsGained] ([EstBenefitsGained], [PercentOfIndustryAve], [Id]) VALUES (N'80%+', 110, 8)
SET IDENTITY_INSERT [dbo].[TBL_GA_EstBenefitsGained] OFF
/****** Object:  Table [dbo].[TBL_GA_TrainingCostSavings]    Script Date: 10/02/2012 16:20:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_GA_TrainingCostSavings]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TBL_GA_TrainingCostSavings](
	[TrngCostSavings] [nvarchar](255) NULL,
	[PercentOfIndustryAve] [int] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_TBL_GA_TrainingCostSavings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[TBL_GA_TrainingCostSavings] ON
INSERT [dbo].[TBL_GA_TrainingCostSavings] ([TrngCostSavings], [PercentOfIndustryAve], [Id]) VALUES (N'Less than 5%', 5, 1)
INSERT [dbo].[TBL_GA_TrainingCostSavings] ([TrngCostSavings], [PercentOfIndustryAve], [Id]) VALUES (N'5% to 10%', 20, 2)
INSERT [dbo].[TBL_GA_TrainingCostSavings] ([TrngCostSavings], [PercentOfIndustryAve], [Id]) VALUES (N'10% to 15%', 45, 3)
INSERT [dbo].[TBL_GA_TrainingCostSavings] ([TrngCostSavings], [PercentOfIndustryAve], [Id]) VALUES (N'15% to 20%', 70, 4)
INSERT [dbo].[TBL_GA_TrainingCostSavings] ([TrngCostSavings], [PercentOfIndustryAve], [Id]) VALUES (N'20%+', 100, 5)
SET IDENTITY_INSERT [dbo].[TBL_GA_TrainingCostSavings] OFF
/****** Object:  Table [dbo].[TBL_GA_Tracker]    Script Date: 10/02/2012 16:20:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TBL_GA_Tracker](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[ContactId] [int] NOT NULL,
	[AsIsSalesCycleTimeId] [int] NULL,
	[AsIsSalesEffId] [int] NULL,
	[AsIsSalesQualificationId] [int] NULL,
	[AsIsTrgCostSavingsId] [int] NULL,
	[AsIsQuotaAchtId] [int] NULL,
	[AsIsEstBenGainedId] [int] NULL,
	[ToBeSalesCycleTimeId] [int] NULL,
	[ToBeSalesEffId] [int] NULL,
	[ToBeSalesQualificationId] [int] NULL,
	[ToBeTrgCostSavingsId] [int] NULL,
	[ToBeQuotaAchtId] [int] NULL,
	[ToBeEstBenGainedId] [int] NULL,
	[DesiredAnnualImptSalesCycleTime] [varchar](50) NULL,
	[DesiredAnnualImptSalesEfficiency] [varchar](50) NULL,
	[DesiredAnnualImptSalesQualfn] [varchar](50) NULL,
	[DesiredAnnualImptTrgCstSvgs] [varchar](50) NULL,
	[DesiredAnnualImptQuotaAcht] [varchar](50) NULL,
	[DesiredAnnualImptEstBenefitsGained] [varchar](50) NULL,
	[Year1] [numeric](18, 0) NULL,
	[Year2] [numeric](18, 0) NULL,
	[Year3] [numeric](18, 0) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[AsIsSalesRepRetnId] [int] NULL,
	[ToBeSalesRepRetnId] [int] NULL,
	[AsIsTrngBenefitsId] [int] NULL,
	[ToBeTrngBenefitsId] [int] NULL,
	[DesiredAnnualImptSalesRepRetention] [varchar](50) NULL,
	[DesiredAnnualImptTrngBenefits] [varchar](50) NULL,
 CONSTRAINT [PK_TBL_GA_Tracker] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_GA_Tracker] ON
INSERT [dbo].[TBL_GA_Tracker] ([Id], [CompanyId], [ContactId], [AsIsSalesCycleTimeId], [AsIsSalesEffId], [AsIsSalesQualificationId], [AsIsTrgCostSavingsId], [AsIsQuotaAchtId], [AsIsEstBenGainedId], [ToBeSalesCycleTimeId], [ToBeSalesEffId], [ToBeSalesQualificationId], [ToBeTrgCostSavingsId], [ToBeQuotaAchtId], [ToBeEstBenGainedId], [DesiredAnnualImptSalesCycleTime], [DesiredAnnualImptSalesEfficiency], [DesiredAnnualImptSalesQualfn], [DesiredAnnualImptTrgCstSvgs], [DesiredAnnualImptQuotaAcht], [DesiredAnnualImptEstBenefitsGained], [Year1], [Year2], [Year3], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy], [AsIsSalesRepRetnId], [ToBeSalesRepRetnId], [AsIsTrngBenefitsId], [ToBeTrngBenefitsId], [DesiredAnnualImptSalesRepRetention], [DesiredAnnualImptTrngBenefits]) VALUES (1, 2940, 15862, 4, 1, 1, 1, 1, 1, 2, 4, 3, 4, 2, 5, N'10', N'10', N'10', N'10', N'10', N'10', CAST(90000 AS Numeric(18, 0)), CAST(100000 AS Numeric(18, 0)), CAST(130000 AS Numeric(18, 0)), CAST(0x0000A0DD01444F3F AS DateTime), N'72305985-4171-4c6c-a796-4afd870da716', CAST(0x0000A0DA00267AE8 AS DateTime), N'72305985-4171-4c6c-a796-4afd870da716', 1, 4, 1, 5, N'10', N'10')
INSERT [dbo].[TBL_GA_Tracker] ([Id], [CompanyId], [ContactId], [AsIsSalesCycleTimeId], [AsIsSalesEffId], [AsIsSalesQualificationId], [AsIsTrgCostSavingsId], [AsIsQuotaAchtId], [AsIsEstBenGainedId], [ToBeSalesCycleTimeId], [ToBeSalesEffId], [ToBeSalesQualificationId], [ToBeTrgCostSavingsId], [ToBeQuotaAchtId], [ToBeEstBenGainedId], [DesiredAnnualImptSalesCycleTime], [DesiredAnnualImptSalesEfficiency], [DesiredAnnualImptSalesQualfn], [DesiredAnnualImptTrgCstSvgs], [DesiredAnnualImptQuotaAcht], [DesiredAnnualImptEstBenefitsGained], [Year1], [Year2], [Year3], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy], [AsIsSalesRepRetnId], [ToBeSalesRepRetnId], [AsIsTrngBenefitsId], [ToBeTrngBenefitsId], [DesiredAnnualImptSalesRepRetention], [DesiredAnnualImptTrngBenefits]) VALUES (2, 1, 6114, 5, 2, 2, 2, 3, 3, 4, 4, 3, 4, 5, 5, N'10', N'10', N'10', N'10', N'10', N'10', CAST(100000 AS Numeric(18, 0)), CAST(100000 AS Numeric(18, 0)), CAST(110000 AS Numeric(18, 0)), CAST(0x0000A0DC00DF77AE AS DateTime), N'7f31e699-0ec2-46b7-b1ef-c66e1178f726', CAST(0x0000A0DA007AF0D8 AS DateTime), N'7f31e699-0ec2-46b7-b1ef-c66e1178f726', 2, 4, 3, 5, N'10', N'10')
INSERT [dbo].[TBL_GA_Tracker] ([Id], [CompanyId], [ContactId], [AsIsSalesCycleTimeId], [AsIsSalesEffId], [AsIsSalesQualificationId], [AsIsTrgCostSavingsId], [AsIsQuotaAchtId], [AsIsEstBenGainedId], [ToBeSalesCycleTimeId], [ToBeSalesEffId], [ToBeSalesQualificationId], [ToBeTrgCostSavingsId], [ToBeQuotaAchtId], [ToBeEstBenGainedId], [DesiredAnnualImptSalesCycleTime], [DesiredAnnualImptSalesEfficiency], [DesiredAnnualImptSalesQualfn], [DesiredAnnualImptTrgCstSvgs], [DesiredAnnualImptQuotaAcht], [DesiredAnnualImptEstBenefitsGained], [Year1], [Year2], [Year3], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy], [AsIsSalesRepRetnId], [ToBeSalesRepRetnId], [AsIsTrngBenefitsId], [ToBeTrngBenefitsId], [DesiredAnnualImptSalesRepRetention], [DesiredAnnualImptTrngBenefits]) VALUES (3, 1, 6115, 6, 3, 2, 3, 3, 4, 5, 4, 5, 5, 4, 8, NULL, NULL, NULL, NULL, NULL, NULL, CAST(5 AS Numeric(18, 0)), CAST(100 AS Numeric(18, 0)), CAST(200 AS Numeric(18, 0)), CAST(0x0000A0DC00F82673 AS DateTime), N'7f31e699-0ec2-46b7-b1ef-c66e1178f726', CAST(0x0000A0DA00DE52DB AS DateTime), N'7f31e699-0ec2-46b7-b1ef-c66e1178f726', 3, 5, 4, 8, NULL, NULL)
INSERT [dbo].[TBL_GA_Tracker] ([Id], [CompanyId], [ContactId], [AsIsSalesCycleTimeId], [AsIsSalesEffId], [AsIsSalesQualificationId], [AsIsTrgCostSavingsId], [AsIsQuotaAchtId], [AsIsEstBenGainedId], [ToBeSalesCycleTimeId], [ToBeSalesEffId], [ToBeSalesQualificationId], [ToBeTrgCostSavingsId], [ToBeQuotaAchtId], [ToBeEstBenGainedId], [DesiredAnnualImptSalesCycleTime], [DesiredAnnualImptSalesEfficiency], [DesiredAnnualImptSalesQualfn], [DesiredAnnualImptTrgCstSvgs], [DesiredAnnualImptQuotaAcht], [DesiredAnnualImptEstBenefitsGained], [Year1], [Year2], [Year3], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy], [AsIsSalesRepRetnId], [ToBeSalesRepRetnId], [AsIsTrngBenefitsId], [ToBeTrngBenefitsId], [DesiredAnnualImptSalesRepRetention], [DesiredAnnualImptTrngBenefits]) VALUES (4, 1, 6113, 5, 3, 2, 5, 4, 2, 3, 2, 4, 5, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, CAST(10000 AS Numeric(18, 0)), CAST(20000 AS Numeric(18, 0)), CAST(30000 AS Numeric(18, 0)), NULL, NULL, CAST(0x0000A0DC00ED5CC7 AS DateTime), N'7f31e699-0ec2-46b7-b1ef-c66e1178f726', 5, 5, 2, 2, NULL, NULL)
INSERT [dbo].[TBL_GA_Tracker] ([Id], [CompanyId], [ContactId], [AsIsSalesCycleTimeId], [AsIsSalesEffId], [AsIsSalesQualificationId], [AsIsTrgCostSavingsId], [AsIsQuotaAchtId], [AsIsEstBenGainedId], [ToBeSalesCycleTimeId], [ToBeSalesEffId], [ToBeSalesQualificationId], [ToBeTrgCostSavingsId], [ToBeQuotaAchtId], [ToBeEstBenGainedId], [DesiredAnnualImptSalesCycleTime], [DesiredAnnualImptSalesEfficiency], [DesiredAnnualImptSalesQualfn], [DesiredAnnualImptTrgCstSvgs], [DesiredAnnualImptQuotaAcht], [DesiredAnnualImptEstBenefitsGained], [Year1], [Year2], [Year3], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy], [AsIsSalesRepRetnId], [ToBeSalesRepRetnId], [AsIsTrngBenefitsId], [ToBeTrngBenefitsId], [DesiredAnnualImptSalesRepRetention], [DesiredAnnualImptTrngBenefits]) VALUES (5, 2942, 6118, 4, 2, 2, 3, 2, 2, 2, 2, 2, 3, 2, 2, N'0', N'0', N'0', N'0', N'0', N'0', NULL, NULL, NULL, CAST(0x0000A0DC00FD190A AS DateTime), N'72305985-4171-4c6c-a796-4afd870da716', CAST(0x0000A0DC00FCDD6D AS DateTime), N'72305985-4171-4c6c-a796-4afd870da716', 3, 3, 2, 2, N'0', N'0')
INSERT [dbo].[TBL_GA_Tracker] ([Id], [CompanyId], [ContactId], [AsIsSalesCycleTimeId], [AsIsSalesEffId], [AsIsSalesQualificationId], [AsIsTrgCostSavingsId], [AsIsQuotaAchtId], [AsIsEstBenGainedId], [ToBeSalesCycleTimeId], [ToBeSalesEffId], [ToBeSalesQualificationId], [ToBeTrgCostSavingsId], [ToBeQuotaAchtId], [ToBeEstBenGainedId], [DesiredAnnualImptSalesCycleTime], [DesiredAnnualImptSalesEfficiency], [DesiredAnnualImptSalesQualfn], [DesiredAnnualImptTrgCstSvgs], [DesiredAnnualImptQuotaAcht], [DesiredAnnualImptEstBenefitsGained], [Year1], [Year2], [Year3], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy], [AsIsSalesRepRetnId], [ToBeSalesRepRetnId], [AsIsTrngBenefitsId], [ToBeTrngBenefitsId], [DesiredAnnualImptSalesRepRetention], [DesiredAnnualImptTrngBenefits]) VALUES (6, 55004, 15863, 3, 1, 1, 1, 1, 1, 2, 3, 3, 3, 3, 3, N'10', N'10', N'10', N'10', N'10', N'10', CAST(90000 AS Numeric(18, 0)), CAST(100000 AS Numeric(18, 0)), CAST(110000 AS Numeric(18, 0)), CAST(0x0000A0DD013C53D9 AS DateTime), N'72305985-4171-4c6c-a796-4afd870da716', CAST(0x0000A0DC016DCCF1 AS DateTime), N'72305985-4171-4c6c-a796-4afd870da716', 1, 3, 1, 3, N'10', N'10')
INSERT [dbo].[TBL_GA_Tracker] ([Id], [CompanyId], [ContactId], [AsIsSalesCycleTimeId], [AsIsSalesEffId], [AsIsSalesQualificationId], [AsIsTrgCostSavingsId], [AsIsQuotaAchtId], [AsIsEstBenGainedId], [ToBeSalesCycleTimeId], [ToBeSalesEffId], [ToBeSalesQualificationId], [ToBeTrgCostSavingsId], [ToBeQuotaAchtId], [ToBeEstBenGainedId], [DesiredAnnualImptSalesCycleTime], [DesiredAnnualImptSalesEfficiency], [DesiredAnnualImptSalesQualfn], [DesiredAnnualImptTrgCstSvgs], [DesiredAnnualImptQuotaAcht], [DesiredAnnualImptEstBenefitsGained], [Year1], [Year2], [Year3], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy], [AsIsSalesRepRetnId], [ToBeSalesRepRetnId], [AsIsTrngBenefitsId], [ToBeTrngBenefitsId], [DesiredAnnualImptSalesRepRetention], [DesiredAnnualImptTrngBenefits]) VALUES (7, 55005, 15867, 5, 1, 1, 1, 1, 1, 3, 2, 2, 2, 2, 4, N'20', N'20', N'20', N'20', N'20', N'20', CAST(100000 AS Numeric(18, 0)), CAST(110000 AS Numeric(18, 0)), CAST(120000 AS Numeric(18, 0)), NULL, NULL, CAST(0x0000A0DC0179B65A AS DateTime), N'72305985-4171-4c6c-a796-4afd870da716', 1, 2, 1, 4, N'20', N'20')
SET IDENTITY_INSERT [dbo].[TBL_GA_Tracker] OFF
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_COMPANIES]    Script Date: 10/02/2012 16:20:07 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_COMPANIES]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_COMPANIES] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[TBL_COMPANIES] ([COMPANIESID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_COMPANIES]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_COMPANIES]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_CONTACTS]    Script Date: 10/02/2012 16:20:07 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_CONTACTS]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_CONTACTS] FOREIGN KEY([ContactId])
REFERENCES [dbo].[TBL_CONTACTS] ([CONTACTSID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_CONTACTS]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_CONTACTS]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_EstBenefitsGained]    Script Date: 10/02/2012 16:20:07 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_EstBenefitsGained]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_EstBenefitsGained] FOREIGN KEY([AsIsEstBenGainedId])
REFERENCES [dbo].[TBL_GA_EstBenefitsGained] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_EstBenefitsGained]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_EstBenefitsGained]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_EstBenefitsGained1]    Script Date: 10/02/2012 16:20:07 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_EstBenefitsGained1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_EstBenefitsGained1] FOREIGN KEY([ToBeEstBenGainedId])
REFERENCES [dbo].[TBL_GA_EstBenefitsGained] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_EstBenefitsGained1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_EstBenefitsGained1]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_QuotaAchievement]    Script Date: 10/02/2012 16:20:07 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_QuotaAchievement]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_QuotaAchievement] FOREIGN KEY([AsIsQuotaAchtId])
REFERENCES [dbo].[TBL_GA_QuotaAchievement] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_QuotaAchievement]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_QuotaAchievement]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_QuotaAchievement1]    Script Date: 10/02/2012 16:20:07 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_QuotaAchievement1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_QuotaAchievement1] FOREIGN KEY([ToBeQuotaAchtId])
REFERENCES [dbo].[TBL_GA_QuotaAchievement] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_QuotaAchievement1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_QuotaAchievement1]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_SalesCycleTime]    Script Date: 10/02/2012 16:20:07 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesCycleTime]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesCycleTime] FOREIGN KEY([AsIsSalesCycleTimeId])
REFERENCES [dbo].[TBL_GA_SalesCycleTime] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesCycleTime]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesCycleTime]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_SalesCycleTime1]    Script Date: 10/02/2012 16:20:07 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesCycleTime1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesCycleTime1] FOREIGN KEY([ToBeSalesCycleTimeId])
REFERENCES [dbo].[TBL_GA_SalesCycleTime] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesCycleTime1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesCycleTime1]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_SalesEfficiency]    Script Date: 10/02/2012 16:20:07 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesEfficiency]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesEfficiency] FOREIGN KEY([AsIsSalesEffId])
REFERENCES [dbo].[TBL_GA_SalesEfficiency] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesEfficiency]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesEfficiency]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_SalesEfficiency1]    Script Date: 10/02/2012 16:20:07 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesEfficiency1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesEfficiency1] FOREIGN KEY([ToBeSalesEffId])
REFERENCES [dbo].[TBL_GA_SalesEfficiency] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesEfficiency1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesEfficiency1]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_SalesQualification]    Script Date: 10/02/2012 16:20:07 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesQualification]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesQualification] FOREIGN KEY([AsIsSalesQualificationId])
REFERENCES [dbo].[TBL_GA_SalesQualification] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesQualification]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesQualification]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_SalesQualification1]    Script Date: 10/02/2012 16:20:07 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesQualification1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesQualification1] FOREIGN KEY([ToBeSalesQualificationId])
REFERENCES [dbo].[TBL_GA_SalesQualification] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesQualification1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesQualification1]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_SalesRepRetention]    Script Date: 10/02/2012 16:20:07 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesRepRetention]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesRepRetention] FOREIGN KEY([AsIsSalesRepRetnId])
REFERENCES [dbo].[TBL_GA_SalesRepRetention] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesRepRetention]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesRepRetention]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_SalesRepRetention1]    Script Date: 10/02/2012 16:20:07 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesRepRetention1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesRepRetention1] FOREIGN KEY([ToBeSalesRepRetnId])
REFERENCES [dbo].[TBL_GA_SalesRepRetention] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_SalesRepRetention1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesRepRetention1]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings]    Script Date: 10/02/2012 16:20:07 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings] FOREIGN KEY([AsIsTrgCostSavingsId])
REFERENCES [dbo].[TBL_GA_TrainingCostSavings] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings1]    Script Date: 10/02/2012 16:20:07 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings1] FOREIGN KEY([ToBeTrgCostSavingsId])
REFERENCES [dbo].[TBL_GA_TrainingCostSavings] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings1]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_TrngBenefits]    Script Date: 10/02/2012 16:20:07 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_TrngBenefits]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_TrngBenefits] FOREIGN KEY([AsIsTrngBenefitsId])
REFERENCES [dbo].[TBL_GA_TrngBenefits] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_TrngBenefits]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_TrngBenefits]
GO
/****** Object:  ForeignKey [FK_TBL_GA_Tracker_TBL_GA_TrngBenefits1]    Script Date: 10/02/2012 16:20:07 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_TrngBenefits1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_TrngBenefits1] FOREIGN KEY([ToBeTrngBenefitsId])
REFERENCES [dbo].[TBL_GA_TrngBenefits] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_TrngBenefits1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_TrngBenefits1]
GO
