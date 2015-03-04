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

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetACECampaignsForCampaignType]') AND type in (N'P', N'PC'))
/****** Object:  StoredProcedure [dbo].[sp_GetACECampaignsForCampaignType]    Script Date: 3/3/2015 10:12:36 AM ******/
DROP PROCEDURE [dbo].[sp_GetACECampaignsForCampaignType]
GO

CREATE Procedure [dbo].[sp_GetACECampaignsForCampaignType] 
(
@campaignTypeId INT,
@eventCompareDate DATETIME = NULL
)AS

SET @eventCompareDate = ISNULL(@eventCompareDate,GetDate());
PRINT CAST(@eventCompareDate AS VARCHAR(30));


IF @campaignTypeId = 1 
BEGIN
	SELECT a.CallToActionText,t.TypeDescription, i.* 
	FROM [dbo].[Tbl_AceMainInfo] i 
	INNER JOIN [dbo].[Tbl_AceCallToActionType] a ON i.CallToActionId = a.CallToActionId 
	INNER JOIN [dbo].[Tbl_AceCampaignType] t ON i.CampaignTypeId = t.CampaignTypeId 
	WHERE i.MessageSentDate IS NULL AND i.CampaignTypeId = @campaignTypeId AND DATEDIFF(day, @eventCompareDate,i.EventDate) = i.DaysFromEvent
	AND( (CAST(SUBSTRING(CONVERT(VARCHAR(8),@eventCompareDate,108),1,2) as int) >= CAST(SUBSTRING(CONVERT(VARCHAR(8),TimeSent,108),1,2) as int) AND CAST(SUBSTRING(CONVERT(VARCHAR(8),@eventCompareDate,108),4,2) as int) >= CAST(SUBSTRING(CONVERT(VARCHAR(8),TimeSent,108),4,2) as int)) 
	OR CAST(SUBSTRING(CONVERT(VARCHAR(8),@eventCompareDate,108),1,2) as int) > CAST(SUBSTRING(CONVERT(VARCHAR(8),TimeSent,108),1,2) as int));
END
ELSE
BEGIN
	SELECT a.CallToActionText,t.TypeDescription, i.* 
	FROM [dbo].[Tbl_AceMainInfo] i 
	INNER JOIN [dbo].[Tbl_AceCallToActionType] a ON i.CallToActionId = a.CallToActionId 
	INNER JOIN [dbo].[Tbl_AceCampaignType] t ON i.CampaignTypeId = t.CampaignTypeId 
	WHERE i.MessageSentDate IS NULL AND i.CampaignTypeId = @campaignTypeId AND DATEDIFF(day,i.EventDate,@eventCompareDate) = i.DaysFromEvent 
	AND( (CAST(SUBSTRING(CONVERT(VARCHAR(8),@eventCompareDate,108),1,2) as int) >= CAST(SUBSTRING(CONVERT(VARCHAR(8),TimeSent,108),1,2) as int) AND CAST(SUBSTRING(CONVERT(VARCHAR(8),@eventCompareDate,108),4,2) as int) >= CAST(SUBSTRING(CONVERT(VARCHAR(8),TimeSent,108),4,2) as int)) 
	OR CAST(SUBSTRING(CONVERT(VARCHAR(8),@eventCompareDate,108),1,2) as int) > CAST(SUBSTRING(CONVERT(VARCHAR(8),TimeSent,108),1,2) as int));
END

Return 0;
/*
Test area
exec sp_GetACECampaignsForCampaignType 1;
exec sp_GetACECampaignsForCampaignType 1,'03/09/2015';
exec sp_GetACECampaignsForCampaignType 1,'03/12/2015';
exec sp_GetACECampaignsForCampaignType 2,'03/20/2015';
*/
GO

ALTER TABLE [dbo].[Tbl_AceMainInfo] ADD TimeSent DATETIME NULL;
GO