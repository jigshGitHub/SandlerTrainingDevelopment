/*
Executed on 139 Dt:10/22 11:41PM
*/

Alter Table TBL_OPPORTUNITIES ADD  ProductCost NUMERIC NULL;
GO
Alter Table TBL_OPPORTUNITIES ADD  CreationDate DATETIME NULL;
GO
Alter Table TBL_OPPORTUNITIES ALTER COLUMN  Value NUMERIC NULL;
GO

EXEC [aspnet_Roles_CreateRole] 'SandlerTraining','Client';

INSERT INTO [SandlerDB].[dbo].[TBL_CHART] ([Caption],[SWFile], [ChartID], [TypeOfChart] ,[YaxisName] ,[CanvasBgColor] ,[BgColor] ,[CanvasBgAlpha] ,[BgAlpha])      
VALUES ('Cost of Sale (By Product)' ,'StackedColumn3D.swf','CostOfSale','Chart','' ,'FFFFFF' ,'FFFFFF' ,'100' ,'100' );
GO
		
/****** Object:  View [dbo].[vw_Opportunities]    Script Date: 10/20/2012 19:42:10 ******/
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
o.ID,
o.COMPANYID,
o.CONTACTID,
o.NAME,
o.ProductID,
o.SALESREPLASTNAME,
o.SALESREPFIRSTNAME,
o.SALESREPPHONE,
o.STATUSID,
o.VALUE,
o.WINPROBABILITY,
o.WEIGHTEDVALUE,
o.CLOSEDATE,
o.IsActive,
o.UpdatedDate,
o.UpdatedBy,
o.CreatedDate,
o.CreatedBy,
o.OpportunityID,
o.SourceID,
o.TypeID,
o.WhyLostID,
o.Description,
o.Notes,
o.ActualValue,
o.SeconadryContactId1,
o.SeconadryContactId2,
o.ProductCost,
o.CreationDate AS OppCreationDate
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

/****** Object:  StoredProcedure [dbo].[sp_GetCompaniesByUser]    Script Date: 10/22/2012 13:40:16 ******/
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
	
	IF (@RoleName = 'FranchiseeOwner' OR @RoleName = 'FranchiseeUser' OR @RoleName = 'Client')
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


/****** Object:  StoredProcedure [dbo].[sp_GetContactsByUser]    Script Date: 10/22/2012 13:43:28 ******/
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
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		Select vw.*  
		FROM [vw_Contacts] vw
		WHERE vw.CreatedBy = @userId;
		
	END 
	
	
	
End

GO
/****** Object:  StoredProcedure [dbo].[sp_GetOpportunitiesByUser]    Script Date: 10/22/2012 13:51:16 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetOpportunitiesByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetOpportunitiesByUser]
GO

CREATE Procedure [dbo].[sp_GetOpportunitiesByUser]
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
		FROM [vw_Opportunities];
		
		Return;
	END
	
	IF @RoleName = 'Coach'
	BEGIN
		
		Select vw.*  
		FROM [vw_Opportunities] vw
		INNER JOIN TBL_COACH ch WITH(NOLOCK) ON ch.ID = vw.CoachId
		WHERE ch.UserID = @userId;
		
	END 
	
	IF (@RoleName = 'FranchiseeOwner' OR @RoleName = 'Client')
	Begin
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		PRINT '@franchiseeId=' + CAST(@franchiseeId as varchar(10));
		
		Select vw.*  
		FROM [vw_Opportunities] vw
		INNER JOIN TBL_Franchisee f WITH(NOLOCK) ON f.ID = vw.FranchiseeID
		WHERE vw.FranchiseeID = @franchiseeId;
		Return;
	END
	
	IF @RoleName = 'FranchiseeUser'
	BEGIN
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		Select vw.*  
		FROM [vw_Opportunities] vw
		WHERE vw.CreatedBy = @userId;
		
	END 
	
End

GO


/****** Object:  StoredProcedure [dbo].[sp_GetNewAppointmentsWithAppointmentSource]    Script Date: 10/22/2012 13:55:29 ******/
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
		AND CreatedBy = @userId
		Group By ApptSourceName;
		
	END 
