-- Executed on 239 Dt:02/11

ALTER TABLE [dbo].[TBL_OPPORTUNITIES] ADD [Pain] [varchar](100) NULL;
ALTER TABLE [dbo].[TBL_OPPORTUNITIES] ADD [LengthOfProblem] [varchar](30) NULL;
ALTER TABLE [dbo].[TBL_OPPORTUNITIES] ADD [Alternatives] [varchar](100) NULL;
ALTER TABLE [dbo].[TBL_OPPORTUNITIES] ADD [CostToFix] [varchar](30) NULL;
ALTER TABLE [dbo].[TBL_OPPORTUNITIES] ADD [IsBudgeIdentified] [bit] NULL;
ALTER TABLE [dbo].[TBL_OPPORTUNITIES] ADD [IsMoveForward] [bit] NULL;


/****** Object:  View [dbo].[vw_Opportunities]    Script Date: 02/10/2013 18:49:00 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Opportunities]'))
DROP VIEW [dbo].[vw_Opportunities]
GO


/****** Object:  View [dbo].[vw_Opportunities]    Script Date: 02/10/2013 18:49:01 ******/
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
cnt.CourseTrainingDate,
cnt.FirstName AS PrimaryContactFirstName,
cnt.LastName AS PrimaryContactLastName,
cnt.Email AS PrimaryContactEmail,
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
o.UpdatedBy,
o.CreatedDate,
o.CreatedBy,
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
o.IsMoveForward
FROM dbo.[TBL_OPPORTUNITIES] o WITH (NOLOCK)
INNER JOIN dbo.[TBL_COMPANIES] cmp WITH (NOLOCK) ON cmp.COMPANIESID = o.COMPANYID AND cmp.IsActive = 1
INNER JOIN dbo.[TBL_CONTACTS] cnt WITH (NOLOCK) ON cnt.CONTACTSID = o.CONTACTID AND cnt.IsActive = 1
INNER JOIN dbo.[TBL_Franchisee] f WITH (NOLOCK) ON cmp.FranchiseeID = f.ID AND f.IsActive = 1
INNER JOIN dbo.[TBL_COACH] ch WITH (NOLOCK) ON f.CoachID = ch.ID AND ch.IsActive = 1
INNER JOIN dbo.[TBL_Region] r WITH (NOLOCK) ON ch.RegionID = r.ID AND r.IsActive = 1
LEFT JOIN dbo.[TBL_Contacts] seconadryCnt1 WITH (NOLOCK) ON seconadryCnt1.CONTACTSID = o.SeconadryContactId1
LEFT JOIN dbo.[TBL_Contacts] seconadryCnt2 WITH (NOLOCK) ON seconadryCnt2.CONTACTSID = o.SeconadryContactId2
LEFT JOIN dbo.[TBL_OpportunityWhyLost] wl WITH (NOLOCK) ON wl.ID = o.WhyLostID
LEFT JOIN dbo.[TBL_OpportunityTypes] ot WITH (NOLOCK) ON ot.ID = o.TypeID
LEFT JOIN dbo.[TBL_OPPORTUNITYSTATUS] st WITH (NOLOCK) ON st.ID = o.StatusID
LEFT JOIN dbo.[TBL_OpportunitySource] src WITH (NOLOCK) ON src.ID = o.SourceID
LEFT JOIN dbo.[Tbl_ProductType] p WITH (NOLOCK) ON.p.ID = o.ProductID
AND o.IsActive = 1


GO

USE [SandlerDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertQuickStartRecord]    Script Date: 02/10/2013 12:58:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertQuickStartRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_InsertQuickStartRecord]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetYesNoOptions]    Script Date: 02/10/2013 12:58:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetYesNoOptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetYesNoOptions]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetProductTypeByRole]    Script Date: 02/10/2013 12:58:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetProductTypeByRole]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetProductTypeByRole]
GO

USE [SandlerDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertQuickStartRecord]    Script Date: 02/10/2013 12:58:33 ******/
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
		@NextContactDate datetime,@OppCloseDate datetime,
		@CreatedBy varchar(100),
		@LoggedInUserName varchar(100),
		@FranchiseeId int
		
	 )
AS

	declare @CreationDate datetime
	declare @companyID int
	declare @contactID int
	
		
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
		Insert into TBL_COMPANIES(COMPANYNAME,IsActive,CreationDate,CreatedDate,UpdatedDate,CreatedBy,NEXTCONTACT_DATE,FranchiseeId,IsSameBillingAddress,IsNewCompany) values
		(@CompanyName,1,@CreationDate,@CreationDate,@CreationDate,@CreatedBy,@NextContactDate,@FranchiseeId,0,0)
		set @companyID = @@IDENTITY
		
		-- Now user this Company Id and create record in the Contact Table
		Insert into TBL_CONTACTS(COMPANYID,LASTNAME,FIRSTNAME,PHONE,EMAIL,NEXT_CONTACT_DATE,IsActive,CreatedBy,CreatedDate,UpdatedDate,IsEmailSubscription,IsNeedCallBack,IsRegisteredForTraining,IsNewAppointment) values
		(@companyID,@LastName,@FirstName,@Phone,@Email,@NextContactDate,1,@CreatedBy,@CreationDate,@CreationDate,1,0,0,0)
		set @contactID = @@IDENTITY
		
				
		-- Now Create the Opportunity based on Comapany and Contact Id
		Insert into TBL_OPPORTUNITIES(COMPANYID,CONTACTID,Name,ProductID,
		STATUSID,VALUE,CLOSEDATE,IsActive,CreatedBy,CreatedDate,SourceID,TypeID,CreationDate,SALESREPLASTNAME,SALESREPFIRSTNAME,UpdatedDate,
		IsBudgeIdentified,IsMoveForward,Pain,LengthOfProblem,Alternatives,CostToFix) values
		(@companyID,@contactID,@OppName,@ProductID,@OppStatusID,@OPPVALUE,@OppCloseDate,1,@CreatedBy,@CreationDate,
		@OppSourceID,@OppTypeID,@CreationDate,@LoggedInUserName,@LoggedInUserName,@CreationDate,
		@BudgeIdentifiedValue,@MoveForwardValue,@Pain,@LengthProblem,@Alternatives,@CostToFix)
		
		
		
	END
	
	/* SET NOCOUNT ON */
	RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_GetYesNoOptions]    Script Date: 02/10/2013 12:58:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




Create PROCEDURE [dbo].[sp_GetYesNoOptions]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	SELECT Description , Value FROM TBL_YesNoOptions ORDER BY Description desc/* SET NOCOUNT ON */
	RETURN




GO

/****** Object:  StoredProcedure [dbo].[sp_GetProductTypeByRole]    Script Date: 02/10/2013 12:58:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetProductTypeByRole]

	 (
	 @Role varchar(50),
     @FranchiseeId int
	)

AS


	 if (@Role = 'Corporate' or @Role = 'SiteAdmin' or @Role = 'HomeOfficeAdmin' or @Role = 'HomeOfficeUser' )

	 Begin

		 -- full access get all Product types
	    Select [Id] ,[ProductTypeName] from [Tbl_ProductType] order by ProductTypeName


	 End

    

    if (@Role = 'Coach' or @Role = 'FranchiseeOwner' or @Role = 'Client' or @Role = 'FranchiseeUser')

	 Begin

		 -- full access to all companies and contacts within their region
	    Select [Id] ,[ProductTypeName] from [Tbl_ProductType] 
	    where 
	    -- 0 represents default options
	    FranchiseeId = @FranchiseeId or FranchiseeId = 0
	    order by ProductTypeName

	 End

    

	 RETURN




GO


