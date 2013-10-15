--Quiick start related changes
GO


/****** Object:  View [dbo].[vw_Opportunities]    Script Date: 10/15/2013 16:06:08 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Opportunities]'))
DROP VIEW [dbo].[vw_Opportunities]
GO

/****** Object:  View [dbo].[vw_Opportunities]    Script Date: 10/15/2013 16:06:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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
cnt.CourseId,
cnt.CourseTrainingDate,
c.CourseName,
cnt.HowManyAttended,
cnt.FirstName AS PrimaryContactFirstName,
cnt.LastName AS PrimaryContactLastName,
cnt.Email AS PrimaryContactEmail,
cnt.Phone AS PrimaryContactPhone,
cnt.ActionStep,
cnt.NEXT_CONTACT_DATE,
seconadryCnt1.FirstName AS SeconadryContact1FirstName,
seconadryCnt1.LastName AS SeconadryContact1LastName,
seconadryCnt1.Email AS SeconadryContact1Email,
seconadryCnt2.FirstName AS SeconadryContact2FirstName,
seconadryCnt2.LastName AS SeconadryContact2LastName,
seconadryCnt2.Email AS SeconadryContact2Email,
cmp.COMPANYNAME, 
cmp.IsNewCompany, 
cmp.CreationDate, cmp.IndustryId,  
wl.Name AS WhyLost,
ot.Name AS [Type],
st.Name AS [Status],
p.ProductTypeName,
src.Name AS [Source],
o.ID,
o.COMPANYID,
o.CONTACTID,
o.NAME,
o.ProductID,
o.SALESREPLASTNAME,
o.SALESREPFIRSTNAME,
o.SALESREPPHONE,
o.STATUSID,
o.VALUE,
o.WINPROBABILITY,
o.WEIGHTEDVALUE,
o.CLOSEDATE,
o.IsActive,
o.UpdatedDate,
o.CreatedDate,
o.OpportunityID,
o.SourceID,
o.TypeID,
o.WhyLostID,
o.Description,
o.Notes,
o.ActualValue,
o.SeconadryContactId1,
o.SeconadryContactId2,
o.ProductCost,
o.CreationDate AS OppCreationDate,
o.Pain,
o.LengthofProblem,
o.CostToFix,
o.Alternatives,
o.IsBudgeIdentified,
o.IsMoveForward,
uCreated.Username as CreatedByUserName,
uUpdated.Username as UpdatedBy
FROM dbo.[TBL_OPPORTUNITIES] o WITH (NOLOCK)
INNER JOIN dbo.[TBL_COMPANIES] cmp WITH (NOLOCK) ON cmp.COMPANIESID = o.COMPANYID-- AND cmp.IsActive = 1
INNER JOIN dbo.[TBL_CONTACTS] cnt WITH (NOLOCK) ON cnt.CONTACTSID = o.CONTACTID-- AND cnt.IsActive = 1
INNER JOIN dbo.[TBL_Franchisee] f WITH (NOLOCK) ON cmp.FranchiseeID = f.ID AND f.IsActive = 1
INNER JOIN dbo.[TBL_COACH] ch WITH (NOLOCK) ON f.CoachID = ch.ID AND ch.IsActive = 1
INNER JOIN dbo.[TBL_Region] r WITH (NOLOCK) ON ch.RegionID = r.ID AND r.IsActive = 1
LEFT JOIN dbo.[TBL_Contacts] seconadryCnt1 WITH (NOLOCK) ON seconadryCnt1.CONTACTSID = o.SeconadryContactId1
LEFT JOIN dbo.[TBL_Contacts] seconadryCnt2 WITH (NOLOCK) ON seconadryCnt2.CONTACTSID = o.SeconadryContactId2
LEFT JOIN dbo.[TBL_OpportunityWhyLost] wl WITH (NOLOCK) ON wl.ID = o.WhyLostID
LEFT JOIN dbo.[TBL_OpportunityTypes] ot WITH (NOLOCK) ON ot.ID = o.TypeID
LEFT JOIN dbo.[TBL_OPPORTUNITYSTATUS] st WITH (NOLOCK) ON st.ID = o.StatusID
LEFT JOIN dbo.[TBL_OpportunitySource] src WITH (NOLOCK) ON src.ID = o.SourceID
LEFT JOIN dbo.[Tbl_ProductType] p WITH (NOLOCK) ON p.ID = o.ProductID
LEFT JOIN dbo.[Tbl_Course] c WITH (NOLOCK) ON c.CourseID = cnt.CourseId
LEFT JOIN dbo.aspnet_users uCreated WITH (NOLOCK) ON uCreated.userid = o.createdBy
LEFT JOIN dbo.aspnet_users uUpdated WITH (NOLOCK) ON uUpdated.userid = o.updatedBy

GO


/****** Object:  Table [dbo].[TBL_OpportunitiesHistory]    Script Date: 10/09/2013 23:34:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_OpportunitiesHistory]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_OpportunitiesHistory]
GO


GO

/****** Object:  Table [dbo].[TBL_OpportunitiesHistory]    Script Date: 10/09/2013 23:34:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TBL_OpportunitiesHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OpportunityID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
	[ContactID] [int] NOT NULL,
	[Notes] [nvarchar](1000) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdatedBy] [uniqueidentifier] NULL
	
 CONSTRAINT [PK_TBL_NotesHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO




GO

/****** Object:  StoredProcedure [dbo].[sp_InsertQuickStartRecord]    Script Date: 10/09/2013 23:35:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertQuickStartRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_InsertQuickStartRecord]
GO


GO

/****** Object:  StoredProcedure [dbo].[sp_InsertQuickStartRecord]    Script Date: 10/09/2013 23:35:28 ******/
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
		@CourseTrainingDate datetime,@TrainingCourseName varchar(150),@HeadCount varchar(150),@IsNewcompany int,@Industry int,
		@NextContactDate datetime,@OppCloseDate datetime,
		@CreatedBy varchar(100),
		@LoggedInUserName varchar(100),
		@FranchiseeId int,
		@SalesRepLastName varchar(100),
		@SalesRepFirstName varchar(100),
		@Notes varchar(1000)
		
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
	 if(@IsNewcompany = 0) 
 
	Begin

	 Set @IsNewcompany = null

	 End
		
	
	BEGIN
		--First Let us create record in the Tbl_Companies
		Insert into TBL_COMPANIES(POCEmail,POCPhone,POCFirstName,POCLastName,COMPANYNAME,IsActive,CreationDate,CreatedDate,UpdatedDate,CreatedBy,NEXTCONTACT_DATE,FranchiseeId,IsSameBillingAddress,IsNewCompany,IndustryId,ACTIONSTEP) values
		(@Email,@Phone,@FirstName,@LastName,@CompanyName,1,@CreationDate,@CreationDate,@CreationDate,@CreatedBy,@NextContactDate,@FranchiseeId,0,@IsNewcompany,@Industry,@ACTIONSTEP)
		set @companyID = @@IDENTITY
		
		-- Now user this Company Id and create record in the Contact Table
		
			Insert into TBL_CONTACTS(COMPANYID,LASTNAME,FIRSTNAME,PHONE,EMAIL,NEXT_CONTACT_DATE,IsActive,CreatedBy,CreatedDate,UpdatedDate,IsEmailSubscription,IsNeedCallBack,IsRegisteredForTraining,IsNewAppointment,ApptSourceId,CourseId,CourseTrainingDate,TrainingCourseName,HowManyAttended,ACTIONSTEP) values
			(@companyID,@LastName,@FirstName,@Phone,@Email,@NextContactDate,1,@CreatedBy,@CreationDate,@CreationDate,1,0,@RegisteredForTraining,@NewAppointment,@AppointmentSource,@CourseType,@CourseTrainingDate,@TrainingCourseName,@HeadCount,@ACTIONSTEP)
			set @contactID = @@IDENTITY	
		
					

		-- Now Create the Opportunity based on Comapany and Contact Id
		Insert into TBL_OPPORTUNITIES(COMPANYID,CONTACTID,Name,ProductID,
		STATUSID,VALUE,CLOSEDATE,IsActive,CreatedBy,CreatedDate,SourceID,TypeID,CreationDate,
		SALESREPLASTNAME,SALESREPFIRSTNAME,UpdatedDate,Pain,LengthOfProblem,Alternatives,
		CostToFix,IsBudgeIdentified,IsMoveForward,Notes) values
		(@companyID,@contactID,@OppName,@ProductID,@OppStatusID,@OPPVALUE,@OppCloseDate,1,@CreatedBy,
		@CreationDate,@OppSourceID,@OppTypeID,@CreationDate,@SalesRepLastName,@SalesRepFirstName,
		@CreationDate,@Pain,@LengthProblem,@Alternatives,@CostToFix,@BudgeIdentifiedValue,@MoveForwardValue,@Notes)
		
		
		
	END
	
	/* SET NOCOUNT ON */
	RETURN






