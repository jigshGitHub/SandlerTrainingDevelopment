/*Exeuted 9/26 11:30PM on 139 */

ALTER TABLE Tbl_AppointmentsSource ADD ColorCode VARCHAR(6);
GO

Update Tbl_AppointmentsSource SET ColorCode = '00CC66' WHERE ApptSourceId = 1;
Update Tbl_AppointmentsSource SET ColorCode = '0099FF' WHERE ApptSourceId = 2;
Update Tbl_AppointmentsSource SET ColorCode = 'FF3300' WHERE ApptSourceId = 3;
Update Tbl_AppointmentsSource SET ColorCode = '9900CC' WHERE ApptSourceId = 4;
Update Tbl_AppointmentsSource SET ColorCode = 'CC6600' WHERE ApptSourceId = 5;
GO

ALTER TABLE Tbl_AppointmentsSource
ALTER COLUMN ColorCode VARCHAR(6) NOT NULL
GO
/* New values for OpportunityStatus */
INSERT INTO [SandlerDB].[dbo].[TBL_OPPORTUNITYSTATUS] ([Name] ,[IsActive] ,[CreatedDate]) VALUES ('Qualification',1,GetDate())
GO
INSERT INTO [SandlerDB].[dbo].[TBL_OPPORTUNITYSTATUS] ([Name] ,[IsActive] ,[CreatedDate]) VALUES ('Needs Analysis',1,GetDate())
GO
INSERT INTO [SandlerDB].[dbo].[TBL_OPPORTUNITYSTATUS] ([Name] ,[IsActive] ,[CreatedDate]) VALUES ('Proposal/Price Quote',1,GetDate())
GO
INSERT INTO [SandlerDB].[dbo].[TBL_OPPORTUNITYSTATUS] ([Name] ,[IsActive] ,[CreatedDate]) VALUES ('Closed Won',1,GetDate())
GO
INSERT INTO [SandlerDB].[dbo].[TBL_OPPORTUNITYSTATUS] ([Name] ,[IsActive] ,[CreatedDate]) VALUES ('Closed Lost',1,GetDate())
GO

/*
* Opportunity Types
*/

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TBL_OpportunityTypes_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TBL_OpportunityTypes] DROP CONSTRAINT [DF_TBL_OpportunityTypes_IsActive]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TBL_OpportunityTypes_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TBL_OpportunityTypes] DROP CONSTRAINT [DF_TBL_OpportunityTypes_CreatedDate]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TBL_OpportunityTypes_LastUpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TBL_OpportunityTypes] DROP CONSTRAINT [DF_TBL_OpportunityTypes_LastUpdatedDate]
END

GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_OpportunityTypes]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_OpportunityTypes]
GO

CREATE TABLE [dbo].[TBL_OpportunityTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NULL,
	[CreateBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[LastUpdateBy] [uniqueidentifier] NULL,
	[LastUpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_TBL_OpportunityTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[TBL_OpportunityTypes] ADD  CONSTRAINT [DF_TBL_OpportunityTypes_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[TBL_OpportunityTypes] ADD  CONSTRAINT [DF_TBL_OpportunityTypes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[TBL_OpportunityTypes] ADD  CONSTRAINT [DF_TBL_OpportunityTypes_LastUpdatedDate]  DEFAULT (getdate()) FOR [LastUpdatedDate]
GO

INSERT INTO [SandlerDB].[dbo].[TBL_OpportunityTypes] ([Name] ,[IsActive] ,[CreatedDate]) VALUES ('New Business',1,GetDate())
GO  
INSERT INTO [SandlerDB].[dbo].[TBL_OpportunityTypes] ([Name] ,[IsActive] ,[CreatedDate]) VALUES ('Additional Business',1,GetDate())
GO 
INSERT INTO [SandlerDB].[dbo].[TBL_OpportunityTypes] ([Name] ,[IsActive] ,[CreatedDate]) VALUES ('Recompete',1,GetDate())
GO 

/* Opportunity WhyLost */
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TBL_OpportunityWhyLost_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TBL_OpportunityWhyLost] DROP CONSTRAINT [DF_TBL_OpportunityWhyLost_IsActive]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TBL_OpportunityWhyLost_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TBL_OpportunityWhyLost] DROP CONSTRAINT [DF_TBL_OpportunityWhyLost_CreatedDate]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TBL_OpportunityWhyLost_LastUpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TBL_OpportunityWhyLost] DROP CONSTRAINT [DF_TBL_OpportunityWhyLost_LastUpdatedDate]
END

GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_OpportunityWhyLost]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_OpportunityWhyLost]
GO

