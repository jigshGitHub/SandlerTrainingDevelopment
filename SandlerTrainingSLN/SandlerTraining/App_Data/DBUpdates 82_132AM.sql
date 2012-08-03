USE [SandlerDB]
GO
ALTER TABLE [dbo].[TBL_CONTACTS]  DROP COLUMN [CreatedDate] ; 
GO
ALTER TABLE [dbo].[TBL_CONTACTS] DROP COLUMN [UpdatedDate];
GO
ALTER TABLE [dbo].[TBL_CONTACTS]  ADD [CreatedDate] DATETIME; 
GO
ALTER TABLE [dbo].[TBL_CONTACTS] ADD [UpdatedDate] DATETIME;
GO
ALTER TABLE [dbo].[TBL_CONTACTS] ADD CONSTRAINT [DF_TBL_CONTACTS_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate];
GO
ALTER TABLE [dbo].[TBL_CONTACTS] ADD CONSTRAINT [DF_TBL_CONTACTS_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate];
GO

ALTER TABLE [dbo].[TBL_CONTACTS]  WITH CHECK ADD  CONSTRAINT [FK_TBL_CONTACTS_Tbl_AppointmentsSource] FOREIGN KEY([ApptSourceId])
REFERENCES [dbo].[Tbl_AppointmentsSource] ([ApptSourceId])
GO
ALTER TABLE [dbo].[TBL_CONTACTS] CHECK CONSTRAINT [FK_TBL_CONTACTS_Tbl_AppointmentsSource]
GO

ALTER TABLE [dbo].[TBL_CONTACTS]  WITH CHECK ADD  CONSTRAINT [FK_TBL_CONTACTS_TBL_Companies] FOREIGN KEY([COMPANYID])
REFERENCES [dbo].[TBL_Companies] ([COMPANIESID])
GO
ALTER TABLE [dbo].[TBL_CONTACTS] CHECK CONSTRAINT [FK_TBL_CONTACTS_TBL_Companies]
GO

ALTER TABLE [dbo].[TBL_CONTACTS]  WITH CHECK ADD  CONSTRAINT [FK_TBL_CONTACTS_Tbl_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Tbl_Course] ([CourseId])
GO
ALTER TABLE [dbo].[TBL_CONTACTS] CHECK CONSTRAINT [FK_TBL_CONTACTS_Tbl_Course]
GO

ALTER
 TABLE [dbo].[TBL_COMPANIES] DROP COLUMN [CreatedDate] ; 
GO
 
ALTER
 TABLE [dbo].[TBL_COMPANIES] DROP COLUMN [UpdatedDate]; 
GO
 
ALTER
 TABLE [dbo].[TBL_COMPANIES] ADD [CreatedDate] DATETIME; 
GO
 
ALTER
 TABLE [dbo].[TBL_COMPANIES] ADD [UpdatedDate] DATETIME; 
GO

ALTER
 TABLE [dbo].[TBL_COMPANIES] WITH CHECK ADD CONSTRAINT [FK_TBL_COMPANIES_Tbl_IndustryType] FOREIGN KEY([IndustryId])
 REFERENCES
 [dbo].[Tbl_IndustryType] ([IndId]) 
GO
 
ALTER
 TABLE [dbo].[TBL_COMPANIES] CHECK CONSTRAINT [FK_TBL_COMPANIES_Tbl_IndustryType] 
GO

ALTER
 TABLE [dbo].[TBL_COMPANIES] WITH CHECK ADD CONSTRAINT [FK_TBL_COMPANIES_TBL_FRANCHISEE] FOREIGN KEY([FranchiseeId])
 REFERENCES
 [dbo].[TBL_FRANCHISEE] ([Id]) 
GO
 
ALTER
 TABLE [dbo].[TBL_COMPANIES] CHECK CONSTRAINT [FK_TBL_COMPANIES_TBL_FRANCHISEE] 
GO

ALTER
 TABLE [dbo].[TBL_COMPANIES] ADD CONSTRAINT [DF_TBL_COMPANIES_UpdatedDate] DEFAULT (getdate()) FOR [UpdatedDate];
 GO
 
ALTER
 TABLE [dbo].[TBL_COMPANIES] ADD CONSTRAINT [DF_TBL_COMPANIES_CreatedDate] DEFAULT (getdate()) FOR [CreatedDate];
 GO

ALTER
 TABLE [dbo].[TBL_DOCS] DROP COLUMN [CreatedDate] ; 
GO
 
ALTER
 TABLE [dbo].[TBL_DOCS] DROP COLUMN [UpdatedDate]; 
GO
 
ALTER
 TABLE [dbo].[TBL_DOCS] ADD [CreatedDate] DATETIME; 
GO
 
ALTER
 TABLE [dbo].[TBL_DOCS] ADD [UpdatedDate] DATETIME; 
GO
ALTER
 TABLE [dbo].[TBL_DOCS] WITH CHECK ADD CONSTRAINT [FK_TBL_DOCS_TBL_COMPANIES] FOREIGN KEY([CompanyId])
 REFERENCES
 [dbo].[TBL_COMPANIES] ([COMPANIESID]) 
GO
 
ALTER
 TABLE [dbo].[TBL_DOCS] CHECK CONSTRAINT [FK_TBL_DOCS_TBL_COMPANIES] 
