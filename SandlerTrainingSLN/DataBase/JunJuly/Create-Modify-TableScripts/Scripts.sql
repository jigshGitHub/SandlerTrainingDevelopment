USE [SandlerDB]

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_ERRORLOG]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_ERRORLOG]
GO
Create Table TBL_ERRORLOG ( UserName VARCHAR(50), [ErrorNumber] INT, [ErrorSeverity] INT, [ErrorState] INT, [ErrorProcedure] VARCHAR(50), [ErrorLine] INT, [ErrorMessage] VARCHAR(MAX));

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_CHART]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_CHART]
GO

-- TO DO Script for Create Table TBL_CHART
USE [SandlerDB]
GO

/****** Object:  Table [dbo].[TBL_CHART]    Script Date: 07/18/2012 10:14:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TBL_CHART](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeOfChart] [varchar](100) NOT NULL,
	[Caption] [varchar](500) NOT NULL,
	[SWFile] [varchar](500) NOT NULL,
	[ChartID] [varchar](500) NOT NULL,
	[NumberSuffix] [char](1) NULL,
	[SNumberSuffix] [char](1) NULL,
	[XaxisName] [varchar](500) NULL,
	[YaxisName] [varchar](500) NULL,
	[CanvasBgColor] [char](6) NULL,
	[BgColor] [char](6) NULL,
	[CanvasBgAlpha] [varchar](10) NULL,
	[BgAlpha] [varchar](10) NULL,
	[PieRadius] [varchar](10) NULL,
	[EnableRotation] [char](1) NULL,
	[ShowLegend] [char](1) NULL,
	[ShowLabels] [char](1) NULL,
	[PlotGradientColor] [char](6) NULL,
	[DrillLevel] [int] NULL,
	[DrillBy] [varchar] (50) NULL,
	[IsActive] [bit] NULL,
	[LastUpdatedDate] [datetime] NULL,
	[LastCreatedDate] [datetime] NULL,
	[LastUpdatedBy] [uniqueidentifier] NULL,
	[LastCreatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TBL_CHART] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[TBL_CHART] ADD  CONSTRAINT [DF_TBL_CHART_EnableRotation]  DEFAULT ((0)) FOR [EnableRotation]
GO

ALTER TABLE [dbo].[TBL_CHART] ADD  CONSTRAINT [DF_TBL_CHART_ShowLegend]  DEFAULT ((0)) FOR [ShowLegend]
GO

ALTER TABLE [dbo].[TBL_CHART] ADD  CONSTRAINT [DF_TBL_CHART_ShowLabels]  DEFAULT ((0)) FOR [ShowLabels]
GO

ALTER TABLE [dbo].[TBL_CHART] ADD  CONSTRAINT [DF_Table_1_Active]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[TBL_CHART] ADD  CONSTRAINT [DF_TBL_CHART_LastUpdatedDate]  DEFAULT (getdate()) FOR [LastUpdatedDate]
GO

ALTER TABLE [dbo].[TBL_CHART] ADD  CONSTRAINT [DF_TBL_CHART_LastCreatedDate]  DEFAULT (getdate()) FOR [LastCreatedDate]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_FRANCHISEE_USERS]') AND type in (N'U'))
DROP TABLE [dbo].TBL_FRANCHISEE_USERS
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_FRANCHISEE]') AND type in (N'U'))
DROP TABLE [dbo].TBL_FRANCHISEE
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_COACH]') AND type in (N'U'))
DROP TABLE [dbo].TBL_COACH
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_REGION]') AND type in (N'U'))
DROP TABLE [dbo].TBL_REGION
GO


-- TO DO Script for Create Table TBL_REGION
USE [SandlerDB]
GO

/****** Object:  Table [dbo].[TBL_REGION]    Script Date: 07/18/2012 10:15:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TBL_REGION](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) NOT NULL,
	[IsActive] [bit] NULL,
	[LastUpdatedDate] [datetime] NULL,
	[LastUpdatedBy] [uniqueidentifier] NULL,
	[LastCreatedDate] [datetime] NULL,
	[LastCreatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TBL_REGION] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[TBL_REGION] ADD  CONSTRAINT [DF_TBL_REGION_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[TBL_REGION] ADD  CONSTRAINT [DF_TBL_REGION_LastUpdatedDate]  DEFAULT (getdate()) FOR [LastUpdatedDate]
GO

ALTER TABLE [dbo].[TBL_REGION] ADD  CONSTRAINT [DF_Table_1_CreatedDate]  DEFAULT (getdate()) FOR [LastCreatedDate]
GO

-- TO DO Script for Create Table TBL_COACH

USE [SandlerDB]
GO

/****** Object:  Table [dbo].[TBL_COACH]    Script Date: 07/18/2012 10:32:54 ******/
USE [SandlerDB]
GO