CREATE TABLE [dbo].[TBL_OpportunityWhyLost](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NULL,
	[CreateBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[LastUpdateBy] [uniqueidentifier] NULL,
	[LastUpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_TBL_OpportunityWhyLost] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[TBL_OpportunityWhyLost] ADD  CONSTRAINT [DF_TBL_OpportunityWhyLost_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[TBL_OpportunityWhyLost] ADD  CONSTRAINT [DF_TBL_OpportunityWhyLost_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[TBL_OpportunityWhyLost] ADD  CONSTRAINT [DF_TBL_OpportunityWhyLost_LastUpdatedDate]  DEFAULT (getdate()) FOR [LastUpdatedDate]
GO

INSERT INTO [SandlerDB].[dbo].[TBL_OpportunityWhyLost] ([Name] ,[IsActive] ,[CreatedDate]) VALUES ('Lost Funding',1,GetDate())
GO  
INSERT INTO [SandlerDB].[dbo].[TBL_OpportunityWhyLost] ([Name] ,[IsActive] ,[CreatedDate]) VALUES ('Competition',1,GetDate())
GO 
INSERT INTO [SandlerDB].[dbo].[TBL_OpportunityWhyLost] ([Name] ,[IsActive] ,[CreatedDate]) VALUES ('Customer Cancelled',1,GetDate())
GO 
INSERT INTO [SandlerDB].[dbo].[TBL_OpportunityWhyLost] ([Name] ,[IsActive] ,[CreatedDate]) VALUES ('No Bid',1,GetDate())
GO 

/* Opportunity Source */
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TBL_OpportunitySource_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TBL_OpportunitySource] DROP CONSTRAINT [DF_TBL_OpportunitySource_IsActive]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TBL_OpportunitySource_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TBL_OpportunitySource] DROP CONSTRAINT [DF_TBL_OpportunitySource_CreatedDate]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TBL_OpportunitySource_LastUpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TBL_OpportunitySource] DROP CONSTRAINT [DF_TBL_OpportunitySource_LastUpdatedDate]
END

GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_OpportunitySource]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_OpportunitySource]
GO

CREATE TABLE [dbo].[TBL_OpportunitySource](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NULL,
	[CreateBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[LastUpdateBy] [uniqueidentifier] NULL,
	[LastUpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_TBL_OpportunitySource] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[TBL_OpportunitySource] ADD  CONSTRAINT [DF_TBL_OpportunitySource_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[TBL_OpportunitySource] ADD  CONSTRAINT [DF_TBL_OpportunitySource_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[TBL_OpportunitySource] ADD  CONSTRAINT [DF_TBL_OpportunitySource_LastUpdatedDate]  DEFAULT (getdate()) FOR [LastUpdatedDate]
GO

INSERT INTO dbo.[TBL_OpportunitySource](Name) VALUES('Existing Account');
GO
INSERT INTO dbo.[TBL_OpportunitySource](Name) VALUES('Employee Referral');
GO
INSERT INTO dbo.[TBL_OpportunitySource](Name) VALUES('Customer Referral');
GO
INSERT INTO dbo.[TBL_OpportunitySource](Name) VALUES('Vendor Referral');
GO
INSERT INTO dbo.[TBL_OpportunitySource](Name) VALUES('Client Inbound');
GO
INSERT INTO dbo.[TBL_OpportunitySource](Name) VALUES('Website');
GO
INSERT INTO dbo.[TBL_OpportunitySource](Name) VALUES('Marketing Campaign');
GO


/* New fields in Opportunity */
ALTER TABLE TBL_OPPORTUNITIES ADD SourceID INT
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_OPPORTUNITIES_TBL_OpportunitySource]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_OPPORTUNITIES]'))
ALTER TABLE [dbo].[TBL_OPPORTUNITIES] DROP CONSTRAINT [FK_TBL_OPPORTUNITIES_TBL_OpportunitySource]
GO

ALTER TABLE [dbo].[TBL_OPPORTUNITIES]  WITH CHECK ADD  CONSTRAINT [FK_TBL_OPPORTUNITIES_TBL_OpportunitySource] FOREIGN KEY([SourceID])
REFERENCES [dbo].[TBL_OpportunitySource] ([ID])
GO

ALTER TABLE [dbo].[TBL_OPPORTUNITIES] CHECK CONSTRAINT [FK_TBL_OPPORTUNITIES_TBL_OpportunitySource]
GO
ALTER TABLE TBL_OPPORTUNITIES ADD TypeID INT
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_OPPORTUNITIES_TBL_OpportunityTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_OPPORTUNITIES]'))
ALTER TABLE [dbo].[TBL_OPPORTUNITIES] DROP CONSTRAINT [FK_TBL_OPPORTUNITIES_TBL_OpportunityTypes]
GO

ALTER TABLE [dbo].[TBL_OPPORTUNITIES]  WITH CHECK ADD  CONSTRAINT [FK_TBL_OPPORTUNITIES_TBL_OpportunityTypes] FOREIGN KEY([TypeID])
REFERENCES [dbo].[TBL_OpportunityTypes] ([ID])
GO

ALTER TABLE [dbo].[TBL_OPPORTUNITIES] CHECK CONSTRAINT [FK_TBL_OPPORTUNITIES_TBL_OpportunityTypes]
GO

ALTER TABLE TBL_OPPORTUNITIES ADD WhyLostID INT
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_OPPORTUNITIES_TBL_OpportunityWhyLost]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_OPPORTUNITIES]'))
ALTER TABLE [dbo].[TBL_OPPORTUNITIES] DROP CONSTRAINT [FK_TBL_OPPORTUNITIES_TBL_OpportunityWhyLost]
GO

