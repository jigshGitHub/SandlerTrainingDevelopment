/*
This script executed on 139 machine on 9/3/2012 at 1:03PM
*/
CREATE TABLE [dbo].[TBL_BlastEmailGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BlastGroupName] [nvarchar](500) NOT NULL,
	[IsActive] [bit] NULL,
	[ForCorporate] [bit] NULL,
	[ForCoach] [bit] NULL,
	[ForFrOwner] [bit] NULL,
	[ForFrUser] [bit] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_TBL_BlastEmailGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TBL_BlastEmailGroup] ON
INSERT [dbo].[TBL_BlastEmailGroup] ([Id], [BlastGroupName], [IsActive], [ForCorporate], [ForCoach], [ForFrOwner], [ForFrUser], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdateDate]) VALUES (1, N'Corporate', 1, 1, 0, 0, 0, NULL, CAST(0x0000A0AB00FD835F AS DateTime), NULL, CAST(0x0000A0AB00FD835F AS DateTime))
INSERT [dbo].[TBL_BlastEmailGroup] ([Id], [BlastGroupName], [IsActive], [ForCorporate], [ForCoach], [ForFrOwner], [ForFrUser], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdateDate]) VALUES (2, N'All Coach', 1, 0, 1, 0, 0, NULL, CAST(0x0000A0AB00FD835F AS DateTime), NULL, CAST(0x0000A0AB00FD835F AS DateTime))
INSERT [dbo].[TBL_BlastEmailGroup] ([Id], [BlastGroupName], [IsActive], [ForCorporate], [ForCoach], [ForFrOwner], [ForFrUser], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdateDate]) VALUES (3, N'Franchisee Coach', 1, 0, 1, 0, 0, NULL, CAST(0x0000A0AB00FD835F AS DateTime), NULL, CAST(0x0000A0AB00FD835F AS DateTime))
INSERT [dbo].[TBL_BlastEmailGroup] ([Id], [BlastGroupName], [IsActive], [ForCorporate], [ForCoach], [ForFrOwner], [ForFrUser], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdateDate]) VALUES (4, N'All Franchisee Owners', 1, 1, 0, 0, 0, NULL, CAST(0x0000A0AB00FD835F AS DateTime), NULL, CAST(0x0000A0AB00FD835F AS DateTime))
INSERT [dbo].[TBL_BlastEmailGroup] ([Id], [BlastGroupName], [IsActive], [ForCorporate], [ForCoach], [ForFrOwner], [ForFrUser], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdateDate]) VALUES (5, N'Franchisee Owner', 1, 0, 1, 0, 0, NULL, CAST(0x0000A0AB00FD835F AS DateTime), NULL, CAST(0x0000A0AB00FD835F AS DateTime))
INSERT [dbo].[TBL_BlastEmailGroup] ([Id], [BlastGroupName], [IsActive], [ForCorporate], [ForCoach], [ForFrOwner], [ForFrUser], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdateDate]) VALUES (6, N'All Franchisee Users', 1, 1, 0, 0, 0, NULL, CAST(0x0000A0AB00FD8366 AS DateTime), NULL, CAST(0x0000A0AB00FD8366 AS DateTime))
INSERT [dbo].[TBL_BlastEmailGroup] ([Id], [BlastGroupName], [IsActive], [ForCorporate], [ForCoach], [ForFrOwner], [ForFrUser], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdateDate]) VALUES (7, N'Franchisee Users', 1, 0, 1, 1, 0, NULL, CAST(0x0000A0AB00FD8366 AS DateTime), NULL, CAST(0x0000A0AB00FD8366 AS DateTime))
INSERT [dbo].[TBL_BlastEmailGroup] ([Id], [BlastGroupName], [IsActive], [ForCorporate], [ForCoach], [ForFrOwner], [ForFrUser], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdateDate]) VALUES (8, N'All Franchisee Contacts', 1, 1, 0, 0, 0, NULL, CAST(0x0000A0AB00FD8366 AS DateTime), NULL, CAST(0x0000A0AB00FD8366 AS DateTime))
INSERT [dbo].[TBL_BlastEmailGroup] ([Id], [BlastGroupName], [IsActive], [ForCorporate], [ForCoach], [ForFrOwner], [ForFrUser], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdateDate]) VALUES (9, N'Franchisee Contacts', 1, 0, 1, 1, 1, NULL, CAST(0x0000A0AB00FD8366 AS DateTime), NULL, CAST(0x0000A0AB00FD8366 AS DateTime))
SET IDENTITY_INSERT [dbo].[TBL_BlastEmailGroup] OFF
/****** Object:  Default [DF_TBL_BlastEmailGroup_IsActive]    Script Date: 08/30/2012 18:54:54 ******/
ALTER TABLE [dbo].[TBL_BlastEmailGroup] ADD  CONSTRAINT [DF_TBL_BlastEmailGroup_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_TBL_BlastEmailGroup_CreatedDate]    Script Date: 08/30/2012 18:54:54 ******/
ALTER TABLE [dbo].[TBL_BlastEmailGroup] ADD  CONSTRAINT [DF_TBL_BlastEmailGroup_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_TBL_BlastEmailGroup_UpdateDate]    Script Date: 08/30/2012 18:54:54 ******/
ALTER TABLE [dbo].[TBL_BlastEmailGroup] ADD  CONSTRAINT [DF_TBL_BlastEmailGroup_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
USE [SandlerDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByUserIDSearch]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByUserIDSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByUserIDSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByFrIDSearch]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByFrIDSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByFrIDSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCoachIDSearch]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByCoachIDSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByCoachIDSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsSearch]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByFrIdSearch]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCompaniesByFrIdSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCompaniesByFrIdSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByCoachIdSearch]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCompaniesByCoachIdSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCompaniesByCoachIdSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesSearch]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCompaniesSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCompaniesSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetCallList]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetCallList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetCallList]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetBlastEmailGroupsByRole]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetBlastEmailGroupsByRole]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetBlastEmailGroupsByRole]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCoachAddresses]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCoachAddresses]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCoachAddresses]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllFranchiseeAddresses]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllFranchiseeAddresses]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllFranchiseeAddresses]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsAddresses]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsAddresses]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsAddresses]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetFranchiseeAddresses]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetFranchiseeAddresses]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetFranchiseeAddresses]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetLoggedInUserAddress]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetLoggedInUserAddress]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetLoggedInUserAddress]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateSubscriptionInfo]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UpdateSubscriptionInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UpdateSubscriptionInfo]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetSubscriptionInfo]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetSubscriptionInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetSubscriptionInfo]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetBlastEmailOptions]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetBlastEmailOptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetBlastEmailOptions]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllEvents]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllEvents]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllEvents]
GO

/****** Object:  StoredProcedure [dbo].[sp_AddFollowUpItem]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AddFollowUpItem]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AddFollowUpItem]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertContact]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertContact]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_InsertContact]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateContactDetails]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UpdateContactDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UpdateContactDetails]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetContactDetails]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetContactDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetContactDetails]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetCallBackOptions]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetCallBackOptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetCallBackOptions]
GO

/****** Object:  StoredProcedure [dbo].[sp_LoadCompanyContactsData]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_LoadCompanyContactsData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_LoadCompanyContactsData]
GO

/****** Object:  StoredProcedure [dbo].[sp_AddProduct]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AddProduct]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AddProduct]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompanies]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCompanies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCompanies]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContacts]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContacts]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContacts]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateCompanyDetails]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UpdateCompanyDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UpdateCompanyDetails]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertCompany]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertCompany]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_InsertCompany]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetCompanyDetails]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetCompanyDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetCompanyDetails]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByFrId]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCompaniesByFrId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCompaniesByFrId]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetNewItemOptions]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetNewItemOptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetNewItemOptions]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCompID]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByCompID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByCompID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllProducts]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllProducts]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllProducts]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllIndustries]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllIndustries]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllIndustries]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByFrID]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByFrID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByFrID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetRegForTrainingOptions]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetRegForTrainingOptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetRegForTrainingOptions]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetApptSourceOptions]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetApptSourceOptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetApptSourceOptions]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByCoachId]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCompaniesByCoachId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCompaniesByCoachId]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCoachID]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByCoachID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByCoachID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByUserID]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByUserID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByUserID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsForCompByUserID]    Script Date: 09/03/2012 12:10:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsForCompByUserID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsForCompByUserID]
GO

USE [SandlerDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByUserIDSearch]    Script Date: 09/03/2012 12:10:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[sp_GetAllContactsByUserIDSearch]
	
	(
	    @UserID varchar(50),
	    @LastName varchar(50),
		@FirstName varchar(50),
		@Phone varchar(50),
		@Email varchar(50),
		@IsNewApptIdList varchar(50),
		@ApptSourceIdList varchar(150),
		@IsRegForTrainingList varchar(50),
		@CourseTypeIdList varchar(50),
		@CompanyIdList varchar(50),
		@NeedCallBackList varchar(50),
		@EmailSubscriptionList varchar(50),
		@DiscussionTopic varchar(50),
		@ActionStep varchar(50),
		@LastContactDate datetime,
		@NextContactDate datetime,
		@CourseTrngDate datetime,
		@BirthDayDate datetime,
		@AnniversaryDate datetime,
		@CompanyYears varchar(50),
		@BossName varchar(50) 
	)
	
AS
	if @LastContactDate < '2/1/1755'
	 Begin
		 Set @LastContactDate = null
	 End
	 
	if @NextContactDate < '2/1/1755'
	 Begin
		 Set @NextContactDate = null
	 End 
	
	if @CourseTrngDate < '2/1/1755'
	 Begin
		 Set @CourseTrngDate = null
	 End
	
	if @BirthDayDate < '2/1/1755'
	 Begin
		 Set @BirthDayDate = null
	 End
	 
	 if @AnniversaryDate < '2/1/1755'
	 Begin
		 Set @AnniversaryDate = null
	 End
	 
	 DECLARE @SQLString VARCHAR(7500);
	 Declare @PrevConditionExist varchar(10);
	 Set @PrevConditionExist = 'No';
	 
	 -- Base SQL string stetement
	Set @SQLString = 'Select 
	ct.lastname + '','' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack   
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join   Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack
	where ('
	-- Last Name
	if @LastName is not null and @LastName != ''
	Begin
		SET @SQLString = @SQLString + 'ct.lastname like ''' + @LastName  + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- First Name
	if @FirstName is not null and @FirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.FirstName like ''' + @FirstName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Phone
	if @Phone is not null and @Phone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Phone like ''' + @Phone  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Email
	if @Email is not null and @Email != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Email like ''' + @Email  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Is New Appt List
	if @IsNewApptIdList is not null and  @IsNewApptIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsNewAppointment in (' + @IsNewApptIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Appt Source Id List
	if @ApptSourceIdList is not null and  @ApptSourceIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ApptSourceId in (' + @ApptSourceIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Is Reg For Training List
	if @IsRegForTrainingList is not null and  @IsRegForTrainingList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsRegisteredForTraining in (' + @IsRegForTrainingList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Course Type
	if @CourseTypeIdList is not null and  @CourseTypeIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CourseId in (' + @CourseTypeIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Company ID
	if @CompanyIdList is not null and  @CompanyIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.companyid in (' + @CompanyIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Need Call Back List
	if @NeedCallBackList is not null and  @NeedCallBackList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsNeedCallBack in (' + @NeedCallBackList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Email Subscription
	if @EmailSubscriptionList is not null and  @EmailSubscriptionList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsEmailSubscription in (' + @EmailSubscriptionList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Discussion Topic
	if @DiscussionTopic is not null and @DiscussionTopic != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.DiscussionTopic like ''' + @DiscussionTopic  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Action Step
	if @ActionStep is not null and @ActionStep != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ActionStep like ''' + @ActionStep  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Contact Date
	if @LastContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LAST_CONTACT_DATE = ''' + Convert(Varchar,@LastContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Next Contact Date
	if @NextContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.NEXT_CONTACT_DATE = ''' + Convert(Varchar,@NextContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Course Training Date
	if @CourseTrngDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CourseTrainingDate = ''' + Convert(Varchar,@CourseTrngDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Birthday
	if @BirthDayDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Birthday = ''' + Convert(Varchar,@BirthDayDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Anniversary
	if @AnniversaryDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Anniversary = ''' + Convert(Varchar,@AnniversaryDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- Company Years
	if @CompanyYears is not null and @CompanyYears != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CompanyYears like ''' + @CompanyYears  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Boss Name
	if @BossName is not null and @BossName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.BossName like ''' + @BossName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- End of conditons so we need to close with bracket
	SET @SQLString = @SQLString + ')' ;
	
	SET @SQLString = @SQLString + ' AND ct.CreatedBy =' + @UserID ;
	
	-- Order By
	SET @SQLString = @SQLString + ' ORDER BY cp.COMPANYNAME ' ;
    -- Now Print/Execute the Statement
    --Print @SQLString
    EXEC(@SQLString);
	
		
	
	RETURN
	
		
	/*select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID 
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack  
	where Upper(ct.CreatedBy) = Upper(@UserID)
	Order by cp.COMPANYNAME
	*/
	
	
	RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByFrIDSearch]    Script Date: 09/03/2012 12:10:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetAllContactsByFrIDSearch]
	
	(
	    @FranchiseeID varchar(50),
	    @LastName varchar(50),
		@FirstName varchar(50),
		@Phone varchar(50),
		@Email varchar(50),
		@IsNewApptIdList varchar(50),
		@ApptSourceIdList varchar(150),
		@IsRegForTrainingList varchar(50),
		@CourseTypeIdList varchar(50),
		@CompanyIdList varchar(50),
		@NeedCallBackList varchar(50),
		@EmailSubscriptionList varchar(50),
		@DiscussionTopic varchar(50),
		@ActionStep varchar(50),
		@LastContactDate datetime,
		@NextContactDate datetime,
		@CourseTrngDate datetime,
		@BirthDayDate datetime,
		@AnniversaryDate datetime,
		@CompanyYears varchar(50),
		@BossName varchar(50) 
	)
	