GO




GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateQuickStartRecord]    Script Date: 10/09/2013 23:36:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UpdateQuickStartRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UpdateQuickStartRecord]
GO


GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateQuickStartRecord]    Script Date: 10/09/2013 23:36:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_UpdateQuickStartRecord]
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
		@CourseTrainingDate datetime,@TrainingCourseName varchar(150),@HeadCount varchar(150),@IsNewcompany int,@Industry int,
		@NextContactDate datetime,@OppCloseDate datetime,
		@CreatedBy varchar(100),
		@LoggedInUserName varchar(100),
		@FranchiseeId int,
		@SalesRepLastName varchar(100),
		@SalesRepFirstName varchar(100),
		@Notes varchar(1000),
		@CompanyID int,
		@OpportunityID int
		
	 )
AS

	declare @CreationDate datetime
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
	 if(@IsNewcompany = 0) 
 
	Begin

	 Set @IsNewcompany = null

	 End
		
	
	BEGIN
		--First Let us create record in the Tbl_Companies
		UPDATE TBL_COMPANIES 
		SET
		POCEmail = @Email,
		POCPhone = @Phone,
		POCFirstName = @FirstName,
		POCLastName = @LastName,
		COMPANYNAME = @CompanyName,
		IsActive=1,
		UpdatedDate = @CreationDate,
		UpdatedBy = @CreatedBy,		
		--NEXTCONTACT_DATE = @NextContactDate,
		FranchiseeId = @FranchiseeId,
		IsSameBillingAddress = 0,
		IsNewCompany =@IsNewcompany,
		IndustryId = @Industry,
		ACTIONSTEP = @ACTIONSTEP
		WHERE COMPANIESID = @companyID;
		
		
		-- Now user this Company Id and create record in the Contact Table
		UPDATE TBL_CONTACTS
		SET 
		LASTNAME = @LastName,
		FIRSTNAME = @FirstName,
		PHONE = @Phone,
		EMAIL = @Email,
		--NEXT_CONTACT_DATE = @NextContactDate,
		IsActive =1 ,
		UpdatedDate = @CreationDate,
		UpdatedBy = @CreatedBy,
		IsEmailSubscription =1,
		IsNeedCallBack = 0,
		IsRegisteredForTraining = @RegisteredForTraining,
		IsNewAppointment = @NewAppointment,
		ApptSourceId = @AppointmentSource,
		CourseId =@CourseType,
		--CourseTrainingDate =@CourseTrainingDate,
		TrainingCourseName = @TrainingCourseName,
		HowManyAttended = @HeadCount,
		ACTIONSTEP = @ACTIONSTEP
		WHERE COMPANYID = @companyID;
		
		If(@Notes is not null AND @Notes <> '')
		Begin
			Insert into tbl_notesHistory(OpportunityID,CompanyID,ContactID,Notes,createdDate)
			Values(@OpportunityID,@companyID,(Select CONTACTSID from TBL_CONTACTS where COMPANYID = @companyID),
			(Select Notes from TBL_OPPORTUNITIES where COMPANYID = @companyID AND ID=@OpportunityID),GetDate())
		END
		UPDATE TBL_OPPORTUNITIES 
		SET
		Name = @OppName,
		ProductID = @ProductID,
		STATUSID = @OppStatusID,
		VALUE = @OPPVALUE,
		--CLOSEDATE =@OppCloseDate,
		IsActive=1,
		UpdatedBy = @CreatedBy,
		UpdatedDate = @CreationDate,
		 SourceID = @OppSourceID,
		 TypeID = @OppTypeID,
		 SALESREPLASTNAME = @SalesRepLastName ,
		 SALESREPFIRSTNAME = @SalesRepFIRSTName ,		 
		 Pain = @Pain,
		 LengthOfProblem = @LengthProblem,
		 Alternatives = @Alternatives,
		 CostToFix = @CostToFix,
		 IsBudgeIdentified = @BudgeIdentifiedValue,
		 IsMoveForward = @MoveForwardValue ,
		 Notes = CASE WHEN (@Notes IS NOT NULL AND @Notes <> '') THEN @Notes ELSE Notes END 		 
		 WHERE COMPANYID = @companyID AND ID=@OpportunityID;
		

	END
	
	/* SET NOCOUNT ON */
	RETURN