ALTER TABLE [dbo].[TBL_OPPORTUNITIES]  WITH CHECK ADD  CONSTRAINT [FK_TBL_OPPORTUNITIES_TBL_OpportunityWhyLost] FOREIGN KEY([WhyLostID])
REFERENCES [dbo].[TBL_OpportunityWhyLost] ([ID])
GO

ALTER TABLE [dbo].[TBL_OPPORTUNITIES] CHECK CONSTRAINT [FK_TBL_OPPORTUNITIES_TBL_OpportunityWhyLost]
GO

ALTER TABLE [dbo].[TBL_OPPORTUNITIES] ADD [Description] VARCHAR(500);
GO
ALTER TABLE [dbo].[TBL_OPPORTUNITIES] ADD Notes VARCHAR(500);
GO
ALTER TABLE [dbo].[TBL_OPPORTUNITIES] ADD ActualValue NUMERIC
GO
ALTER TABLE [dbo].[TBL_OPPORTUNITIES] ALTER COLUMN WEIGHTEDVALUE NUMERIC
GO

ALTER TABLE [dbo].[TBL_OPPORTUNITIES] ADD SeconadryContactId1 INT;
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_OPPORTUNITIES_TBL_CONTACTS1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_OPPORTUNITIES]'))
ALTER TABLE [dbo].[TBL_OPPORTUNITIES] DROP CONSTRAINT [FK_TBL_OPPORTUNITIES_TBL_CONTACTS1]
GO

ALTER TABLE [dbo].[TBL_OPPORTUNITIES]  WITH CHECK ADD  CONSTRAINT [FK_TBL_OPPORTUNITIES_TBL_CONTACTS1] FOREIGN KEY([SeconadryContactId1])
REFERENCES [dbo].[TBL_CONTACTS] ([CONTACTSID])
GO

ALTER TABLE [dbo].[TBL_OPPORTUNITIES] CHECK CONSTRAINT [FK_TBL_OPPORTUNITIES_TBL_CONTACTS1]
GO

ALTER TABLE [dbo].[TBL_OPPORTUNITIES] ADD SeconadryContactId2 INT;
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_OPPORTUNITIES_TBL_CONTACTS2]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_OPPORTUNITIES]'))
ALTER TABLE [dbo].[TBL_OPPORTUNITIES] DROP CONSTRAINT [FK_TBL_OPPORTUNITIES_TBL_CONTACTS2]
GO

ALTER TABLE [dbo].[TBL_OPPORTUNITIES]  WITH CHECK ADD  CONSTRAINT [FK_TBL_OPPORTUNITIES_TBL_CONTACTS2] FOREIGN KEY([SeconadryContactId2])
REFERENCES [dbo].[TBL_CONTACTS] ([CONTACTSID])
GO

ALTER TABLE [dbo].[TBL_OPPORTUNITIES] CHECK CONSTRAINT [FK_TBL_OPPORTUNITIES_TBL_CONTACTS2]
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Opportunities]'))
DROP VIEW [dbo].[vw_Opportunities]
GO

Create VIEW [dbo].[vw_Opportunities]

AS

