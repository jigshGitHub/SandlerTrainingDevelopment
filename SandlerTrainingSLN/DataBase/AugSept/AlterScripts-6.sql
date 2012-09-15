/*
Executed in 139 on 9/12/2012 at 10:00PM
*/

/****** Object:  View [dbo].[vw_Opportunities]    Script Date: 09/12/2012 13:07:55 ******/
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
cmp.COMPANYNAME, 
cmp.IsNewCompany, 
cmp.CreationDate, cmp.IndustryId,  
o.* 
FROM dbo.[TBL_OPPORTUNITIES] o WITH (NOLOCK)
INNER JOIN dbo.[TBL_COMPANIES] cmp WITH (NOLOCK) ON cmp.COMPANIESID = o.COMPANYID AND cmp.IsActive = 1
INNER JOIN dbo.[TBL_CONTACTS] cnt WITH (NOLOCK) ON cnt.CONTACTSID = o.CONTACTID AND cnt.IsActive = 1
INNER JOIN dbo.[TBL_Franchisee] f WITH (NOLOCK) ON cmp.FranchiseeID = f.ID AND f.IsActive = 1
INNER JOIN dbo.[TBL_COACH] ch WITH (NOLOCK) ON f.CoachID = ch.ID AND ch.IsActive = 1
INNER JOIN dbo.[TBL_Region] r WITH (NOLOCK) ON ch.RegionID = r.ID AND r.IsActive = 1
AND o.IsActive = 1


GO


/****** Object:  StoredProcedure [dbo].[sp_GetOpportunitiesByUser]    Script Date: 09/12/2012 13:23:24 ******/
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
	
	IF @RoleName = 'FranchiseeOwner'
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

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Contacts]'))
DROP VIEW [dbo].[vw_Contacts]
GO

Create VIEW [dbo].[vw_Contacts]

AS

SELECT r.ID AS RegionID, 
r.Name AS Region, 
ch.ID AS CoachID, 
ch.FirstName + ' ' + ch.LastName AS CoachName, 
f.ID AS FranchiseeId, 
f.Name AS FranchiseeName, 
cmp.COMPANYNAME, 
cmp.IsNewCompany, 
cmp.CreationDate, cmp.IndustryId,  
cnt.* 
FROM dbo.[TBL_CONTACTS] cnt WITH (NOLOCK)
INNER JOIN dbo.[TBL_COMPANIES] cmp WITH (NOLOCK) ON cmp.COMPANIESID = cnt.COMPANYID AND cmp.IsActive = 1
INNER JOIN dbo.[TBL_Franchisee] f WITH (NOLOCK) ON cmp.FranchiseeID = f.ID AND f.IsActive = 1
INNER JOIN dbo.[TBL_COACH] ch WITH (NOLOCK) ON f.CoachID = ch.ID AND ch.IsActive = 1
INNER JOIN dbo.[TBL_Region] r WITH (NOLOCK) ON ch.RegionID = r.ID AND r.IsActive = 1
WHERE cnt.IsActive = 1

GO

/****** Object:  StoredProcedure [dbo].[sp_GetContactsByUser]    Script Date: 09/12/2012 13:23:24 ******/
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
	
	IF @RoleName = 'FranchiseeOwner'
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



USE [SandlerDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContacts]    Script Date: 09/12/2012 15:52:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContacts]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContacts]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCoachID]    Script Date: 09/12/2012 15:52:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByCoachID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByCoachID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCoachIDSearch]    Script Date: 09/12/2012 15:52:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByCoachIDSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByCoachIDSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCompID]    Script Date: 09/12/2012 15:52:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByCompID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByCompID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByFrID]    Script Date: 09/12/2012 15:52:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByFrID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByFrID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByFrIDSearch]    Script Date: 09/12/2012 15:52:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByFrIDSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByFrIDSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByUserID]    Script Date: 09/12/2012 15:52:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByUserID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByUserID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByUserIDSearch]    Script Date: 09/12/2012 15:52:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByUserIDSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByUserIDSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsForCompByUserID]    Script Date: 09/12/2012 15:52:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsForCompByUserID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsForCompByUserID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsSearch]    Script Date: 09/12/2012 15:52:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsSearch]
GO

USE [SandlerDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContacts]    Script Date: 09/12/2012 15:52:10 ******/
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
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName 
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join   Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack 
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
    left join TBL_COACH ch on ch.ID = f.CoachID
    left join TBL_REGION rg on ch.RegionID = rg.ID   
	Order by cp.COMPANYNAME
	
	
	/* SET NOCOUNT ON */
	RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCoachID]    Script Date: 09/12/2012 15:52:10 ******/
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
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName 
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID 
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
    left join TBL_COACH ch on ch.ID = f.CoachID
    left join TBL_REGION rg on ch.RegionID = rg.ID
	where ct.companyid in (Select CompaniesId from tbl_Companies where FranchiseeId in (Select id from Tbl_Franchisee  where CoachID = @CoachId))
	Order by cp.COMPANYNAME
	
	RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCoachIDSearch]    Script Date: 09/12/2012 15:52:10 ******/
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
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName    
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join   Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId   
    left join TBL_COACH ch on ch.ID = f.CoachID
    left join TBL_REGION rg on ch.RegionID = rg.ID
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

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCompID]    Script Date: 09/12/2012 15:52:10 ******/
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
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName 
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID 
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
    left join TBL_COACH ch on ch.ID = f.CoachID
    left join TBL_REGION rg on ch.RegionID = rg.ID
	where ct.companyid = @CompanyID
	Order by cp.COMPANYNAME
	
	
	RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByFrID]    Script Date: 09/12/2012 15:52:10 ******/
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
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName 
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID 
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack 
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
    left join TBL_COACH ch on ch.ID = f.CoachID
    left join TBL_REGION rg on ch.RegionID = rg.ID 
	where ct.companyid in (Select CompaniesId from tbl_Companies where FranchiseeId = @FranchiseeID)
	Order by cp.COMPANYNAME
	
	
	RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByFrIDSearch]    Script Date: 09/12/2012 15:52:10 ******/
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
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName    
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join   Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
    left join TBL_COACH ch on ch.ID = f.CoachID
    left join TBL_REGION rg on ch.RegionID = rg.ID
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

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByUserID]    Script Date: 09/12/2012 15:52:10 ******/
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
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName 
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID 
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack  
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
    left join TBL_COACH ch on ch.ID = f.CoachID
    left join TBL_REGION rg on ch.RegionID = rg.ID
	where Upper(ct.CreatedBy) = Upper(@UserID)
	Order by cp.COMPANYNAME
	
	
	RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByUserIDSearch]    Script Date: 09/12/2012 15:52:10 ******/
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
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName    
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join   Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
    left join TBL_COACH ch on ch.ID = f.CoachID
    left join TBL_REGION rg on ch.RegionID = rg.ID
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

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsForCompByUserID]    Script Date: 09/12/2012 15:52:11 ******/
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
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName 
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack 
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
    left join TBL_COACH ch on ch.ID = f.CoachID
    left join TBL_REGION rg on ch.RegionID = rg.ID
	where Upper(ct.CreatedBy) = Upper(@UserID) and ct.COMPANYID = @CompanyID
	Order by cp.COMPANYNAME
	
	
	RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsSearch]    Script Date: 09/12/2012 15:52:11 ******/
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
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName    
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join   Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
    left join TBL_COACH ch on ch.ID = f.CoachID
    left join TBL_REGION rg on ch.RegionID = rg.ID
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


