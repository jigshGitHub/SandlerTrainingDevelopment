ALTER TABLE TBL_COMPANIES ALTER COLUMN Notes varchar(1000);
ALTER TABLE TBL_CONTACTS ALTER COLUMN Notes varchar(1000);
ALTER TABLE TBL_OPPORTUNITIES ALTER COLUMN Notes varchar(1000);


IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TBL_OPPORTUNITIES_IsBudgeIdentified]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TBL_OPPORTUNITIES] DROP CONSTRAINT [DF_TBL_OPPORTUNITIES_IsBudgeIdentified]
END

GO

ALTER TABLE [dbo].[TBL_OPPORTUNITIES] ADD  CONSTRAINT [DF_TBL_OPPORTUNITIES_IsBudgeIdentified]  DEFAULT ((1)) FOR [IsBudgeIdentified]
GO



IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TBL_OPPORTUNITIES_IsMoveForward]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TBL_OPPORTUNITIES] DROP CONSTRAINT [DF_TBL_OPPORTUNITIES_IsMoveForward]
END

GO


ALTER TABLE [dbo].[TBL_OPPORTUNITIES] ADD  CONSTRAINT [DF_TBL_OPPORTUNITIES_IsMoveForward]  DEFAULT ((1)) FOR [IsMoveForward]
GO                                         
                                                                     