AS
	
	
	if @LastContactDate < '2/1/1755'
	 Begin
		 Set @LastContactDate = null
	 End
	 
	if @NextContactDate < '2/1/1755'
	 Begin
		 Set @NextContactDate = null
	 End 
	
	if @CourseTrngDate < '2/1/1755'
	 Begin
		 Set @CourseTrngDate = null
	 End
	
	if @BirthDayDate < '2/1/1755'
	 Begin
		 Set @BirthDayDate = null
	 End
	 
	 if @AnniversaryDate < '2/1/1755'
	 Begin
		 Set @AnniversaryDate = null
	 End
	 
	 DECLARE @SQLString VARCHAR(7500);
	 Declare @PrevConditionExist varchar(10);
	 Set @PrevConditionExist = 'No';
	 
	 -- Base SQL string stetement
	Set @SQLString = 'Select 
	ct.lastname + '','' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack   
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join   Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack
	where ct.companyid in (Select CompaniesId from tbl_Companies where FranchiseeId = (' + @FranchiseeID + '))'  + ' AND ('
	
	-- Last Name
	if @LastName is not null and @LastName != ''
	Begin
		SET @SQLString = @SQLString + 'ct.lastname like ''' + @LastName  + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- First Name
	if @FirstName is not null and @FirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.FirstName like ''' + @FirstName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Phone
	if @Phone is not null and @Phone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Phone like ''' + @Phone  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Email
	if @Email is not null and @Email != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Email like ''' + @Email  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Is New Appt List
	if @IsNewApptIdList is not null and  @IsNewApptIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsNewAppointment in (' + @IsNewApptIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Appt Source Id List
	if @ApptSourceIdList is not null and  @ApptSourceIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ApptSourceId in (' + @ApptSourceIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Is Reg For Training List
	if @IsRegForTrainingList is not null and  @IsRegForTrainingList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsRegisteredForTraining in (' + @IsRegForTrainingList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Course Type
	if @CourseTypeIdList is not null and  @CourseTypeIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CourseId in (' + @CourseTypeIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Company ID
	if @CompanyIdList is not null and  @CompanyIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.companyid in (' + @CompanyIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Need Call Back List
	if @NeedCallBackList is not null and  @NeedCallBackList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsNeedCallBack in (' + @NeedCallBackList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Email Subscription
	if @EmailSubscriptionList is not null and  @EmailSubscriptionList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsEmailSubscription in (' + @EmailSubscriptionList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Discussion Topic
	if @DiscussionTopic is not null and @DiscussionTopic != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.DiscussionTopic like ''' + @DiscussionTopic  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Action Step
	if @ActionStep is not null and @ActionStep != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ActionStep like ''' + @ActionStep  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Contact Date
	if @LastContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LAST_CONTACT_DATE = ''' + Convert(Varchar,@LastContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Next Contact Date
	if @NextContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.NEXT_CONTACT_DATE = ''' + Convert(Varchar,@NextContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Course Training Date
	if @CourseTrngDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CourseTrainingDate = ''' + Convert(Varchar,@CourseTrngDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Birthday
	if @BirthDayDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Birthday = ''' + Convert(Varchar,@BirthDayDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Anniversary
	if @AnniversaryDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Anniversary = ''' + Convert(Varchar,@AnniversaryDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- Company Years
	if @CompanyYears is not null and @CompanyYears != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CompanyYears like ''' + @CompanyYears  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Boss Name
	if @BossName is not null and @BossName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.BossName like ''' + @BossName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- End of conditons so we need to close with bracket
	SET @SQLString = @SQLString + ')' ;
	-- Order By
	SET @SQLString = @SQLString + ' ORDER BY cp.COMPANYNAME ' ;
    -- Now Print/Execute the Statement
    --Print @SQLString
    EXEC(@SQLString);
	
		
	
	RETURN
	
	
		
	/*select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID 
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack  
	where ct.companyid in (Select CompaniesId from tbl_Companies where FranchiseeId = @FranchiseeID)
	Order by cp.COMPANYNAME
	*/
	
	
	RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCoachIDSearch]    Script Date: 09/03/2012 12:10:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetAllContactsByCoachIDSearch]
	
	(
	    @CoachID varchar(50), 
	    @LastName varchar(50),
		@FirstName varchar(50),
		@Phone varchar(50),
		@Email varchar(50),
		@IsNewApptIdList varchar(50),
		@ApptSourceIdList varchar(150),
		@IsRegForTrainingList varchar(50),
		@CourseTypeIdList varchar(50),
		@CompanyIdList varchar(50),
		@NeedCallBackList varchar(50),
		@EmailSubscriptionList varchar(50),
		@DiscussionTopic varchar(50),
		@ActionStep varchar(50),
		@LastContactDate datetime,
		@NextContactDate datetime,
		@CourseTrngDate datetime,
		@BirthDayDate datetime,
		@AnniversaryDate datetime,
		@CompanyYears varchar(50),
		@BossName varchar(50)
	)
	
AS
	if @LastContactDate < '2/1/1755'
	 Begin
		 Set @LastContactDate = null
	 End
	 
	if @NextContactDate < '2/1/1755'
	 Begin
		 Set @NextContactDate = null
	 End 
	
	if @CourseTrngDate < '2/1/1755'
	 Begin
		 Set @CourseTrngDate = null
	 End
	
	if @BirthDayDate < '2/1/1755'
	 Begin
		 Set @BirthDayDate = null
	 End
	 
	 if @AnniversaryDate < '2/1/1755'
	 Begin
		 Set @AnniversaryDate = null
	 End
	 
	 DECLARE @SQLString VARCHAR(7500);
	 Declare @PrevConditionExist varchar(10);
	 Set @PrevConditionExist = 'No';
	 
	 -- Base SQL string stetement
	Set @SQLString = 'Select 
	ct.lastname + '','' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack   
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join   Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack
	where 
	ct.companyid in (Select CompaniesId from tbl_Companies where FranchiseeId in (Select id from Tbl_Franchisee  where CoachID = (' + @CoachId + ')))'  + ' AND ('
	
	-- Last Name
	if @LastName is not null and @LastName != ''
	Begin
		SET @SQLString = @SQLString + 'ct.lastname like ''' + @LastName  + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- First Name
	if @FirstName is not null and @FirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.FirstName like ''' + @FirstName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Phone
	if @Phone is not null and @Phone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Phone like ''' + @Phone  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Email
	if @Email is not null and @Email != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Email like ''' + @Email  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Is New Appt List
	if @IsNewApptIdList is not null and  @IsNewApptIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsNewAppointment in (' + @IsNewApptIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Appt Source Id List
	if @ApptSourceIdList is not null and  @ApptSourceIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ApptSourceId in (' + @ApptSourceIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Is Reg For Training List
	if @IsRegForTrainingList is not null and  @IsRegForTrainingList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsRegisteredForTraining in (' + @IsRegForTrainingList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Course Type
	if @CourseTypeIdList is not null and  @CourseTypeIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CourseId in (' + @CourseTypeIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Company ID
	if @CompanyIdList is not null and  @CompanyIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.companyid in (' + @CompanyIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Need Call Back List
	if @NeedCallBackList is not null and  @NeedCallBackList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsNeedCallBack in (' + @NeedCallBackList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Email Subscription
	if @EmailSubscriptionList is not null and  @EmailSubscriptionList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsEmailSubscription in (' + @EmailSubscriptionList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Discussion Topic
	if @DiscussionTopic is not null and @DiscussionTopic != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.DiscussionTopic like ''' + @DiscussionTopic  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Action Step
	if @ActionStep is not null and @ActionStep != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ActionStep like ''' + @ActionStep  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Contact Date
	if @LastContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LAST_CONTACT_DATE = ''' + Convert(Varchar,@LastContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Next Contact Date
	if @NextContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.NEXT_CONTACT_DATE = ''' + Convert(Varchar,@NextContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Course Training Date
	if @CourseTrngDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CourseTrainingDate = ''' + Convert(Varchar,@CourseTrngDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Birthday
	if @BirthDayDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Birthday = ''' + Convert(Varchar,@BirthDayDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Anniversary
	if @AnniversaryDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Anniversary = ''' + Convert(Varchar,@AnniversaryDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- Company Years
	if @CompanyYears is not null and @CompanyYears != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CompanyYears like ''' + @CompanyYears  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Boss Name
	if @BossName is not null and @BossName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.BossName like ''' + @BossName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- End of conditons so we need to close with bracket
	SET @SQLString = @SQLString + ')' ;
	-- Order By
	SET @SQLString = @SQLString + ' ORDER BY cp.COMPANYNAME ' ;
    -- Now Print/Execute the Statement
    --Print @SQLString
    EXEC(@SQLString);
		
	
	RETURN
	
		
	/*select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID 
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack
	where ct.companyid in (Select CompaniesId from tbl_Companies where FranchiseeId in (Select id from Tbl_Franchisee  where CoachID = @CoachId))
	Order by cp.COMPANYNAME
	*/
	
	RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsSearch]    Script Date: 09/03/2012 12:10:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetAllContactsSearch]
	
	(
	    @LastName varchar(50),
		@FirstName varchar(50),
		@Phone varchar(50),
		@Email varchar(50),
		@IsNewApptIdList varchar(50),
		@ApptSourceIdList varchar(150),
		@IsRegForTrainingList varchar(50),
		@CourseTypeIdList varchar(50),
		@CompanyIdList varchar(50),
		@NeedCallBackList varchar(50),
		@EmailSubscriptionList varchar(50),
		@DiscussionTopic varchar(50),
		@ActionStep varchar(50),
		@LastContactDate datetime,
		@NextContactDate datetime,
		@CourseTrngDate datetime,
		@BirthDayDate datetime,
		@AnniversaryDate datetime,
		@CompanyYears varchar(50),
		@BossName varchar(50)
	
	)
	
AS
		
	if @LastContactDate < '2/1/1755'
	 Begin
		 Set @LastContactDate = null
	 End
	 
	if @NextContactDate < '2/1/1755'
	 Begin
		 Set @NextContactDate = null
	 End 
	
	if @CourseTrngDate < '2/1/1755'
	 Begin
		 Set @CourseTrngDate = null
	 End
	
	if @BirthDayDate < '2/1/1755'
	 Begin
		 Set @BirthDayDate = null
	 End
	 
	 if @AnniversaryDate < '2/1/1755'
	 Begin
		 Set @AnniversaryDate = null
	 End
	 
	 DECLARE @SQLString VARCHAR(7500);
	 Declare @PrevConditionExist varchar(10);
	 Set @PrevConditionExist = 'No';
	 
	 -- Base SQL string stetement
	Set @SQLString = 'Select 
	ct.lastname + '','' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack   
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join   Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack
	where ('
	-- Last Name
	if @LastName is not null and @LastName != ''
	Begin
		SET @SQLString = @SQLString + 'ct.lastname like ''' + @LastName  + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- First Name
	if @FirstName is not null and @FirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.FirstName like ''' + @FirstName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Phone
	if @Phone is not null and @Phone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Phone like ''' + @Phone  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Email
	if @Email is not null and @Email != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Email like ''' + @Email  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Is New Appt List
	if @IsNewApptIdList is not null and  @IsNewApptIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsNewAppointment in (' + @IsNewApptIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Appt Source Id List
	if @ApptSourceIdList is not null and  @ApptSourceIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ApptSourceId in (' + @ApptSourceIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Is Reg For Training List
	if @IsRegForTrainingList is not null and  @IsRegForTrainingList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsRegisteredForTraining in (' + @IsRegForTrainingList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Course Type
	if @CourseTypeIdList is not null and  @CourseTypeIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CourseId in (' + @CourseTypeIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Company ID
	if @CompanyIdList is not null and  @CompanyIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.companyid in (' + @CompanyIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Need Call Back List
	if @NeedCallBackList is not null and  @NeedCallBackList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsNeedCallBack in (' + @NeedCallBackList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Email Subscription
	if @EmailSubscriptionList is not null and  @EmailSubscriptionList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsEmailSubscription in (' + @EmailSubscriptionList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Discussion Topic
	if @DiscussionTopic is not null and @DiscussionTopic != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.DiscussionTopic like ''' + @DiscussionTopic  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Action Step
	if @ActionStep is not null and @ActionStep != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ActionStep like ''' + @ActionStep  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Contact Date
	if @LastContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LAST_CONTACT_DATE = ''' + Convert(Varchar,@LastContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Next Contact Date
	if @NextContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.NEXT_CONTACT_DATE = ''' + Convert(Varchar,@NextContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Course Training Date
	if @CourseTrngDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CourseTrainingDate = ''' + Convert(Varchar,@CourseTrngDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Birthday
	if @BirthDayDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Birthday = ''' + Convert(Varchar,@BirthDayDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Anniversary
	if @AnniversaryDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Anniversary = ''' + Convert(Varchar,@AnniversaryDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- Company Years
	if @CompanyYears is not null and @CompanyYears != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CompanyYears like ''' + @CompanyYears  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Boss Name
	if @BossName is not null and @BossName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.BossName like ''' + @BossName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- End of conditons so we need to close with bracket
	SET @SQLString = @SQLString + ')' ;
	-- Order By
	SET @SQLString = @SQLString + ' ORDER BY cp.COMPANYNAME ' ;
    -- Now Print/Execute the Statement
    --Print @SQLString
    EXEC(@SQLString);
	
		
	
	RETURN
	
	/*Select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack   
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join   Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack    
	Order by cp.COMPANYNAME*/
	
	
	/* SET NOCOUNT ON */
	


GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByFrIdSearch]    Script Date: 09/03/2012 12:10:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_GetAllCompaniesByFrIdSearch]
	
	(
		@FranchiseeId varchar(50),
		@CompanyName varchar(150),
		@RepLastName varchar(50),
		@RepFirstName varchar(50),
		@IndustryIdList varchar(50),
		@TotalCompValue varchar(50),
		@IsNewCompanyIdList varchar(50),
		@Address varchar(150),
		@Zip varchar(50),
		@City varchar(50),
		@State varchar(50),
		@POCLastName varchar(50),
		@POCFirstName varchar(50),
		@POCPhone varchar(50),
		@DiscussionTopic varchar(50),
		@ActionStep varchar(50),
		@LastContactDate datetime,
		@NextContactDate datetime,
		@CreationDate datetime
	)
	
AS
	if @LastContactDate < '2/1/1755'
	 Begin
		 Set @LastContactDate = null
	 End	
	
	if @NextContactDate < '2/1/1755'
	 Begin
		 Set @NextContactDate = null
	 End
	 
	 if @CreationDate < '2/1/1755'
	 Begin
		 Set @CreationDate = null
	 End
	
	DECLARE @SQLString VARCHAR(7500);
	Declare @PrevConditionExist varchar(10);
	Set @PrevConditionExist = 'No';
	-- Base SQL string stetement
	Set @SQLString = 'SELECT 
	cp.COMPANIESID,
	cp.COMPANYNAME,
	cp.RepLastName+'',''+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	-- Extra Columns for Export to Excel
	f.Name as FranchiseeName ,
	yno.Description as NewCompanyDesp,
	cp.Address,	cp.Zip, 
	cp.CITY,cp.STATE,
	cp.POCLastName+'',''+ cp.POCFirstName as POCFullName,
	cp.POCPhone,cp.DiscussionTopic,
	cp.ActionStep,cp.LASTCONTACT_DATE,
	cp.NEXTCONTACT_DATE,cp.CreationDate,
	ch.RegionId,
	rg.Name as RegionName
	FROM TBL_COMPANIES cp
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	left join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany 
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	left join TBL_COACH ch on ch.ID = f.CoachID
	left join TBL_REGION rg on ch.RegionID = rg.ID  
	where ('
	-- Add based on the selection by the user - at least one selection will be there
	if @CompanyName is not null and @CompanyName != ''
	Begin
		SET @SQLString = @SQLString + 'cp.COMPANYNAME like ''' + @CompanyName  + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Rep Last Name
	if @RepLastName is not null and @RepLastName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.RepLastName like ''' + @RepLastName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Rep First Name
	if @RepFirstName is not null and @RepFirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.RepFirstName like ''' + @RepFirstName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Industry Id
	if @IndustryIdList is not null and  @IndustryIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.IndustryId in (' + @IndustryIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Total Company Value
	if @TotalCompValue is not null and @TotalCompValue != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'dbo.GetTotalCompanyValue(COMPANIESID) = (' + @TotalCompValue + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for IsNewComapany ?
	if @IsNewCompanyIdList is not null and @IsNewCompanyIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.IsNewCompany in (' + @IsNewCompanyIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Address
	if @Address is not null and @Address != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Address like ''' + @Address  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Zip
	if @Zip is not null and @Zip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Zip like ''' + @Zip  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For City
	if @City is not null and @City != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.City like ''' + @City  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For State
	if @State is not null and @State != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.State like ''' + @State  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Last Name
	if @POCLastName is not null and @POCLastName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCLastName like ''' + @POCLastName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC First Name
	if @POCFirstName is not null and @POCFirstName  != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCFirstName like ''' + @POCFirstName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Phone
	if @POCPhone is not null and @POCPhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCPhone like ''' + @POCPhone  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Discussion Topic
	if @DiscussionTopic is not null and @DiscussionTopic != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.DiscussionTopic like ''' + @DiscussionTopic  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Action Step
	if @ActionStep is not null and @ActionStep != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.ActionStep like ''' + @ActionStep  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Contact Date
	if @LastContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.LASTCONTACT_DATE = ''' + Convert(Varchar,@LastContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Next Contact Date
	if @NextContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.NEXTCONTACT_DATE = ''' + Convert(Varchar,@NextContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Creation Date
	if @CreationDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.CreationDate = ''' + Convert(Varchar,@CreationDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- End of conditons so we need to close with bracket
	SET @SQLString = @SQLString + ')' ;
	
	SET @SQLString = @SQLString + ' AND cp.FranchiseeId =' + @FranchiseeId ;
	-- Order By
	SET @SQLString = @SQLString + ' ORDER BY cp.COMPANYNAME ' ;
    -- Now Print/Execute the Statement
    --Print @SQLString
    EXEC(@SQLString);
	
		
	
	RETURN
	
	/*SELECT 
	cp.COMPANIESID,
	cp.COMPANYNAME,
	cp.RepLastName+', '+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	-- Extra Columns for Export to Excel
	f.Name as FranchiseeName ,
	yno.Description as NewCompanyDesp,
	cp.Address,	cp.Zip, 
	cp.CITY,cp.STATE,
	cp.POCLastName+', '+ cp.POCFirstName as POCFullName,
	cp.POCPhone,cp.DiscussionTopic,
	cp.ActionStep,cp.LASTCONTACT_DATE,
	cp.NEXTCONTACT_DATE,cp.CreationDate
	FROM TBL_COMPANIES cp
	join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany  
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	where cp.FranchiseeId = @FranchiseeId 
	ORDER BY COMPANYNAME
	
	
	
	
	RETURN
	*/


GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByCoachIdSearch]    Script Date: 09/03/2012 12:10:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_GetAllCompaniesByCoachIdSearch]
	
	(
		@CoachId varchar(50),
		@CompanyName varchar(150),
		@RepLastName varchar(50),
		@RepFirstName varchar(50),
		@IndustryIdList varchar(50),
		@TotalCompValue varchar(50),
		@IsNewCompanyIdList varchar(50),
		@Address varchar(150),
		@Zip varchar(50),
		@City varchar(50),
		@State varchar(50),
		@POCLastName varchar(50),
		@POCFirstName varchar(50),
		@POCPhone varchar(50),
		@DiscussionTopic varchar(50),
		@ActionStep varchar(50),
		@LastContactDate datetime,
		@NextContactDate datetime,
		@CreationDate datetime
	)
	
AS

    if @LastContactDate < '2/1/1755'
	 Begin
		 Set @LastContactDate = null
	 End	
	
	if @NextContactDate < '2/1/1755'
	 Begin
		 Set @NextContactDate = null
	 End
	 
	 if @CreationDate < '2/1/1755'
	 Begin
		 Set @CreationDate = null
	 End
    
    DECLARE @SQLString VARCHAR(7500);
	Declare @PrevConditionExist varchar(10);
	Set @PrevConditionExist = 'No';
	-- Base SQL string stetement
	Set @SQLString = 'SELECT 
	cp.COMPANIESID,
	cp.COMPANYNAME,
	cp.RepLastName+'',''+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	-- Extra Columns for Export to Excel
	f.Name as FranchiseeName ,
	yno.Description as NewCompanyDesp,
	cp.Address,	cp.Zip, 
	cp.CITY,cp.STATE,
	cp.POCLastName+'',''+ cp.POCFirstName as POCFullName,
	cp.POCPhone,cp.DiscussionTopic,
	cp.ActionStep,cp.LASTCONTACT_DATE,
	cp.NEXTCONTACT_DATE,cp.CreationDate,
	ch.RegionId,
	rg.Name as RegionName 
	FROM TBL_COMPANIES cp
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	left join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany 
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	left join TBL_COACH ch on ch.ID = f.CoachID
	left join TBL_REGION rg on ch.RegionID = rg.ID  
	where cp.FranchiseeId in (Select id from Tbl_Franchisee  where CoachID = (' + @CoachId + '))'  + ' AND ('
	-- Add based on the selection by the user - at least one selection will be there
	if @CompanyName is not null and @CompanyName != ''
	Begin
		SET @SQLString = @SQLString + 'cp.COMPANYNAME like ''' + @CompanyName  + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Rep Last Name
	if @RepLastName is not null and @RepLastName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.RepLastName like ''' + @RepLastName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Rep First Name
	if @RepFirstName is not null and @RepFirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.RepFirstName like ''' + @RepFirstName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Industry Id
	if @IndustryIdList is not null and  @IndustryIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.IndustryId in (' + @IndustryIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Total Company Value
	if @TotalCompValue is not null and @TotalCompValue != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'dbo.GetTotalCompanyValue(COMPANIESID) = (' + @TotalCompValue + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for IsNewComapany ?
	if @IsNewCompanyIdList is not null and @IsNewCompanyIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.IsNewCompany in (' + @IsNewCompanyIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Address
	if @Address is not null and @Address != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Address like ''' + @Address  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Zip
	if @Zip is not null and @Zip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Zip like ''' + @Zip  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For City
	if @City is not null and @City != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.City like ''' + @City  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For State
	if @State is not null and @State != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.State like ''' + @State  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Last Name
	if @POCLastName is not null and @POCLastName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCLastName like ''' + @POCLastName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC First Name
	if @POCFirstName is not null and @POCFirstName  != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCFirstName like ''' + @POCFirstName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Phone
	if @POCPhone is not null and @POCPhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCPhone like ''' + @POCPhone  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Discussion Topic
	if @DiscussionTopic is not null and @DiscussionTopic != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.DiscussionTopic like ''' + @DiscussionTopic  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Action Step
	if @ActionStep is not null and @ActionStep != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.ActionStep like ''' + @ActionStep  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Contact Date
	if @LastContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.LASTCONTACT_DATE = ''' + Convert(Varchar,@LastContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Next Contact Date
	if @NextContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.NEXTCONTACT_DATE = ''' + Convert(Varchar,@NextContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Creation Date
	if @CreationDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.CreationDate = ''' + Convert(Varchar,@CreationDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- End of conditons so we need to close with bracket
	SET @SQLString = @SQLString + ')' ;
	-- Order By
	SET @SQLString = @SQLString + ' ORDER BY cp.COMPANYNAME ' ;
    -- Now Print/Execute the Statement
    --Print @SQLString
    EXEC(@SQLString);
	
		
	
	RETURN 
    
		
	/*SELECT cp.COMPANIESID,cp.COMPANYNAME,
	cp.RepLastName+', '+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	-- Extra Columns for Export to Excel
	f.Name as FranchiseeName ,
	yno.Description as NewCompanyDesp,
	cp.Address,	cp.Zip, 
	cp.CITY,cp.STATE,
	cp.POCLastName+', '+ cp.POCFirstName as POCFullName,
	cp.POCPhone,cp.DiscussionTopic,
	cp.ActionStep,cp.LASTCONTACT_DATE,
	cp.NEXTCONTACT_DATE,cp.CreationDate
	FROM TBL_COMPANIES cp 
	join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany 
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	where cp.FranchiseeId in (Select id from Tbl_Franchisee  where CoachID = @CoachId) 
	ORDER BY COMPANYNAME
		
	RETURN*/


GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesSearch]    Script Date: 09/03/2012 12:10:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetAllCompaniesSearch]
	
	(
		@CompanyName varchar(150),
		@RepLastName varchar(50),
		@RepFirstName varchar(50),
		@IndustryIdList varchar(50),
		@TotalCompValue varchar(50),
		@IsNewCompanyIdList varchar(50),
		@Address varchar(150),
		@Zip varchar(50),
		@City varchar(50),
		@State varchar(50),
		@POCLastName varchar(50),
		@POCFirstName varchar(50),
		@POCPhone varchar(50),
		@DiscussionTopic varchar(50),
		@ActionStep varchar(50),
		@LastContactDate datetime,
		@NextContactDate datetime,
		@CreationDate datetime
				
	)
	
AS
	
	if @LastContactDate < '2/1/1755'
	 Begin
		 Set @LastContactDate = null
	 End	
	
	if @NextContactDate < '2/1/1755'
	 Begin
		 Set @NextContactDate = null
	 End
	 
	 if @CreationDate < '2/1/1755'
	 Begin
		 Set @CreationDate = null
	 End
	
	DECLARE @SQLString VARCHAR(7500);
	Declare @PrevConditionExist varchar(10);
	Set @PrevConditionExist = 'No';
	-- Base SQL string stetement
	Set @SQLString = 'SELECT 
	cp.COMPANIESID,
	cp.COMPANYNAME,
	cp.RepLastName+'',''+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	-- Extra Columns for Export to Excel
	f.Name as FranchiseeName ,
	yno.Description as NewCompanyDesp,
	cp.Address,	cp.Zip, 
	cp.CITY,cp.STATE,
	cp.POCLastName+'',''+ cp.POCFirstName as POCFullName,
	cp.POCPhone,cp.DiscussionTopic,
	cp.ActionStep,cp.LASTCONTACT_DATE,
	cp.NEXTCONTACT_DATE,cp.CreationDate,
	ch.RegionId,
	rg.Name as RegionName
	FROM TBL_COMPANIES cp
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	left join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany 
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	left join TBL_COACH ch on ch.ID = f.CoachID
	left join TBL_REGION rg on ch.RegionID = rg.ID  
	where ('
	-- Add based on the selection by the user - at least one selection will be there
	if @CompanyName is not null and @CompanyName != ''
	Begin
		SET @SQLString = @SQLString + 'cp.COMPANYNAME like ''' + @CompanyName  + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Rep Last Name
	if @RepLastName is not null and @RepLastName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.RepLastName like ''' + @RepLastName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Rep First Name
	if @RepFirstName is not null and @RepFirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.RepFirstName like ''' + @RepFirstName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Industry Id
	if @IndustryIdList is not null and  @IndustryIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.IndustryId in (' + @IndustryIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Total Company Value
	if @TotalCompValue is not null and @TotalCompValue != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'dbo.GetTotalCompanyValue(COMPANIESID) = (' + @TotalCompValue + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for IsNewComapany ?
	if @IsNewCompanyIdList is not null and @IsNewCompanyIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.IsNewCompany in (' + @IsNewCompanyIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Address
	if @Address is not null and @Address != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Address like ''' + @Address  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Zip
	if @Zip is not null and @Zip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Zip like ''' + @Zip  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For City
	if @City is not null and @City != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.City like ''' + @City  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For State
	if @State is not null and @State != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.State like ''' + @State  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Last Name
	if @POCLastName is not null and @POCLastName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCLastName like ''' + @POCLastName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC First Name
	if @POCFirstName is not null and @POCFirstName  != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCFirstName like ''' + @POCFirstName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Phone
	if @POCPhone is not null and @POCPhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCPhone like ''' + @POCPhone  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Discussion Topic
	if @DiscussionTopic is not null and @DiscussionTopic != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.DiscussionTopic like ''' + @DiscussionTopic  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Action Step
	if @ActionStep is not null and @ActionStep != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.ActionStep like ''' + @ActionStep  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Contact Date
	if @LastContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.LASTCONTACT_DATE = ''' + Convert(Varchar,@LastContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Next Contact Date
	if @NextContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.NEXTCONTACT_DATE = ''' + Convert(Varchar,@NextContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Creation Date
	if @CreationDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.CreationDate = ''' + Convert(Varchar,@CreationDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- End of conditons so we need to close with bracket
	SET @SQLString = @SQLString + ')' ;
	-- Order By
	SET @SQLString = @SQLString + ' ORDER BY cp.COMPANYNAME ' ;
    -- Now Print/Execute the Statement
    --Print @SQLString
    EXEC(@SQLString);
	
		
	
	RETURN
	
	/* Testing Code */

/*
    DECLARE @SQLString VARCHAR(7500);
	Declare @PrevConditionExist varchar(10);
	Set @PrevConditionExist = 'No';
	
	Declare @CompanyName varchar(50);
	Declare @RepLastName varchar(50);
	Declare @RepFirstName varchar(50);
	Declare @POCLastName varchar(50);
	Declare @POCFirstName varchar(50);
	Declare @City varchar(50);
	Declare @State varchar(50);
	Declare @Zip varchar(50);
	Declare @IndustryIdList varchar(50);
	Declare @TotalCompValue varchar(50);
	Declare @IsNewCompanyIdList varchar(50);
	Declare @Address varchar(50);
	Declare @POCPhone varchar(50);
	Declare @DiscussionTopic varchar(50);
	Declare @ActionStep varchar(50);
	Declare @LastContactDate datetime;
	
	Set @CompanyName = null;
	Set @RepLastName = null;
	Set @RepFirstName = null;
	Set @POCLastName = null;
	Set @POCFirstName = null;
	Set @City = null;
	Set @State = null;
	Set @Zip = null;
	Set @IndustryIdList = '5,3';
	Set @TotalCompValue = '1234';
	Set @IsNewCompanyIdList = null;
	Set @Address = null;
	Set @POCPhone = null;
	Set @DiscussionTopic = null;
	Set @ActionStep = null;
	Set @LastContactDate = '8/12/2012';
	
	-- Base SQL string stetement
	Set @SQLString = 'SELECT 
	cp.COMPANIESID,
	cp.COMPANYNAME,
	cp.RepLastName+'',''+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	-- Extra Columns for Export to Excel
	f.Name as FranchiseeName ,
	yno.Description as NewCompanyDesp,
	cp.Address,	cp.Zip, 
	cp.CITY,cp.STATE,
	cp.POCLastName+'',''+ cp.POCFirstName as POCFullName,
	cp.POCPhone,cp.DiscussionTopic,
	cp.ActionStep,cp.LASTCONTACT_DATE,
	cp.NEXTCONTACT_DATE,cp.CreationDate
	FROM TBL_COMPANIES cp
	join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany 
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	where ('
	-- Add based on the selection by the user - at least one selection will be there
	if @CompanyName is not null
	Begin
		SET @SQLString = @SQLString + 'cp.COMPANYNAME like ''' + @CompanyName  + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Rep Last Name
	if @RepLastName is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.RepLastName like ''' + @RepLastName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Rep First Name
	if @RepFirstName is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.RepFirstName like ''' + @RepFirstName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Industry Id
	if @IndustryIdList is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.IndustryId in (' + @IndustryIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Total Company Value
	if @TotalCompValue is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'dbo.GetTotalCompanyValue(COMPANIESID) = (' + @TotalCompValue + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for IsNewComapany ?
	if @IsNewCompanyIdList is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.IsNewCompany in (' + @IsNewCompanyIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Address
	if @Address is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Address like ''' + @Address  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Zip
	if @Zip is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Zip like ''' + @Zip  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For City
	if @City is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.City like ''' + @City  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For State
	if @State is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.State like ''' + @State  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Last Name
	if @POCLastName is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCLastName like ''' + @POCLastName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC First Name
	if @POCFirstName is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCFirstName like ''' + @POCFirstName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Phone
	if @POCPhone is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCPhone like ''' + @POCPhone  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Discussion Topic
	if @DiscussionTopic is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.DiscussionTopic like ''' + @DiscussionTopic  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Action Step
	if @ActionStep is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.ActionStep like ''' + @ActionStep  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Last Contact Date
	if @LastContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.LASTCONTACT_DATE = ''' + Convert(Varchar,@LastContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	
	-- End of conditons so we need to close with bracket
	SET @SQLString = @SQLString + ')' ;
	-- Order By
	SET @SQLString = @SQLString + ' ORDER BY cp.COMPANYNAME ' ;
    -- Now Print/Execute the Statement
    Print @SQLString
    --EXEC(@SQLString);
	
		
	
	RETURN
	*/
GO

/****** Object:  StoredProcedure [dbo].[sp_GetCallList]    Script Date: 09/03/2012 12:10:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[sp_GetCallList]

	 (

	 @Role varchar(50),

	 @UserId varchar(50),

	 @FranchiseeId int,

	 @RegionId int
 
	)

AS

		

	 if (@Role = 'Corporate' or @Role = 'SiteAdmin')

	 Begin

		 Select ct.lastname + ',' + ct.FirstName as FullName, ct.phone, ct.Email, ct.contactsid 	,cp.COMPANYNAME , ct.LAST_CONTACT_DATE  

		 from tbl_contacts ct 

		 join tbl_companies cp on ct.companyid = cp.COMPANIESID
 
		where ct.LAST_CONTACT_DATE is not null and

		 -- Last contact date is within 30 days period
 
		ct.IsNeedCallBack = 1 and ct.LAST_CONTACT_DATE <= (GETDATE()-30)

		 Order by cp.COMPANYNAME
 
	End

    

    if (@Role = 'Coach')

	 Begin

	    Select ct.lastname + ',' + ct.FirstName as FullName, ct.phone, ct.Email, ct.contactsid 	,cp.COMPANYNAME , ct.LAST_CONTACT_DATE  

		 from tbl_contacts ct join tbl_companies cp on ct.companyid = cp.COMPANIESID

		 join TBL_FRANCHISEE f on cp.FranchiseeId = f.ID  join TBL_COACH ch on f.CoachID = ch.ID

		 where ct.LAST_CONTACT_DATE is not null and ch.RegionID = @RegionId and

		 -- Last contact date is within 30 days period

		 ct.IsNeedCallBack = 1 and ct.LAST_CONTACT_DATE <= (GETDATE()-30)

		 Order by cp.COMPANYNAME
 
	End

    

    if (@Role = 'FranchiseeOwner')

    Begin

        Select ct.lastname + ',' + ct.FirstName as FullName, ct.phone, ct.Email, ct.contactsid 	,cp.COMPANYNAME , ct.LAST_CONTACT_DATE  

		 from tbl_contacts ct join tbl_companies cp on ct.companyid = cp.COMPANIESID

		 join TBL_FRANCHISEE f on cp.FranchiseeId = f.ID

		 where ct.LAST_CONTACT_DATE is not null and f.ID = @FranchiseeId and

		 -- Last contact date is within 30 days period

		 ct.IsNeedCallBack = 1 and ct.LAST_CONTACT_DATE <= (GETDATE()-30)

		 Order by cp.COMPANYNAME
 
    End

    

    if (@Role = 'FranchiseeUser')

    Begin

        Select ct.lastname + ',' + ct.FirstName as FullName, ct.phone, ct.Email, ct.contactsid 	,cp.COMPANYNAME , ct.LAST_CONTACT_DATE  

		 from tbl_contacts ct join tbl_companies cp on ct.companyid = cp.COMPANIESID

		 where ct.LAST_CONTACT_DATE is not null and ct.CreatedBy = @UserId and

		 -- Last contact date is within 30 days period

		 ct.IsNeedCallBack = 1 and ct.LAST_CONTACT_DATE <= (GETDATE()-30)

		 Order by cp.COMPANYNAME

    

    End

    

	 RETURN
 

GO

/****** Object:  StoredProcedure [dbo].[sp_GetBlastEmailGroupsByRole]    Script Date: 09/03/2012 12:10:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[sp_GetBlastEmailGroupsByRole]

	 (

	 @Role varchar(50)

	 )

AS

		

	 if @Role = 'FranchiseeUser'
 
	Begin

	     Select Id, BlastGroupName From TBL_BlastEmailGroup where ForFrUser = 1 and IsActive = 1
 
	End

	 if @Role = 'FranchiseeOwner'

	 Begin
 
		Select Id, BlastGroupName From TBL_BlastEmailGroup where ForFrOwner = 1 and IsActive = 1

	 End
 
	if @Role = 'Coach'

	 Begin

		 Select Id, BlastGroupName From TBL_BlastEmailGroup where ForCoach = 1 and IsActive = 1

	 End

	 if (@Role = 'Corporate' or @Role = 'SiteAdmin')

	 Begin

		 Select Id, BlastGroupName From TBL_BlastEmailGroup where ForCorporate = 1 and IsActive = 1

	 End
 
    




	 RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCoachAddresses]    Script Date: 09/03/2012 12:10:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetAllCoachAddresses]

	 /*

	 (

	 @parameter1 int = 5,

	 @parameter2 datatype OUTPUT

	 )
 
	*/

AS

		

	 Select Email from aspnet_Membership ms 
 
	join tbl_coach ch on ms.UserId = ch.UserId

	 where ch.IsEmailSubscription = 1 ;

 	

	

	/* SET NOCOUNT ON */
 
	RETURN








GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllFranchiseeAddresses]    Script Date: 09/03/2012 12:10:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetAllFranchiseeAddresses]

	

	 (
 
		@RoleName varchar(50)

	 )

	
 
AS

		

	 Select Email from aspnet_Membership ms 

	 join aspnet_UsersInRoles ur 

	 on ms.UserId = ur.UserId 

	 join TBL_FRANCHISEE_USERS fu on ms.UserId = fu.UserID  
 
	where fu.IsEmailSubscription = 1 and ur.RoleId in 

	 (select RoleId  from [SandlerDB].[dbo].[aspnet_Roles] where RoleName = @RoleName)




	

	

	 /* SET NOCOUNT ON */
 
	RETURN








GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsAddresses]    Script Date: 09/03/2012 12:10:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetAllContactsAddresses]

	

	 (

		 @FranchiseeId int

	 )

	
 
AS

		

	 If @FranchiseeId = 0

	 Begin 
 
	SELECT EMAIL FROM [SandlerDB].[dbo].[TBL_CONTACTS] where IsEmailSubscription = 1

    End

		
 
	If @FranchiseeId > 0

	 Begin 

	 SELECT EMAIL FROM [SandlerDB].[dbo].[TBL_CONTACTS] where IsEmailSubscription = 1 and COMPANYID in

	 (Select  COMPANIESID from [SandlerDB].[dbo].TBL_COMPANIES where  FranchiseeId = @FranchiseeId)

    End

	

	

	 /* SET NOCOUNT ON */

	 RETURN
 







GO

/****** Object:  StoredProcedure [dbo].[sp_GetFranchiseeAddresses]    Script Date: 09/03/2012 12:10:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[sp_GetFranchiseeAddresses]

	

	 (

		 @RoleName varchar(50),

		 @FranchiseeId int

	 )
 
	

AS

		

	 Select Email from [SandlerDB].[dbo].aspnet_Membership ms 

	 join [SandlerDB].[dbo].[aspnet_UsersInRoles] ur on ms.UserId = ur.UserId 

	 join [SandlerDB].[dbo].[TBL_Franchisee_Users] fru on ms.UserId = fru.UserId

	 where ur.RoleId in 

	 (select RoleId  from [SandlerDB].[dbo].[aspnet_Roles] where RoleName = @RoleName)
 
	and fru.FranchiseeID = @FranchiseeId 




	

	
 
	/* SET NOCOUNT ON */

	 RETURN








GO

/****** Object:  StoredProcedure [dbo].[sp_GetLoggedInUserAddress]    Script Date: 09/03/2012 12:10:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[sp_GetLoggedInUserAddress]

	

	 (

		 @UserId varchar(100)

	 )

	
 
AS

		

	 Select Email from [SandlerDB].[dbo].aspnet_Membership 

	 where UserId = @UserId




	

	

	 /* SET NOCOUNT ON */
 
	RETURN








GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateSubscriptionInfo]    Script Date: 09/03/2012 12:10:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_UpdateSubscriptionInfo]

	 (

		 @UserId varchar(150), 

		 @Response varchar(50),

		 @Role varchar(50) 

	 )
 
AS

	

	 if @Role = 'Coach'

	 Begin
 
		Update TBL_COACH Set IsEmailSubscription = @Response where UserId = @UserId

	 End
 
	else

	 Begin

	    Update TBL_Franchisee_Users Set IsEmailSubscription = @Response where UserId = @UserId

	 End

	

	

 





	RETURN








GO

/****** Object:  StoredProcedure [dbo].[sp_GetSubscriptionInfo]    Script Date: 09/03/2012 12:10:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetSubscriptionInfo]

	 (

		 @UserId varchar(150),

		 @Role varchar(50) 

		

	 )
 
AS

	

	 if @Role = 'Coach'

	 Begin
 
	Select IsEmailSubscription from Tbl_Coach where UserId = @UserId

	 End

	 else

	 Begin

	 Select IsEmailSubscription from Tbl_Franchisee_Users where UserId = @UserId
 
	End




	 RETURN








GO

/****** Object:  StoredProcedure [dbo].[sp_GetBlastEmailOptions]    Script Date: 09/03/2012 12:10:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[sp_GetBlastEmailOptions]

	 /*

	 (

 	@parameter1 int = 5,

	 @parameter2 datatype OUTPUT

	 )
 
	*/

AS

	 SELECT id, Value as BlastEmailId, Description  FROM TBL_YesNoOptions ORDER BY Description/* SET NOCOUNT ON */

	 RETURN








GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllEvents]    Script Date: 09/03/2012 12:10:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetAllEvents]

	 (

	 @Role varchar(50),

	 @UserId varchar(50),

	 @FranchiseeId int,

	 @RegionId int
 
	)

AS

		

	 if (@Role = 'Corporate' or @Role = 'SiteAdmin')

	 Begin

		 -- full access to all companies and contacts

		 Select NextContact_date as Date, 'Contact due - '+ CompanyName as Description, POCPhone as Phone From TBL_Companies where NextContact_date is not null

	    Union

	    Select Next_Contact_date as Date, 'Contact due - ' + LastName+','+FirstName as Description, Phone as Phone from TBL_CONTACTS where Next_Contact_date is not null

	    Union

	    Select BirthDay as Date, 'Birthday - ' + LastName+','+FirstName as Description, Phone as Phone from TBL_CONTACTS where BirthDay is not null

	    Union

	    Select Anniversary as Date, 'Anniversary - ' + LastName+','+FirstName as Description, Phone as Phone from TBL_CONTACTS  where Anniversary is not null

	    Union

	    Select FollowUpDate as Date, Description, Phone from Tbl_FollowUpItemsList where UserId = @UserId 
 
	   

	 End

    

    if (@Role = 'Coach')

	 Begin

		 -- full access to all companies and contacts within their region

		 Select c.NextContact_date as Date, 'Contact due - '+ c.CompanyName as Description, c.POCPhone as Phone From TBL_Companies c 

		 join TBL_FRANCHISEE f on c.FranchiseeId = f.ID   join TBL_COACH ch on f.CoachID = ch.ID  

		 where c.NextContact_date is not null and ch.RegionID = @RegionId

	    Union

	    Select ct.Next_Contact_date as Date, 'Contact due - ' + ct.LastName+','+ ct.FirstName as Description, ct.Phone as Phone from TBL_CONTACTS ct

	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f on c.FranchiseeId = f.ID join TBL_COACH ch on f.CoachID = ch.ID 

	    where ct.Next_Contact_date is not null and ch.RegionID = @RegionId

	    Union

	    Select ct.BirthDay as Date, 'Birthday - ' + ct.LastName+','+ ct.FirstName as Description, ct.Phone as Phone from TBL_CONTACTS ct

	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f on c.FranchiseeId = f.ID join TBL_COACH ch on f.CoachID = ch.ID  

 	   where ct.BirthDay is not null and ch.RegionID = @RegionId

	    Union

	    Select ct.Anniversary as Date, 'Anniversary - ' + ct.LastName+','+ ct.FirstName as Description, ct.Phone as Phone from TBL_CONTACTS ct

	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f on c.FranchiseeId = f.ID join TBL_COACH ch on f.CoachID = ch.ID   

 	   where ct.Anniversary is not null and ch.RegionID = @RegionId

	    Union

	    Select FollowUpDate as Date, Description, Phone from Tbl_FollowUpItemsList where UserId = @UserId 

	 End




    if (@Role = 'FranchiseeOwner')

    Begin

        Select c.NextContact_date as Date, 'Contact due - '+ c.CompanyName as Description, c.POCPhone as Phone From TBL_Companies c 

		 join TBL_FRANCHISEE f on c.FranchiseeId = f.ID where c.NextContact_date is not null and f.ID = @FranchiseeId

	    Union

	    Select ct.Next_Contact_date as Date, 'Contact due - ' + ct.LastName+','+ ct.FirstName as Description, ct.Phone as Phone from TBL_CONTACTS ct
 
	   join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f on c.FranchiseeId = f.ID 

	    where ct.Next_Contact_date is not null and f.ID = @FranchiseeId

	    Union

	    Select ct.BirthDay as Date, 'Birthday - ' + ct.LastName+','+ ct.FirstName as Description, ct.Phone as Phone from TBL_CONTACTS ct

	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f on c.FranchiseeId = f.ID 

	    where ct.BirthDay is not null and f.ID = @FranchiseeId

	    Union

	    Select ct.Anniversary as Date, 'Anniversary - ' + ct.LastName+','+ ct.FirstName as Description, ct.Phone as Phone from TBL_CONTACTS ct

	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f on c.FranchiseeId = f.ID 

	    where ct.Anniversary is not null and f.ID = @FranchiseeId

	    Union

	    Select FollowUpDate as Date, Description, Phone from Tbl_FollowUpItemsList where UserId = @UserId 
 
    End




    if (@Role = 'FranchiseeUser')

    Begin

        Select ct.Next_Contact_date as Date, 'Contact due - ' + ct.LastName+','+ ct.FirstName as Description, ct.Phone as Phone from TBL_CONTACTS ct

	    where ct.Next_Contact_date is not null and ct.CreatedBy = @UserId

	    Union
 
	   Select ct.BirthDay as Date, 'Birthday - ' + ct.LastName+','+ ct.FirstName as Description, ct.Phone as Phone from TBL_CONTACTS ct

 	   where ct.BirthDay is not null and ct.CreatedBy = @UserId

	    Union

	    Select ct.Anniversary as Date, 'Anniversary - ' + ct.LastName+','+ ct.FirstName as Description, ct.Phone as Phone from TBL_CONTACTS ct

	    where ct.Anniversary is not null and ct.CreatedBy = @UserId

	    Union

 	   Select FollowUpDate as Date, Description, Phone from Tbl_FollowUpItemsList where UserId = @UserId 

    End

    

	 RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_AddFollowUpItem]    Script Date: 09/03/2012 12:10:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_AddFollowUpItem]

	

	 (

		 @UserId varchar(50),

		 @FollowUpDate datetime,

		 @Description varchar(150),

		 @Phone varchar(50)

	 )

	
 
AS

	

	 Insert into Tbl_FollowUpItemsList

	 (UserId, FollowUpDate,Description,IsActive, CreatedOn,Phone)

	 values

	 (@UserId,@FollowUpDate,@Description,1, GetDate(),@Phone)

	

	 /* SET NOCOUNT ON */

	 RETURN








GO

/****** Object:  StoredProcedure [dbo].[sp_InsertContact]    Script Date: 09/03/2012 12:10:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_InsertContact]

	

	 (

		 @COMPANIESID int, @LastName varchar(50), @FirstName varchar(50),

		 @Phone varchar(50), @Email varchar(50),
 
		@Value int, @ApptSourceId int, @RegForTrainingId int, @CourseId int, 

        @CourseTrngDate datetime, @DiscussionTopic varchar(50), 

         @ACTIONSTEP varchar(50), 

        @Last_Contact_Date datetime, @Next_Contact_Date datetime, @CreatedBy varchar(50),

        @CallBackValue int,
        @Birthday datetime,@Anniversary datetime, @CompanyYears int, @BossName varchar(50)

	 )

	

 AS




		

	 if(@CourseId = 0) 
 
	Begin

	 Set @CourseId = null

	 End
 
	

	if(@ApptSourceId = 0) 

	 Begin
 
	Set @ApptSourceId = null

	 End

	
 
	if @Last_Contact_Date < '2/1/1755'

	 Begin

	  Set @Last_Contact_Date = null

	 End

	

	

 	if @CourseTrngDate < '2/1/1755'

	 Begin

	  Set @CourseTrngDate = null

	 End

	

	

 	

	Insert into tbl_contacts 

	 (COMPANYID, LastName,FirstName,Phone,Email, IsNewAppointment,ApptSourceId,IsRegisteredForTraining,

	 CourseId,CourseTrainingDate, DiscussionTopic,ActionStep,LAST_CONTACT_DATE,NEXT_CONTACT_DATE, 

	 IsActive, CreatedBy, IsEmailSubscription,IsNeedCallBack,CallBackCreatedDate,Birthday,Anniversary,CompanyYears,BossName)

	 values

	 (@COMPANIESID , @LastName , @FirstName ,@Phone , @Email,

	 @Value , @ApptSourceId , @RegForTrainingId , @CourseId , 

     @CourseTrngDate , @DiscussionTopic , @ACTIONSTEP, 

     @Last_Contact_Date , @Next_Contact_Date,1,@CreatedBy,1,@CallBackValue,GETDATE(),@Birthday,@Anniversary,@CompanyYears,@BossName)

	
 
	/* SET NOCOUNT ON */

	 RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateContactDetails]    Script Date: 09/03/2012 12:10:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_UpdateContactDetails]	

	 (		

		 @ContactsID int, @CompanyID int, @LastName varchar(50),

        @FirstName varchar(50), 

        @Phone varchar(50), 

        @Email varchar(50), 

        @DiscussionTopic varchar(50), 

        @ActionStep varchar(50), 

        @IsRegisteredForTrng int, 

        @IsNewAppt int, 

        @CourseId int, 

        @AppsSourceId int, 

        @LastDate datetime,

        @NextDate datetime,

        @CourseTrngDate datetime,

        @UpdatedBy varchar(50),

        @BlastEmailSubscription int,

        @CallBackValue int,
        @BirthDate datetime,
        @AnniversaryDate datetime,
        @CompanyYears int,
        @BossName varchar(50)		

	 )

	

 AS

	 if(@CourseId = 0) 
 
	Begin

	 Set @CourseId = null

	 End
 
	

	if(@AppsSourceId = 0) 

	 Begin
 
	Set @AppsSourceId = null

	 End

	
 
	

	if @LastDate < '2/1/1755'

	 Begin
 
	 Set @LastDate = null

	 End

	
 
	

	if @CourseTrngDate < '2/1/1755'

	 Begin
 
	 Set @CourseTrngDate = null

	 End

	
 
	

	Update Tbl_Contacts




	 Set LastName = @LastName, 

	 FirstName = @FirstName,

	 Phone = @Phone, 

	 Email = @Email,
 
	Last_Contact_Date = @LastDate, 

	 Next_Contact_Date = @NextDate, 

	 DiscussionTopic = @DiscussionTopic,

	 ActionStep = @ActionStep, 

	 Companyid = @CompanyID,

	 ApptSourceId = @AppsSourceId,

	 IsNewAppointment = @IsNewAppt,

	 CourseId = @CourseId,

	 IsRegisteredForTraining = @IsRegisteredForTrng,

	 CourseTrainingDate = @CourseTrngDate,

	 UpdatedBy = @UpdatedBy,

	 UpdatedDate = GETDATE(),

	 IsEmailSubscription = @BlastEmailSubscription,

	 IsNeedCallBack = @CallBackValue,
 
	CallBackCreatedDate = GETDATE(),
	Birthday=@BirthDate,
	Anniversary=@AnniversaryDate,
	CompanyYears=@CompanyYears,
	BossName=@BossName

	 where CONTACTSID = @ContactsID

	

	 /* SET NOCOUNT ON */

	 RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_GetContactDetails]    Script Date: 09/03/2012 12:10:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


	

 CREATE PROCEDURE [dbo].[sp_GetContactDetails]

	 (

	 @ContactID int 

	 )

AS

		
 
	Select 

	 ct.CONTACTSID,

	 ct.LASTNAME,
 
	ct.FIRSTNAME,   

	 ct.Phone, 

	 ct.Email, 
 
	ct.DiscussionTopic,

	 ct.ACTIONSTEP,

	 ISNULL(ct.LAST_CONTACT_DATE, '') as LAST_CONTACT_DATE,

	 ISNULL(ct.NEXT_CONTACT_DATE, '') as NEXT_CONTACT_DATE,

	 ISNULL(ct.CourseTrainingDate, '') as CourseTrainingDate,
	 ISNULL(ct.Birthday,'') as Birthday,
	 ISNULL(ct.Anniversary,'') as Anniversary,
	 ct.CompanyYears,
	 ct.BossName,
	 cp.COMPANYNAME,cp.COMPANIESID,
	 yn.Description as NewApptDescription, yn.Value as Value,

	aps.ApptSourceName , 

	 yno.Description as RegForTrngDescription, yno.Value as RegForTrainingId,
 
	ynbe.Description as BlastEmailDescription, ynbe.Value as BlastEmailId,

	 yncb.Description as CallBackDescription, yncb.Value as CallBackValue,

	 cs.CourseName, 

	 ISNULL(cs.courseId,1) as courseId,

	 ISNULL(aps.ApptSourceId,1) as ApptSourceId

	 /*ISNULL(ct.next_contact_date, '') as next_contact_date*/

	 from tbl_contacts ct 
 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID 

	 left join Tbl_YesNoOptions yn on ct.IsNewAppointment = yn.Value 

	 left join Tbl_AppointmentsSource aps on ct.ApptSourceId = aps.ApptSourceId

	 left join Tbl_YesNoOptions yno on ct.IsRegisteredForTraining = yno.Value

	 left join Tbl_YesNoOptions ynbe on ct.IsEmailSubscription = ynbe.Value

	 left join Tbl_YesNoOptions yncb on ct.IsNeedCallBack = yncb.Value

	 left join Tbl_Course cs on ct.CourseId = cs.CourseId  

	 where ct.CONTACTSID = @ContactID
 
	

	RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_GetCallBackOptions]    Script Date: 09/03/2012 12:10:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetCallBackOptions]

	 /*

	 (

 	@parameter1 int = 5,

	 @parameter2 datatype OUTPUT

	 )
 
	*/

AS

	 SELECT Value as CallBackValue, Description as CallBackDescription FROM TBL_YesNoOptions ORDER BY Description/* SET NOCOUNT ON */

	 RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_LoadCompanyContactsData]    Script Date: 09/03/2012 12:10:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/*We should have FranchiseeId, CoachUserId and FranchiseeOwnerId before we do this */

CREATE PROCEDURE [dbo].[sp_LoadCompanyContactsData]
@FranchiseeId int,
@CoachUserId varchar(50),
@FranchiseeOwnerUserId varchar(50)
AS
BEGIN TRY
     -- DECLARE VARIABLE
	 DECLARE @CompanyId INT
	 DECLARE @CompanyName varchar(150)
	 DECLARE @NewCompanyId INT
	 DECLARE @RecordCount INT
	 	
	BEGIN TRANSACTION;
	 SELECT @RecordCount = COUNT(*) FROM [dbo].[TBL_COMPANIES$] WHERE IsActive = 1
	 WHILE (@RecordCount) > 0
	 BEGIN
	 -- LET US HAVE FIRST RECORD FROM TEMP TABLE
	 SELECT top 1 @CompanyId = CompaniesID FROM [dbo].[TBL_COMPANIES$] where IsActive = 1;
	 SELECT top 1 @CompanyName = COMPANYNAME FROM [dbo].[TBL_COMPANIES$] where CompaniesID = @CompanyId;
	 -- NOW INSERT COMPANY RECORD
	 --print @CompanyName
	 IF NOT EXISTS (SELECT CompaniesID FROM [dbo].[TBL_COMPANIESTEST] WHERE COMPANYNAME = @CompanyName)
	 Begin
	 -- Insert if does not exist
	 INSERT INTO [dbo].[TBL_COMPANIESTEST]
           ([COMPANYNAME],[CITY],[STATE],[ZIP],[POCLastName]
           ,[POCFirstName],[POCPhone],[IsNewCompany],[COMPANYVALUEGOAL]
           ,[IndustryId],[RepLastName],[RepFirstName],[DiscussionTopic],[ACTIONSTEP],[LASTCONTACT_DATE],[NEXTCONTACT_DATE],[CreationDate]
           ,[FranchiseeId],[IsActive],[CreatedBy],[UpdatedBy],[Address],[CreatedDate],[UpdatedDate])
     SELECT top 1 [COMPANYNAME],[CITY],[STATE],[ZIP],[POCLastName]
           ,[POCFirstName],[POCPhone],[IsNewCompany],[COMPANYVALUEGOAL],[IndustryId],[RepLastName],[RepFirstName],[DiscussionTopic]
           ,[ACTIONSTEP],[LASTCONTACT_DATE],[NEXTCONTACT_DATE],[CreationDate],@FranchiseeId,[IsActive],@CoachUserId,[UpdatedBy]
           ,[Address],[CreatedDate],[UpdatedDate] From [dbo].[TBL_COMPANIES$] where CompaniesId = @CompanyId
       
      -- GET THE NEW COMPANY ID     
      SELECT @NewCompanyId = @@IDENTITY;
      Print @NewCompanyId  
      
      -- Now Add Contacts for this new Company
      INSERT INTO [dbo].[TBL_CONTACTSTEST]
      ([COMPANYID],[LASTNAME],[FIRSTNAME]
           ,[PHONE],[EMAIL],[IsNewAppointment]
           ,[ApptSourceId],[IsRegisteredForTraining],[CourseId]
           ,[CourseTrainingDate],[DiscussionTopic],[ACTIONSTEP]
           ,[LAST_CONTACT_DATE],[NEXT_CONTACT_DATE],[IsActive]
           ,[UpdatedBy],[CreatedBy],[CreatedDate]
           ,[UpdatedDate],[IsEmailSubscribtion])
           SELECT 
           @NewCompanyId ,[LASTNAME] ,[FIRSTNAME] ,[PHONE]
           ,[E-MAIL],[IsNewAppointment],[ApptSourceId]
           ,[IsRegisteredForTraining],[CourseId]
           ,[CourseTrainingDate],[DiscussionTopic]
           ,[ACTIONSTEP],[LASTCONTACT_DATE]
           ,[NEXT_CONTACT_DATE] ,1
           ,[UpdatedBy] ,@FranchiseeOwnerUserId
           ,[CreatedDate],[UpdatedDate],1 from [dbo].[TBL_CONTACTS$] WHERE CompanyId = @CompanyId
            
      END
      
    
      -- now delete from the table
      --Delete from [dbo].[TBL_COMPANIES$] where CompaniesId = @CompanyId
      Update [dbo].[TBL_COMPANIES$] Set IsActive = 0 where CompaniesId = @CompanyId
      -- check if more records exist or not
      SELECT @RecordCount = COUNT(*) FROM [dbo].[TBL_COMPANIES$] WHERE IsActive = 1
      IF (@RecordCount) = 0
		BREAK
	  ELSE
		CONTINUE
	  END
	  COMMIT TRANSACTION;
END TRY

BEGIN CATCH

END CATCH



GO

/****** Object:  StoredProcedure [dbo].[sp_AddProduct]    Script Date: 09/03/2012 12:10:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_AddProduct]
	
	(
		@ProductTypeName varchar(50), 
		@CreatedBy varchar(50),
		@FranchiseeId int
	)
	

	
	
AS
	
	Insert into tbl_ProductType
	(ProductTypeName, CreatedBy, FranchiseeId, IsActive)
	values
	(@ProductTypeName, @CreatedBy ,@FranchiseeId,1) 
	
	/* SET NOCOUNT ON */
	RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompanies]    Script Date: 09/03/2012 12:10:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetAllCompanies]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	SELECT 
	cp.COMPANIESID,
	cp.COMPANYNAME,
	cp.RepLastName+', '+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	-- Extra Columns for Export to Excel
	f.Name as FranchiseeName ,
	yno.Description as NewCompanyDesp,
	cp.Address,	cp.Zip, 
	cp.CITY,cp.STATE,
	cp.POCLastName+', '+ cp.POCFirstName as POCFullName,
	cp.POCPhone,cp.DiscussionTopic,
	cp.ActionStep,cp.LASTCONTACT_DATE,
	cp.NEXTCONTACT_DATE,cp.CreationDate,
	ch.RegionID,
	rg.Name as RegionName  
	FROM TBL_COMPANIES cp
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	left join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany 
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	left join TBL_COACH ch on ch.ID = f.CoachID
	left join TBL_REGION rg on ch.RegionID = rg.ID  
	ORDER BY COMPANYNAME
	
	RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContacts]    Script Date: 09/03/2012 12:10:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetAllContacts]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
		
	select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack   
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join   Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack    
	Order by cp.COMPANYNAME
	
	
	/* SET NOCOUNT ON */
	RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateCompanyDetails]    Script Date: 09/03/2012 12:10:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_UpdateCompanyDetails]
	(
		@COMPANIESID int,@CompanyName varchar(50), @Address varchar(150),
		@City varchar(50), @State varchar(50), @Zip varchar(50),
		@POCLastName varchar(50), @POCFirstName varchar(50),
		@POCPhone varchar(50), @Value int, @COMPANYVALUEGOAL int,
		/*@Id int, */
		@IndId int,
		@RepLastName varchar(50),@RepFirstName varchar(50),
		@DiscussionTopic varchar(50), @ActionStep varchar(50),
		@LastContact_Date datetime,@NextContact_Date datetime, 
		@CreationDate datetime, @UpdatedBy varchar(50)
		
	)
