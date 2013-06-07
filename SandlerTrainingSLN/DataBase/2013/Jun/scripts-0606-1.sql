GO

/****** Object:  StoredProcedure [dbo].[sp_InsertQuickStartRecord]    Script Date: 06/05/2013 07:26:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertQuickStartRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_InsertQuickStartRecord]
GO

GO

/****** Object:  StoredProcedure [dbo].[sp_InsertQuickStartRecord]    Script Date: 06/05/2013 07:26:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[sp_InsertQuickStartRecord]
	(	
		@COMPANYNAME varchar(150), 
		@FirstName varchar(50),@LastName varchar(50),
		@Phone varchar(50),@Email varchar(50),
		@OPPNAME varchar(100),@Pain varchar(100),
		@LengthProblem varchar(30), @Alternatives varchar(100),
		@CostToFix varchar(30),@BudgeIdentifiedValue int,@MoveForwardValue int,
		@ProductID int, @OppStatusID int,@OppSourceID int,@OppTypeID int,
		@OPPVALUE varchar(100),@ACTIONSTEP varchar(150),
		@NewAppointment int,@AppointmentSource int,@RegisteredForTraining int,@CourseType int,
		@CourseTrainingDate datetime,@TrainingCourseName varchar(150),@HeadCount varchar(150),@Industry int,
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
	if @CourseTrainingDate < '2/1/1755'
	Begin
	  Set @CourseTrainingDate = null
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
	 	
	 if(@NewAppointment = 0) 
 
	Begin

	 Set @NewAppointment = null

	 End
	  if(@AppointmentSource = 0) 
 
	Begin

	 Set @AppointmentSource = null

	 End
	  if(@RegisteredForTraining = 0) 
 
	Begin

	 Set @RegisteredForTraining = null

	 End
	  if(@CourseType = 0) 
 
	Begin

	 Set @CourseType = null

	 End
	   if(@Industry = 0) 
 
	Begin

	 Set @Industry = null

	 End
		
	
	BEGIN
		--First Let us create record in the Tbl_Companies
		Insert into TBL_COMPANIES(POCEmail,POCPhone,POCFirstName,POCLastName,COMPANYNAME,IsActive,CreationDate,CreatedDate,UpdatedDate,CreatedBy,NEXTCONTACT_DATE,FranchiseeId,IsSameBillingAddress,IsNewCompany,IndustryId) values
		(@Email,@Phone,@FirstName,@LastName,@CompanyName,1,@CreationDate,@CreationDate,@CreationDate,@CreatedBy,@NextContactDate,@FranchiseeId,0,0,@Industry)
		set @companyID = @@IDENTITY
		
		-- Now user this Company Id and create record in the Contact Table
		Insert into TBL_CONTACTS(COMPANYID,LASTNAME,FIRSTNAME,PHONE,EMAIL,NEXT_CONTACT_DATE,IsActive,CreatedBy,CreatedDate,UpdatedDate,IsEmailSubscription,IsNeedCallBack,IsRegisteredForTraining,IsNewAppointment,ApptSourceId,CourseId,CourseTrainingDate,TrainingCourseName,HowManyAttended) values
		(@companyID,@LastName,@FirstName,@Phone,@Email,@NextContactDate,1,@CreatedBy,@CreationDate,@CreationDate,1,0,@RegisteredForTraining,@NewAppointment,@AppointmentSource,@CourseType,@CourseTrainingDate,@TrainingCourseName,@HeadCount)
		set @contactID = @@IDENTITY	
					

		-- Now Create the Opportunity based on Comapany and Contact Id
		Insert into TBL_OPPORTUNITIES(COMPANYID,CONTACTID,Name,ProductID,
		STATUSID,VALUE,CLOSEDATE,IsActive,CreatedBy,CreatedDate,SourceID,TypeID,CreationDate,SALESREPLASTNAME,SALESREPFIRSTNAME,UpdatedDate,Pain,LengthOfProblem,Alternatives,CostToFix,IsBudgeIdentified,IsMoveForward) values
		(@companyID,@contactID,@OppName,@ProductID,@OppStatusID,@OPPVALUE,@OppCloseDate,1,@CreatedBy,@CreationDate,@OppSourceID,@OppTypeID,@CreationDate,@userLastName,@userFirstName,@CreationDate,@Pain,@LengthProblem,@Alternatives,@CostToFix,@BudgeIdentifiedValue,@MoveForwardValue)
		
		
		
	END
	
	/* SET NOCOUNT ON */
	RETURN





GO