/****** Object:  Table [dbo].[TBL_COACH]    Script Date: 07/19/2012 12:10:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TBL_COACH](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[RegionID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[LastCreatedDate] [datetime] NULL,
	[LastUpdatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TBL_COACH] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[TBL_COACH]  WITH CHECK ADD  CONSTRAINT [FK_TBL_COACH_aspnet_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO

ALTER TABLE [dbo].[TBL_COACH] CHECK CONSTRAINT [FK_TBL_COACH_aspnet_Users]
GO

ALTER TABLE [dbo].[TBL_COACH]  WITH CHECK ADD  CONSTRAINT [FK_TBL_COACH_TBL_REGION] FOREIGN KEY([RegionID])
REFERENCES [dbo].[TBL_REGION] ([ID])
GO

ALTER TABLE [dbo].[TBL_COACH] CHECK CONSTRAINT [FK_TBL_COACH_TBL_REGION]
GO

ALTER TABLE [dbo].[TBL_COACH] ADD  CONSTRAINT [DF_TBL_COACH_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[TBL_COACH] ADD  CONSTRAINT [DF_TBL_COACH_LastCreatedDate]  DEFAULT (getdate()) FOR [LastCreatedDate]
GO

ALTER TABLE [dbo].[TBL_COACH] ADD  CONSTRAINT [DF_TBL_COACH_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO




-- TO DO Script for Create Table TBL_FRANCHISEE
USE [SandlerDB]
GO

/****** Object:  Table [dbo].[TBL_FRANCHISEE]    Script Date: 07/18/2012 10:15:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TBL_FRANCHISEE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) NOT NULL,
	[CoachID] [int] NOT NULL,
	[IsActive] [bit] NULL,
	[LastCreatedDate] [datetime] NULL,
	[LastUpdatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TBL_FRANCHISEE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[TBL_FRANCHISEE]  WITH CHECK ADD  CONSTRAINT [FK_TBL_FRANCHISEE_TBL_COACH] FOREIGN KEY([CoachID])
REFERENCES [dbo].[TBL_COACH] ([ID])
GO

ALTER TABLE [dbo].[TBL_FRANCHISEE] CHECK CONSTRAINT [FK_TBL_FRANCHISEE_TBL_COACH]
GO

ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD  CONSTRAINT [DF_TBL_FRANCHISEE_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD  CONSTRAINT [DF_TBL_FRANCHISEE_LastCreatedDate]  DEFAULT (getdate()) FOR [LastCreatedDate]
GO

ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD  CONSTRAINT [DF_TBL_FRANCHISEE_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO




-- TO DO Script for Create Table TBL_FRANCHISEE_USERS
USE [SandlerDB]
GO

/****** Object:  Table [dbo].[TBL_FRANCHISEE_USERS]    Script Date: 07/18/2012 10:15:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TBL_FRANCHISEE_USERS](
	[FranchiseeID] [int] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[TBL_FRANCHISEE_USERS]  WITH CHECK ADD  CONSTRAINT [FK_TBL_FRANCHISEE_USERS_aspnet_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO

ALTER TABLE [dbo].[TBL_FRANCHISEE_USERS] CHECK CONSTRAINT [FK_TBL_FRANCHISEE_USERS_aspnet_Users]
GO

ALTER TABLE [dbo].[TBL_FRANCHISEE_USERS]  WITH CHECK ADD  CONSTRAINT [FK_TBL_FRANCHISEE_USERS_TBL_FRANCHISEE] FOREIGN KEY([FranchiseeID])
REFERENCES [dbo].[TBL_FRANCHISEE] ([ID])
GO

ALTER TABLE [dbo].[TBL_FRANCHISEE_USERS] CHECK CONSTRAINT [FK_TBL_FRANCHISEE_USERS_TBL_FRANCHISEE]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_YesNoOptions]') AND type in (N'U'))
DROP TABLE [dbo].[Tbl_YesNoOptions]
GO

CREATE TABLE [dbo].[Tbl_YesNoOptions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NULL,
	[Value] [int] NULL,
 CONSTRAINT [PK_Tbl_YesNoOptions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET IDENTITY_INSERT [dbo].[Tbl_YesNoOptions] ON
INSERT [dbo].[Tbl_YesNoOptions] ([id], [Description], [Value]) VALUES (1, N'No', 0)
INSERT [dbo].[Tbl_YesNoOptions] ([id], [Description], [Value]) VALUES (2, N'Yes', 1)
SET IDENTITY_INSERT [dbo].[Tbl_YesNoOptions] OFF

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_ProductType]') AND type in (N'U'))
DROP TABLE [dbo].[Tbl_ProductType]
GO

CREATE TABLE [dbo].[Tbl_ProductType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeName] [varchar](150) NULL,
	[IsActive] [bit] NULL,
	[LastUpdatedDate] [datetime] NULL,
	[LastUpdatedBy] [varchar](80) NULL,
	[CreatedDate]  AS (getdate()),
	[CreatedBy] [varchar](80) NULL,
 CONSTRAINT [PK_Tbl_ProductType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET IDENTITY_INSERT [dbo].[Tbl_ProductType] ON
INSERT [dbo].[Tbl_ProductType] ([Id], [ProductTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES (1, N'Assessment', 1, NULL, NULL, N'System')
INSERT [dbo].[Tbl_ProductType] ([Id], [ProductTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES (2, N'PC', 1, NULL, NULL, N'System')
INSERT [dbo].[Tbl_ProductType] ([Id], [ProductTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES (3, N'Consulting', 1, NULL, NULL, N'System')
INSERT [dbo].[Tbl_ProductType] ([Id], [ProductTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES (4, N'Training', 1, NULL, NULL, N'System')
INSERT [dbo].[Tbl_ProductType] ([Id], [ProductTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES (5, N'Leadership ', 1, NULL, NULL, N'System')
INSERT [dbo].[Tbl_ProductType] ([Id], [ProductTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES (6, N'Coaching', 1, NULL, NULL, N'System')
SET IDENTITY_INSERT [dbo].[Tbl_ProductType] OFF

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_OPPORTUNITIES]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_OPPORTUNITIES]
GO

CREATE TABLE [dbo].[TBL_OPPORTUNITIES](
	[OPPSID] [int] IDENTITY(1,1) NOT NULL,
	[OPPORTUNITYID] [int] NULL,
	[COMPANYID] [int] NULL,
	[CONTACTID] [int] NULL,
	[OPPNAME] [varchar](50) NULL,
	[SALESREPLASTNAME] [varchar](50) NULL,
	[SALESREPFIRSTNAME] [varchar](50) NULL,
	[SALESREPPHONE] [varchar](50) NULL,
	[PRODUCTID] [int] NULL,
	[OPPSTATUS] [int] NULL,
	[OPPVALUE] [int] NULL,
	[WINPROBABILITY] [varchar](50) NULL,
	[WEIGHTEDVALUE] [int] NULL,
	[CLOSEDATE] [datetime] NULL,
	[IsActive] [bit] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](80) NULL,
	[CreatedDate]  AS (getdate()),
	[CreatedBy] [varchar](80) NULL,
 CONSTRAINT [PK_TBL_OPPORTUNITIES] PRIMARY KEY CLUSTERED 
(
	[OPPSID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_IndustryType]') AND type in (N'U'))
DROP TABLE [dbo].[Tbl_IndustryType]
GO

CREATE TABLE [dbo].[Tbl_IndustryType](
	[IndId] [int] IDENTITY(1,1) NOT NULL,
	[IndustryTypeName] [varchar](150) NULL,
	[IsActive] [bit] NULL,
	[LastUpdatedDate] [datetime] NULL,
	[LastUpdatedBy] [varchar](80) NULL,
	[CreatedDate]  AS (getdate()),
	[CreatedBy] [varchar](80) NULL,
 CONSTRAINT [PK_Tbl_IndustryType] PRIMARY KEY CLUSTERED 
(
	[IndId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET IDENTITY_INSERT [dbo].[Tbl_IndustryType] ON
INSERT [dbo].[Tbl_IndustryType] ([IndId], [IndustryTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES (1, N'Professional Services', 1, NULL, NULL, N'System')
INSERT [dbo].[Tbl_IndustryType] ([IndId], [IndustryTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES (2, N'Service Industry', 1, NULL, NULL, N'System')
INSERT [dbo].[Tbl_IndustryType] ([IndId], [IndustryTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES (3, N'Manufacturing', 1, NULL, NULL, N'System')
INSERT [dbo].[Tbl_IndustryType] ([IndId], [IndustryTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES (4, N'Software ', 1, NULL, NULL, N'System')
INSERT [dbo].[Tbl_IndustryType] ([IndId], [IndustryTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES (5, N'Consulting', 1, NULL, NULL, N'System')
SET IDENTITY_INSERT [dbo].[Tbl_IndustryType] OFF

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_DOCS]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_DOCS]
GO

CREATE TABLE [dbo].[TBL_DOCS](
	[DOCSID] [int] IDENTITY(1,1) NOT NULL,
	[DOCNAME] [varchar](50) NULL,
	[OPPSID] [int] NULL,
	[COMPANYID] [int] NULL,
	[DOCUMENTSTATUS] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[UpdatedBy] [varchar](80) NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedDate]  AS (getdate()),
	[CreatedBy] [varchar](80) NULL,
 CONSTRAINT [PK_TBL_DOCS] PRIMARY KEY CLUSTERED 
(
	[DOCSID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_CONTACTS]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_CONTACTS]
GO

CREATE TABLE [dbo].[TBL_CONTACTS](
	[CONTACTSID] [int] IDENTITY(1,1) NOT NULL,
	[COMPANYID] [int] NULL,
	[LASTNAME] [varchar](50) NULL,
	[FIRSTNAME] [varchar](50) NULL,
	[PHONE] [varchar](50) NULL,
	[EMAIL] [varchar](50) NULL,
	[IsNewAppointment] [bit] NULL,
	[ApptSourceId] [int] NULL,
	[IsRegisteredForTraining] [bit] NULL,
	[CourseId] [int] NULL,
	[CourseTrainingDate] [datetime] NULL,
	[DiscussionTopic] [varchar](50) NULL,
	[ACTIONSTEP] [varchar](50) NULL,
	[LAST_CONTACT_DATE] [datetime] NULL,
	[NEXT_CONTACT_DATE] [datetime] NULL,
	[IsActive] [bit] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[CreatedDate]  AS (getdate()),
	[CreatedBy] [varchar](50) NULL,
 CONSTRAINT [PK_TBL_CONTACTS] PRIMARY KEY CLUSTERED 
(
	[CONTACTSID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_COMPANIES]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_COMPANIES]
GO

CREATE TABLE [dbo].[TBL_COMPANIES](
	[COMPANIESID] [int] IDENTITY(1,1) NOT NULL,
	[COMPANYNAME] [varchar](max) NULL,
	[CITY] [varchar](50) NULL,
	[STATE] [varchar](50) NULL,
	[ZIP] [int] NULL,
	[POCLastName] [varchar](50) NULL,
	[POCFirstName] [varchar](50) NULL,
	[POCPhone] [varchar](50) NULL,
	[IsNewCompany] [bit] NULL,
	[COMPANYVALUEGOAL] [int] NULL,
	[IndustryId] [int] NULL,
	[RepLastName] [varchar](50) NULL,
	[RepFirstName] [varchar](50) NULL,
	[DiscussionTopic] [varchar](50) NULL,
	[ACTIONSTEP] [varchar](50) NULL,
	[LASTCONTACT_DATE] [datetime] NULL,
	[NEXTCONTACT_DATE] [datetime] NULL,
	[CreationDate] [datetime] NULL,
	[FranchiseeId] [int] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate]  AS (getdate()),
	[CreatedBy] [varchar](80) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](80) NULL,
 CONSTRAINT [PK_TBL_COMPANIES] PRIMARY KEY CLUSTERED 
(
	[COMPANIESID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

