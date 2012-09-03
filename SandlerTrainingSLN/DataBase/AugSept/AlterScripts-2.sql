USE [SandlerDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertContact]    Script Date: 09/03/2012 07:38:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_InsertContact]
	
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
	
	if @Birthday < '2/1/1755'
	Begin
	  Set @Birthday = null
	End
	
	if @Anniversary < '2/1/1755'
	Begin
	  Set @Anniversary = null
	End
	
	
	Insert into tbl_contacts 
	(COMPANYID, LastName,FirstName,Phone,Email, IsNewAppointment,ApptSourceId,IsRegisteredForTraining,
	 CourseId,CourseTrainingDate, DiscussionTopic,ActionStep,LAST_CONTACT_DATE,NEXT_CONTACT_DATE, 
	 IsActive, CreatedBy, IsEmailSubscription,IsNeedCallBack,CallBackCreatedDate,Birthday, Anniversary, CompanyYears, BossName )
	values
	(@COMPANIESID , @LastName , @FirstName ,@Phone , @Email,
	 @Value , @ApptSourceId , @RegForTrainingId , @CourseId , 
     @CourseTrngDate , @DiscussionTopic , @ACTIONSTEP, 
     @Last_Contact_Date , @Next_Contact_Date,1,@CreatedBy,1,@CallBackValue,GETDATE(),@Birthday,@Anniversary,@CompanyYears,@BossName)
	
	/* SET NOCOUNT ON */
	RETURN

GO

USE [SandlerDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetContactDetails]    Script Date: 09/03/2012 07:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	
ALTER PROCEDURE [dbo].[sp_GetContactDetails]
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

USE [SandlerDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateContactDetails]    Script Date: 09/03/2012 07:49:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_UpdateContactDetails]	
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