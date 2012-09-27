USE [SandlerDB]
GO
/****** Object:  Table [dbo].[TBL_GA_EstBenefitsGained]    Script Date: 09/26/2012 19:44:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_GA_EstBenefitsGained]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_GA_EstBenefitsGained]
GO
/****** Object:  Table [dbo].[TBL_GA_QuotaAchievement]    Script Date: 09/26/2012 19:44:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_GA_QuotaAchievement]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_GA_QuotaAchievement]
GO
/****** Object:  Table [dbo].[TBL_GA_SalesCycleTime]    Script Date: 09/26/2012 19:44:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_GA_SalesCycleTime]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_GA_SalesCycleTime]
GO
/****** Object:  Table [dbo].[TBL_GA_SalesEfficiency]    Script Date: 09/26/2012 19:44:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_GA_SalesEfficiency]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_GA_SalesEfficiency]
GO
/****** Object:  Table [dbo].[TBL_GA_SalesQualification]    Script Date: 09/26/2012 19:44:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_GA_SalesQualification]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_GA_SalesQualification]
GO
/****** Object:  Table [dbo].[TBL_GA_TrainingCostSavings]    Script Date: 09/26/2012 19:44:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_GA_TrainingCostSavings]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_GA_TrainingCostSavings]
GO
/****** Object:  Table [dbo].[TBL_GA_TrainingCostSavings]    Script Date: 09/26/2012 19:44:22 ******/

GO

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

INSERT [dbo].[TBL_GA_TrainingCostSavings] ([TrngCostSavings], [PercentOfIndustryAve]) VALUES (N'Less than 5%', 5)
INSERT [dbo].[TBL_GA_TrainingCostSavings] ([TrngCostSavings], [PercentOfIndustryAve]) VALUES (N'5% to 10%', 20)
INSERT [dbo].[TBL_GA_TrainingCostSavings] ([TrngCostSavings], [PercentOfIndustryAve]) VALUES (N'10% to 15%', 45)
INSERT [dbo].[TBL_GA_TrainingCostSavings] ([TrngCostSavings], [PercentOfIndustryAve]) VALUES (N'15% to 20%', 70)
INSERT [dbo].[TBL_GA_TrainingCostSavings] ([TrngCostSavings], [PercentOfIndustryAve]) VALUES (N'20%+', 100)

/****** Object:  Table [dbo].[TBL_GA_SalesQualification]    Script Date: 09/26/2012 19:44:22 ******/