AS
	
	if @LastContact_Date < '2/1/1755'
	Begin
	  Set @LastContact_Date = null
	End
	
	Update tbl_companies

	Set 
	CompanyName = @CompanyName,
	Address = @Address,
	City = @City,
	State = @State,
	Zip = @Zip,
	POCLastName = @POCLastName,
	POCFirstName = @POCFirstName,
	POCPhone = @POCPhone,
	COMPANYVALUEGOAL = @COMPANYVALUEGOAL,
	RepLastName = @RepLastName,
	RepFirstName = @RepFirstName,
	DiscussionTopic = @DiscussionTopic,
	ActionStep = @ActionStep,
	LastContact_Date = @LastContact_Date, 
	NextContact_Date = @NextContact_Date,
	CreationDate = @CreationDate,
	/*ProductId = @Id,*/
	IndustryId = @IndId,
	IsNewCompany = @Value,
	UpdatedBy = @UpdatedBy,
	UPdatedDate = GETDATE()
	where COMPANIESID = @COMPANIESID


	RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_InsertCompany]    Script Date: 09/03/2012 12:10:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_InsertCompany]
	(	
		@CompanyName varchar(50), @Address varchar(150),
		@City varchar(50), @State varchar(50), @Zip varchar(50),
		@POCLastName varchar(50), @POCFirstName varchar(50),
		@POCPhone varchar(50), @Value int, @COMPANYVALUEGOAL int,
		/*@Id int, */
		@IndId int,
		@RepLastName varchar(50),@RepFirstName varchar(50),
		@DiscussionTopic varchar(50), @ActionStep varchar(50),
		@LastContact_Date datetime,@NextContact_Date datetime, 
		@CreationDate datetime, @CreatedBy varchar(50),
		@FranchiseeId int
	 )