END

GO

/****** Object:  StoredProcedure [dbo].[sp_GetNewClientsWithProducts]    Script Date: 10/22/2012 13:57:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetNewClientsWithProducts]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetNewClientsWithProducts]
GO

CREATE PROCEDURE [dbo].[sp_GetNewClientsWithProducts]
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
    
		Select Count(COMPANIESID) AS CompaniesCount, ProductTypeName 
		FROM [vw_NewClientsWithProducts]
		WHERE DATEPART(MONTH,CreationDate) = @month
		AND DATEPART(YEAR,CreationDate) = @year
		Group By ProductTypeName;
		
		Return;
	END
	
	IF @RoleName = 'Coach'
	BEGIN
		
		Select Count(vw.COMPANIESID) AS ContactsCount, vw.ProductTypeName 
		FROM [vw_NewClientsWithProducts] vw
		INNER JOIN TBL_FRANCHISEE f WITH(NOLOCK) ON f.ID = vw.FranchiseeId
		INNER JOIN TBL_COACH ch WITH(NOLOCK) ON ch.ID = f.CoachId
		WHERE DATEPART(MONTH,vw.CreationDate) = @month
		AND DATEPART(YEAR,vw.CreationDate) = @year
		AND ch.UserID = @userId
		Group By vw.ProductTypeName;
		
	END 
	
	IF(@RoleName = 'FranchiseeOwner' OR @RoleName = 'Client')
	Begin
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		PRINT '@franchiseeId=' + CAST(@franchiseeId as varchar(10));
		
		Select Count(COMPANIESID) AS ContactsCount, ProductTypeName 
		FROM [vw_NewClientsWithProducts]
		WHERE DATEPART(MONTH,CreationDate) = @month
		AND DATEPART(YEAR,CreationDate) = @year
		AND FranchiseeId = @franchiseeId
		Group By ProductTypeName;
		
		Return;
	END
	
	IF @RoleName = 'FranchiseeUser'
	BEGIN
		
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		Select Count(COMPANIESID) AS ContactsCount, ProductTypeName 
		FROM [vw_NewClientsWithProducts]
		WHERE DATEPART(MONTH,CreationDate) = @month
		AND DATEPART(YEAR,CreationDate) = @year
		AND FranchiseeId = @franchiseeId
		AND CreatedBy = @userId
		Group By ProductTypeName;
		
	END 
END

GO

/****** Object:  StoredProcedure [dbo].[sp_ClientsAvgLengthWithIndustries]    Script Date: 10/22/2012 14:01:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ClientsAvgLengthWithIndustries]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_ClientsAvgLengthWithIndustries]
GO

CREATE PROCEDURE [dbo].[sp_ClientsAvgLengthWithIndustries]
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
    
		SELECT IndustryTypeName,AVG(DATEDIFF(MONTH,CreationDate,GETDATE()))
		FROM [vw_ClientsWithIndustries]
		Group By IndustryTypeName;
		
		Return;
	END
	
	IF @RoleName = 'Coach'
	BEGIN
		
		SELECT vw.IndustryTypeName,AVG(DATEDIFF(MONTH,vw.CreationDate,GETDATE()))
		FROM [vw_ClientsWithIndustries] vw
		INNER JOIN TBL_FRANCHISEE f WITH(NOLOCK) ON f.ID = vw.FranchiseeId
		INNER JOIN TBL_COACH ch WITH(NOLOCK) ON ch.ID = f.CoachId
		WHERE ch.UserID = @userId
		Group By vw.IndustryTypeName;
		
	END 
	
	IF( @RoleName = 'FranchiseeOwner' OR  @RoleName = 'Client')
	Begin
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		PRINT '@franchiseeId=' + CAST(@franchiseeId as varchar(10));
		
		SELECT IndustryTypeName,AVG(DATEDIFF(MONTH,CreationDate,GETDATE()))
		FROM [vw_ClientsWithIndustries]
		WHERE FranchiseeId = @franchiseeId
		Group By IndustryTypeName;
		
		Return;
	END
	
	IF @RoleName = 'FranchiseeUser'
	BEGIN
		
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		SELECT IndustryTypeName,AVG(DATEDIFF(MONTH,CreationDate,GETDATE()))
		FROM [vw_ClientsWithIndustries]
		WHERE FranchiseeId = @franchiseeId
		Group By IndustryTypeName;
		
	END 
END

GO


--Bhavesh Changes

CREATE TABLE [dbo].[Tbl_MeetingType](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreatedOn] [datetime] NULL CONSTRAINT [DF_Tbl_MeetingType_CreatedOn]  DEFAULT (getdate()),
	[CreatedBy] [varchar](80) NULL,
 CONSTRAINT [PK_Tbl_MeetingType] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_MeetingType] ON
INSERT [dbo].[Tbl_MeetingType] ([TypeId], [TypeName], [IsActive], [CreatedOn], [CreatedBy]) VALUES (1, N'Business', 1, CAST(0x0000A0EF00E35CA8 AS DateTime), N'System')
INSERT [dbo].[Tbl_MeetingType] ([TypeId], [TypeName], [IsActive], [CreatedOn], [CreatedBy]) VALUES (2, N'Casual', 1, CAST(0x0000A0EF00E36EF2 AS DateTime), N'System')
INSERT [dbo].[Tbl_MeetingType] ([TypeId], [TypeName], [IsActive], [CreatedOn], [CreatedBy]) VALUES (3, N'Follow-up', 1, CAST(0x0000A0EF00E37E74 AS DateTime), N'System')
SET IDENTITY_INSERT [dbo].[Tbl_MeetingType] OFF
/****** Object:  Table [dbo].[Tbl_MeetingFrequencyType]    Script Date: 10/21/2012 20:47:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_MeetingFrequencyType](
	[FreqId] [int] IDENTITY(1,1) NOT NULL,
	[FreqType] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreatedOn] [datetime] NULL CONSTRAINT [DF_Tbl_MeetingFrequencyType_CreatedOn]  DEFAULT (getdate()),
	[CreatedBy] [varchar](80) NULL,
 CONSTRAINT [PK_Tbl_MeetingFrequencyType] PRIMARY KEY CLUSTERED 
(
	[FreqId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_MeetingFrequencyType] ON
INSERT [dbo].[Tbl_MeetingFrequencyType] ([FreqId], [FreqType], [IsActive], [CreatedOn], [CreatedBy]) VALUES (1, N'Daily', 1, CAST(0x0000A0EF00EFB3C2 AS DateTime), N'System')
INSERT [dbo].[Tbl_MeetingFrequencyType] ([FreqId], [FreqType], [IsActive], [CreatedOn], [CreatedBy]) VALUES (2, N'Weekly', 1, CAST(0x0000A0EF00EFC08F AS DateTime), N'System')
INSERT [dbo].[Tbl_MeetingFrequencyType] ([FreqId], [FreqType], [IsActive], [CreatedOn], [CreatedBy]) VALUES (3, N'Monthly', 1, CAST(0x0000A0EF00EFDB30 AS DateTime), N'System')
INSERT [dbo].[Tbl_MeetingFrequencyType] ([FreqId], [FreqType], [IsActive], [CreatedOn], [CreatedBy]) VALUES (4, N'Yearly', 1, CAST(0x0000A0EF01014091 AS DateTime), N'System')
SET IDENTITY_INSERT [dbo].[Tbl_MeetingFrequencyType] OFF
/****** Object:  StoredProcedure [dbo].[sp_GetMeetingTypeOptions]    Script Date: 10/21/2012 20:47:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_GetMeetingTypeOptions]

	 

AS

	 SELECT TypeId, TypeName FROM Tbl_MeetingType ORDER BY TypeName/* SET NOCOUNT ON */

	 RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_GetMeetingFrequencyType]    Script Date: 10/21/2012 20:47:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetMeetingFrequencyType]

	 

AS

	 SELECT FreqId, FreqType FROM Tbl_MeetingFrequencyType ORDER BY FreqId

	 RETURN
GO