GO

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_GA_SalesQualification]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TBL_GA_SalesQualification](
	[SalesQualification] [nvarchar](255) NULL,
	[PercentOfIndustryAve] [int] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_TBL_GA_SalesQualification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

INSERT [dbo].[TBL_GA_SalesQualification] ([SalesQualification], [PercentOfIndustryAve]) VALUES (N'Less than10%', 10)
INSERT [dbo].[TBL_GA_SalesQualification] ([SalesQualification], [PercentOfIndustryAve]) VALUES (N'10% to 15%', 25)
INSERT [dbo].[TBL_GA_SalesQualification] ([SalesQualification], [PercentOfIndustryAve]) VALUES (N'15% to 20%', 40)
INSERT [dbo].[TBL_GA_SalesQualification] ([SalesQualification], [PercentOfIndustryAve]) VALUES (N'20% to 25%', 75)
INSERT [dbo].[TBL_GA_SalesQualification] ([SalesQualification], [PercentOfIndustryAve]) VALUES (N'25%+', 100)

/****** Object:  Table [dbo].[TBL_GA_SalesEfficiency]    Script Date: 09/26/2012 19:44:22 ******/

GO

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_GA_SalesEfficiency]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TBL_GA_SalesEfficiency](
	[SalesEfficiency] [nvarchar](255) NULL,
	[PercentOfIndustryAve] [int] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_TBL_GA_SalesEfficiency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

INSERT [dbo].[TBL_GA_SalesEfficiency] ([SalesEfficiency], [PercentOfIndustryAve]) VALUES (N'Less than10%', 10)
INSERT [dbo].[TBL_GA_SalesEfficiency] ([SalesEfficiency], [PercentOfIndustryAve]) VALUES (N'10% to 15%', 25)
INSERT [dbo].[TBL_GA_SalesEfficiency] ([SalesEfficiency], [PercentOfIndustryAve]) VALUES (N'15% to 20%', 40)
INSERT [dbo].[TBL_GA_SalesEfficiency] ([SalesEfficiency], [PercentOfIndustryAve]) VALUES (N'20% to 25%', 75)
INSERT [dbo].[TBL_GA_SalesEfficiency] ([SalesEfficiency], [PercentOfIndustryAve]) VALUES (N'25%+', 100)

/****** Object:  Table [dbo].[TBL_GA_SalesCycleTime]    Script Date: 09/26/2012 19:44:22 ******/

GO

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_GA_SalesCycleTime]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TBL_GA_SalesCycleTime](
	[SalesCycleTime] [nvarchar](255) NULL,
	[PercentOfIndustryAve] [int] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_TBL_GA_SalesCycleTime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

INSERT [dbo].[TBL_GA_SalesCycleTime] ([SalesCycleTime], [PercentOfIndustryAve]) VALUES (N'Less than 3 months', 110)
INSERT [dbo].[TBL_GA_SalesCycleTime] ([SalesCycleTime], [PercentOfIndustryAve]) VALUES (N'3 to 6 months', 100)
INSERT [dbo].[TBL_GA_SalesCycleTime] ([SalesCycleTime], [PercentOfIndustryAve]) VALUES (N'6 to 12 months', 75)
INSERT [dbo].[TBL_GA_SalesCycleTime] ([SalesCycleTime], [PercentOfIndustryAve]) VALUES (N'12 to 18 months', 55)
INSERT [dbo].[TBL_GA_SalesCycleTime] ([SalesCycleTime], [PercentOfIndustryAve]) VALUES (N'18 to 24 months', 30)
INSERT [dbo].[TBL_GA_SalesCycleTime] ([SalesCycleTime], [PercentOfIndustryAve]) VALUES (N'24+ months', 10)

/****** Object:  Table [dbo].[TBL_GA_QuotaAchievement]    Script Date: 09/26/2012 19:44:22 ******/

GO

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_GA_QuotaAchievement]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TBL_GA_QuotaAchievement](
	[QuotaAchievement] [nvarchar](255) NULL,
	[PercentOfIndustryAve] [int] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_TBL_GA_QuotaAchievement] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

INSERT [dbo].[TBL_GA_QuotaAchievement] ([QuotaAchievement], [PercentOfIndustryAve]) VALUES (N'Less than 10%', 10)
INSERT [dbo].[TBL_GA_QuotaAchievement] ([QuotaAchievement], [PercentOfIndustryAve]) VALUES (N'10% to 15%', 30)
INSERT [dbo].[TBL_GA_QuotaAchievement] ([QuotaAchievement], [PercentOfIndustryAve]) VALUES (N'15% to 20%', 45)
INSERT [dbo].[TBL_GA_QuotaAchievement] ([QuotaAchievement], [PercentOfIndustryAve]) VALUES (N'20% to 25%', 60)
INSERT [dbo].[TBL_GA_QuotaAchievement] ([QuotaAchievement], [PercentOfIndustryAve]) VALUES (N'25% to 30%', 100)
INSERT [dbo].[TBL_GA_QuotaAchievement] ([QuotaAchievement], [PercentOfIndustryAve]) VALUES (N'30%+', 110)

/****** Object:  Table [dbo].[TBL_GA_EstBenefitsGained]    Script Date: 09/26/2012 19:44:22 ******/

GO

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

INSERT [dbo].[TBL_GA_EstBenefitsGained] ([EstBenefitsGained], [PercentOfIndustryAve]) VALUES (N'Less than 50%', 5)
INSERT [dbo].[TBL_GA_EstBenefitsGained] ([EstBenefitsGained], [PercentOfIndustryAve]) VALUES (N'50% to 55%', 15)
INSERT [dbo].[TBL_GA_EstBenefitsGained] ([EstBenefitsGained], [PercentOfIndustryAve]) VALUES (N'55% to 60%', 25)
INSERT [dbo].[TBL_GA_EstBenefitsGained] ([EstBenefitsGained], [PercentOfIndustryAve]) VALUES (N'60% to 65%', 40)
INSERT [dbo].[TBL_GA_EstBenefitsGained] ([EstBenefitsGained], [PercentOfIndustryAve]) VALUES (N'65% to 70%', 65)
INSERT [dbo].[TBL_GA_EstBenefitsGained] ([EstBenefitsGained], [PercentOfIndustryAve]) VALUES (N'70% to 75%', 80)
INSERT [dbo].[TBL_GA_EstBenefitsGained] ([EstBenefitsGained], [PercentOfIndustryAve]) VALUES (N'75% to 80%', 100)
INSERT [dbo].[TBL_GA_EstBenefitsGained] ([EstBenefitsGained], [PercentOfIndustryAve]) VALUES (N'80%+', 110)