AS
	
	if @LastContact_Date < '2/1/1755'
	Begin
	  Set @LastContact_Date = null
	End
	
	
	
	Insert into tbl_Companies
	(CompanyName, Address,City, State, Zip,POCLastName,POCFirstName,
	 POCPhone,IsNewCompany, COMPANYVALUEGOAL,
	 /*ProductId,*/
	 IndustryId,
	 RepLastName,RepFirstName,DiscussionTopic,ActionStep,
	 LastContact_Date,NextContact_Date,CreationDate, CreatedBy, FranchiseeId,IsActive)
	values
	(@CompanyName, @Address,@City, @State, @Zip,@POCLastName,@POCFirstName,
		@POCPhone , @Value, @COMPANYVALUEGOAL,
		/*@Id ,*/
		@IndId ,@RepLastName ,@RepFirstName,
		@DiscussionTopic , @ActionStep,	@LastContact_Date,
	 @NextContact_Date,@CreationDate,@CreatedBy,@FranchiseeId,1)
	
	/* SET NOCOUNT ON */
	RETURN



GO

/****** Object:  StoredProcedure [dbo].[sp_GetCompanyDetails]    Script Date: 09/03/2012 12:10:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE  PROCEDURE [dbo].[sp_GetCompanyDetails]
	(
	@COMPANIESID int 
	)
AS
	select 
	c.COMPANIESID,c.CompanyName, c.Address,c.City, c.State, c.Zip,
	c.POCLastName,c.POCFirstName,
	c.POCPhone,c.COMPANYVALUEGOAL,
	c.RepLastName,c.RepFirstName,c.DiscussionTopic,c.ActionStep,
	ISNULL(c.LastContact_Date, '') as LastContact_Date,
	ISNULL(c.NextContact_Date, '') as NextContact_Date,
	ISNULL(c.CreationDate, '') as CreationDate,
	c.FranchiseeId,
	i.IndustryTypeName as Industry,i.IndId as IndId,
	y.Description as Description, y.Value as Value
	from tbl_companies c 
	left join Tbl_IndustryType i on c.IndustryId = i.IndId
	left join tbl_YesNoOptions y on c.IsNewCompany = y.Value
	where c.COMPANIESID = @COMPANIESID

	RETURN



GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByFrId]    Script Date: 09/03/2012 12:10:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_GetAllCompaniesByFrId]
	
	(
		@FranchiseeId int
	)
	
AS
		
	SELECT 
	cp.COMPANIESID,
	cp.COMPANYNAME,
	cp.RepLastName+', '+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	-- Extra Columns for Export to Excel
	f.Name as FranchiseeName ,
	yno.Description as NewCompanyDesp,
	cp.Address,	cp.Zip, 
	cp.CITY,cp.STATE,
	cp.POCLastName+', '+ cp.POCFirstName as POCFullName,
	cp.POCPhone,cp.DiscussionTopic,
	cp.ActionStep,cp.LASTCONTACT_DATE,
	cp.NEXTCONTACT_DATE,cp.CreationDate,
	ch.RegionID,
	rg.Name as RegionName 
	FROM TBL_COMPANIES cp
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	left join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany  
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	left join TBL_COACH ch on ch.ID = f.CoachID
	left join TBL_REGION rg on ch.RegionID = rg.ID  
	where cp.FranchiseeId = @FranchiseeId 
	ORDER BY COMPANYNAME
	
	
	
	RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_GetNewItemOptions]    Script Date: 09/03/2012 12:10:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[sp_GetNewItemOptions]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	SELECT * FROM TBL_YesNoOptions ORDER BY Description/* SET NOCOUNT ON */
	RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCompID]    Script Date: 09/03/2012 12:10:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[sp_GetAllContactsByCompID]
	
	(
	@CompanyID int 
	)
	