UPDATE [TBL_OPPORTUNITIES] SET  [IsBudgeIdentified] = 1  WHERE [IsBudgeIdentified] IS NULL:
UPDATE [TBL_OPPORTUNITIES] SET  [IsMoveForward] = 1  WHERE [IsMoveForward] IS NULL:                                          
/****** Object:  StoredProcedure [dbo].[sp_InsertCompany]    Script Date: 02/13/2013 14:56:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertCompany]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_InsertCompany]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertContact]    Script Date: 02/13/2013 14:56:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertContact]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_InsertContact]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateCompanyDetails]    Script Date: 02/13/2013 14:56:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UpdateCompanyDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UpdateCompanyDetails]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateContactDetails]    Script Date: 02/13/2013 14:56:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UpdateContactDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UpdateContactDetails]
GO


/****** Object:  StoredProcedure [dbo].[sp_InsertCompany]    Script Date: 02/13/2013 14:56:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[sp_InsertCompany]
	(	
		@CompanyName varchar(50), 
		@CompanyOwnership varchar(50), @CompanyDescription varchar(50),
		@Address varchar(150),	@City varchar(50), @State varchar(50), 
		@Zip varchar(50),
		@Country varchar(50),
		@BillingValue int,
		@BillingAddress varchar(150),
		@BillingCity varchar(50), @BillingState varchar(50), 
		@BillingZip varchar(50),
		@BillingCountry varchar(50),
		@POCLastName varchar(50), @POCFirstName varchar(50),
		@POCPhone varchar(50), 
		@POCDepartment varchar(50),
		@POCEmail varchar(50),
		@POCFax varchar(50),
		@AssistantLastName varchar(50),
		@AssistantFirstName varchar(50),
		@AssistantPhone varchar(50),
		@Value int, 
		@Website varchar(80),
		@EmpQuantity int,
		@COMPANYVALUEGOAL int,
		@IndId int,
		@RepLastName varchar(50),@RepFirstName varchar(50),
		@DiscussionTopic varchar(50), @ActionStep varchar(50),
		@LastContact_Date datetime,@NextContact_Date datetime, 
		@CreationDate datetime, @CreatedBy varchar(50),
		@Notes varchar(1000),
		@FranchiseeId int
	 )
AS
	
	declare @companyID int
	declare @contactID int
	
	if @LastContact_Date < '2/1/1755'
	Begin
	  Set @LastContact_Date = null
	End
	
	if @NextContact_Date < '2/1/1755'
	Begin
	  Set @NextContact_Date = null
	End
	
	if @CreationDate < '2/1/1755'
	Begin
	  Set @CreationDate = null
	End
	
	if(@IndId = 0) 
 	Begin
	 Set @IndId = null
	 End
		
	if(@COMPANYVALUEGOAL = 0) 
 	Begin
	 Set @COMPANYVALUEGOAL = null
	 End
	 
	 if(@EmpQuantity = 0) 
 	Begin
	 Set @EmpQuantity = null
	 End
	
	
	
	
	
	Insert into tbl_Companies
	(CompanyName,
	CompanyOwnership, CompanyDescription,
	Address,City, State, Zip, Country,
	IsSameBillingAddress,BillingAddress ,
	BillingCity , BillingState, 
	BillingZip ,
	BillingCountry,
	POCLastName,POCFirstName,
	POCPhone,
	POCDepartment,
	POCEmail,
	POCFax,
	AssistantLastName,
	AssistantFirstName,
	AssistantPhone,
	IsNewCompany, 
	Website, 
	EmpQuantity,
	COMPANYVALUEGOAL,
	IndustryId,
	 RepLastName,RepFirstName,DiscussionTopic,ActionStep,
	 LastContact_Date,NextContact_Date,CreationDate, CreatedBy, Notes,FranchiseeId,IsActive)
	values
	(@CompanyName, @CompanyOwnership, @CompanyDescription,
	@Address,@City, @State, @Zip,@Country,
	@BillingValue ,
	@BillingAddress ,
	@BillingCity , @BillingState, 
	@BillingZip ,
	@BillingCountry,
	@POCLastName,@POCFirstName,
	@POCPhone, 
	@POCDepartment,
	@POCEmail,
	@POCFax,
	@AssistantLastName,
	@AssistantFirstName,
	@AssistantPhone,
	@Value, 
	@Website,
	@EmpQuantity,
	@COMPANYVALUEGOAL,
	@IndId ,@RepLastName ,@RepFirstName,
	@DiscussionTopic , @ActionStep,	@LastContact_Date,
	@NextContact_Date,@CreationDate,@CreatedBy,@Notes,@FranchiseeId,1)
	
	set @companyID = @@IDENTITY
	
	-- now create the contact if we have the necessary Information for this contact
	if(@RepLastName != '' and @RepFirstName != '')
	
	Begin
	
	-- Now user this Company Id and create record in the Contact Table
		Insert into TBL_CONTACTS(COMPANYID,LASTNAME,FIRSTNAME,PHONE,EMAIL,NEXT_CONTACT_DATE,IsActive,CreatedBy,CreatedDate,UpdatedDate,IsEmailSubscription,IsNeedCallBack,IsRegisteredForTraining,IsNewAppointment) 
		values
		(@companyID,@RepLastName,@RepFirstName,@POCPhone,@POCEmail,@NextContact_Date,1,@CreatedBy,GetDate(),GetDate(),1,0,0,0)
		set @contactID = @@IDENTITY
	
	End
	
	/* SET NOCOUNT ON */
	RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_InsertContact]    Script Date: 02/13/2013 14:56:35 ******/
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
        @Notes varchar(1000)

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
     LetterSentDate,SpouseName,ReferredBy,Notes )

	 values

	 (@COMPANIESID , @LastName , @FirstName ,@Title ,@ContactsDepartment,@ContactsRole,@Phone , @Email,
	 @Value , @ApptSourceId , @RegForTrainingId , @CourseId , @CourseTrngDate , @DiscussionTopic , @ACTIONSTEP, 
     @Last_Contact_Date , @Next_Contact_Date,1,@CreatedBy,1,@CallBackValue,GETDATE(),@Birthday,@Anniversary,@CompanyYears,@BossName,
     @MobilePhone , @HomePhone ,@Fax , @PersonalEmail , @Address , @City , @State , @Zip , @Country ,@LastAttemptedDate , @LastEmailedDate ,
     @LastMeetingDate,@LetterSentDate,@SpouseName,@ReferredBy,@Notes)

	
 
	/* SET NOCOUNT ON */

	 RETURN







GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateCompanyDetails]    Script Date: 02/13/2013 14:56:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_UpdateCompanyDetails]
	(
		@COMPANIESID int,@CompanyName varchar(50), 
		@CompanyOwnership varchar(50), @CompanyDescription varchar(50),
		@Address varchar(150),
		@City varchar(50), @State varchar(50), @Zip varchar(50),
		@Country varchar(50),
		@BillingValue int,
		@BillingAddress varchar(150),
		@BillingCity varchar(50), @BillingState varchar(50), 
		@BillingZip varchar(50),
		@BillingCountry varchar(50),
		@POCLastName varchar(50), @POCFirstName varchar(50),
		@POCPhone varchar(50), 
		@POCDepartment varchar(50),
		@POCEmail varchar(50),
		@POCFax varchar(50),
		@AssistantLastName varchar(50),
		@AssistantFirstName varchar(50),
		@AssistantPhone varchar(50),
		@Value int, 
		@Website varchar(80),
		@EmpQuantity int,
		@COMPANYVALUEGOAL int,
		@IndId int,
		@RepLastName varchar(50),@RepFirstName varchar(50),
		@DiscussionTopic varchar(50), @ActionStep varchar(50),
		@LastContact_Date datetime,@NextContact_Date datetime, 
		@CreationDate datetime, @UpdatedBy varchar(50),
		@Notes varchar(1000)
		
	)
AS
	
	if @LastContact_Date < '2/1/1755'
	Begin
	  Set @LastContact_Date = null
	End
	
	if @NextContact_Date < '2/1/1755'
	Begin
	  Set @NextContact_Date = null
	End
	
	if @CreationDate < '2/1/1755'
	Begin
	  Set @CreationDate = null
	End
	
	if(@IndId = 0) 
 	Begin
	 Set @IndId = null
	 End
		
	if(@COMPANYVALUEGOAL = 0) 
 	Begin
	 Set @COMPANYVALUEGOAL = null
	 End
	 
	 if(@EmpQuantity = 0) 
 	Begin
	 Set @EmpQuantity = null
	 End
	
	
	
	Update tbl_companies

	Set 
	CompanyName = @CompanyName,
	CompanyOwnership = @CompanyOwnership,
	CompanyDescription = @CompanyDescription,
	Address = @Address,
	City = @City,
	State = @State,
	Zip = @Zip,
	Country = @Country,
	IsSameBillingAddress = @BillingValue,
	BillingAddress = @BillingAddress,
	BillingCity = @BillingCity,
	BillingState = @BillingState,
	BillingZip = @BillingZip,
	BillingCountry = @BillingCountry,
	POCLastName = @POCLastName,
	POCFirstName = @POCFirstName,
	POCPhone = @POCPhone,
	POCDepartment = @POCDepartment,
	POCEmail = @POCEmail,
	POCFax = @POCFax,
	AssistantLastName = @AssistantLastName,
	AssistantFirstName = @AssistantFirstName,
	AssistantPhone = @AssistantPhone,
	Website = @Website,
	EmpQuantity = @EmpQuantity,
	COMPANYVALUEGOAL = @COMPANYVALUEGOAL,
	RepLastName = @RepLastName,
	RepFirstName = @RepFirstName,
	DiscussionTopic = @DiscussionTopic,
	ActionStep = @ActionStep,
	LastContact_Date = @LastContact_Date, 
	NextContact_Date = @NextContact_Date,
	CreationDate = @CreationDate,
	IndustryId = @IndId,
	IsNewCompany = @Value,
	UpdatedBy = @UpdatedBy,
	UPdatedDate = GETDATE(),
	Notes = @Notes
	where COMPANIESID = @COMPANIESID

	RETURN







GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateContactDetails]    Script Date: 02/13/2013 14:56:35 ******/
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
        @Notes varchar(1000)

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
     Country = @Country 
	 where CONTACTSID = @ContactsID

	

	 /* SET NOCOUNT ON */

	 RETURN




GO



