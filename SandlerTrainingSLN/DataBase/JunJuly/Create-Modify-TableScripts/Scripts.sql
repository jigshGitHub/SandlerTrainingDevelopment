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

CREATE TABLE [dbo].[TBL_CHART](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeOfChart] [varchar](100) NOT NULL,
	[Caption] [varchar](500) NOT NULL,
	[SWFile] [varchar] (500) NOT NULL,
	[ChartID] [varchar] (500) NOT NULL,
	[NumberSuffix] [char](1) NULL,
	[SNumberSuffix] [char](1) NULL,
	[XaxisName] [varchar] (500) NULL,
	[YaxisName] [varchar] (500) NULL,
	[CanvasBgColor] [char](6) NULL,
	[BgColor] [char](6) NULL,
	[CanvasBgAlpha] [varchar](10) NULL,
	[BgAlpha] [varchar](10) NULL,
	[PieRadius] [varchar](10) NULL,
	[EnableRotation] [char](1) NULL,
	[ShowLegend] [char](1) NULL,
	[ShowLabels] [char](1) NULL,
	[PlotGradientColor] [char](6) NULL,
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