GO

ALTER
 TABLE [dbo].[TBL_DOCS] WITH CHECK ADD CONSTRAINT [FK_TBL_DOCS_Tbl_DocumentStatus] FOREIGN KEY([DOCSTATUSID])
 REFERENCES
 [dbo].[Tbl_DocumentStatus] ([DocStatusId]) 
GO
 
ALTER
 TABLE [dbo].[TBL_DOCS] CHECK CONSTRAINT [FK_TBL_DOCS_Tbl_DocumentStatus] 
GO

ALTER
 TABLE [dbo].[TBL_DOCS] WITH CHECK ADD CONSTRAINT [FK_TBL_DOCS_TBL_OPPORTUNITIES] FOREIGN KEY([OPPSID])
 REFERENCES
 [dbo].[TBL_OPPORTUNITIES] ([Id]) 
GO
 
ALTER
 TABLE [dbo].[TBL_DOCS] CHECK CONSTRAINT [FK_TBL_DOCS_TBL_OPPORTUNITIES] 
GO
ALTER
 TABLE [dbo].[TBL_DOCS] ADD CONSTRAINT [DF_TBL_DOCS_UpdatedDate] DEFAULT (getdate()) FOR [UpdatedDate];
 GO
 
ALTER
 TABLE [dbo].[TBL_DOCS] ADD CONSTRAINT [DF_TBL_DOCS_CreatedDate] DEFAULT (getdate()) FOR [CreatedDate];
 GO

ALTER TABLE [dbo].[TBL_OPPORTUNITIES] ADD CONSTRAINT [DF_TBL_OPPORTUNITIES_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate];
GO
ALTER TABLE [dbo].[TBL_OPPORTUNITIES] ADD CONSTRAINT [DF_TBL_OPPORTUNITIES_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate];
GO


/****** Object:  StoredProcedure [dbo].[sp_InsertContact]    Script Date: 07/31/2012 16:16:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertContact]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_InsertContact]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetContactDetails]    Script Date: 07/31/2012 16:16:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetContactDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetContactDetails]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateContactDetails]    Script Date: 07/31/2012 16:16:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UpdateContactDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UpdateContactDetails]
GO


CREATE PROCEDURE [dbo].[sp_InsertContact]
	
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
	 CourseId,CourseTrainingDate, DiscussionTopic,ActionStep,LAST_CONTACT_DATE,NEXT_CONTACT_DATE, IsActive, CreatedBy )
	values
	(@COMPANIESID , @LastName , @FirstName ,@Phone , @Email,
	 @Value , @ApptSourceId , @RegForTrainingId , @CourseId , 
     @CourseTrngDate , @DiscussionTopic , @ACTIONSTEP, 
     @Last_Contact_Date , @Next_Contact_Date,1,@CreatedBy)
	
	/* SET NOCOUNT ON */
	RETURN




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
	cp.COMPANYNAME,cp.COMPANIESID,
	yn.Description as NewApptDescription, yn.Value as Value,
	aps.ApptSourceName , 
	yno.Description as RegForTrngDescription, yno.Value as RegForTrainingId,
	cs.CourseName, 
	ISNULL(cs.courseId,1) as courseId,
	ISNULL(aps.ApptSourceId,1) as ApptSourceId
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
        @UpdatedBy varchar(50)		
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
	UpdatedDate = GETDATE()
	where CONTACTSID = @ContactsID
	
	/* SET NOCOUNT ON */
	RETURN


GO


 
ALTER
 TABLE [dbo].[TBL_ProductType] DROP COLUMN [CreatedDate] ; 
GO
 
ALTER
 TABLE [dbo].[TBL_ProductType] DROP COLUMN [LastUpdatedDate]; 
GO
 
ALTER
 TABLE [dbo].[TBL_ProductType] ADD [CreatedDate] DATETIME; 
GO
 
ALTER
 TABLE [dbo].[TBL_ProductType] ADD [LastUpdatedDate] DATETIME; 
GO

ALTER
 TABLE [dbo].[TBL_ProductType] ADD [FranchiseeId] INT; 
GO
 
ALTER
 TABLE [dbo].[TBL_ProductType] ADD CONSTRAINT [DF_TBL_ProductType_LastUpdatedDate] DEFAULT (getdate()) FOR [LastUpdatedDate];
 GO
 
ALTER
 TABLE [dbo].[TBL_ProductType] ADD CONSTRAINT [DF_TBL_ProductType_CreatedDate] DEFAULT (getdate()) FOR [CreatedDate];
 GO

UPDATE [TBL_ProductType]
SET FranchiseeId = 0;

CREATE PROCEDURE [dbo].[sp_AddProduct]
	
	(
		@ProductTypeName varchar(50), 
		@CreatedBy varchar(50),
		@FranchiseeId int
	)
	

	
	
AS
	
	Insert into tbl_ProductType
	(ProductTypeName, CreatedBy, FranchiseeId)
	values
	(@ProductTypeName, @CreatedBy ,@FranchiseeId) 
	
	/* SET NOCOUNT ON */
	RETURN

GO

                                                                     
                                                                     
                                                                     
                                             



                                                                     
                                                                     
                                                                     
                                             



