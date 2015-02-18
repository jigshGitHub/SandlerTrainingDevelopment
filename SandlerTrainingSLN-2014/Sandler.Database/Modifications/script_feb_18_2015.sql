USE [SandlerDBV2014]
GO

ALTER TABLE [dbo].[Tbl_ACE_CampaignType] DROP CONSTRAINT [FK_Tbl_ACE_CampaignType_Tbl_ACE_CampaignType1]
GO

ALTER TABLE [dbo].[Tbl_ACE_CampaignType] DROP CONSTRAINT [PK_Tbl_ACE_CampaignType]
GO



IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_AceCampaignType]') AND type in (N'U'))
DROP TABLE [dbo].[Tbl_AceCampaignType]
GO

CREATE TABLE [dbo].[Tbl_AceCampaignType](
	[CampaignTypeId] [smallint] NOT NULL,
	[TypeDescription] [varchar](50) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Tbl_ACE_CampaignType] PRIMARY KEY CLUSTERED 
(
	[CampaignTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_AceMainInfo]') AND type in (N'U'))
DROP TABLE [dbo].[Tbl_AceMainInfo]
GO

CREATE TABLE [dbo].[Tbl_AceMainInfo](
	[AceId] [int] NULL,
	[CampaignName] [varchar](150) NULL,
	[CampaignTypeId] [smallint] NULL,
	[EventDate] [datetime] NULL,
	[CampaignPurpose] [varchar](150) NULL,
	[MessageNumber] [smallint] NULL,
	[DaysFromEvent] [int] NULL,
	[MessageSubject] [varchar](50) NULL,
	[Recipients] [varchar](max) NULL,
	[EmailGroupIds] [varchar](150) NULL,
	[ResponseTo] [varchar](150) NULL,
	[CallToActionId] [smallint] NULL,
	[MessageText] [varchar](max) NULL,
	[AttachFileId] [int] NULL,
	[MessageSentDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](150) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](150) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_AceCallToActionType]') AND type in (N'U'))
DROP TABLE [dbo].[Tbl_AceCallToActionType]
GO

CREATE TABLE [dbo].[Tbl_AceCallToActionType](
	[CallToActionId] [int] NOT NULL,
	[CallToActionText] [varchar](150) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Tbl_AceCallToActionType] PRIMARY KEY CLUSTERED 
(
	[CallToActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