SELECT r.ID AS RegionID, 
r.Name AS Region, 
ch.ID AS CoachID, 
ch.FirstName + ' ' + ch.LastName AS CoachName, 
f.ID AS FranchiseeId, 
f.Name AS FranchiseeName, 
cnt.FirstName + ' ' + cnt.LastName AS ContactName,
cnt.IsNewAppointment,
cnt.IsRegisteredForTraining,
cnt.ApptSourceId,
cnt.CourseTrainingDate,
cnt.FirstName AS PrimaryContactFirstName,
cnt.LastName AS PrimaryContactLastName,
cnt.Email AS PrimaryContactEmail,
seconadryCnt1.FirstName AS SeconadryContact1FirstName,
seconadryCnt1.LastName AS SeconadryContact1LastName,
seconadryCnt1.Email AS SeconadryContact1Email,
seconadryCnt2.FirstName AS SeconadryContact2FirstName,
seconadryCnt2.LastName AS SeconadryContact2LastName,
seconadryCnt2.Email AS SeconadryContact2Email,
cmp.COMPANYNAME, 
cmp.IsNewCompany, 
cmp.CreationDate, cmp.IndustryId,  
wl.Name AS WhyLost,
ot.Name AS [Type],
st.Name AS [Status],
p.ProductTypeName,
src.Name AS [Source],
o.* 
FROM dbo.[TBL_OPPORTUNITIES] o WITH (NOLOCK)
INNER JOIN dbo.[TBL_COMPANIES] cmp WITH (NOLOCK) ON cmp.COMPANIESID = o.COMPANYID AND cmp.IsActive = 1
INNER JOIN dbo.[TBL_CONTACTS] cnt WITH (NOLOCK) ON cnt.CONTACTSID = o.CONTACTID AND cnt.IsActive = 1
INNER JOIN dbo.[TBL_Franchisee] f WITH (NOLOCK) ON cmp.FranchiseeID = f.ID AND f.IsActive = 1
INNER JOIN dbo.[TBL_COACH] ch WITH (NOLOCK) ON f.CoachID = ch.ID AND ch.IsActive = 1
INNER JOIN dbo.[TBL_Region] r WITH (NOLOCK) ON ch.RegionID = r.ID AND r.IsActive = 1
LEFT JOIN dbo.[TBL_Contacts] seconadryCnt1 WITH (NOLOCK) ON seconadryCnt1.CONTACTSID = o.SeconadryContactId1
LEFT JOIN dbo.[TBL_Contacts] seconadryCnt2 WITH (NOLOCK) ON seconadryCnt2.CONTACTSID = o.SeconadryContactId2
LEFT JOIN dbo.[TBL_OpportunityWhyLost] wl WITH (NOLOCK) ON wl.ID = o.WhyLostID
LEFT JOIN dbo.[TBL_OpportunityTypes] ot WITH (NOLOCK) ON ot.ID = o.TypeID
LEFT JOIN dbo.[TBL_OPPORTUNITYSTATUS] st WITH (NOLOCK) ON st.ID = o.StatusID
LEFT JOIN dbo.[TBL_OpportunitySource] src WITH (NOLOCK) ON src.ID = o.SourceID
LEFT JOIN dbo.[Tbl_ProductType] p WITH (NOLOCK) ON.p.ID = o.ProductID
AND o.IsActive = 1

GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Companies]'))
DROP VIEW [dbo].[vw_Companies]
GO

Create VIEW [dbo].[vw_Companies]

AS

SELECT r.ID AS RegionID, 
r.Name AS Region, 
ch.ID AS CoachID, 
ch.FirstName + ' ' + ch.LastName AS CoachName,
f.Name AS FranchiseeName, 
cmp.* 
FROM dbo.[TBL_COMPANIES] cmp WITH (NOLOCK)
INNER JOIN dbo.[TBL_Franchisee] f WITH (NOLOCK) ON cmp.FranchiseeID = f.ID AND f.IsActive = 1
INNER JOIN dbo.[TBL_COACH] ch WITH (NOLOCK) ON f.CoachID = ch.ID AND ch.IsActive = 1
INNER JOIN dbo.[TBL_Region] r WITH (NOLOCK) ON ch.RegionID = r.ID AND r.IsActive = 1
WHERE cmp.IsActive = 1


GO


/****** Object:  StoredProcedure [dbo].[sp_GetCompaniesByUser]    Script Date: 09/25/2012 22:43:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetCompaniesByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetCompaniesByUser]
GO


CREATE Procedure [dbo].[sp_GetCompaniesByUser]
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
		FROM [vw_Companies];
		
		Return;
	END
	
	IF @RoleName = 'Coach'
	BEGIN
		
		Select vw.*  
		FROM [vw_Companies] vw
		INNER JOIN TBL_COACH ch WITH(NOLOCK) ON ch.ID = vw.CoachId
		WHERE ch.UserID = @userId;
		
	END 
	
	IF (@RoleName = 'FranchiseeOwner' OR @RoleName = 'FranchiseeUser')
	Begin
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		PRINT '@franchiseeId=' + CAST(@franchiseeId as varchar(10));
		
		Select vw.*  
		FROM [vw_Companies] vw
		INNER JOIN TBL_Franchisee f WITH(NOLOCK) ON f.ID = vw.FranchiseeID
		WHERE vw.FranchiseeID = @franchiseeId;
		Return;
	END	
	
End

GO