GO




GO

/****** Object:  UserDefinedFunction [dbo].[fn_split]    Script Date: 10/09/2013 23:36:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_split]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_split]
GO


GO

/****** Object:  UserDefinedFunction [dbo].[fn_split]    Script Date: 10/09/2013 23:36:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


 /***********************************************************************  
  Title:  	[fn_split]       
  Creation Date:  3/31/09

select * from sandlerdb.dbo.fn_split('568,1',',')
  Description:    used by AOV Credential Application
				
  Parameters:  @String nvarchar (4000),
 @Delimiter nvarchar (10)
	    
  Object Dependency:  A listing of any objects this object depends on should be here.	    			   

  	Tables:					

  	Stored Procdures:

  	Views:				

  Revision History:  
***********************************************************************/
CREATE function [dbo].[fn_split](
 @String nvarchar (4000),
 @Delimiter nvarchar (10)
 )
returns @ValueTable table ([Value] nvarchar(4000))
begin
 declare @NextString nvarchar(4000)
 declare @Pos int
 declare @NextPos int
 declare @CommaCheck nvarchar(1)
 
 --Initialize
 set @NextString = ''''
 set @CommaCheck = right(@String,1) 
 
 --Check for trailing Comma, if not exists, INSERT
 --if (@CommaCheck <> @Delimiter )
 set @String = @String + @Delimiter
 
 --Get position of first Comma
 set @Pos = charindex(@Delimiter,@String)
 set @NextPos = 1
 
 --Loop while there is still a comma in the String of levels
 while (@pos <>  0)  
 begin
  set @NextString = substring(@String,1,@Pos - 1)
 
  insert into @ValueTable ( [Value]) Values (@NextString)
 
  set @String = substring(@String,@pos +1,len(@String))
  
  set @NextPos = @Pos
  set @pos  = charindex(@Delimiter,@String)
 end
 
 return
end


GO

IF OBJECT_ID ('trg_CreateHistory ','TR') IS NOT NULL
    DROP TRIGGER trg_CreateHistory ;
GO
CREATE TRIGGER trg_CreateHistory 
ON TBL_OPPORTUNITIES
AFTER INSERT, UPDATE, DELETE 
AS
	declare @notes varchar(1000)
	declare @newNotes varchar(1000)
	declare @OpportunityID int
	declare @CompanyID int
	declare @ContactID int
	declare @createdBy uniqueidentifier

	select @newNotes = notes,@OpportunityID = ID,@CompanyID = CompanyID, @ContactID = ContactID, @createdBy = UpdatedBy  from inserted;
	select @notes = notes from deleted;

	print @newNotes;
	print @notes;
	if(@newNotes <> @notes)
	begin
		INSERT INTO [TBL_OpportunitiesHistory](OpportunityID,CompanyID,ContactID,Notes,CreatedDate,CreatedBy) 
		VALUES (@OpportunityID, @CompanyID,@ContactID,@notes,getdate(),@createdBy);
	end
GO