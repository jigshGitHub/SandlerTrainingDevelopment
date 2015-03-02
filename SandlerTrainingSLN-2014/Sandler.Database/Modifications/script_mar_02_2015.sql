USE [SandlerDBV2014]
GO

ALTER TABLE [dbo].[Tbl_AceEmailTracker] DROP CONSTRAINT [FK_Tbl_AceEmailTracker_Tbl_AceMainInfo]
GO

ALTER TABLE [dbo].[Tbl_AceEmailTracker] DROP CONSTRAINT [DF_Tbl_AceEmailTracker_IsViewed]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_AceEmailTracker]') AND type in (N'U'))
DROP TABLE [dbo].[Tbl_AceEmailTracker]
GO

/****** Object:  Table [dbo].[Tbl_AceEmailTracker]    Script Date: 3/2/2015 3:11:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Tbl_AceEmailTracker](
	[ID] [uniqueidentifier] NOT NULL,
	[AceId] [int] NOT NULL,
	[EmailAddress] [varchar](100) NOT NULL,
	[IsViewed] [bit] NOT NULL,
 CONSTRAINT [PK_Tbl_AceEmailTracker] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Tbl_AceEmailTracker] ADD  CONSTRAINT [DF_Tbl_AceEmailTracker_IsViewed]  DEFAULT ((0)) FOR [IsViewed]
GO

ALTER TABLE [dbo].[Tbl_AceEmailTracker]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_AceEmailTracker_Tbl_AceMainInfo] FOREIGN KEY([AceId])
REFERENCES [dbo].[Tbl_AceMainInfo] ([AceId])
GO

ALTER TABLE [dbo].[Tbl_AceEmailTracker] CHECK CONSTRAINT [FK_Tbl_AceEmailTracker_Tbl_AceMainInfo]
GO