AS
	
		
	select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID 
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack
	where ct.companyid = @CompanyID
	Order by cp.COMPANYNAME
	
	
	RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllProducts]    Script Date: 09/03/2012 12:10:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[sp_GetAllProducts]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	SELECT * FROM TBL_ProductType ORDER BY ProductTypeName/* SET NOCOUNT ON */
	RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllIndustries]    Script Date: 09/03/2012 12:10:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[sp_GetAllIndustries]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	SELECT * FROM TBL_IndustryType ORDER BY IndustryTypeName/* SET NOCOUNT ON */
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByFrID]    Script Date: 09/03/2012 12:10:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetAllContactsByFrID]
	
	(
	@FranchiseeID int 
	)
	
AS
	
		
	select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID 
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack  
	where ct.companyid in (Select CompaniesId from tbl_Companies where FranchiseeId = @FranchiseeID)
	Order by cp.COMPANYNAME
	
	
	RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_GetRegForTrainingOptions]    Script Date: 09/03/2012 12:10:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[sp_GetRegForTrainingOptions]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	SELECT id, Value as RegForTrainingId, Description  FROM TBL_YesNoOptions ORDER BY Description/* SET NOCOUNT ON */
	RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_GetApptSourceOptions]    Script Date: 09/03/2012 12:10:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[sp_GetApptSourceOptions]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	SELECT * FROM Tbl_AppointmentsSource ORDER BY ApptSourceName /* SET NOCOUNT ON */
	RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByCoachId]    Script Date: 09/03/2012 12:10:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_GetAllCompaniesByCoachId]
	
	(
		@CoachId int
	)
	
