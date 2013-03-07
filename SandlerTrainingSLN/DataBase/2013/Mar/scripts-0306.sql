ALTER TABLE [dbo].[TBL_CONTACTS] ADD [TrainingCourseName] [varchar](150) NULL
GO
ALTER TABLE [dbo].[TBL_CONTACTS] ADD [HowManyAttended] [int] NULL
GO
ALTER TABLE [dbo].[TBL_CONTACTS] ADD [CompanyNameWhereTrainingConducted] [varchar](150) NULL
GO
ALTER TABLE [dbo].[TBL_FRANCHISEE] Drop column [Territory] 
GO
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [Territory] [varchar](120) NULL
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllContacts]    Script Date: 03/05/2013 11:32:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContacts]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContacts]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCoachID]    Script Date: 03/05/2013 11:32:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByCoachID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByCoachID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCoachIDSearch]    Script Date: 03/05/2013 11:32:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByCoachIDSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByCoachIDSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCompID]    Script Date: 03/05/2013 11:32:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByCompID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByCompID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByFrID]    Script Date: 03/05/2013 11:32:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByFrID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByFrID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByFrIDSearch]    Script Date: 03/05/2013 11:32:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByFrIDSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByFrIDSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByUserID]    Script Date: 03/05/2013 11:32:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByUserID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByUserID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByUserIDSearch]    Script Date: 03/05/2013 11:32:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByUserIDSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByUserIDSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsForCompByUserID]    Script Date: 03/05/2013 11:32:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsForCompByUserID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsForCompByUserID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsSearch]    Script Date: 03/05/2013 11:32:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllEvents]    Script Date: 03/05/2013 11:32:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllEvents]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllEvents]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertContact]    Script Date: 03/05/2013 11:32:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertContact]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_InsertContact]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateContactDetails]    Script Date: 03/05/2013 11:32:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UpdateContactDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UpdateContactDetails]
GO



