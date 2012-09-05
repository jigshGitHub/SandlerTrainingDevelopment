USE [SandlerDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertContact]    Script Date: 09/03/2012 22:22:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertContact]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_InsertContact]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateContactDetails]    Script Date: 09/03/2012 22:22:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UpdateContactDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UpdateContactDetails]
GO

USE [SandlerDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertContact]    Script Date: 09/03/2012 22:22:13 ******/
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


     if(@CompanyYears = 0) 
 
	 Begin

	 Set @CompanyYears = null

	 End

		

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

	 IsActive, CreatedBy, IsEmailSubscription,IsNeedCallBack,CallBackCreatedDate,Birthday,Anniversary,CompanyYears,BossName)

	 values

	 (@COMPANIESID , @LastName , @FirstName ,@Phone , @Email,

	 @Value , @ApptSourceId , @RegForTrainingId , @CourseId , 

     @CourseTrngDate , @DiscussionTopic , @ACTIONSTEP, 

     @Last_Contact_Date , @Next_Contact_Date,1,@CreatedBy,1,@CallBackValue,GETDATE(),@Birthday,@Anniversary,@CompanyYears,@BossName)

	
 
	/* SET NOCOUNT ON */

	 RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateContactDetails]    Script Date: 09/03/2012 22:22:13 ******/
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

	 if(@CompanyYears = 0) 
 
	 Begin

	 Set @CompanyYears = null

	 End
	 
	 
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
	BossName=@BossName

	 where CONTACTSID = @ContactsID

	

	 /* SET NOCOUNT ON */

	 RETURN


GO