ALTER PROCEDURE [dbo].[sp_InsertQuickStartRecord]
	(	
		@COMPANYNAME varchar(150), 
		@FirstName varchar(50),@LastName varchar(50),
		@Phone varchar(50),@Email varchar(50),
		@OPPNAME varchar(100),@Pain varchar(100),
		@LengthProblem varchar(30), @Alternatives varchar(100),
		@CostToFix varchar(30),@BudgeIdentifiedValue int,@MoveForwardValue int,
		@ProductID int, @OppStatusID int,@OppSourceID int,@OppTypeID int,
		@OPPVALUE varchar(100),@ACTIONSTEP varchar(150),
		@NextContactDate datetime,@OppCloseDate datetime,
		@CreatedBy varchar(100),
		@LoggedInUserName varchar(100),
		@FranchiseeId int
		
	 )
AS

	declare @CreationDate datetime
	declare @companyID int
	declare @contactID int
	declare @userFirstName varchar(100)
	declare @userLastName varchar(100)
	
	Set @userFirstName = ( select FirstName from tbl_coach where  UserID=@CreatedBy
							union
							Select  FirstName from TBL_FRANCHISEE_USERS where  UserID=@CreatedBy
						)
						
	Set @userLastName = ( select LastName from tbl_coach where  UserID=@CreatedBy
		union
		Select  LastName from TBL_FRANCHISEE_USERS where  UserID=@CreatedBy
	)


		
	Set @CreationDate = GETDATE()
	
	if @NextContactDate < '2/1/1755'
	Begin
	  Set @NextContactDate = null
	End	
	
	if @OppCloseDate < '2/1/1755'
	Begin
	  Set @OppCloseDate = null
	End
	
	if(@ProductID = 0) 
 
	Begin

	 Set @ProductID = null

	 End
	
	if(@OppStatusID = 0) 
 
	Begin

	 Set @OppStatusID = null

	 End
	
	if(@OppSourceID = 0) 
 
	Begin

	 Set @OppSourceID = null

	 End
	
	if(@OppTypeID = 0) 
 
	Begin

	 Set @OppTypeID = null

	 End
		
	
	BEGIN
		--First Let us create record in the Tbl_Companies
		Insert into TBL_COMPANIES(POCEmail,POCPhone,POCFirstName,POCLastName,COMPANYNAME,IsActive,CreationDate,CreatedDate,UpdatedDate,CreatedBy,NEXTCONTACT_DATE,FranchiseeId,IsSameBillingAddress,IsNewCompany) values
		(@Email,@Phone,@FirstName,@LastName,@CompanyName,1,@CreationDate,@CreationDate,@CreationDate,@CreatedBy,@NextContactDate,@FranchiseeId,0,0)
		set @companyID = @@IDENTITY
		
		-- Now user this Company Id and create record in the Contact Table
		Insert into TBL_CONTACTS(COMPANYID,LASTNAME,FIRSTNAME,PHONE,EMAIL,NEXT_CONTACT_DATE,IsActive,CreatedBy,CreatedDate,UpdatedDate,IsEmailSubscription,IsNeedCallBack,IsRegisteredForTraining,IsNewAppointment) values
		(@companyID,@LastName,@FirstName,@Phone,@Email,@NextContactDate,1,@CreatedBy,@CreationDate,@CreationDate,1,0,0,0)
		set @contactID = @@IDENTITY
		
				
		-- Now Create the Opportunity based on Comapany and Contact Id
		Insert into TBL_OPPORTUNITIES(COMPANYID,CONTACTID,Name,ProductID,
		STATUSID,VALUE,CLOSEDATE,IsActive,CreatedBy,CreatedDate,SourceID,TypeID,CreationDate,SALESREPLASTNAME,SALESREPFIRSTNAME,UpdatedDate,Pain,LengthOfProblem,Alternatives,CostToFix,IsBudgeIdentified,IsMoveForward) values
		(@companyID,@contactID,@OppName,@ProductID,@OppStatusID,@OPPVALUE,@OppCloseDate,1,@CreatedBy,@CreationDate,@OppSourceID,@OppTypeID,@CreationDate,@userLastName,@userFirstName,@CreationDate,@Pain,@LengthProblem,@Alternatives,@CostToFix,@BudgeIdentifiedValue,@MoveForwardValue)
		
		
		
	END
	
	/* SET NOCOUNT ON */
	RETURN