/****** Object:  StoredProcedure [dbo].[sp_GetAllContacts]    Script Date: 03/05/2013 11:32:29 ******/
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
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country,
    ct.TrainingCourseName, 
    ct.HowManyAttended,
    ct.CompanyNameWhereTrainingConducted  
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

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCoachID]    Script Date: 03/05/2013 11:32:29 ******/
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
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country,
    ISNULL(ct.TrainingCourseName,'') as TrainingCourseName, 
    ct.HowManyAttended,
    ISNULL(ct.CompanyNameWhereTrainingConducted,'') as CompanyNameWhereTrainingConducted 
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

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCoachIDSearch]    Script Date: 03/05/2013 11:32:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[sp_GetAllContactsByCoachIDSearch]
	
	(
	    @CoachID varchar(50), 
	    @LastName varchar(50),
		@FirstName varchar(50),
		@Title varchar(50),
		@ContactsDepartment varchar(50),
		@ContactsRole varchar(50),
		@Phone varchar(50),
		@MobilePhone varchar(50),
		@HomePhone varchar(50),
		@Fax varchar(50),
		@Email varchar(50),
		@PersonalEmail varchar(50),
		@Address varchar(150),
		@City varchar(50),
		@State varchar(50),
		@Zip varchar(50),
		@Country varchar(50),
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
		@LastAttemptedDate datetime,
		@LastEmailedDate datetime,
		@LastMeetingDate datetime,
		@LetterSentDate datetime,
		@CourseTrngDate datetime,
		@BirthDayDate datetime,
		@AnniversaryDate datetime,
		@CompanyYears varchar(50),
		@BossName varchar(50),
		@SpouseName varchar(50),
		@ReferredBy varchar(50),
		@Notes varchar(200),
		@TrainingCourseName varchar(150),
        @HowManyAttended varchar(20),
        @CompanyNameWhereTrainingConducted varchar(150)
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
	 
	 if @LastAttemptedDate < '2/1/1755'
	 Begin
		 Set @LastAttemptedDate = null
	 End
	 
	 if @LastEmailedDate < '2/1/1755'
	 Begin
		 Set @LastEmailedDate = null
	 End
	 
	 if @LastMeetingDate < '2/1/1755'
	 Begin
		 Set @LastMeetingDate = null
	 End
	 
	 if @LetterSentDate < '2/1/1755'
	 Begin
		 Set @LetterSentDate = null
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
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country,
    ct.TrainingCourseName, 
    ct.HowManyAttended,
    ct.CompanyNameWhereTrainingConducted        
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
		SET @SQLString = @SQLString + 'ct.lastname like ''' + '%' + @LastName  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Training Course Name
	if @TrainingCourseName is not null and @TrainingCourseName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.TrainingCourseName like ''' + '%' + @TrainingCourseName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Company Name where Training is conducted
	if @CompanyNameWhereTrainingConducted is not null and @CompanyNameWhereTrainingConducted != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CompanyNameWhereTrainingConducted like ''' + '%' + @CompanyNameWhereTrainingConducted  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- How Many Attended
	if @HowManyAttended is not null and @HowManyAttended != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.HowManyAttended like ''' + '%' + @HowManyAttended  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- First Name
	if @FirstName is not null and @FirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.FirstName like ''' + '%' + @FirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Title
	if @Title is not null and @Title != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Title like ''' + '%' + @Title  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- ContactsDepartment
	if @ContactsDepartment is not null and @ContactsDepartment != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ContactsDepartment like ''' + '%' + @ContactsDepartment  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- ContactsRole
	if @ContactsRole is not null and @ContactsRole != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ContactsRole like ''' + '%' + @ContactsRole  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	--@MobilePhone
	if @MobilePhone is not null and @MobilePhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.MobilePhone like ''' + '%' + @MobilePhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	--@HomePhone
	if @HomePhone is not null and @HomePhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.HomePhone like ''' + '%' + @HomePhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- Fax
	if @Fax is not null and @Fax != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Fax like ''' + '%' + @Fax  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
		
	-- PersonalEmail
	if @PersonalEmail is not null and @PersonalEmail != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.PersonalEmail like ''' + '%' + @PersonalEmail  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Address
	if @Address is not null and @Address != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Address like ''' + '%' + @Address  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Zip
	if @Zip is not null and @Zip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Zip like ''' + '%' + @Zip  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For City
	if @City is not null and @City != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.City like ''' + '%' + @City  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For State
	if @State is not null and @State != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.State like ''' + '%' + @State  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Country
	if @Country is not null and @Country != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Country like ''' + '%' + @Country  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Attempted Date
	if @LastAttemptedDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastAttemptedDate = ''' + Convert(Varchar,@LastAttemptedDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Last Emailed Date
	if @LastEmailedDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastEmailedDate = ''' + Convert(Varchar,@LastEmailedDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Last Meeting Date
	if @LastMeetingDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastMeetingDate = ''' + Convert(Varchar,@LastMeetingDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Letter Sent Date
	if @LetterSentDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LetterSentDate = ''' + Convert(Varchar,@LetterSentDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Spouse Name
	if @SpouseName is not null and @SpouseName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.SpouseName like ''' + '%' + @SpouseName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	
	-- For ReferredBy
	if @ReferredBy is not null and @ReferredBy != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ReferredBy like ''' + '%' + @ReferredBy  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Notes
	if @Notes is not null and @Notes != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Notes like ''' + '%' + @Notes  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Phone
	if @Phone is not null and @Phone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Phone like ''' + '%' + @Phone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Email
	if @Email is not null and @Email != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Email like ''' + '%' + @Email  + '%' + ''''
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
		SET @SQLString = @SQLString + 'ct.DiscussionTopic like ''' + '%' + @DiscussionTopic  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Action Step
	if @ActionStep is not null and @ActionStep != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ActionStep like ''' + '%' + @ActionStep  + '%' + ''''
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
		SET @SQLString = @SQLString + 'ct.BossName like ''' + '%' + @BossName  + '%' + ''''
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

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCompID]    Script Date: 03/05/2013 11:32:29 ******/
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
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country,
    ISNULL(ct.TrainingCourseName,'') as TrainingCourseName, 
     ct.HowManyAttended,
     ISNULL(ct.CompanyNameWhereTrainingConducted,'') as CompanyNameWhereTrainingConducted 
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

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByFrID]    Script Date: 03/05/2013 11:32:29 ******/
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
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment,ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country,
    ISNULL(ct.TrainingCourseName,'') as TrainingCourseName, 
     ct.HowManyAttended,
     ISNULL(ct.CompanyNameWhereTrainingConducted,'') as CompanyNameWhereTrainingConducted 
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

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByFrIDSearch]    Script Date: 03/05/2013 11:32:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[sp_GetAllContactsByFrIDSearch]
	
	(
	    @FranchiseeID varchar(50),
	    @LastName varchar(50),
		@FirstName varchar(50),
		@Title varchar(50),
		@ContactsDepartment varchar(50),
		@ContactsRole varchar(50),
		@Phone varchar(50),
		@MobilePhone varchar(50),
		@HomePhone varchar(50),
		@Fax varchar(50),
		@Email varchar(50),
		@PersonalEmail varchar(50),
		@Address varchar(150),
		@City varchar(50),
		@State varchar(50),
		@Zip varchar(50),
		@Country varchar(50),
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
		@LastAttemptedDate datetime,
		@LastEmailedDate datetime,
		@LastMeetingDate datetime,
		@LetterSentDate datetime,
		@CourseTrngDate datetime,
		@BirthDayDate datetime,
		@AnniversaryDate datetime,
		@CompanyYears varchar(50),
		@BossName varchar(50),
		@SpouseName varchar(50),
		@ReferredBy varchar(50),
		@Notes varchar(200),
		@TrainingCourseName varchar(150),
        @HowManyAttended varchar(20),
        @CompanyNameWhereTrainingConducted varchar(150)
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
	 
	 if @LastAttemptedDate < '2/1/1755'
	 Begin
		 Set @LastAttemptedDate = null
	 End
	 
	 if @LastEmailedDate < '2/1/1755'
	 Begin
		 Set @LastEmailedDate = null
	 End
	 
	 if @LastMeetingDate < '2/1/1755'
	 Begin
		 Set @LastMeetingDate = null
	 End
	 
	 if @LetterSentDate < '2/1/1755'
	 Begin
		 Set @LetterSentDate = null
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
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country,
    ct.TrainingCourseName, 
    ct.HowManyAttended,
    ct.CompanyNameWhereTrainingConducted            
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
		SET @SQLString = @SQLString + 'ct.lastname like ''' + '%' + @LastName  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Training Course Name
	if @TrainingCourseName is not null and @TrainingCourseName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.TrainingCourseName like ''' + '%' + @TrainingCourseName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Company Name where Training is conducted
	if @CompanyNameWhereTrainingConducted is not null and @CompanyNameWhereTrainingConducted != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CompanyNameWhereTrainingConducted like ''' + '%' + @CompanyNameWhereTrainingConducted  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- How Many Attended
	if @HowManyAttended is not null and @HowManyAttended != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.HowManyAttended like ''' + '%' + @HowManyAttended  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- First Name
	if @FirstName is not null and @FirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.FirstName like ''' + '%' + @FirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Title
	if @Title is not null and @Title != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Title like ''' + '%' + @Title  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- ContactsDepartment
	if @ContactsDepartment is not null and @ContactsDepartment != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ContactsDepartment like ''' + '%' + @ContactsDepartment  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- ContactsRole
	if @ContactsRole is not null and @ContactsRole != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ContactsRole like ''' + '%' + @ContactsRole  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	--@MobilePhone
	if @MobilePhone is not null and @MobilePhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.MobilePhone like ''' + '%' + @MobilePhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	--@HomePhone
	if @HomePhone is not null and @HomePhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.HomePhone like ''' + '%' + @HomePhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- Fax
	if @Fax is not null and @Fax != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Fax like ''' + '%' + @Fax  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
		
	-- PersonalEmail
	if @PersonalEmail is not null and @PersonalEmail != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.PersonalEmail like ''' + '%' + @PersonalEmail  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Address
	if @Address is not null and @Address != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Address like ''' + '%' + @Address  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Zip
	if @Zip is not null and @Zip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Zip like ''' + '%' + @Zip  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For City
	if @City is not null and @City != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.City like ''' + '%' + @City  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For State
	if @State is not null and @State != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.State like ''' + '%' + @State  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Country
	if @Country is not null and @Country != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Country like ''' + '%' + @Country  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Attempted Date
	if @LastAttemptedDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastAttemptedDate = ''' + Convert(Varchar,@LastAttemptedDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Last Emailed Date
	if @LastEmailedDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastEmailedDate = ''' + Convert(Varchar,@LastEmailedDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Last Meeting Date
	if @LastMeetingDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastMeetingDate = ''' + Convert(Varchar,@LastMeetingDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Letter Sent Date
	if @LetterSentDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LetterSentDate = ''' + Convert(Varchar,@LetterSentDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Spouse Name
	if @SpouseName is not null and @SpouseName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.SpouseName like ''' + '%' + @SpouseName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	
	-- For ReferredBy
	if @ReferredBy is not null and @ReferredBy != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ReferredBy like ''' + '%' + @ReferredBy  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Notes
	if @Notes is not null and @Notes != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Notes like ''' + '%' + @Notes  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Phone
	if @Phone is not null and @Phone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Phone like ''' + '%' + @Phone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Email
	if @Email is not null and @Email != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Email like ''' + '%' + @Email  + '%' + ''''
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
		SET @SQLString = @SQLString + 'ct.DiscussionTopic like ''' + '%' + @DiscussionTopic  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Action Step
	if @ActionStep is not null and @ActionStep != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ActionStep like ''' + '%' + @ActionStep  + '%' + ''''
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
		SET @SQLString = @SQLString + 'ct.BossName like ''' + '%' + @BossName  + '%' + ''''
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

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByUserID]    Script Date: 03/05/2013 11:32:30 ******/
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
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country,
    ISNULL(ct.TrainingCourseName,'') as TrainingCourseName, 
     ct.HowManyAttended,
     ISNULL(ct.CompanyNameWhereTrainingConducted,'') as CompanyNameWhereTrainingConducted 
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

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByUserIDSearch]    Script Date: 03/05/2013 11:32:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE  PROCEDURE [dbo].[sp_GetAllContactsByUserIDSearch]
	
	(
	    @UserID varchar(50),
	    @LastName varchar(50),
		@FirstName varchar(50),
		@Title varchar(50),
		@ContactsDepartment varchar(50),
		@ContactsRole varchar(50),
		@Phone varchar(50),
		@MobilePhone varchar(50),
		@HomePhone varchar(50),
		@Fax varchar(50),
		@Email varchar(50),
		@PersonalEmail varchar(50),
		@Address varchar(150),
		@City varchar(50),
		@State varchar(50),
		@Zip varchar(50),
		@Country varchar(50),
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
		@LastAttemptedDate datetime,
		@LastEmailedDate datetime,
		@LastMeetingDate datetime,
		@LetterSentDate datetime,
		@CourseTrngDate datetime,
		@BirthDayDate datetime,
		@AnniversaryDate datetime,
		@CompanyYears varchar(50),
		@BossName varchar(50),
		@SpouseName varchar(50),
		@ReferredBy varchar(50),
		@Notes varchar(200),
		@TrainingCourseName varchar(150),
        @HowManyAttended varchar(20),
        @CompanyNameWhereTrainingConducted varchar(150)
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
	 
	 if @LastAttemptedDate < '2/1/1755'
	 Begin
		 Set @LastAttemptedDate = null
	 End
	 
	 if @LastEmailedDate < '2/1/1755'
	 Begin
		 Set @LastEmailedDate = null
	 End
	 
	 if @LastMeetingDate < '2/1/1755'
	 Begin
		 Set @LastMeetingDate = null
	 End
	 
	 if @LetterSentDate < '2/1/1755'
	 Begin
		 Set @LetterSentDate = null
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
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country,
    ct.TrainingCourseName, 
    ct.HowManyAttended,
    ct.CompanyNameWhereTrainingConducted             
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
		SET @SQLString = @SQLString + 'ct.lastname like ''' + '%' + @LastName  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Training Course Name
	if @TrainingCourseName is not null and @TrainingCourseName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.TrainingCourseName like ''' + '%' + @TrainingCourseName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Company Name where Training is conducted
	if @CompanyNameWhereTrainingConducted is not null and @CompanyNameWhereTrainingConducted != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CompanyNameWhereTrainingConducted like ''' + '%' + @CompanyNameWhereTrainingConducted  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- How Many Attended
	if @HowManyAttended is not null and @HowManyAttended != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.HowManyAttended like ''' + '%' + @HowManyAttended  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- First Name
	if @FirstName is not null and @FirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.FirstName like ''' + '%' + @FirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Title
	if @Title is not null and @Title != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Title like ''' + '%' + @Title  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- ContactsDepartment
	if @ContactsDepartment is not null and @ContactsDepartment != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ContactsDepartment like ''' + '%' + @ContactsDepartment  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- ContactsRole
	if @ContactsRole is not null and @ContactsRole != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ContactsRole like ''' + '%' + @ContactsRole  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	--@MobilePhone
	if @MobilePhone is not null and @MobilePhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.MobilePhone like ''' + '%' + @MobilePhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	--@HomePhone
	if @HomePhone is not null and @HomePhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.HomePhone like ''' + '%' + @HomePhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- Fax
	if @Fax is not null and @Fax != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Fax like ''' + '%' + @Fax  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
		
	-- PersonalEmail
	if @PersonalEmail is not null and @PersonalEmail != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.PersonalEmail like ''' + '%' + @PersonalEmail  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Address
	if @Address is not null and @Address != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Address like ''' + '%' + @Address  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Zip
	if @Zip is not null and @Zip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Zip like ''' + '%' + @Zip  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For City
	if @City is not null and @City != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.City like ''' + '%' + @City  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For State
	if @State is not null and @State != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.State like ''' + '%' + @State  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Country
	if @Country is not null and @Country != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Country like ''' + '%' + @Country  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Attempted Date
	if @LastAttemptedDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastAttemptedDate = ''' + Convert(Varchar,@LastAttemptedDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Last Emailed Date
	if @LastEmailedDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastEmailedDate = ''' + Convert(Varchar,@LastEmailedDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Last Meeting Date
	if @LastMeetingDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastMeetingDate = ''' + Convert(Varchar,@LastMeetingDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Letter Sent Date
	if @LetterSentDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LetterSentDate = ''' + Convert(Varchar,@LetterSentDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Spouse Name
	if @SpouseName is not null and @SpouseName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.SpouseName like ''' + '%' + @SpouseName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	
	-- For ReferredBy
	if @ReferredBy is not null and @ReferredBy != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ReferredBy like ''' + '%' + @ReferredBy  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Notes
	if @Notes is not null and @Notes != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Notes like ''' + '%' + @Notes  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Phone
	if @Phone is not null and @Phone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Phone like ''' + '%' + @Phone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Email
	if @Email is not null and @Email != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Email like ''' + '%' + @Email  + '%' + ''''
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
		SET @SQLString = @SQLString + 'ct.DiscussionTopic like ''' + '%' + @DiscussionTopic  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Action Step
	if @ActionStep is not null and @ActionStep != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ActionStep like ''' + '%' + @ActionStep  + '%' + ''''
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
		SET @SQLString = @SQLString + 'ct.BossName like ''' + '%' + @BossName  + '%' + ''''
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

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsForCompByUserID]    Script Date: 03/05/2013 11:32:30 ******/
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
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country,
    ISNULL(ct.TrainingCourseName,'') as TrainingCourseName, 
     ct.HowManyAttended,
     ISNULL(ct.CompanyNameWhereTrainingConducted,'') as CompanyNameWhereTrainingConducted 
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

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsSearch]    Script Date: 03/05/2013 11:32:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_GetAllContactsSearch]
	
	(
	    @LastName varchar(50),
		@FirstName varchar(50),
		@Title varchar(50),
		@ContactsDepartment varchar(50),
		@ContactsRole varchar(50),
		@Phone varchar(50),
		@MobilePhone varchar(50),
		@HomePhone varchar(50),
		@Fax varchar(50),
		@Email varchar(50),
		@PersonalEmail varchar(50),
		@Address varchar(150),
		@City varchar(50),
		@State varchar(50),
		@Zip varchar(50),
		@Country varchar(50),
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
		@LastAttemptedDate datetime,
		@LastEmailedDate datetime,
		@LastMeetingDate datetime,
		@LetterSentDate datetime,
		@CourseTrngDate datetime,
		@BirthDayDate datetime,
		@AnniversaryDate datetime,
		@CompanyYears varchar(50),
		@BossName varchar(50),
		@SpouseName varchar(50),
		@ReferredBy varchar(50),
		@Notes varchar(200),
		@TrainingCourseName varchar(150),
        @HowManyAttended varchar(20),
        @CompanyNameWhereTrainingConducted varchar(150)
			
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
	 
	 if @LastAttemptedDate < '2/1/1755'
	 Begin
		 Set @LastAttemptedDate = null
	 End
	 
	 if @LastEmailedDate < '2/1/1755'
	 Begin
		 Set @LastEmailedDate = null
	 End
	 
	 if @LastMeetingDate < '2/1/1755'
	 Begin
		 Set @LastMeetingDate = null
	 End
	 
	 if @LetterSentDate < '2/1/1755'
	 Begin
		 Set @LetterSentDate = null
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
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country,
    ct.TrainingCourseName, 
    ct.HowManyAttended,
    ct.CompanyNameWhereTrainingConducted
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
		SET @SQLString = @SQLString + 'ct.lastname like ''' + '%' + @LastName  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- Training Course Name
	if @TrainingCourseName is not null and @TrainingCourseName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.TrainingCourseName like ''' + '%' + @TrainingCourseName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Company Name where Training is conducted
	if @CompanyNameWhereTrainingConducted is not null and @CompanyNameWhereTrainingConducted != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CompanyNameWhereTrainingConducted like ''' + '%' + @CompanyNameWhereTrainingConducted  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- How Many Attended
	if @HowManyAttended is not null and @HowManyAttended != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.HowManyAttended like ''' + '%' + @HowManyAttended  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- First Name
	if @FirstName is not null and @FirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.FirstName like ''' + '%' + @FirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Title
	if @Title is not null and @Title != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Title like ''' + '%' + @Title  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- ContactsDepartment
	if @ContactsDepartment is not null and @ContactsDepartment != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ContactsDepartment like ''' + '%' + @ContactsDepartment  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- ContactsRole
	if @ContactsRole is not null and @ContactsRole != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ContactsRole like ''' + '%' + @ContactsRole  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	--@MobilePhone
	if @MobilePhone is not null and @MobilePhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.MobilePhone like ''' + '%' + @MobilePhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	--@HomePhone
	if @HomePhone is not null and @HomePhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.HomePhone like ''' + '%' + @HomePhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- Fax
	if @Fax is not null and @Fax != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Fax like ''' + '%' + @Fax  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	
	-- PersonalEmail
	if @PersonalEmail is not null and @PersonalEmail != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.PersonalEmail like ''' + '%' + @PersonalEmail  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Address
	if @Address is not null and @Address != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Address like ''' + '%' + @Address  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Zip
	if @Zip is not null and @Zip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Zip like ''' + '%' + @Zip  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For City
	if @City is not null and @City != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.City like ''' + '%' + @City  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For State
	if @State is not null and @State != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.State like ''' + '%' + @State  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Country
	if @Country is not null and @Country != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Country like ''' + '%' + @Country  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Attempted Date
	if @LastAttemptedDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastAttemptedDate = ''' + Convert(Varchar,@LastAttemptedDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Last Emailed Date
	if @LastEmailedDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastEmailedDate = ''' + Convert(Varchar,@LastEmailedDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Last Meeting Date
	if @LastMeetingDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastMeetingDate = ''' + Convert(Varchar,@LastMeetingDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Letter Sent Date
	if @LetterSentDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LetterSentDate = ''' + Convert(Varchar,@LetterSentDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Spouse Name
	if @SpouseName is not null and @SpouseName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.SpouseName like ''' + '%' + @SpouseName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	
	-- For ReferredBy
	if @ReferredBy is not null and @ReferredBy != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ReferredBy like ''' + '%' + @ReferredBy  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Notes
	if @Notes is not null and @Notes != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Notes like ''' + '%' + @Notes  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- Phone
	if @Phone is not null and @Phone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Phone like ''' + '%' + @Phone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Email
	if @Email is not null and @Email != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Email like ''' + '%' + @Email  + '%' + ''''
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
		SET @SQLString = @SQLString + 'ct.DiscussionTopic like ''' + '%' + @DiscussionTopic  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Action Step
	if @ActionStep is not null and @ActionStep != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ActionStep like ''' + '%' + @ActionStep  + '%' + ''''
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
		SET @SQLString = @SQLString + 'ct.BossName like ''' + '%' + @BossName  + '%' + ''''
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

/****** Object:  StoredProcedure [dbo].[sp_GetAllEvents]    Script Date: 03/05/2013 11:32:30 ******/
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

		

	 if (@Role = 'Corporate' or @Role = 'SiteAdmin' or @Role = 'HomeOfficeAdmin')

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




    if (@Role = 'FranchiseeOwner' or @Role = 'Client')

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

/****** Object:  StoredProcedure [dbo].[sp_InsertContact]    Script Date: 03/05/2013 11:32:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_InsertContact]


	 (
		@COMPANIESID int, @LastName varchar(50), @FirstName varchar(50),
		@Title varchar(50),@ContactsDepartment varchar(50),
		@ContactsRole varchar(50),
		@Phone varchar(50), @MobilePhone varchar(50),@HomePhone varchar(50),
		@Fax varchar(50), @Email varchar(50),
		@PersonalEmail varchar(50),
		@Address varchar(150),	@City varchar(50), @State varchar(50), 
		@Zip varchar(50),
		@Country varchar(50),@Value int, @ApptSourceId int, @RegForTrainingId int, @CourseId int, 
        @CourseTrngDate datetime, @DiscussionTopic varchar(50), 
        @ACTIONSTEP varchar(50), 
        @LastAttemptedDate datetime,@LastEmailedDate datetime,@LastMeetingDate datetime,@LetterSentDate datetime,
        @Last_Contact_Date datetime, @Next_Contact_Date datetime, @CreatedBy varchar(50),
        @CallBackValue int,
        @Birthday datetime,@Anniversary datetime, @CompanyYears int, @BossName varchar(50),
        @SpouseName  varchar(50),
        @ReferredBy varchar(50),
        @Notes varchar(1000),
        @TrainingCourseName varchar(150),
        @HowManyAttended int,
        @CompanyNameWhereTrainingConducted varchar(150)

	 )

	

 AS
		

	 if(@CourseId = 0) 
 
	Begin

	 Set @CourseId = null

	 End
 
    if(@HowManyAttended = 0) 
 
	Begin

	 Set @HowManyAttended = null

	 End
 
 
	
	if(@ApptSourceId = 0) 

	 Begin
 
	Set @ApptSourceId = null

	 End


      if(@CompanyYears = 0) 
 
	Begin

	 Set @CompanyYears = null

	 End
	 
	if @Last_Contact_Date < '2/1/1755'

	 Begin

	  Set @Last_Contact_Date = null

	 End


    if @Next_Contact_Date < '2/1/1755'

	 Begin

	  Set @Next_Contact_Date = null

	 End

    if @LastAttemptedDate < '2/1/1755'

	 Begin

	  Set @LastAttemptedDate = null

	 End
	
	if @LastEmailedDate < '2/1/1755'

	 Begin

	  Set @LastEmailedDate = null

	 End
	 
	 if @LastMeetingDate < '2/1/1755'

	 Begin

	  Set @LastMeetingDate = null

	 End
	 
	 if @LetterSentDate < '2/1/1755'

	 Begin

	  Set @LetterSentDate = null

	 End
	

 	if @CourseTrngDate < '2/1/1755'

	 Begin

	  Set @CourseTrngDate = null

	 End

	if @Birthday < '2/1/1755'

	 Begin

	  Set @Birthday = null

	 End
	 
	 
	 if @Anniversary < '2/1/1755'

	 Begin

	  Set @Anniversary = null

	 End

	Insert into tbl_contacts 

	 (COMPANYID, LastName,FirstName,
	 Title ,ContactsDepartment ,ContactsRole,Phone,Email, IsNewAppointment,ApptSourceId,IsRegisteredForTraining,
	 CourseId,CourseTrainingDate, DiscussionTopic,ActionStep,LAST_CONTACT_DATE,NEXT_CONTACT_DATE, 
	 IsActive, CreatedBy, IsEmailSubscription,IsNeedCallBack,CallBackCreatedDate,Birthday,Anniversary,CompanyYears,BossName,
	 MobilePhone,HomePhone,Fax,PersonalEmail,Address,City,State,Zip,Country,LastAttemptedDate,LastEmailedDate,LastMeetingDate,
     LetterSentDate,SpouseName,ReferredBy,Notes,
     TrainingCourseName, HowManyAttended,CompanyNameWhereTrainingConducted)

	 values

	 (@COMPANIESID , @LastName , @FirstName ,@Title ,@ContactsDepartment,@ContactsRole,@Phone , @Email,
	 @Value , @ApptSourceId , @RegForTrainingId , @CourseId , @CourseTrngDate , @DiscussionTopic , @ACTIONSTEP, 
     @Last_Contact_Date , @Next_Contact_Date,1,@CreatedBy,1,@CallBackValue,GETDATE(),@Birthday,@Anniversary,@CompanyYears,@BossName,
     @MobilePhone , @HomePhone ,@Fax , @PersonalEmail , @Address , @City , @State , @Zip , @Country ,@LastAttemptedDate , @LastEmailedDate ,
     @LastMeetingDate,@LetterSentDate,@SpouseName,@ReferredBy,@Notes,
     @TrainingCourseName, @HowManyAttended,@CompanyNameWhereTrainingConducted)

	
 
	/* SET NOCOUNT ON */

	 RETURN








GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateContactDetails]    Script Date: 03/05/2013 11:32:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_UpdateContactDetails]	

	 (		

		@ContactsID int, @CompanyID int, @LastName varchar(50),
        @FirstName varchar(50), 
        @Title varchar(50),@ContactsDepartment varchar(50),
		@ContactsRole varchar(50),
        @Phone varchar(50), @MobilePhone varchar(50),@HomePhone varchar(50),
		@Fax varchar(50),
        @Email varchar(50), 
        @PersonalEmail varchar(50),
		@Address varchar(150),	@City varchar(50), @State varchar(50), 
		@Zip varchar(50),
		@Country varchar(50),
        @DiscussionTopic varchar(50), 
        @ActionStep varchar(50), 
        @LastAttemptedDate datetime,@LastEmailedDate datetime,
        @LastMeetingDate datetime,@LetterSentDate datetime,
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
        @BossName varchar(50),
        @SpouseName  varchar(50),
        @ReferredBy varchar(50),
        @Notes varchar(1000),
        @TrainingCourseName varchar(150),
        @HowManyAttended int,
        @CompanyNameWhereTrainingConducted varchar(150)

	 )

	

 AS

	 if(@CourseId = 0) 
 
	 Begin

	 Set @CourseId = null

	 End
 
  if(@HowManyAttended = 0) 
 
	Begin

	 Set @HowManyAttended = null

	 End
 
	
	if(@AppsSourceId = 0) 

	 Begin
 
	   Set @AppsSourceId = null

	 End


    if(@CompanyYears = 0) 
 
	Begin

	 Set @CompanyYears = null

	 End
	 
	if @LastDate < '2/1/1755'

	 Begin

	  Set @LastDate = null

	 End


    if @NextDate < '2/1/1755'

	 Begin

	  Set @NextDate = null

	 End

    if @LastAttemptedDate < '2/1/1755'

	 Begin

	  Set @LastAttemptedDate = null

	 End
	
	if @LastEmailedDate < '2/1/1755'

	 Begin

	  Set @LastEmailedDate = null

	 End
	 
	 if @LastMeetingDate < '2/1/1755'

	 Begin

	  Set @LastMeetingDate = null

	 End
	 
	 if @LetterSentDate < '2/1/1755'

	 Begin

	  Set @LetterSentDate = null

	 End
	

 	if @CourseTrngDate < '2/1/1755'

	 Begin

	  Set @CourseTrngDate = null

	 End

	if @BirthDate < '2/1/1755'

	 Begin

	  Set @BirthDate = null

	 End
	 	 
	 if @AnniversaryDate < '2/1/1755'

	 Begin

	  Set @AnniversaryDate = null

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
	 BossName=@BossName,
	 Title = @Title,ContactsDepartment = @ContactsDepartment, 
     ContactsRole = @ContactsRole, 
     MobilePhone = @MobilePhone,
     HomePhone = @HomePhone, 
     Fax = @Fax, 
     PersonalEmail = @PersonalEmail,
     Address = @Address, 
     City = @City, 
     State = @State ,
     Zip = @Zip, 
     LastAttemptedDate = @LastAttemptedDate, 
     LastEmailedDate = @LastEmailedDate, 
     LastMeetingDate = @LastMeetingDate ,
     LetterSentDate = @LetterSentDate, 
     SpouseName = @SpouseName,
     ReferredBy = @ReferredBy, 
     Notes = @Notes ,
     Country = @Country,
     TrainingCourseName = @TrainingCourseName, 
     HowManyAttended = @HowManyAttended,
     CompanyNameWhereTrainingConducted = @CompanyNameWhereTrainingConducted 
	 where CONTACTSID = @ContactsID

	

	 /* SET NOCOUNT ON */

	 RETURN





GO



/****** Object:  StoredProcedure [dbo].[sp_GetAllFranchiseesSearch]    Script Date: 03/06/2013 17:47:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllFranchiseesSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllFranchiseesSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertFranchisee]    Script Date: 03/06/2013 17:47:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertFranchisee]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_InsertFranchisee]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateFranchiseeDetails]    Script Date: 03/06/2013 17:47:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UpdateFranchiseeDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UpdateFranchiseeDetails]
GO


/****** Object:  StoredProcedure [dbo].[sp_GetAllFranchiseesSearch]    Script Date: 03/06/2013 17:47:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetAllFranchiseesSearch]
	
	(
		@Name varchar(500),
		@LastName varchar(50),
        @FirstName varchar(50),
        @Title varchar(80),
        @OfficePhone varchar(50),
        @MobilePhone varchar(50),
        @Fax varchar(50),
        @WorkEmail varchar(80),
        @WorkAddress varchar(200),
        @WorkCity varchar(50),
        @WorkZip varchar(50),
        @SpouseName varchar(50),
        @YearsWithCompany varchar(50),
        @HomePhone varchar(50),
        @AlternateEmail varchar(80),
        @HomeAddress varchar(200),
        @HomeCity varchar(50),
        @HomeZip varchar(50),
        @InitialContractDate datetime,
        @RenewalDate datetime,
        @ContractFormDate datetime,
        @DHSAwardDate datetime,
        @InitialTrngDate datetime,
        @BirthDay datetime,
        @Anniversary datetime,
		@SandlerRoleID varchar(50),
        @IsPartOfMasterFranchisee varchar(50),
        @MasterFranchiseeID varchar(50),
        @IsCanPrintLocally varchar(50),
        @IsBuyFromCustomer varchar(50),
        @IsFixedPricePurchase varchar(50),
        @CostPlusAmountID varchar(50),
        @IsBehindInTerDev varchar(50),
        @BehindAmountID varchar(50),
        @CoachID varchar(50),
        @AwardLevelID varchar(50),
        @PurchaseLevelID varchar(50),
        @PrimaryBusinessID varchar(50),
        @CertifiedLevelID varchar(50),
        @IsContractorsPermitted varchar(50), 
        @IsKOLMember varchar(50), 
        @IsAdvBoard varchar(50), 
        @IsMktgCommittee varchar(50), 
        @IsUsingSandlerCRM varchar(50), 
        @IsDHSAwardWinner varchar(50), 
        @IsSandlerMailRequired varchar(50), 
        @IsReqToSubmitFinancials varchar(50), 
        @IsRepAgreementForGlobalAcct varchar(50), 
        @WorkStateID varchar(50),
        @WorkCountryID varchar(50),
        @HomeStateID varchar(50),
        @HomeCountryID varchar(50),
        @IsSameHomeAddress varchar(50),
        @Territory varchar(120),
        @BusinessFocusArea varchar(50),
        @ClosestMetroArea varchar(50)
				
	)
	
AS
	
	if @InitialContractDate < '2/1/1755'
	Begin
	  Set @InitialContractDate = null
	End
	if @RenewalDate < '2/1/1755'
	Begin
	  Set @RenewalDate = null
	End
	if @ContractFormDate < '2/1/1755'
	Begin
	  Set @ContractFormDate = null
	End
	if @DHSAwardDate < '2/1/1755'
	Begin
	  Set @DHSAwardDate = null
	End
	if @InitialTrngDate < '2/1/1755'
	 Begin
	  Set @InitialTrngDate = null
	 End
	if @BirthDay < '2/1/1755'
	 Begin
	  Set @BirthDay = null
	 End
	if @Anniversary < '2/1/1755'
	 Begin
	  Set @Anniversary = null
	 End
	
	DECLARE @SQLString VARCHAR(8000);
	Declare @PrevConditionExist varchar(10);
	Set @PrevConditionExist = 'No';
	
		
	-- Base SQL string stetement
	Set @SQLString = 'SELECT fr.ID, 
fr.LastName as "Last Name", 
fr.FirstName as "First Name",fr.Name as "Franchise Name",
fr.Title,
fr.OfficePhone,
fr.HomePhone,
fr.MobilePhone,
fr.Fax, 
fr.WorkEmail as "Primary Office Email", 
fr.WorkAddress as "Primary Office Address", 
fr.WorkCity as "Primary Office City",
fr.WorkZip as "Primary Office Zip",
fr.AlternateEmail,fr.HomeAddress, fr.HomeCity, fr.HomeZip,
fr.Territory,fr.BusinessFocusArea,fr.ClosestMetroArea,
ISNULL(fr.SpouseName,'') as SpouseName,ISNULL(fr.YearswithCompany,'') as YearswithCompany,
ISNULL(ysn1.Description, ''No'') as IsCanPrintLocally,
ISNULL(ysn2.Description, ''No'') as IsBuyFromCustomer,
ISNULL(ysn3.Description, ''No'') as IsMasterFranchiseeExists,
ISNULL(ysn4.Description, ''No'') as IsFixedPricePurchase,
ISNULL(ysn5.Description, ''No'') as IsBehindInTerDev,
ISNULL(ysn6.Description, ''No'') as IsContractorPermitted,
ISNULL(ysn7.Description, ''No'') as IsSandlerMailRequired,
ISNULL(ysn8.Description, ''No'') as IsKOLMember,
ISNULL(ysn9.Description, ''No'') as IsAdvBoard,
ISNULL(ysn10.Description, ''No'') as IsMktgCommittee,
ISNULL(ysn11.Description, ''No'') as IsUsingSandlerCRM,
ISNULL(ysn12.Description, ''No'') as IsDHSAwardWinner,
ISNULL(ysn13.Description, ''No'') as IsReqToSubmitFinancial,
ISNULL(ysn14.Description, ''No'') as IsRepAgreement,
ISNULL(ysn15.Description, ''No'') as IsSameHomeAddress,
ISNULL(bhamt.BehindAmountText,'''') as BehindAmount,
ISNULL(sndr.SandlerRoleText,'''') as SandlerRole,
ISNULL(awdl.AwardLevelText,'''') as AwardLevel,
ISNULL(pusl.PurchaseLevelText,'''') as PurchaseLevel,
ISNULL(cerl.CertifiedLevelText,'''') as CertifiedLevel,
ISNULL(prmbus.PrimaryBusinessText,'''') as PrimaryBusiness,
ISNULL(fr.InitialContractDate, '''') as InitialContractDate, 
ISNULL(fr.RenewalDate, '''') as RenewalDate, 
ISNULL(fr.ContractFormDate, '''') as ContractFormDate, 
ISNULL(fr.DHSAwardDate, '''') as DHSAwardDate, 
ISNULL(fr.InitialTrngDate, '''') as InitialTrngDate, 
ISNULL(fr.BirthDay, '''') as BirthDay, 
ISNULL(fr.Anniversary, '''') as Anniversary, 
ISNULL(mfz.MasterFranchiseeName,'''') as MasterFrName,
ISNULL(cpamt.CostPlusAmountText,'''') as CostPlusAmount,
ISNULL(state1.Name,'''') as WorkState,
ISNULL(state2.Name,'''') as HomeState,
ISNULL(cnt1.Name,'''') as "Primary Office Country",
ISNULL(cnt2.Name,'''') as HomeCountry,
(ch.FirstName + '''' + ch.LastName) as CoachName,
ISNULL(fr.LastCreatedDate, '''') as LastUpdatedDate, 
rg.Name as RegionName
FROM TBL_Franchisee fr
left outer join tbl_MasterFranchisee mfz on mfz.MasterFranchiseeId = fr.MasterFranchiseeId
left outer join Tbl_YesNoOptions ysn1 on ysn1.Value = fr.IsCanPrintLocally
left outer join Tbl_YesNoOptions ysn2 on ysn2.Value = fr.IsBuyFromCustomer
left outer join Tbl_YesNoOptions ysn3 on ysn3.Value = fr.IsMasterFranchiseeExists
left outer join Tbl_YesNoOptions ysn4 on ysn4.Value = fr.IsFixedPricePurchase
left outer join Tbl_YesNoOptions ysn5 on ysn5.Value = fr.IsBehindInTerDev
left outer join Tbl_YesNoOptions ysn6 on ysn6.Value = fr.IsContractorPermitted
left outer join Tbl_YesNoOptions ysn7 on ysn7.Value = fr.IsSandlerMailRequired
left outer join Tbl_YesNoOptions ysn8 on ysn8.Value = fr.IsKOLMember
left outer join Tbl_YesNoOptions ysn9 on ysn9.Value = fr.IsAdvBoard
left outer join Tbl_YesNoOptions ysn10 on ysn10.Value = fr.IsMktgCommittee
left outer join Tbl_YesNoOptions ysn11 on ysn11.Value = fr.IsUsingSandlerCRM
left outer join Tbl_YesNoOptions ysn12 on ysn12.Value = fr.IsDHSAwardWinner
left outer join Tbl_YesNoOptions ysn13 on ysn13.Value = fr.IsReqToSubmitFinancial
left outer join Tbl_YesNoOptions ysn14 on ysn14.Value = fr.IsRepAgreement
left outer join Tbl_YesNoOptions ysn15 on ysn15.Value = fr.IsSameHomeAddress
left outer join Tbl_State state1  on state1.Id = fr.WorkStateId
left outer join Tbl_State state2  on state2.Id = fr.HomeStateId
left outer join Tbl_Country cnt1  on cnt1.Id = fr.WorkCountryId
left outer join Tbl_Country cnt2  on cnt2.Id = fr.HomeCountryId
left outer join Tbl_AwardLevel awdl on awdl.AwardLevelId = fr.AwardLevelId
left outer join Tbl_PurchaseLevel pusl on pusl.PurchaseLevelId = fr.PurchaseLevelId
left outer join Tbl_CertifiedLevel cerl on cerl.CertifiedLevelId = fr.CertifiedLevelId
left outer join Tbl_PrimaryBusiness prmbus on prmbus.PrimaryBusinessId = fr.PrimaryBusinessId
left outer join Tbl_SandlerRole sndr on sndr.SandlerRoleId = fr.SandlerRoleId
left outer join Tbl_BehindAmount bhamt on bhamt.BehindAmountId = fr.BehindAmountId
left outer join tbl_CostPlusAmount cpamt on cpamt.CostPlusAmountId = fr.CostPlusAmountId
inner join TBL_COACH ch on ch.Id = fr.CoachID
inner join TBL_REGION rg on rg.Id = ch.regionId
	where ('
	-- Add based on the selection by the user - at least one selection will be there
	if @Name is not null and @Name != ''
	Begin
		SET @SQLString = @SQLString + 'fr.NAME like ''' + '%' + @Name  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Last Name
	if @LastName is not null and @LastName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.LastName like ''' + '%' + @LastName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- First Name
	if @FirstName is not null and @FirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.FirstName like ''' + '%' + @FirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Title
	if @Title is not null and @Title != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.Title like ''' + '%' + @Title  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- OfficePhone
	if @OfficePhone is not null and @OfficePhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.OfficePhone like ''' + '%' + @OfficePhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- MobilePhone
	if @MobilePhone is not null and @MobilePhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.MobilePhone like ''' + '%' + @MobilePhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Fax
	if @Fax is not null and @Fax != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.Fax like ''' + '%' + @Fax  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- WorkEmail
	if @WorkEmail is not null and @WorkEmail != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.WorkEmail like ''' + '%' + @WorkEmail  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- WorkAddress
	if @WorkAddress is not null and @WorkAddress != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.WorkAddress like ''' + '%' + @WorkAddress  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- WorkCity
	if @WorkCity is not null and @WorkCity != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.WorkCity like ''' + '%' + @WorkCity  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- WorkZip
	if @WorkZip is not null and @WorkZip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.WorkZip like ''' + '%' + @WorkZip  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- SpouseName
	if @SpouseName is not null and @SpouseName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.SpouseName like ''' + '%' + @SpouseName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Years with Company
	if @YearsWithCompany is not null and @YearsWithCompany != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.YearsWithCompany = (' + @YearsWithCompany + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	-- HomePhone
	if @HomePhone is not null and @HomePhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.HomePhone like ''' + '%' + @HomePhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- AlternateEmail
	if @AlternateEmail is not null and @AlternateEmail != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.AlternateEmail like ''' + '%' + @AlternateEmail  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- HomeAddress
	if @HomeAddress is not null and @HomeAddress != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.HomeAddress like ''' + '%' + @HomeAddress  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End	
	-- HomeCity
	if @HomeCity is not null and @HomeCity != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.HomeCity like ''' + '%' + @HomeCity  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End	
	-- HomeZip
	if @HomeZip is not null and @HomeZip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.HomeZip like ''' + '%' + @HomeZip  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Territory
	if @Territory is not null and @Territory != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.Territory like ''' + '%' + @Territory  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End	
	-- BusinessFocusArea
	if @BusinessFocusArea is not null and @BusinessFocusArea != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.BusinessFocusArea like ''' + '%' + @BusinessFocusArea  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End	
	-- ClosestMetroArea
	if @ClosestMetroArea is not null and @ClosestMetroArea != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.ClosestMetroArea like ''' + '%' + @ClosestMetroArea  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End			
	-- For Initial Contract Date
	if @InitialContractDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.InitialContractDate = ''' + Convert(Varchar,@InitialContractDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Renewal Date
	if @RenewalDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.RenewalDate = ''' + Convert(Varchar,@RenewalDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Contract Form Date
	if @ContractFormDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.ContractFormDate = ''' + Convert(Varchar,@ContractFormDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For DHS Award Date
	if @DHSAwardDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.DHSAwardDate = ''' + Convert(Varchar,@DHSAwardDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Initial Trng Date
	if @InitialTrngDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.InitialTrngDate = ''' + Convert(Varchar,@InitialTrngDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For BirthDay
	if @BirthDay is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.BirthDay = ''' + Convert(Varchar,@BirthDay,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Anniversary
	if @Anniversary is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.Anniversary = ''' + Convert(Varchar,@Anniversary,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Sandler Role ID
	if @SandlerRoleID is not null and @SandlerRoleID != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.SandlerRoleId in (' + @SandlerRoleID + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Is Part Of Master Franchisee
	if @IsPartOfMasterFranchisee is not null and @IsPartOfMasterFranchisee != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.IsMasterFranchiseeExists in (' + @IsPartOfMasterFranchisee + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--for Master Franchisee ID
	if @MasterFranchiseeID is not null and @MasterFranchiseeID != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.MasterFranchiseeID in (' + @MasterFranchiseeID + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--for Can Print Locally
	if @IsCanPrintLocally is not null and @IsCanPrintLocally != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.IsCanPrintLocally in (' + @IsCanPrintLocally + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--for Is Buy From Customer
	if @IsBuyFromCustomer is not null and @IsBuyFromCustomer != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.IsBuyFromCustomer in (' + @IsBuyFromCustomer + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--for Is Fixed Price Purchase
	if @IsFixedPricePurchase is not null and @IsFixedPricePurchase != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.IsFixedPricePurchase in (' + @IsFixedPricePurchase + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--for Cost Plus Amount ID
	if @CostPlusAmountID is not null and @CostPlusAmountID != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.CostPlusAmountID in (' + @CostPlusAmountID + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--for Behind Amount ID
	if @BehindAmountID is not null and @BehindAmountID != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.BehindAmountID in (' + @BehindAmountID + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--for CoachID
	if @CoachID is not null and @CoachID != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.CoachID in (' + @CoachID + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--for AwardLevelID
	if @AwardLevelID is not null and @AwardLevelID != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.AwardLevelID in (' + @AwardLevelID + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--for PurchaseLevelID
	if @PurchaseLevelID is not null and @PurchaseLevelID != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.PurchaseLevelID in (' + @PurchaseLevelID + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--for Primary Business ID
	if @PrimaryBusinessID is not null and @PrimaryBusinessID != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.PrimaryBusinessID in (' + @PrimaryBusinessID + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--for Certified Level ID
	if @CertifiedLevelID is not null and @CertifiedLevelID != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.CertifiedLevelID in (' + @CertifiedLevelID + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--Is Contractors Permitted
	if @IsContractorsPermitted is not null and @IsContractorsPermitted != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.IsContractorPermitted in (' + @IsContractorsPermitted + ')'
		Set @PrevConditionExist = 'Yes'; 
	End		
	--Is IsKOLMember
	if @IsKOLMember is not null and @IsKOLMember != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.IsKOLMember in (' + @IsKOLMember + ')'
		Set @PrevConditionExist = 'Yes'; 
	End		
	--Is IsAdvBoard
	if @IsAdvBoard is not null and @IsAdvBoard != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.IsAdvBoard in (' + @IsAdvBoard + ')'
		Set @PrevConditionExist = 'Yes'; 
	End		
	--Is IsMktgCommittee
	if @IsMktgCommittee is not null and @IsMktgCommittee != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.IsMktgCommittee in (' + @IsMktgCommittee + ')'
		Set @PrevConditionExist = 'Yes'; 
	End		
	--Is IsUsingSandlerCRM
	if @IsUsingSandlerCRM is not null and @IsUsingSandlerCRM != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.IsUsingSandlerCRM in (' + @IsUsingSandlerCRM + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--Is IsDHSAwardWinner
	if @IsDHSAwardWinner is not null and @IsDHSAwardWinner != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.IsDHSAwardWinner in (' + @IsDHSAwardWinner + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--Is IsSandlerMailRequired
	if @IsSandlerMailRequired is not null and @IsSandlerMailRequired != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.IsSandlerMailRequired in (' + @IsSandlerMailRequired + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--Is IsReqToSubmitFinancials
	if @IsReqToSubmitFinancials is not null and @IsReqToSubmitFinancials != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.IsReqToSubmitFinancial in (' + @IsReqToSubmitFinancials + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--Is IsRepAgreementForGlobalAcct
	if @IsRepAgreementForGlobalAcct is not null and @IsRepAgreementForGlobalAcct != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.IsRepAgreement in (' + @IsRepAgreementForGlobalAcct + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--Is WorkStateId
	if @WorkStateID is not null and @WorkStateID != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.WorkStateId in (' + @WorkStateID + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--Is WorkCountryID
	if @WorkCountryID is not null and @WorkCountryID != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.WorkCountryID in (' + @WorkCountryID + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--Is HomeStateID
	if @HomeStateID is not null and @HomeStateID != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.HomeStateID in (' + @HomeStateID + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--Is @HomeCountryID
	if @HomeCountryID is not null and @HomeCountryID != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.HomeCountryID in (' + @HomeCountryID + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--Is IsSameHomeAddress
	if @IsSameHomeAddress is not null and @IsSameHomeAddress != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.IsSameHomeAddress in (' + @IsSameHomeAddress + ')'
		Set @PrevConditionExist = 'Yes'; 
	End		
		
	-- End of conditons so we need to close with bracket
	SET @SQLString = @SQLString + ')' ;
	-- Order By
	SET @SQLString = @SQLString + ' ORDER BY fr.NAME ' ;
    -- Now Print/Execute the Statement
    Print @SQLString
    EXEC(@SQLString);
	
		
	
	RETURN
	
	




GO

/****** Object:  StoredProcedure [dbo].[sp_InsertFranchisee]    Script Date: 03/06/2013 17:47:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[sp_InsertFranchisee]
	(	
		@Name varchar(500),
		@LastName varchar(50),
        @FirstName varchar(50),
        @Title varchar(80),
        @OfficePhone varchar(50),
        @MobilePhone varchar(50),
        @Fax varchar(50),
        @WorkEmail varchar(80),
        @WorkAddress varchar(200),
        @WorkCity varchar(50),
        @WorkZip varchar(50),
        @SpouseName varchar(50),
        @YearsWithCompany int,
        @HomePhone varchar(50),
        @AlternateEmail varchar(80),
        @HomeAddress varchar(200),
        @HomeCity varchar(50),
        @HomeZip varchar(50),
        @InitialContractDate datetime,
        @RenewalDate datetime,
        @ContractFormDate datetime,
        @DHSAwardDate datetime,
        @InitialTrngDate datetime,
        @BirthDay datetime,
        @Anniversary datetime,
		@SandlerRoleID int,
        @IsPartOfMasterFranchisee int,
        @MasterFranchiseeID int,
        @IsCanPrintLocally int,
        @IsBuyFromCustomer int,
        @IsFixedPricePurchase int,
        @CostPlusAmountID int,
        @IsBehindInTerDev int,
        @BehindAmountID int,
        @CoachID int,
        @AwardLevelID int,
        @PurchaseLevelID int,
        @PrimaryBusinessID int,
        @CertifiedLevelID int,
        @IsContractorsPermitted int, 
        @IsKOLMember int, 
        @IsAdvBoard int, 
        @IsMktgCommittee int, 
        @IsUsingSandlerCRM int, 
        @IsDHSAwardWinner int, 
        @IsSandlerMailRequired int, 
        @IsReqToSubmitFinancials int, 
        @IsRepAgreementForGlobalAcct int, 
        @WorkStateID int,
        @WorkCountryID int,
        @HomeStateID int,
        @HomeCountryID int,
        @IsSameHomeAddress int,
        @Territory varchar(120),
        @BusinessFocusArea varchar(50),
        @ClosestMetroArea varchar(50)
        
        
        
	 )
AS
	
	if @InitialContractDate < '2/1/1755'
	Begin
	  Set @InitialContractDate = null
	End
	if @RenewalDate < '2/1/1755'
	Begin
	  Set @RenewalDate = null
	End
	if @ContractFormDate < '2/1/1755'
	Begin
	  Set @ContractFormDate = null
	End
	if @DHSAwardDate < '2/1/1755'
	Begin
	  Set @DHSAwardDate = null
	End
	if @InitialTrngDate < '2/1/1755'
	 Begin
	  Set @InitialTrngDate = null
	 End
	if @BirthDay < '2/1/1755'
	 Begin
	  Set @BirthDay = null
	 End
	if @Anniversary < '2/1/1755'
	 Begin
	  Set @Anniversary = null
	 End
	if(@SandlerRoleID = 0) 
 	 Begin
	 Set @SandlerRoleID = null
	 End
	
	 if(@MasterFranchiseeID = 0) 
 	 Begin
	 Set @MasterFranchiseeID = null
	 End
	 
	 if(@BehindAmountID = 0) 
 	 Begin
	 Set @BehindAmountID = null
	 End
	
	 if(@AwardLevelID = 0) 
 	 Begin
	 Set @AwardLevelID = null
	 End
		
	 if(@PurchaseLevelID = 0) 
 	 Begin
	 Set @PurchaseLevelID = null
	 End
	
	 if(@CoachID = 0) 
 	 Begin
	 Set @CoachID = null
	 End
	
	if(@PrimaryBusinessID = 0) 
 	 Begin
	 Set @PrimaryBusinessID = null
	 End
	
	if(@CertifiedLevelID = 0) 
 	 Begin
	 Set @CertifiedLevelID = null
	 End
	
	if(@WorkStateID = 0) 
 	 Begin
	 Set @WorkStateID = null
	 End
	 
	 if(@WorkCountryID = 0) 
 	 Begin
	 Set @WorkCountryID = null
	 End
	 
	 if(@HomeStateID = 0) 
 	 Begin
	 Set @HomeStateID = null
	 End
	 
	 if(@HomeCountryID = 0) 
 	 Begin
	 Set @HomeCountryID = null
	 End
	
	 if(@CostPlusAmountID = 0) 
 	 Begin
	 Set @CostPlusAmountID = null
	 End
	
	if(@YearsWithCompany = 0) 
 	 Begin
	 Set @YearsWithCompany = null
	 End
	
	
	
	
	Insert into tbl_Franchisee
	(Name,LastName,FirstName, Title,
	OfficePhone,MobilePhone,Fax,WorkEmail,WorkAddress,WorkCity,
	WorkZip,SpouseName,YearsWithCompany, HomePhone,AlternateEmail,HomeAddress,HomeCity,HomeZip,
	InitialContractDate, RenewalDate, ContractFormDate, DHSAwardDate, InitialTrngDate,BirthDay,
	Anniversary,SandlerRoleID,
        IsMasterFranchiseeExists,
        MasterFranchiseeID,
        IsCanPrintLocally,
        IsBuyFromCustomer,
        IsFixedPricePurchase,
        CostPlusAmountID,
        IsBehindInTerDev,
        BehindAmountID,
        CoachID,
        AwardLevelID,
        PurchaseLevelID,
        PrimaryBusinessID,
        CertifiedLevelID,
        IsContractorPermitted, 
        IsKOLMember, 
        IsAdvBoard, 
        IsMktgCommittee, 
        IsUsingSandlerCRM, 
        IsDHSAwardWinner, 
        IsSandlerMailRequired, 
        IsReqToSubmitFinancial, 
        IsRepAgreement, 
        WorkStateID,
        WorkCountryID,
        HomeStateID,
        HomeCountryID,
        IsSameHomeAddress,
        CreatedDate,
        LastCreatedDate,
        Territory,
        BusinessFocusArea,
        ClosestMetroArea
	
	)
	values
	(@Name,@LastName,
        @FirstName,
        @Title,
        @OfficePhone,
        @MobilePhone,
        @Fax,
        @WorkEmail,
        @WorkAddress,
        @WorkCity,
        @WorkZip,
        @SpouseName,
        @YearsWithCompany,
        @HomePhone,
        @AlternateEmail,
        @HomeAddress,
        @HomeCity,
        @HomeZip,
        @InitialContractDate,
        @RenewalDate,
        @ContractFormDate,
        @DHSAwardDate,
        @InitialTrngDate,
        @BirthDay,
        @Anniversary,
		@SandlerRoleID,
        @IsPartOfMasterFranchisee,
        @MasterFranchiseeID,
        @IsCanPrintLocally,
        @IsBuyFromCustomer,
        @IsFixedPricePurchase,
        @CostPlusAmountID,
        @IsBehindInTerDev,
        @BehindAmountID,
        @CoachID,
        @AwardLevelID,
        @PurchaseLevelID,
        @PrimaryBusinessID,
        @CertifiedLevelID,
        @IsContractorsPermitted, 
        @IsKOLMember, 
        @IsAdvBoard, 
        @IsMktgCommittee, 
        @IsUsingSandlerCRM, 
        @IsDHSAwardWinner, 
        @IsSandlerMailRequired, 
        @IsReqToSubmitFinancials, 
        @IsRepAgreementForGlobalAcct, 
        @WorkStateID,
        @WorkCountryID,
        @HomeStateID,
        @HomeCountryID,
        @IsSameHomeAddress, GETDATE(),GETDATE(),
        @Territory,
        @BusinessFocusArea,
        @ClosestMetroArea)
	
	/* SET NOCOUNT ON */
	RETURN







GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateFranchiseeDetails]    Script Date: 03/06/2013 17:47:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[sp_UpdateFranchiseeDetails]
	(
		
		@LastName varchar(50),
        @FirstName varchar(50),
        @Title varchar(80),
        @OfficePhone varchar(50),
        @MobilePhone varchar(50),
        @Fax varchar(50),
        @WorkEmail varchar(80),
        @WorkAddress varchar(200),
        @WorkCity varchar(50),
        @WorkZip varchar(50),
        @SpouseName varchar(50),
        @YearsWithCompany int,
        @HomePhone varchar(50),
        @AlternateEmail varchar(80),
        @HomeAddress varchar(200),
        @HomeCity varchar(50),
        @HomeZip varchar(50),
        @InitialContractDate datetime,
        @RenewalDate datetime,
        @ContractFormDate datetime,
        @DHSAwardDate datetime,
        @InitialTrngDate datetime,
        @BirthDay datetime,
        @Anniversary datetime,
		@SandlerRoleID int,
        @IsPartOfMasterFranchisee int,
        @MasterFranchiseeID int,
        @IsCanPrintLocally int,
        @IsBuyFromCustomer int,
        @IsFixedPricePurchase int,
        @CostPlusAmountID int,
        @IsBehindInTerDev int,
        @BehindAmountID int,
        @CoachID int,
        @AwardLevelID int,
        @PurchaseLevelID int,
        @PrimaryBusinessID int,
        @CertifiedLevelID int,
        @IsContractorsPermitted int, 
        @IsKOLMember int, 
        @IsAdvBoard int, 
        @IsMktgCommittee int, 
        @IsUsingSandlerCRM int, 
        @IsDHSAwardWinner int, 
        @IsSandlerMailRequired int, 
        @IsReqToSubmitFinancials int, 
        @IsRepAgreementForGlobalAcct int, 
        @WorkStateID int,
        @WorkCountryID int,
        @HomeStateID int,
        @HomeCountryID int,
        @IsSameHomeAddress int,
        @FrId int,
        @FranchiseName varchar(500),
        @Territory varchar(120),
        @BusinessFocusArea varchar(50),
        @ClosestMetroArea varchar(50)
		
	)
AS
	
	if @InitialContractDate < '2/1/1755'
	Begin
	  Set @InitialContractDate = null
	End
	if @RenewalDate < '2/1/1755'
	Begin
	  Set @RenewalDate = null
	End
	if @ContractFormDate < '2/1/1755'
	Begin
	  Set @ContractFormDate = null
	End
	if @DHSAwardDate < '2/1/1755'
	Begin
	  Set @DHSAwardDate = null
	End
	if @InitialTrngDate < '2/1/1755'
	 Begin
	  Set @InitialTrngDate = null
	 End
	if @BirthDay < '2/1/1755'
	 Begin
	  Set @BirthDay = null
	 End
	if @Anniversary < '2/1/1755'
	 Begin
	  Set @Anniversary = null
	 End
	if(@SandlerRoleID = 0) 
 	 Begin
	 Set @SandlerRoleID = null
	 End
	
	 if(@MasterFranchiseeID = 0) 
 	 Begin
	 Set @MasterFranchiseeID = null
	 End
	 
	 if(@BehindAmountID = 0) 
 	 Begin
	 Set @BehindAmountID = null
	 End
	
	 if(@AwardLevelID = 0) 
 	 Begin
	 Set @AwardLevelID = null
	 End
		
	 if(@PurchaseLevelID = 0) 
 	 Begin
	 Set @PurchaseLevelID = null
	 End
	
	 if(@CoachID = 0) 
 	 Begin
	 Set @CoachID = null
	 End
	
	if(@PrimaryBusinessID = 0) 
 	 Begin
	 Set @PrimaryBusinessID = null
	 End
	
	if(@CertifiedLevelID = 0) 
 	 Begin
	 Set @CertifiedLevelID = null
	 End
	
	if(@WorkStateID = 0) 
 	 Begin
	 Set @WorkStateID = null
	 End
	 
	 if(@WorkCountryID = 0) 
 	 Begin
	 Set @WorkCountryID = null
	 End
	 
	 if(@HomeStateID = 0) 
 	 Begin
	 Set @HomeStateID = null
	 End
	 
	 if(@HomeCountryID = 0) 
 	 Begin
	 Set @HomeCountryID = null
	 End
	
	 if(@CostPlusAmountID = 0) 
 	 Begin
	 Set @CostPlusAmountID = null
	 End
	
	if(@YearsWithCompany = 0) 
 	 Begin
	 Set @YearsWithCompany = null
	 End
	 
	Update tbl_Franchisee

	Set 
	LastName = @LastName,FirstName = @FirstName,Title = @Title,
	Name = @FranchiseName,
	CoachId = @CoachID,
	IsMasterFranchiseeExists = @IsPartOfMasterFranchisee,
	MasterFranchiseeId = @MasterFranchiseeID,
	SandlerRoleId = @SandlerRoleID,
	OfficePhone = @OfficePhone,	HomePhone = @HomePhone,	Fax = @Fax,
	AwardLevelId = @AwardLevelID,PurchaseLevelId = @PurchaseLevelID,
	CertifiedLevelId = @CertifiedLevelID,PrimaryBusinessId = @PrimaryBusinessID,
	InitialContractDate = @InitialContractDate,	RenewalDate = @RenewalDate,	ContractFormDate = @ContractFormDate,
	IsContractorPermitted = @IsContractorsPermitted,IsSandlerMailRequired = @IsSandlerMailRequired,
	IsKOLMember = @IsKOLMember,IsAdvBoard = @IsAdvBoard,IsMktgCommittee = @IsMktgCommittee,
	IsUsingSandlerCRM = @IsUsingSandlerCRM, IsDHSAwardWinner = @IsDHSAwardWinner,
	DHSAwardDate = @DHSAwardDate, InitialTrngDate = @InitialTrngDate,
	IsReqToSubmitFinancial = @IsReqToSubmitFinancials, IsRepAgreement = @IsRepAgreementForGlobalAcct,
	WorkEmail = @WorkEmail,WorkAddress = @WorkAddress, WorkCity = @WorkCity, WorkZip = @WorkZip,
	WorkStateId = @WorkStateID, WorkCountryId = @WorkCountryId,
	AlternateEmail = @AlternateEmail,
	IsSameHomeAddress = @IsSameHomeAddress,
	HomeAddress = @HomeAddress, HomeCity = @HomeCity, HomeZip = @HomeZip,
	HomeStateId = @HomeStateID, HomeCountryId = @HomeCountryId,
	SpouseName = @SpouseName, Birthday = @Birthday,
	Anniversary = @Anniversary, YearsWithCompany = @YearsWithCompany,
	IsCanPrintLocally = @IsCanPrintLocally, IsBuyFromCustomer = @IsBuyFromCustomer,
	IsFixedPricePurchase = @IsFixedPricePurchase, IsBehindinTerDev = @IsBehindinTerDev,
	CostPlusAmountId = @CostPlusAmountID,
	BehindAmountId = @BehindAmountId,
	LastCreatedDate = GETDATE(),
	Territory = @Territory,
    BusinessFocusArea = @BusinessFocusArea,
    ClosestMetroArea = @ClosestMetroArea
	
	where ID = @FrId

	RETURN








GO



/****** Object:  StoredProcedure [dbo].[sp_GetContactDetails]    Script Date: 03/06/2013 19:27:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetContactDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetContactDetails]
GO
 CREATE PROCEDURE [dbo].[sp_GetContactDetails]

	 (

	 @ContactID int 

	 )

AS

		
 
	select



ct
.CONTACTSID,

ct
.LASTNAME,

ct
.FIRSTNAME, 

ct
.Phone, 

ct
.Email, 

ct
.DiscussionTopic,

ct
.ACTIONSTEP,


ISNULL(ct.LAST_CONTACT_DATE, '') as LAST_CONTACT_DATE,


ISNULL(ct.NEXT_CONTACT_DATE, '') as NEXT_CONTACT_DATE,


ISNULL(ct.CourseTrainingDate, '') as CourseTrainingDate,


ISNULL(ct.Birthday,'') as Birthday,


ISNULL(ct.Anniversary,'') as Anniversary,

ct
.CompanyYears,

ct
.BossName,

cp
.COMPANYNAME,cp.COMPANIESID,

yn
.Description as NewApptDescription, ISNULL(yn.Value,0) as Value,

aps
.ApptSourceName,yno.Description as RegForTrngDescription, ISNULL(yno.Value,0) as RegForTrainingId,

ynbe
.Description as BlastEmailDescription, ISNULL(ynbe.Value,0) as BlastEmailId,

yncb
.Description as CallBackDescription, ISNULL(yncb.Value,0) as CallBackValue,

cs
.CourseName, 


ISNULL(cs.courseId,1) as courseId,


ISNULL(aps.ApptSourceId,1) as ApptSourceId,

ct
.Title , ct.ContactsDepartment , ct.ContactsRole ,

ct
.MobilePhone , ct.HomePhone, ct.Fax, ct.PersonalEmail, 

ct
.Address , ct.City , ct.State, ct.Zip ,


ISNULL(ct.LastAttemptedDate, '') as LastAttemptedDate,


ISNULL(ct.LastEmailedDate, '') as LastEmailedDate,


ISNULL(ct.LastMeetingDate, '') as LastMeetingDate,


ISNULL(ct.LetterSentDate, '') as LetterSentDate,

ct
.SpouseName,ct.ReferredBy , ct.Notes , ct.Country,


ISNULL(ct.TrainingCourseName,'') as TrainingCourseName, 

ct
.HowManyAttended,


ISNULL(ct.CompanyNameWhereTrainingConducted,'') as CompanyNameWhereTrainingConducted 


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