GO

USE [SandlerDB]
GO

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

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]'))
ALTER TABLE [dbo].[TBL_GA_Tracker] DROP CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings1]
GO
/****** Object:  Table [dbo].[TBL_GA_Tracker]    Script Date: 09/26/2012 22:33:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_GA_Tracker]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_GA_Tracker]
GO

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
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TBL_GA_Tracker] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_COMPANIES] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[TBL_COMPANIES] ([COMPANIESID])
GO

ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_COMPANIES]
GO

ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_CONTACTS] FOREIGN KEY([ContactId])
REFERENCES [dbo].[TBL_CONTACTS] ([CONTACTSID])
GO

ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_CONTACTS]
GO

ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_EstBenefitsGained] FOREIGN KEY([AsIsEstBenGainedId])
REFERENCES [dbo].[TBL_GA_EstBenefitsGained] ([Id])
GO

ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_EstBenefitsGained]
GO

ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_EstBenefitsGained1] FOREIGN KEY([ToBeEstBenGainedId])
REFERENCES [dbo].[TBL_GA_EstBenefitsGained] ([Id])
GO

ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_EstBenefitsGained1]
GO

ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_QuotaAchievement] FOREIGN KEY([AsIsQuotaAchtId])
REFERENCES [dbo].[TBL_GA_QuotaAchievement] ([Id])
GO

ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_QuotaAchievement]
GO

ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_QuotaAchievement1] FOREIGN KEY([ToBeQuotaAchtId])
REFERENCES [dbo].[TBL_GA_QuotaAchievement] ([Id])
GO

ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_QuotaAchievement1]
GO

ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesCycleTime] FOREIGN KEY([AsIsSalesCycleTimeId])
REFERENCES [dbo].[TBL_GA_SalesCycleTime] ([Id])
GO

ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesCycleTime]
GO

ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesCycleTime1] FOREIGN KEY([ToBeSalesCycleTimeId])
REFERENCES [dbo].[TBL_GA_SalesCycleTime] ([Id])
GO

ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesCycleTime1]
GO

ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesEfficiency] FOREIGN KEY([AsIsSalesEffId])
REFERENCES [dbo].[TBL_GA_SalesEfficiency] ([Id])
GO

ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesEfficiency]
GO

ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesEfficiency1] FOREIGN KEY([ToBeSalesEffId])
REFERENCES [dbo].[TBL_GA_SalesEfficiency] ([Id])
GO

ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesEfficiency1]
GO

ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesQualification] FOREIGN KEY([AsIsSalesQualificationId])
REFERENCES [dbo].[TBL_GA_SalesQualification] ([Id])
GO

ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesQualification]
GO

ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesQualification1] FOREIGN KEY([ToBeSalesQualificationId])
REFERENCES [dbo].[TBL_GA_SalesQualification] ([Id])
GO

ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_SalesQualification1]
GO

ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings] FOREIGN KEY([AsIsTrgCostSavingsId])
REFERENCES [dbo].[TBL_GA_TrainingCostSavings] ([Id])
GO

ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings]
GO

ALTER TABLE [dbo].[TBL_GA_Tracker]  WITH CHECK ADD  CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings1] FOREIGN KEY([ToBeTrgCostSavingsId])
REFERENCES [dbo].[TBL_GA_TrainingCostSavings] ([Id])
GO

ALTER TABLE [dbo].[TBL_GA_Tracker] CHECK CONSTRAINT [FK_TBL_GA_Tracker_TBL_GA_TrainingCostSavings1]
GO


/****** Object:  View [dbo].[vw_GATracker]    Script Date: 09/26/2012 23:53:52 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_GATracker]'))
DROP VIEW [dbo].[vw_GATracker]
GO

Create View [dbo].[vw_GATracker]
AS
Select 
asisestbg.EstBenefitsGained AS AsIsEstBenefitsGained, asisestbg.PercentOfIndustryAve As AsIsEstBenefitsGainedPercentVal, 
toBeESTBG.EstBenefitsGained AS ToBeEstBenefitsGained, toBeESTBG.PercentOfIndustryAve As ToBeEstBenefitsGainedPercentVal, 
asIsQA.QuotaAchievement AS AsIsQuotaAchievement, asIsQA.PercentOfIndustryAve As AsIsQuotaAchievementPercentVal, 
toBeQA.QuotaAchievement AS ToBeQuotaAchievement, toBeQA.PercentOfIndustryAve As ToBeQuotaAchievementPercentVal,
asIsSCT.SalesCycleTime AS AsIsSalesCycleTime, asIsSCT.PercentOfIndustryAve As AsIsSalesCycleTimePercentVal, 
toBeSCT.SalesCycleTime AS ToBeSalesCycleTime, toBeSCT.PercentOfIndustryAve As ToBeSalesCycleTimePercentVal,
asIsSE.SalesEfficiency AS AsIsSalesEfficiency, asIsSE.PercentOfIndustryAve As AsIsSalesEfficiencyPercentVal, 
toBeSE.SalesEfficiency AS ToBeSalesEfficiency, toBeSE.PercentOfIndustryAve As ToBeSalesEfficiencyPercentVal,
asIsSQ.SalesQualification AS AsIsSalesQualification, asIsSQ.PercentOfIndustryAve As AsIsSalesQualificationPercentVal, 
toBeSQ.SalesQualification AS ToBeSalesQualification, toBeSQ.PercentOfIndustryAve As ToBeSalesQualificationPercentVal,
toBeTCS.TrngCostSavings AS AsIsTrngCostSavings, toBeTCS.PercentOfIndustryAve As AsIsTrngCostSavingsPercentVal, 
toBeTCS.TrngCostSavings AS ToBeTrngCostSavings, toBeTCS.PercentOfIndustryAve As ToBeTrngCostSavingsPercentVal,
T.* From TBL_GA_Tracker T WITH (NOLOCK)
INNER JOIN TBL_GA_EstBenefitsGained asIsESTBG WITH(NOLOCK) ON asisestbg.Id = T.AsIsEstBenGainedId
INNER JOIN TBL_GA_EstBenefitsGained toBeESTBG WITH(NOLOCK) ON toBeESTBG.Id = T.ToBeEstBenGainedId
INNER JOIN TBL_GA_QuotaAchievement asIsQA WITH(NOLOCK) ON asIsQA.Id = T.AsIsQuotaAchtId
INNER JOIN TBL_GA_QuotaAchievement toBeQA WITH(NOLOCK) ON toBeQA.Id = T.ToBeQuotaAchtId
INNER JOIN TBL_GA_SalesCycleTime asIsSCT WITH(NOLOCK) ON asIsSCT.Id = T.AsIsSalesCycleTimeId
INNER JOIN TBL_GA_SalesCycleTime toBeSCT WITH(NOLOCK) ON toBeSCT.Id = T.ToBeSalesCycleTimeId
INNER JOIN TBL_GA_SalesEfficiency asIsSE WITH(NOLOCK) ON asIsSE.Id = T.AsIsSalesEffId
INNER JOIN TBL_GA_SalesEfficiency toBeSE WITH(NOLOCK) ON toBeSE.Id = T.ToBeSalesEffId
INNER JOIN TBL_GA_SalesQualification asIsSQ WITH(NOLOCK) ON asIsSQ.Id = T.AsIsSalesQualificationId
INNER JOIN TBL_GA_SalesQualification toBeSQ WITH(NOLOCK) ON toBeSQ.Id = T.ToBeSalesQualificationId
INNER JOIN TBL_GA_TrainingCostSavings asIsTCS WITH(NOLOCK) ON asIsTCS.Id = T.AsIsTrgCostSavingsId
INNER JOIN TBL_GA_TrainingCostSavings toBeTCS WITH(NOLOCK) ON toBeTCS.Id = T.ToBeTrgCostSavingsId
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetGATracker]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetGATracker]
GO

Create Procedure [dbo].[sp_GetGATracker]
@gaId INT

AS

Select * From dbo.[vw_GATracker] Where ID = @gaId;
GO

