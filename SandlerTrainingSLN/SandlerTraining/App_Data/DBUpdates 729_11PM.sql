
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertContact]    Script Date: 07/29/2012 22:44:41 ******/
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
        @Last_Contact_Date datetime, @Next_Contact_Date datetime, @CreatedBy varchar(50)
	)
	
AS

		
	if(@CourseId = 0) 
	Begin
	 Set @CourseId = null
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
	 CourseId,CourseTrainingDate, DiscussionTopic,ActionStep,LAST_CONTACT_DATE,NEXT_CONTACT_DATE, IsActive, CreatedBy )
	values
	(@COMPANIESID , @LastName , @FirstName ,@Phone , @Email,
	 @Value , @ApptSourceId , @RegForTrainingId , @CourseId , 
     @CourseTrngDate , @DiscussionTopic , @ACTIONSTEP, 
     @Last_Contact_Date , @Next_Contact_Date,1,@CreatedBy)
	
	/* SET NOCOUNT ON */
	RETURN


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
        @UpdatedBy varchar(50)
		
		
	)
	
AS
	if(@CourseId = 0) 
	Begin
	 Set @CourseId = null
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
	UpdatedDate = GETDATE()
	where CONTACTSID = @ContactsID
	
	/* SET NOCOUNT ON */
	RETURN




GO

ALTER PROCEDURE [dbo].[sp_UpdateCompanyDetails]
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


ALTER PROCEDURE [dbo].[sp_InsertCompany]
	
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

ALTER  PROCEDURE [dbo].[sp_GetCompanyDetails]
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
	cp.COMPANYNAME,cp.COMPANIESID,
	yn.Description as NewApptDescription, yn.Value as Value,
	aps.ApptSourceName , aps.ApptSourceId,
	yno.Description as RegForTrngDescription, yno.Value as RegForTrainingId,
	cs.CourseName, 
	ISNULL(cs.courseId,1) as courseId
	/*ISNULL(ct.next_contact_date, '') as next_contact_date*/
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID 
	left join Tbl_YesNoOptions yn on ct.IsNewAppointment = yn.Value 
	left join Tbl_AppointmentsSource aps on ct.ApptSourceId = aps.ApptSourceId
	left join Tbl_YesNoOptions yno on ct.IsRegisteredForTraining = yno.Value
	left join Tbl_Course cs on ct.CourseId = cs.CourseId  
	where ct.CONTACTSID = @ContactID
	
	RETURN



GO