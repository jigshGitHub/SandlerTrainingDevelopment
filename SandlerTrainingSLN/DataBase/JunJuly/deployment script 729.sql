
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

Create PROCEDURE [dbo].[sp_UpdateCompanyDetailsSpecial]
	(
		@COMPANIESID int,@CompanyName varchar(50), @Address varchar(150),
		@City varchar(50), @State varchar(50), @Zip varchar(50),
		@POCLastName varchar(50), @POCFirstName varchar(50),
		@POCPhone varchar(50), @Value int, @COMPANYVALUEGOAL int,
		/*@Id int, */
		@IndId int,
		@RepLastName varchar(50),@RepFirstName varchar(50),
		@DiscussionTopic varchar(50), @ActionStep varchar(50),
		@NextContact_Date datetime, 
		@CreationDate datetime, @UpdatedBy varchar(50)
		
	)
AS
	
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


Create PROCEDURE [dbo].[sp_InsertCompanySpecial]
	
	(	
		@CompanyName varchar(50), @Address varchar(150),
		@City varchar(50), @State varchar(50), @Zip varchar(50),
		@POCLastName varchar(50), @POCFirstName varchar(50),
		@POCPhone varchar(50), @Value int, @COMPANYVALUEGOAL int,
		/*@Id int, */
		@IndId int,
		@RepLastName varchar(50),@RepFirstName varchar(50),
		@DiscussionTopic varchar(50), @ActionStep varchar(50),
		@NextContact_Date datetime, 
		@CreationDate datetime, @CreatedBy varchar(50),
		@FranchiseeId int
	 )
AS
	Insert into tbl_Companies
	(CompanyName, Address,City, State, Zip,POCLastName,POCFirstName,
	 POCPhone,IsNewCompany, COMPANYVALUEGOAL,
	 /*ProductId,*/
	 IndustryId,
	 RepLastName,RepFirstName,DiscussionTopic,ActionStep,
	 NextContact_Date,CreationDate, CreatedBy, FranchiseeId,IsActive)
	values
	(@CompanyName, @Address,@City, @State, @Zip,@POCLastName,@POCFirstName,
		@POCPhone , @Value, @COMPANYVALUEGOAL,
		/*@Id ,*/
		@IndId ,@RepLastName ,@RepLastName,
		@DiscussionTopic , @ActionStep,	
	 @NextContact_Date,@CreationDate,@CreatedBy,@FranchiseeId,1)
	
	/* SET NOCOUNT ON */
	RETURN


GO

SET IDENTITY_INSERT [dbo].[Tbl_Course] ON
INSERT [dbo].[Tbl_Course] ([CourseId], [CourseName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES (1, N'Bootcamp', 1, NULL, NULL, N'System')
INSERT [dbo].[Tbl_Course] ([CourseId], [CourseName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES (2, N'Foundations', 1, NULL, NULL, N'System')
INSERT [dbo].[Tbl_Course] ([CourseId], [CourseName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES (3, N'Management', 1, NULL, NULL, N'System')
INSERT [dbo].[Tbl_Course] ([CourseId], [CourseName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES (4, N'PC', 1, NULL, NULL, N'System')
SET IDENTITY_INSERT [dbo].[Tbl_Course] OFF


GO