AS
		
	SELECT cp.COMPANIESID,cp.COMPANYNAME,
	cp.RepLastName+', '+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	-- Extra Columns for Export to Excel
	f.Name as FranchiseeName ,
	yno.Description as NewCompanyDesp,
	cp.Address,	cp.Zip, 
	cp.CITY,cp.STATE,
	cp.POCLastName+', '+ cp.POCFirstName as POCFullName,
	cp.POCPhone,cp.DiscussionTopic,
	cp.ActionStep,cp.LASTCONTACT_DATE,
	cp.NEXTCONTACT_DATE,cp.CreationDate,
	ch.RegionID,
	rg.Name as RegionName  
	FROM TBL_COMPANIES cp 
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	left join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany 
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	left join TBL_COACH ch on ch.ID = f.CoachID
	left join TBL_REGION rg on ch.RegionID = rg.ID  
	where cp.FranchiseeId in (Select id from Tbl_Franchisee  where CoachID = @CoachId) 
	ORDER BY COMPANYNAME
	
	
	RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCoachID]    Script Date: 09/03/2012 12:10:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetAllContactsByCoachID]
	
	(
	@CoachID int 
	)
	
AS
	
		
	select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID 
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack
	where ct.companyid in (Select CompaniesId from tbl_Companies where FranchiseeId in (Select id from Tbl_Franchisee  where CoachID = @CoachId))
	Order by cp.COMPANYNAME
	
	RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByUserID]    Script Date: 09/03/2012 12:10:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetAllContactsByUserID]
	
	(
	@UserID varchar(50)
	)
	
AS
	
		
	select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID 
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack  
	where Upper(ct.CreatedBy) = Upper(@UserID)
	Order by cp.COMPANYNAME
	
	
	RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsForCompByUserID]    Script Date: 09/03/2012 12:10:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetAllContactsForCompByUserID]
	
	(
	@UserID varchar(50),
	@CompanyID int
	)
	
AS
	
		
	select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack 
	where Upper(ct.CreatedBy) = Upper(@UserID) and ct.COMPANYID = @CompanyID
	Order by cp.COMPANYNAME
	
	
	RETURN


GO


