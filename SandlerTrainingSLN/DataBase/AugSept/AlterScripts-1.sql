/*

Executed this script in 139 on 8/29
*/

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TBL_COACH_IsEmailSubscribtion]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TBL_COACH] DROP CONSTRAINT [DF_TBL_COACH_IsEmailSubscribtion]
END
GO
ALTER TABLE TBL_COACH DROP COLUMN IsEmailSubscribtion
GO
ALTER TABLE TBL_COACH ADD IsEmailSubscription BIT
GO
ALTER TABLE [dbo].[TBL_COACH] ADD  CONSTRAINT [DF_TBL_COACH_IsEmailSubscription]  DEFAULT ((1)) FOR [IsEmailSubscription]
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TBL_FRANCHISEE_USERS_IsEmailSubscribtion]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TBL_FRANCHISEE_USERS] DROP CONSTRAINT [DF_TBL_FRANCHISEE_USERS_IsEmailSubscribtion]
END
GO
ALTER TABLE [TBL_FRANCHISEE_USERS] DROP COLUMN IsEmailSubscribtion
GO
ALTER TABLE [TBL_FRANCHISEE_USERS] ADD IsEmailSubscription BIT
GO
ALTER TABLE [dbo].[TBL_FRANCHISEE_USERS] ADD  CONSTRAINT [DF_TBL_FRANCHISEE_USERS_IsEmailSubscription]  DEFAULT ((1)) FOR [IsEmailSubscription]
GO


IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TBL_CONTACTS_IsEmailSubscribtion]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TBL_CONTACTS] DROP CONSTRAINT [DF_TBL_CONTACTS_IsEmailSubscribtion]
END
GO
ALTER TABLE [TBL_CONTACTS] DROP COLUMN IsEmailSubscribtion
GO
ALTER TABLE [TBL_CONTACTS] ADD IsEmailSubscription BIT
GO
ALTER TABLE [dbo].[TBL_CONTACTS] ADD  CONSTRAINT [DF_TBL_CONTACTS_IsEmailSubscription]  DEFAULT ((1)) FOR [IsEmailSubscription]
GO

ALTER TABLE dbo.TBL_CONTACTS ADD
	[Birthday] [datetime] NULL,
	[Anniversary] [datetime] NULL,
	[CompanyYears] [int] NULL,
	[BossName] [varchar](50) NULL,
	[IsNeedCallBack] [bit] null,
	[CallBackCreatedDate][datetime]null
GO
CREATE TABLE [dbo].[Tbl_FollowUpItemsList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[FollowUpDate] [datetime] NULL,
	[Description] [varchar](150) NULL,
	[IsActive] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[Phone] [varchar](50) NULL,
 CONSTRAINT [PK_Tbl_FollowUpItemsList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Tbl_FollowUpItemsList]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_FollowUpItemsList_aspnet_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO

ALTER TABLE [dbo].[Tbl_FollowUpItemsList] CHECK CONSTRAINT [FK_Tbl_FollowUpItemsList_aspnet_Users]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetCallBackOptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetCallBackOptions]
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

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetContactDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetContactDetails]
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

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UpdateContactDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UpdateContactDetails]
GO
Create PROCEDURE [dbo].[sp_UpdateContactDetails]	
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
        @CallBackValue int		
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
	CallBackCreatedDate = GETDATE()
	where CONTACTSID = @ContactsID
	
	/* SET NOCOUNT ON */
	RETURN
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertContact]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_InsertContact]
GO
Create PROCEDURE [dbo].[sp_InsertContact]
	
	(
		@COMPANIESID int, @LastName varchar(50), @FirstName varchar(50),
		@Phone varchar(50), @Email varchar(50),
		@Value int, @ApptSourceId int, @RegForTrainingId int, @CourseId int, 
        @CourseTrngDate datetime, @DiscussionTopic varchar(50), 
        @ACTIONSTEP varchar(50), 
        @Last_Contact_Date datetime, @Next_Contact_Date datetime, @CreatedBy varchar(50),
        @CallBackValue int
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
	 IsActive, CreatedBy, IsEmailSubscription,IsNeedCallBack,CallBackCreatedDate )
	values
	(@COMPANIESID , @LastName , @FirstName ,@Phone , @Email,
	 @Value , @ApptSourceId , @RegForTrainingId , @CourseId , 
     @CourseTrngDate , @DiscussionTopic , @ACTIONSTEP, 
     @Last_Contact_Date , @Next_Contact_Date,1,@CreatedBy,1,@CallBackValue,GETDATE())
	
	/* SET NOCOUNT ON */
	RETURN

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AddFollowUpItem]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AddFollowUpItem]
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
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllEvents]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllEvents]
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
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetBlastEmailOptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetBlastEmailOptions]
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
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetSubscriptionInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetSubscriptionInfo]
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
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UpdateSubscriptionInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UpdateSubscriptionInfo]
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
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetLoggedInUserAddress]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetLoggedInUserAddress]
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
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetFranchiseeAddresses]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetFranchiseeAddresses]
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
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsAddresses]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsAddresses]
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
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllFranchiseeAddresses]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllFranchiseeAddresses]
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
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCoachAddresses]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCoachAddresses]
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
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetBlastEmailGroupsByRole]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetBlastEmailGroupsByRole]
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
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetCallList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetCallList]
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




Update [SandlerDB].[dbo].[TBL_CONTACTS] Set IsEmailSubscription = 1, IsNeedCallBack = 0, CallBackCreatedDate = GETDATE();
Update [TBL_COACH] SET IsEmailSubscription = 1;
Update [TBL_FRANCHISEE_USERS] SET IsEmailSubscription = 1;