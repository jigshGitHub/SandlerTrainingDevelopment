/*
Executed in devlopment of SandlerTraining on 0606 at 3:50AM
*/
ALTER TABLE [dbo].[TBL_COMPANIES] ADD [StartTime] [datetime] NULL
ALTER TABLE [dbo].[TBL_CONTACTS] ADD [StartTime] [datetime] NULL
ALTER TABLE [dbo].[Tbl_FollowUpItemsList] ADD [StartTime] [datetime] NULL

/****** Object:  StoredProcedure [dbo].[sp_AddFollowUpItem]    Script Date: 06/05/2013 16:21:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AddFollowUpItem]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AddFollowUpItem]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompanies]    Script Date: 06/05/2013 16:21:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCompanies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCompanies]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByCoachId]    Script Date: 06/05/2013 16:21:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCompaniesByCoachId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCompaniesByCoachId]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByCoachIdSearch]    Script Date: 06/05/2013 16:21:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCompaniesByCoachIdSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCompaniesByCoachIdSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByFrId]    Script Date: 06/05/2013 16:21:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCompaniesByFrId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCompaniesByFrId]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByFrIdSearch]    Script Date: 06/05/2013 16:21:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCompaniesByFrIdSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCompaniesByFrIdSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesSearch]    Script Date: 06/05/2013 16:21:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCompaniesSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCompaniesSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContacts]    Script Date: 06/05/2013 16:21:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContacts]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContacts]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCoachID]    Script Date: 06/05/2013 16:21:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByCoachID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByCoachID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCoachIDSearch]    Script Date: 06/05/2013 16:21:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByCoachIDSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByCoachIDSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCompID]    Script Date: 06/05/2013 16:21:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByCompID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByCompID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByFrID]    Script Date: 06/05/2013 16:21:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByFrID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByFrID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByFrIDSearch]    Script Date: 06/05/2013 16:21:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByFrIDSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByFrIDSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByUserID]    Script Date: 06/05/2013 16:21:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByUserID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByUserID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByUserIDSearch]    Script Date: 06/05/2013 16:21:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByUserIDSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByUserIDSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsForCompByUserID]    Script Date: 06/05/2013 16:21:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsForCompByUserID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsForCompByUserID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsSearch]    Script Date: 06/05/2013 16:21:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllEvents]    Script Date: 06/05/2013 16:21:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllEvents]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllEvents]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetCompanyDetails]    Script Date: 06/05/2013 16:21:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetCompanyDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetCompanyDetails]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetContactDetails]    Script Date: 06/05/2013 16:21:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetContactDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetContactDetails]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertCompany]    Script Date: 06/05/2013 16:21:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertCompany]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_InsertCompany]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertContact]    Script Date: 06/05/2013 16:21:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertContact]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_InsertContact]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateCompanyDetails]    Script Date: 06/05/2013 16:21:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UpdateCompanyDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UpdateCompanyDetails]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateContactDetails]    Script Date: 06/05/2013 16:21:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UpdateContactDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UpdateContactDetails]
GO


/****** Object:  StoredProcedure [dbo].[sp_AddFollowUpItem]    Script Date: 06/05/2013 16:21:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[sp_AddFollowUpItem]

	 (

		 @UserId varchar(50),
		 @FollowUpDate datetime,
		 @Description varchar(150),
		 @Topic varchar(50),
		 @Phone varchar(50),
		 @StartTime datetime

	 )
 
AS

	 Insert into Tbl_FollowUpItemsList

	 (UserId, FollowUpDate,Description,Topic,IsActive, CreatedOn,Phone, StartTime)

	 values

	 (@UserId,@FollowUpDate,@Description,@Topic,1, GetDate(),@Phone,@StartTime)

	

	 /* SET NOCOUNT ON */

	 RETURN










GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompanies]    Script Date: 06/05/2013 16:21:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[sp_GetAllCompanies]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	SELECT 
	cp.COMPANIESID,
	cp.COMPANYNAME,
	cp.RepLastName+', '+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	-- Extra Columns for Export to Excel
	f.Name as FranchiseeName ,
	yno.Description as NewCompanyDesp,
	cp.Address,	cp.Zip, 
	cp.CITY,cp.STATE,
	cp.POCLastName+', '+ cp.POCFirstName as POCFullName,
	cp.POCPhone,cp.DiscussionTopic,
	cp.ActionStep,cp.LASTCONTACT_DATE,
	cp.NEXTCONTACT_DATE,cp.CreationDate,
	ch.RegionID,rg.Name as RegionName,
	cp.Country,
	cp.BillingAddress,cp.BillingState,cp.BillingZip,cp.BillingCity,cp.BillingCountry,
	cp.CompanyOwnership,cp.CompanyDescription,cp.POCDepartment,cp.POCEmail,
	cp.POCFax,cp.AssistantLastName,cp.AssistantFirstName,cp.AssistantPhone,
	cp.Website,cp.EmpQuantity,cp.Notes,cp.StartTime,
	ynb.Description as BillingDescription  
	FROM TBL_COMPANIES cp
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	left join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany 
	left join Tbl_YesNoOptions ynb on ynb.Value = cp.IsSameBillingAddress 
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	left join TBL_COACH ch on ch.ID = f.CoachID
	left join TBL_REGION rg on ch.RegionID = rg.ID  
	ORDER BY COMPANYNAME
	
	RETURN




GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByCoachId]    Script Date: 06/05/2013 16:21:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_GetAllCompaniesByCoachId]
	
	(
		@CoachId int
	)
	
AS
		
	SELECT cp.COMPANIESID,cp.COMPANYNAME,
	cp.RepLastName+', '+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	
	-- Extra Columns for Export to Excel
	f.Name as FranchiseeName ,
	yno.Description as NewCompanyDesp,
	cp.Address,	cp.Zip, 
	cp.CITY,cp.STATE,
	cp.POCLastName+', '+ cp.POCFirstName as POCFullName,
	cp.POCPhone,cp.DiscussionTopic,
	cp.ActionStep,cp.LASTCONTACT_DATE,
	cp.NEXTCONTACT_DATE,cp.CreationDate,
	ch.RegionID,rg.Name as RegionName,  
	cp.Country,
	cp.BillingAddress,cp.BillingState,cp.BillingZip,cp.BillingCity,cp.BillingCountry,
	cp.CompanyOwnership,cp.CompanyDescription,cp.POCDepartment,cp.POCEmail,
	cp.POCFax,cp.AssistantLastName,cp.AssistantFirstName,cp.AssistantPhone,
	cp.Website,cp.EmpQuantity,cp.Notes,cp.StartTime,
	ynb.Description as BillingDescription 
	FROM TBL_COMPANIES cp 
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	left join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany 
	left join Tbl_YesNoOptions ynb on ynb.Value = cp.IsSameBillingAddress 
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	left join TBL_COACH ch on ch.ID = f.CoachID
	left join TBL_REGION rg on ch.RegionID = rg.ID  
	where cp.FranchiseeId in (Select id from Tbl_Franchisee  where CoachID = @CoachId) 
	ORDER BY COMPANYNAME
	
	
	RETURN




GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByCoachIdSearch]    Script Date: 06/05/2013 16:21:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[sp_GetAllCompaniesByCoachIdSearch]
	
	(
		@CoachId varchar(50),
		@CompanyName varchar(150),
		@CompanyOwnership varchar(50), 
		@CompanyDescription varchar(50),
		@RepLastName varchar(50),
		@RepFirstName varchar(50),
		@IndustryIdList varchar(50),
		@TotalCompValue varchar(50),
		@IsNewCompanyIdList varchar(50),
		@IsSameBillingAdrsList varchar(50),
		@Address varchar(150),
		@Zip varchar(50),
		@City varchar(50),
		@State varchar(50),
		@Country varchar(50),
		@BillingAddress varchar(150),
		@BillingCity varchar(50), 
		@BillingState varchar(50), 
		@BillingZip varchar(50),
		@BillingCountry varchar(50),
		@POCLastName varchar(50),
		@POCFirstName varchar(50),
		@POCPhone varchar(50),
		@POCDepartment varchar(50),
		@POCEmail varchar(50),
		@POCFax varchar(50),
		@AssistantLastName varchar(50),
		@AssistantFirstName varchar(50),
		@AssistantPhone varchar(50),
		@Website varchar(80),
		@EmpQuantity varchar(50),
		@Notes varchar(200),
		@DiscussionTopic varchar(50),
		@ActionStep varchar(50),
		@LastContactDate datetime,
		@NextContactDate datetime,
		@CreationDate datetime
	)
	
AS

    if @LastContactDate < '2/1/1755'
	 Begin
		 Set @LastContactDate = null
	 End	
	
	if @NextContactDate < '2/1/1755'
	 Begin
		 Set @NextContactDate = null
	 End
	 
	 if @CreationDate < '2/1/1755'
	 Begin
		 Set @CreationDate = null
	 End
    
    DECLARE @SQLString VARCHAR(7500);
	Declare @PrevConditionExist varchar(10);
	Set @PrevConditionExist = 'No';
	-- Base SQL string stetement
	Set @SQLString = 'SELECT 
	cp.COMPANIESID,
	cp.COMPANYNAME,
	cp.RepLastName+'',''+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	
	-- Extra Columns for Export to Excel
	f.Name as FranchiseeName ,
	yno.Description as NewCompanyDesp,
	cp.Address,	cp.Zip, 
	cp.CITY,cp.STATE,
	cp.POCLastName+'',''+ cp.POCFirstName as POCFullName,
	cp.POCPhone,cp.DiscussionTopic,
	cp.ActionStep,cp.LASTCONTACT_DATE,
	cp.NEXTCONTACT_DATE,cp.CreationDate,
	ch.RegionId,
	rg.Name as RegionName,
	cp.Country,
	cp.BillingAddress,cp.BillingState,cp.BillingZip,cp.BillingCity,cp.BillingCountry,
	cp.CompanyOwnership,cp.CompanyDescription,cp.POCDepartment,cp.POCEmail,
	cp.POCFax,cp.AssistantLastName,cp.AssistantFirstName,cp.AssistantPhone,
	cp.Website,cp.EmpQuantity,cp.Notes,cp.StartTime,
	ynb.Description as BillingDescription 
	FROM TBL_COMPANIES cp
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	left join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany
	left join Tbl_YesNoOptions ynb on ynb.Value = cp.IsSameBillingAddress    
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	left join TBL_COACH ch on ch.ID = f.CoachID
	left join TBL_REGION rg on ch.RegionID = rg.ID  
	where cp.FranchiseeId in (Select id from Tbl_Franchisee  where CoachID = (' + @CoachId + '))'  + ' AND ('
	-- Add based on the selection by the user - at least one selection will be there
	if @CompanyName is not null and @CompanyName != ''
	Begin
		SET @SQLString = @SQLString + 'cp.COMPANYNAME like ''' + '%' + @CompanyName  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Company Ownership
	if @CompanyOwnership is not null and @CompanyOwnership != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.CompanyOwnership like ''' + '%' + @CompanyOwnership  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Company Description
	if @CompanyDescription is not null and @CompanyDescription != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.CompanyDescription like ''' + '%' + @CompanyDescription  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Rep Last Name
	if @RepLastName is not null and @RepLastName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.RepLastName like ''' + '%' + @RepLastName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Rep First Name
	if @RepFirstName is not null and @RepFirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.RepFirstName like ''' + '%' + @RepFirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Industry Id
	if @IndustryIdList is not null and  @IndustryIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.IndustryId in (' + @IndustryIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Total Company Value
	if @TotalCompValue is not null and @TotalCompValue != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'dbo.GetTotalCompanyValue(COMPANIESID) = (' + @TotalCompValue + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Emp Quantity
	if @EmpQuantity is not null and @EmpQuantity != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.EmpQuantity = (' + @EmpQuantity + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for IsNewComapany ?
	if @IsNewCompanyIdList is not null and @IsNewCompanyIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.IsNewCompany in (' + @IsNewCompanyIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for IsSameBillingAddress ?
	if @IsSameBillingAdrsList is not null and @IsSameBillingAdrsList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.IsSameBillingAddress in (' + @IsSameBillingAdrsList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Address
	if @Address is not null and @Address != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Address like ''' + '%' + @Address  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Billing Address
	if @BillingAddress is not null and @BillingAddress != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.BillingAddress like ''' + '%' + @BillingAddress  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Zip
	if @Zip is not null and @Zip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Zip like ''' + '%' + @Zip  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Billing Zip
	if @BillingZip is not null and @BillingZip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.BillingZip like ''' + '%' + @BillingZip  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For City
	if @City is not null and @City != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.City like ''' + '%' + @City  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Billing City
	if @BillingCity is not null and @BillingCity != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.BillingCity like ''' + '%' + @BillingCity  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For State
	if @State is not null and @State != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.State like ''' + '%' + @State  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Billing State
	if @BillingState is not null and @BillingState != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.BillingState like ''' + '%' + @BillingState  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Country
	if @Country is not null and @Country != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Country like ''' + '%' + @Country  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Billing Country
	if @BillingCountry is not null and @BillingCountry != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.BillingCountry like ''' + '%' + @BillingCountry  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Last Name
	if @POCLastName is not null and @POCLastName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCLastName like ''' + '%' + @POCLastName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC First Name
	if @POCFirstName is not null and @POCFirstName  != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCFirstName like ''' + '%' + @POCFirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Phone
	if @POCPhone is not null and @POCPhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCPhone like ''' + '%' + @POCPhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Department
	if @POCDepartment is not null and @POCDepartment != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCDepartment like ''' + '%' + @POCDepartment  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Email
	if @POCEmail is not null and @POCEmail != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCEmail like ''' + '%' + @POCEmail  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Fax
	if @POCFax is not null and @POCFax != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCFax like ''' + '%' + @POCFax  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Assistant LastName
	if @AssistantLastName is not null and @AssistantLastName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.AssistantLastName like ''' + '%' + @AssistantLastName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Assistant FirstName
	if @AssistantFirstName is not null and @AssistantFirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.AssistantFirstName like ''' + '%' + @AssistantFirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Assistant Phone
	if @AssistantPhone is not null and @AssistantPhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.AssistantPhone like ''' + '%' + @AssistantPhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Website
	if @Website is not null and @Website != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Website like ''' + '%' + @Website  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Discussion Topic
	if @DiscussionTopic is not null and @DiscussionTopic != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.DiscussionTopic like ''' + '%' + @DiscussionTopic  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Action Step
	if @ActionStep is not null and @ActionStep != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.ActionStep like ''' + '%' + @ActionStep  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Notes
	if @Notes is not null and @Notes != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Notes like ''' + '%' + @Notes  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Contact Date
	if @LastContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.LASTCONTACT_DATE = ''' + Convert(Varchar,@LastContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Next Contact Date
	if @NextContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.NEXTCONTACT_DATE = ''' + Convert(Varchar,@NextContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Creation Date
	if @CreationDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.CreationDate = ''' + Convert(Varchar,@CreationDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- End of conditons so we need to close with bracket
	SET @SQLString = @SQLString + ')' ;
	-- Order By
	SET @SQLString = @SQLString + ' ORDER BY cp.COMPANYNAME ' ;
    -- Now Print/Execute the Statement
    --Print @SQLString
    EXEC(@SQLString);
	
		
	
	RETURN 
    
		
	/*SELECT cp.COMPANIESID,cp.COMPANYNAME,
	cp.RepLastName+', '+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	-- Extra Columns for Export to Excel
	f.Name as FranchiseeName ,
	yno.Description as NewCompanyDesp,
	cp.Address,	cp.Zip, 
	cp.CITY,cp.STATE,
	cp.POCLastName+', '+ cp.POCFirstName as POCFullName,
	cp.POCPhone,cp.DiscussionTopic,
	cp.ActionStep,cp.LASTCONTACT_DATE,
	cp.NEXTCONTACT_DATE,cp.CreationDate
	FROM TBL_COMPANIES cp 
	join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany 
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	where cp.FranchiseeId in (Select id from Tbl_Franchisee  where CoachID = @CoachId) 
	ORDER BY COMPANYNAME
		
	RETURN*/





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByFrId]    Script Date: 06/05/2013 16:21:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_GetAllCompaniesByFrId]
	
	(
		@FranchiseeId int
	)
	
AS
		
	SELECT 
	cp.COMPANIESID,
	cp.COMPANYNAME,
	cp.RepLastName+', '+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	
	-- Extra Columns for Export to Excel
	f.Name as FranchiseeName ,
	yno.Description as NewCompanyDesp,
	cp.Address,	cp.Zip, 
	cp.CITY,cp.STATE,
	cp.POCLastName+', '+ cp.POCFirstName as POCFullName,
	cp.POCPhone,cp.DiscussionTopic,
	cp.ActionStep,cp.LASTCONTACT_DATE,
	cp.NEXTCONTACT_DATE,cp.CreationDate,
	ch.RegionID,rg.Name as RegionName, 
	cp.Country,
	cp.BillingAddress,cp.BillingState,cp.BillingZip,cp.BillingCity,cp.BillingCountry,
	cp.CompanyOwnership,cp.CompanyDescription,cp.POCDepartment,cp.POCEmail,
	cp.POCFax,cp.AssistantLastName,cp.AssistantFirstName,cp.AssistantPhone,
	cp.Website,cp.EmpQuantity,cp.Notes,cp.StartTime,
	ynb.Description as BillingDescription 
	FROM TBL_COMPANIES cp
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	left join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany
	left join Tbl_YesNoOptions ynb on ynb.Value = cp.IsSameBillingAddress   
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	left join TBL_COACH ch on ch.ID = f.CoachID
	left join TBL_REGION rg on ch.RegionID = rg.ID  
	where cp.FranchiseeId = @FranchiseeId 
	ORDER BY COMPANYNAME
	
	
	
	RETURN




GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByFrIdSearch]    Script Date: 06/05/2013 16:21:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[sp_GetAllCompaniesByFrIdSearch]
	
	(
		@FranchiseeId varchar(50),
		@CompanyName varchar(150),
		@CompanyOwnership varchar(50), 
		@CompanyDescription varchar(50),
		@RepLastName varchar(50),
		@RepFirstName varchar(50),
		@IndustryIdList varchar(50),
		@TotalCompValue varchar(50),
		@IsNewCompanyIdList varchar(50),
		@IsSameBillingAdrsList varchar(50),
		@Address varchar(150),
		@Zip varchar(50),
		@City varchar(50),
		@State varchar(50),
		@Country varchar(50),
		@BillingAddress varchar(150),
		@BillingCity varchar(50), 
		@BillingState varchar(50), 
		@BillingZip varchar(50),
		@BillingCountry varchar(50),
		@POCLastName varchar(50),
		@POCFirstName varchar(50),
		@POCPhone varchar(50),
		@POCDepartment varchar(50),
		@POCEmail varchar(50),
		@POCFax varchar(50),
		@AssistantLastName varchar(50),
		@AssistantFirstName varchar(50),
		@AssistantPhone varchar(50),
		@Website varchar(80),
		@EmpQuantity varchar(50),
		@Notes varchar(200),
		@DiscussionTopic varchar(50),
		@ActionStep varchar(50),
		@LastContactDate datetime,
		@NextContactDate datetime,
		@CreationDate datetime
	)
	
AS
	if @LastContactDate < '2/1/1755'
	 Begin
		 Set @LastContactDate = null
	 End	
	
	if @NextContactDate < '2/1/1755'
	 Begin
		 Set @NextContactDate = null
	 End
	 
	 if @CreationDate < '2/1/1755'
	 Begin
		 Set @CreationDate = null
	 End
	
	DECLARE @SQLString VARCHAR(7500);
	Declare @PrevConditionExist varchar(10);
	Set @PrevConditionExist = 'No';
	-- Base SQL string stetement
	Set @SQLString = 'SELECT 
	cp.COMPANIESID,
	cp.COMPANYNAME,
	cp.RepLastName+'',''+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	
	-- Extra Columns for Export to Excel
	f.Name as FranchiseeName ,
	yno.Description as NewCompanyDesp,
	cp.Address,	cp.Zip, 
	cp.CITY,cp.STATE,
	cp.POCLastName+'',''+ cp.POCFirstName as POCFullName,
	cp.POCPhone,cp.DiscussionTopic,
	cp.ActionStep,cp.LASTCONTACT_DATE,
	cp.NEXTCONTACT_DATE,cp.CreationDate,
	ch.RegionId,
	rg.Name as RegionName,
	cp.Country,
	cp.BillingAddress,cp.BillingState,cp.BillingZip,cp.BillingCity,cp.BillingCountry,
	cp.CompanyOwnership,cp.CompanyDescription,cp.POCDepartment,cp.POCEmail,
	cp.POCFax,cp.AssistantLastName,cp.AssistantFirstName,cp.AssistantPhone,
	cp.Website,cp.EmpQuantity,cp.Notes,cp.StartTime,
	ynb.Description as BillingDescription
	FROM TBL_COMPANIES cp
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	left join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany
	left join Tbl_YesNoOptions ynb on ynb.Value = cp.IsSameBillingAddress   
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	left join TBL_COACH ch on ch.ID = f.CoachID
	left join TBL_REGION rg on ch.RegionID = rg.ID  
	where ('
	-- Add based on the selection by the user - at least one selection will be there
	if @CompanyName is not null and @CompanyName != ''
	Begin
		SET @SQLString = @SQLString + 'cp.COMPANYNAME like ''' + '%' + @CompanyName  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Company Ownership
	if @CompanyOwnership is not null and @CompanyOwnership != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.CompanyOwnership like ''' + '%' + @CompanyOwnership  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Company Description
	if @CompanyDescription is not null and @CompanyDescription != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.CompanyDescription like ''' + '%' + @CompanyDescription  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Rep Last Name
	if @RepLastName is not null and @RepLastName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.RepLastName like ''' + '%' + @RepLastName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Rep First Name
	if @RepFirstName is not null and @RepFirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.RepFirstName like ''' + '%' + @RepFirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Industry Id
	if @IndustryIdList is not null and  @IndustryIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.IndustryId in (' + @IndustryIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Total Company Value
	if @TotalCompValue is not null and @TotalCompValue != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'dbo.GetTotalCompanyValue(COMPANIESID) = (' + @TotalCompValue + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Emp Quantity
	if @EmpQuantity is not null and @EmpQuantity != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.EmpQuantity = (' + @EmpQuantity + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for IsNewComapany ?
	if @IsNewCompanyIdList is not null and @IsNewCompanyIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.IsNewCompany in (' + @IsNewCompanyIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for IsSameBillingAddress ?
	if @IsSameBillingAdrsList is not null and @IsSameBillingAdrsList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.IsSameBillingAddress in (' + @IsSameBillingAdrsList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Address
	if @Address is not null and @Address != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Address like ''' + '%' + @Address  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Billing Address
	if @BillingAddress is not null and @BillingAddress != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.BillingAddress like ''' + '%' + @BillingAddress  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Zip
	if @Zip is not null and @Zip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Zip like ''' + '%' + @Zip  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Billing Zip
	if @BillingZip is not null and @BillingZip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.BillingZip like ''' + '%' + @BillingZip  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For City
	if @City is not null and @City != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.City like ''' + '%' + @City  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Billing City
	if @BillingCity is not null and @BillingCity != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.BillingCity like ''' + '%' + @BillingCity  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For State
	if @State is not null and @State != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.State like ''' + '%' + @State  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Billing State
	if @BillingState is not null and @BillingState != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.BillingState like ''' + '%' + @BillingState  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Country
	if @Country is not null and @Country != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Country like ''' + '%' + @Country  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Billing Country
	if @BillingCountry is not null and @BillingCountry != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.BillingCountry like ''' + '%' + @BillingCountry  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End

	-- For POC Last Name
	if @POCLastName is not null and @POCLastName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCLastName like ''' + '%' + @POCLastName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC First Name
	if @POCFirstName is not null and @POCFirstName  != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCFirstName like ''' + '%' + @POCFirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Phone
	if @POCPhone is not null and @POCPhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCPhone like ''' + '%' + @POCPhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Department
	if @POCDepartment is not null and @POCDepartment != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCDepartment like ''' + '%' + @POCDepartment  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Email
	if @POCEmail is not null and @POCEmail != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCEmail like ''' + '%' + @POCEmail  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Fax
	if @POCFax is not null and @POCFax != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCFax like ''' + '%' + @POCFax  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Assistant LastName
	if @AssistantLastName is not null and @AssistantLastName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.AssistantLastName like ''' + '%' + @AssistantLastName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Assistant FirstName
	if @AssistantFirstName is not null and @AssistantFirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.AssistantFirstName like ''' + '%' + @AssistantFirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Assistant Phone
	if @AssistantPhone is not null and @AssistantPhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.AssistantPhone like ''' + '%' + @AssistantPhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Website
	if @Website is not null and @Website != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Website like ''' + '%' + @Website  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End

	-- For Discussion Topic
	if @DiscussionTopic is not null and @DiscussionTopic != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.DiscussionTopic like ''' + '%' + @DiscussionTopic  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Action Step
	if @ActionStep is not null and @ActionStep != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.ActionStep like ''' + '%' + @ActionStep  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Notes
	if @Notes is not null and @Notes != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Notes like ''' + '%' + @Notes  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Contact Date
	if @LastContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.LASTCONTACT_DATE = ''' + Convert(Varchar,@LastContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Next Contact Date
	if @NextContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.NEXTCONTACT_DATE = ''' + Convert(Varchar,@NextContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Creation Date
	if @CreationDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.CreationDate = ''' + Convert(Varchar,@CreationDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- End of conditons so we need to close with bracket
	SET @SQLString = @SQLString + ')' ;
	
	SET @SQLString = @SQLString + ' AND cp.FranchiseeId =' + @FranchiseeId ;
	-- Order By
	SET @SQLString = @SQLString + ' ORDER BY cp.COMPANYNAME ' ;
    -- Now Print/Execute the Statement
    --Print @SQLString
    EXEC(@SQLString);
	
		
	
	RETURN
	
	/*SELECT 
	cp.COMPANIESID,
	cp.COMPANYNAME,
	cp.RepLastName+', '+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	-- Extra Columns for Export to Excel
	f.Name as FranchiseeName ,
	yno.Description as NewCompanyDesp,
	cp.Address,	cp.Zip, 
	cp.CITY,cp.STATE,
	cp.POCLastName+', '+ cp.POCFirstName as POCFullName,
	cp.POCPhone,cp.DiscussionTopic,
	cp.ActionStep,cp.LASTCONTACT_DATE,
	cp.NEXTCONTACT_DATE,cp.CreationDate
	FROM TBL_COMPANIES cp
	join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany  
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	where cp.FranchiseeId = @FranchiseeId 
	ORDER BY COMPANYNAME
	
	
	
	
	RETURN
	*/





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesSearch]    Script Date: 06/05/2013 16:21:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_GetAllCompaniesSearch]
	
	(
		@CompanyName varchar(150),
		@CompanyOwnership varchar(50), 
		@CompanyDescription varchar(50),
		@RepLastName varchar(50),
		@RepFirstName varchar(50),
		@IndustryIdList varchar(50),
		@TotalCompValue varchar(50),
		@IsNewCompanyIdList varchar(50),
		@IsSameBillingAdrsList varchar(50),
		@Address varchar(150),
		@Zip varchar(50),
		@City varchar(50),
		@State varchar(50),
		@Country varchar(50),
		@BillingAddress varchar(150),
		@BillingCity varchar(50), 
		@BillingState varchar(50), 
		@BillingZip varchar(50),
		@BillingCountry varchar(50),
		@POCLastName varchar(50),
		@POCFirstName varchar(50),
		@POCPhone varchar(50),
		@POCDepartment varchar(50),
		@POCEmail varchar(50),
		@POCFax varchar(50),
		@AssistantLastName varchar(50),
		@AssistantFirstName varchar(50),
		@AssistantPhone varchar(50),
		@Website varchar(80),
		@EmpQuantity varchar(50),
		@Notes varchar(200),
		@DiscussionTopic varchar(50),
		@ActionStep varchar(50),
		@LastContactDate datetime,
		@NextContactDate datetime,
		@CreationDate datetime
				
	)
	
AS
	
	if @LastContactDate < '2/1/1755'
	 Begin
		 Set @LastContactDate = null
	 End	
	
	if @NextContactDate < '2/1/1755'
	 Begin
		 Set @NextContactDate = null
	 End
	 
	 if @CreationDate < '2/1/1755'
	 Begin
		 Set @CreationDate = null
	 End
	
	DECLARE @SQLString VARCHAR(7500);
	Declare @PrevConditionExist varchar(10);
	Set @PrevConditionExist = 'No';
	-- Base SQL string stetement
	Set @SQLString = 'SELECT 
	cp.COMPANIESID,
	cp.COMPANYNAME,
	cp.RepLastName+'',''+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	
	-- Extra Columns for Export to Excel
	f.Name as FranchiseeName ,
	yno.Description as NewCompanyDesp,
	cp.Address,	cp.Zip, 
	cp.CITY,cp.STATE,
	cp.POCLastName+'',''+ cp.POCFirstName as POCFullName,
	cp.POCPhone,cp.DiscussionTopic,
	cp.ActionStep,cp.LASTCONTACT_DATE,cp.StartTime,
	cp.NEXTCONTACT_DATE,cp.CreationDate,
	ch.RegionId,
	rg.Name as RegionName,
	cp.Country,
	cp.BillingAddress,cp.BillingState,cp.BillingZip,cp.BillingCity,cp.BillingCountry,
	cp.CompanyOwnership,cp.CompanyDescription,cp.POCDepartment,cp.POCEmail,
	cp.POCFax,cp.AssistantLastName,cp.AssistantFirstName,cp.AssistantPhone,
	cp.Website,cp.EmpQuantity,cp.Notes,
	ynb.Description as BillingDescription
	FROM TBL_COMPANIES cp
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	left join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany
	left join Tbl_YesNoOptions ynb on ynb.Value = cp.IsSameBillingAddress  
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	left join TBL_COACH ch on ch.ID = f.CoachID
	left join TBL_REGION rg on ch.RegionID = rg.ID  
	where ('
	-- Add based on the selection by the user - at least one selection will be there
	if @CompanyName is not null and @CompanyName != ''
	Begin
		SET @SQLString = @SQLString + 'cp.COMPANYNAME like ''' + '%' + @CompanyName  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Company Ownership
	if @CompanyOwnership is not null and @CompanyOwnership != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.CompanyOwnership like ''' + '%' + @CompanyOwnership  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Company Description
	if @CompanyDescription is not null and @CompanyDescription != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.CompanyDescription like ''' + '%' + @CompanyDescription  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Rep Last Name
	if @RepLastName is not null and @RepLastName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.RepLastName like ''' + '%' + @RepLastName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Rep First Name
	if @RepFirstName is not null and @RepFirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.RepFirstName like ''' + '%' + @RepFirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Industry Id
	if @IndustryIdList is not null and  @IndustryIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.IndustryId in (' + @IndustryIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Total Company Value
	if @TotalCompValue is not null and @TotalCompValue != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'dbo.GetTotalCompanyValue(COMPANIESID) = (' + @TotalCompValue + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Emp Quantity
	if @EmpQuantity is not null and @EmpQuantity != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.EmpQuantity = (' + @EmpQuantity + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for IsNewComapany ?
	if @IsNewCompanyIdList is not null and @IsNewCompanyIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.IsNewCompany in (' + @IsNewCompanyIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for IsSameBillingAddress ?
	if @IsSameBillingAdrsList is not null and @IsSameBillingAdrsList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.IsSameBillingAddress in (' + @IsSameBillingAdrsList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Address
	if @Address is not null and @Address != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Address like ''' + '%' + @Address  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Billing Address
	if @BillingAddress is not null and @BillingAddress != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.BillingAddress like ''' + '%' + @BillingAddress  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Zip
	if @Zip is not null and @Zip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Zip like ''' + '%' + @Zip  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Billing Zip
	if @BillingZip is not null and @BillingZip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.BillingZip like ''' + '%' + @BillingZip  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For City
	if @City is not null and @City != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.City like ''' + '%' + @City  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Billing City
	if @BillingCity is not null and @BillingCity != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.BillingCity like ''' + '%' + @BillingCity  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For State
	if @State is not null and @State != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.State like ''' + '%' + @State  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Billing State
	if @BillingState is not null and @BillingState != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.BillingState like ''' + '%' + @BillingState  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Country
	if @Country is not null and @Country != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Country like ''' + '%' + @Country  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Billing Country
	if @BillingCountry is not null and @BillingCountry != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.BillingCountry like ''' + '%' + @BillingCountry  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Last Name
	if @POCLastName is not null and @POCLastName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCLastName like ''' + '%' + @POCLastName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC First Name
	if @POCFirstName is not null and @POCFirstName  != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCFirstName like ''' + '%' + @POCFirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Phone
	if @POCPhone is not null and @POCPhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCPhone like ''' + '%' + @POCPhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Department
	if @POCDepartment is not null and @POCDepartment != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCDepartment like ''' + '%' + @POCDepartment  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Email
	if @POCEmail is not null and @POCEmail != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCEmail like ''' + '%' + @POCEmail  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Fax
	if @POCFax is not null and @POCFax != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCFax like ''' + '%' + @POCFax  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Assistant LastName
	if @AssistantLastName is not null and @AssistantLastName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.AssistantLastName like ''' + '%' + @AssistantLastName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Assistant FirstName
	if @AssistantFirstName is not null and @AssistantFirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.AssistantFirstName like ''' + '%' + @AssistantFirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Assistant Phone
	if @AssistantPhone is not null and @AssistantPhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.AssistantPhone like ''' + '%' + @AssistantPhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Website
	if @Website is not null and @Website != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Website like ''' + '%' + @Website  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
		
	
	-- For Discussion Topic
	if @DiscussionTopic is not null and @DiscussionTopic != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.DiscussionTopic like ''' + '%' + @DiscussionTopic  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Action Step
	if @ActionStep is not null and @ActionStep != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.ActionStep like ''' + '%' + @ActionStep  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Notes
	if @Notes is not null and @Notes != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Notes like ''' + '%' + @Notes  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Contact Date
	if @LastContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.LASTCONTACT_DATE = ''' + Convert(Varchar,@LastContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Next Contact Date
	if @NextContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.NEXTCONTACT_DATE = ''' + Convert(Varchar,@NextContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Creation Date
	if @CreationDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.CreationDate = ''' + Convert(Varchar,@CreationDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- End of conditons so we need to close with bracket
	SET @SQLString = @SQLString + ')' ;
	-- Order By
	SET @SQLString = @SQLString + ' ORDER BY cp.COMPANYNAME ' ;
    -- Now Print/Execute the Statement
    --Print @SQLString
    EXEC(@SQLString);
	
		
	
	RETURN
	
	/* Testing Code */

/*
    DECLARE @SQLString VARCHAR(7500);
	Declare @PrevConditionExist varchar(10);
	Set @PrevConditionExist = 'No';
	
	Declare @CompanyName varchar(50);
	Declare @RepLastName varchar(50);
	Declare @RepFirstName varchar(50);
	Declare @POCLastName varchar(50);
	Declare @POCFirstName varchar(50);
	Declare @City varchar(50);
	Declare @State varchar(50);
	Declare @Zip varchar(50);
	Declare @IndustryIdList varchar(50);
	Declare @TotalCompValue varchar(50);
	Declare @IsNewCompanyIdList varchar(50);
	Declare @Address varchar(50);
	Declare @POCPhone varchar(50);
	Declare @DiscussionTopic varchar(50);
	Declare @ActionStep varchar(50);
	Declare @LastContactDate datetime;
	
	Set @CompanyName = null;
	Set @RepLastName = null;
	Set @RepFirstName = null;
	Set @POCLastName = null;
	Set @POCFirstName = null;
	Set @City = null;
	Set @State = null;
	Set @Zip = null;
	Set @IndustryIdList = '5,3';
	Set @TotalCompValue = '1234';
	Set @IsNewCompanyIdList = null;
	Set @Address = null;
	Set @POCPhone = null;
	Set @DiscussionTopic = null;
	Set @ActionStep = null;
	Set @LastContactDate = '8/12/2012';
	
	-- Base SQL string stetement
	Set @SQLString = 'SELECT 
	cp.COMPANIESID,
	cp.COMPANYNAME,
	cp.RepLastName+'',''+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
	-- Extra Columns for Export to Excel
	f.Name as FranchiseeName ,
	yno.Description as NewCompanyDesp,
	cp.Address,	cp.Zip, 
	cp.CITY,cp.STATE,
	cp.POCLastName+'',''+ cp.POCFirstName as POCFullName,
	cp.POCPhone,cp.DiscussionTopic,
	cp.ActionStep,cp.LASTCONTACT_DATE,
	cp.NEXTCONTACT_DATE,cp.CreationDate
	FROM TBL_COMPANIES cp
	join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
	join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany 
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	where ('
	-- Add based on the selection by the user - at least one selection will be there
	if @CompanyName is not null
	Begin
		SET @SQLString = @SQLString + 'cp.COMPANYNAME like ''' + @CompanyName  + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Rep Last Name
	if @RepLastName is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.RepLastName like ''' + @RepLastName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Rep First Name
	if @RepFirstName is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.RepFirstName like ''' + @RepFirstName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Industry Id
	if @IndustryIdList is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.IndustryId in (' + @IndustryIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Total Company Value
	if @TotalCompValue is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'dbo.GetTotalCompanyValue(COMPANIESID) = (' + @TotalCompValue + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for IsNewComapany ?
	if @IsNewCompanyIdList is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.IsNewCompany in (' + @IsNewCompanyIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Address
	if @Address is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Address like ''' + @Address  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Zip
	if @Zip is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.Zip like ''' + @Zip  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For City
	if @City is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.City like ''' + @City  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For State
	if @State is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.State like ''' + @State  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Last Name
	if @POCLastName is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCLastName like ''' + @POCLastName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC First Name
	if @POCFirstName is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCFirstName like ''' + @POCFirstName  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For POC Phone
	if @POCPhone is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.POCPhone like ''' + @POCPhone  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Discussion Topic
	if @DiscussionTopic is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.DiscussionTopic like ''' + @DiscussionTopic  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Action Step
	if @ActionStep is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.ActionStep like ''' + @ActionStep  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Last Contact Date
	if @LastContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'cp.LASTCONTACT_DATE = ''' + Convert(Varchar,@LastContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	
	-- End of conditons so we need to close with bracket
	SET @SQLString = @SQLString + ')' ;
	-- Order By
	SET @SQLString = @SQLString + ' ORDER BY cp.COMPANYNAME ' ;
    -- Now Print/Execute the Statement
    Print @SQLString
    --EXEC(@SQLString);
	
		
	
	RETURN
	*/



GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContacts]    Script Date: 06/05/2013 16:21:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_GetAllContacts]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
		
	select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,ct.StartTime,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country,
    ct.TrainingCourseName, 
    ct.HowManyAttended,
    ct.CompanyNameWhereTrainingConducted  
 	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join   Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack 
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
    left join TBL_COACH ch on ch.ID = f.CoachID
    left join TBL_REGION rg on ch.RegionID = rg.ID   
	Order by cp.COMPANYNAME
	
	
	/* SET NOCOUNT ON */
	RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCoachID]    Script Date: 06/05/2013 16:21:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_GetAllContactsByCoachID]
	
	(
	@CoachID int 
	)
	
AS
	
		
	select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,ct.StartTime,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country,
    ISNULL(ct.TrainingCourseName,'') as TrainingCourseName, 
    ct.HowManyAttended,
    ISNULL(ct.CompanyNameWhereTrainingConducted,'') as CompanyNameWhereTrainingConducted 
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID 
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
    left join TBL_COACH ch on ch.ID = f.CoachID
    left join TBL_REGION rg on ch.RegionID = rg.ID
	where ct.companyid in (Select CompaniesId from tbl_Companies where FranchiseeId in (Select id from Tbl_Franchisee  where CoachID = @CoachId))
	Order by cp.COMPANYNAME
	
	RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCoachIDSearch]    Script Date: 06/05/2013 16:21:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_GetAllContactsByCoachIDSearch]
	
	(
	    @CoachID varchar(50), 
	    @LastName varchar(50),
		@FirstName varchar(50),
		@Title varchar(50),
		@ContactsDepartment varchar(50),
		@ContactsRole varchar(50),
		@Phone varchar(50),
		@MobilePhone varchar(50),
		@HomePhone varchar(50),
		@Fax varchar(50),
		@Email varchar(50),
		@PersonalEmail varchar(50),
		@Address varchar(150),
		@City varchar(50),
		@State varchar(50),
		@Zip varchar(50),
		@Country varchar(50),
		@IsNewApptIdList varchar(50),
		@ApptSourceIdList varchar(150),
		@IsRegForTrainingList varchar(50),
		@CourseTypeIdList varchar(50),
		@CompanyIdList varchar(50),
		@NeedCallBackList varchar(50),
		@EmailSubscriptionList varchar(50),
		@DiscussionTopic varchar(50),
		@ActionStep varchar(50),
		@LastContactDate datetime,
		@NextContactDate datetime,
		@LastAttemptedDate datetime,
		@LastEmailedDate datetime,
		@LastMeetingDate datetime,
		@LetterSentDate datetime,
		@CourseTrngDate datetime,
		@BirthDayDate datetime,
		@AnniversaryDate datetime,
		@CompanyYears varchar(50),
		@BossName varchar(50),
		@SpouseName varchar(50),
		@ReferredBy varchar(50),
		@Notes varchar(200),
		@TrainingCourseName varchar(150),
        @HowManyAttended varchar(20),
        @CompanyNameWhereTrainingConducted varchar(150)
	)
	
AS
	if @LastContactDate < '2/1/1755'
	 Begin
		 Set @LastContactDate = null
	 End
	 
	if @NextContactDate < '2/1/1755'
	 Begin
		 Set @NextContactDate = null
	 End 
	
	if @CourseTrngDate < '2/1/1755'
	 Begin
		 Set @CourseTrngDate = null
	 End
	
	if @BirthDayDate < '2/1/1755'
	 Begin
		 Set @BirthDayDate = null
	 End
	 
	 if @AnniversaryDate < '2/1/1755'
	 Begin
		 Set @AnniversaryDate = null
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
	 
	 DECLARE @SQLString VARCHAR(7500);
	 Declare @PrevConditionExist varchar(10);
	 Set @PrevConditionExist = 'No';
	 
	 -- Base SQL string stetement
	Set @SQLString = 'Select 
	ct.lastname + '','' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,ct.StartTime,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country,
    ct.TrainingCourseName, 
    ct.HowManyAttended,
    ct.CompanyNameWhereTrainingConducted        
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join   Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId   
    left join TBL_COACH ch on ch.ID = f.CoachID
    left join TBL_REGION rg on ch.RegionID = rg.ID
	where 
	ct.companyid in (Select CompaniesId from tbl_Companies where FranchiseeId in (Select id from Tbl_Franchisee  where CoachID = (' + @CoachId + ')))'  + ' AND ('
	
	-- Last Name
	if @LastName is not null and @LastName != ''
	Begin
		SET @SQLString = @SQLString + 'ct.lastname like ''' + '%' + @LastName  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Training Course Name
	if @TrainingCourseName is not null and @TrainingCourseName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.TrainingCourseName like ''' + '%' + @TrainingCourseName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Company Name where Training is conducted
	if @CompanyNameWhereTrainingConducted is not null and @CompanyNameWhereTrainingConducted != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CompanyNameWhereTrainingConducted like ''' + '%' + @CompanyNameWhereTrainingConducted  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- How Many Attended
	if @HowManyAttended is not null and @HowManyAttended != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.HowManyAttended like ''' + '%' + @HowManyAttended  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- First Name
	if @FirstName is not null and @FirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.FirstName like ''' + '%' + @FirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Title
	if @Title is not null and @Title != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Title like ''' + '%' + @Title  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- ContactsDepartment
	if @ContactsDepartment is not null and @ContactsDepartment != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ContactsDepartment like ''' + '%' + @ContactsDepartment  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- ContactsRole
	if @ContactsRole is not null and @ContactsRole != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ContactsRole like ''' + '%' + @ContactsRole  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	--@MobilePhone
	if @MobilePhone is not null and @MobilePhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.MobilePhone like ''' + '%' + @MobilePhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	--@HomePhone
	if @HomePhone is not null and @HomePhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.HomePhone like ''' + '%' + @HomePhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- Fax
	if @Fax is not null and @Fax != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Fax like ''' + '%' + @Fax  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
		
	-- PersonalEmail
	if @PersonalEmail is not null and @PersonalEmail != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.PersonalEmail like ''' + '%' + @PersonalEmail  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Address
	if @Address is not null and @Address != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Address like ''' + '%' + @Address  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Zip
	if @Zip is not null and @Zip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Zip like ''' + '%' + @Zip  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For City
	if @City is not null and @City != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.City like ''' + '%' + @City  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For State
	if @State is not null and @State != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.State like ''' + '%' + @State  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Country
	if @Country is not null and @Country != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Country like ''' + '%' + @Country  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Attempted Date
	if @LastAttemptedDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastAttemptedDate = ''' + Convert(Varchar,@LastAttemptedDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Last Emailed Date
	if @LastEmailedDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastEmailedDate = ''' + Convert(Varchar,@LastEmailedDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Last Meeting Date
	if @LastMeetingDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastMeetingDate = ''' + Convert(Varchar,@LastMeetingDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Letter Sent Date
	if @LetterSentDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LetterSentDate = ''' + Convert(Varchar,@LetterSentDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Spouse Name
	if @SpouseName is not null and @SpouseName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.SpouseName like ''' + '%' + @SpouseName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	
	-- For ReferredBy
	if @ReferredBy is not null and @ReferredBy != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ReferredBy like ''' + '%' + @ReferredBy  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Notes
	if @Notes is not null and @Notes != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Notes like ''' + '%' + @Notes  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Phone
	if @Phone is not null and @Phone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Phone like ''' + '%' + @Phone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Email
	if @Email is not null and @Email != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Email like ''' + '%' + @Email  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Is New Appt List
	if @IsNewApptIdList is not null and  @IsNewApptIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsNewAppointment in (' + @IsNewApptIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Appt Source Id List
	if @ApptSourceIdList is not null and  @ApptSourceIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ApptSourceId in (' + @ApptSourceIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Is Reg For Training List
	if @IsRegForTrainingList is not null and  @IsRegForTrainingList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsRegisteredForTraining in (' + @IsRegForTrainingList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Course Type
	if @CourseTypeIdList is not null and  @CourseTypeIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CourseId in (' + @CourseTypeIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Company ID
	if @CompanyIdList is not null and  @CompanyIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.companyid in (' + @CompanyIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Need Call Back List
	if @NeedCallBackList is not null and  @NeedCallBackList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsNeedCallBack in (' + @NeedCallBackList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Email Subscription
	if @EmailSubscriptionList is not null and  @EmailSubscriptionList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsEmailSubscription in (' + @EmailSubscriptionList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Discussion Topic
	if @DiscussionTopic is not null and @DiscussionTopic != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.DiscussionTopic like ''' + '%' + @DiscussionTopic  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Action Step
	if @ActionStep is not null and @ActionStep != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ActionStep like ''' + '%' + @ActionStep  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Contact Date
	if @LastContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LAST_CONTACT_DATE = ''' + Convert(Varchar,@LastContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Next Contact Date
	if @NextContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.NEXT_CONTACT_DATE = ''' + Convert(Varchar,@NextContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Course Training Date
	if @CourseTrngDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CourseTrainingDate = ''' + Convert(Varchar,@CourseTrngDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Birthday
	if @BirthDayDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Birthday = ''' + Convert(Varchar,@BirthDayDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Anniversary
	if @AnniversaryDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Anniversary = ''' + Convert(Varchar,@AnniversaryDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- Company Years
	if @CompanyYears is not null and @CompanyYears != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CompanyYears like ''' + @CompanyYears  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Boss Name
	if @BossName is not null and @BossName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.BossName like ''' + '%' + @BossName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- End of conditons so we need to close with bracket
	SET @SQLString = @SQLString + ')' ;
	-- Order By
	SET @SQLString = @SQLString + ' ORDER BY cp.COMPANYNAME ' ;
    -- Now Print/Execute the Statement
    --Print @SQLString
    EXEC(@SQLString);
		
	
	RETURN
	
		
	/*select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID 
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack
	where ct.companyid in (Select CompaniesId from tbl_Companies where FranchiseeId in (Select id from Tbl_Franchisee  where CoachID = @CoachId))
	Order by cp.COMPANYNAME
	*/
	
	RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCompID]    Script Date: 06/05/2013 16:21:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE  PROCEDURE [dbo].[sp_GetAllContactsByCompID]
	
	(
	@CompanyID int 
	)
	
AS
	
		
	select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,ct.StartTime,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country,
    ISNULL(ct.TrainingCourseName,'') as TrainingCourseName, 
     ct.HowManyAttended,
     ISNULL(ct.CompanyNameWhereTrainingConducted,'') as CompanyNameWhereTrainingConducted 
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID 
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
    left join TBL_COACH ch on ch.ID = f.CoachID
    left join TBL_REGION rg on ch.RegionID = rg.ID
	where ct.companyid = @CompanyID
	Order by cp.COMPANYNAME
	
	
	RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByFrID]    Script Date: 06/05/2013 16:21:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_GetAllContactsByFrID]
	
	(
	@FranchiseeID int 
	)
	
AS
	
		
	select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,ct.StartTime,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment,ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country,
    ISNULL(ct.TrainingCourseName,'') as TrainingCourseName, 
     ct.HowManyAttended,
     ISNULL(ct.CompanyNameWhereTrainingConducted,'') as CompanyNameWhereTrainingConducted 
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID 
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack 
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
    left join TBL_COACH ch on ch.ID = f.CoachID
    left join TBL_REGION rg on ch.RegionID = rg.ID 
	where ct.companyid in (Select CompaniesId from tbl_Companies where FranchiseeId = @FranchiseeID)
	Order by cp.COMPANYNAME
	
	
	RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByFrIDSearch]    Script Date: 06/05/2013 16:21:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_GetAllContactsByFrIDSearch]
	
	(
	    @FranchiseeID varchar(50),
	    @LastName varchar(50),
		@FirstName varchar(50),
		@Title varchar(50),
		@ContactsDepartment varchar(50),
		@ContactsRole varchar(50),
		@Phone varchar(50),
		@MobilePhone varchar(50),
		@HomePhone varchar(50),
		@Fax varchar(50),
		@Email varchar(50),
		@PersonalEmail varchar(50),
		@Address varchar(150),
		@City varchar(50),
		@State varchar(50),
		@Zip varchar(50),
		@Country varchar(50),
		@IsNewApptIdList varchar(50),
		@ApptSourceIdList varchar(150),
		@IsRegForTrainingList varchar(50),
		@CourseTypeIdList varchar(50),
		@CompanyIdList varchar(50),
		@NeedCallBackList varchar(50),
		@EmailSubscriptionList varchar(50),
		@DiscussionTopic varchar(50),
		@ActionStep varchar(50),
		@LastContactDate datetime,
		@NextContactDate datetime,
		@LastAttemptedDate datetime,
		@LastEmailedDate datetime,
		@LastMeetingDate datetime,
		@LetterSentDate datetime,
		@CourseTrngDate datetime,
		@BirthDayDate datetime,
		@AnniversaryDate datetime,
		@CompanyYears varchar(50),
		@BossName varchar(50),
		@SpouseName varchar(50),
		@ReferredBy varchar(50),
		@Notes varchar(200),
		@TrainingCourseName varchar(150),
        @HowManyAttended varchar(20),
        @CompanyNameWhereTrainingConducted varchar(150)
	)
	
AS
	
	
	if @LastContactDate < '2/1/1755'
	 Begin
		 Set @LastContactDate = null
	 End
	 
	if @NextContactDate < '2/1/1755'
	 Begin
		 Set @NextContactDate = null
	 End 
	
	if @CourseTrngDate < '2/1/1755'
	 Begin
		 Set @CourseTrngDate = null
	 End
	
	if @BirthDayDate < '2/1/1755'
	 Begin
		 Set @BirthDayDate = null
	 End
	 
	 if @AnniversaryDate < '2/1/1755'
	 Begin
		 Set @AnniversaryDate = null
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
	 
	 DECLARE @SQLString VARCHAR(7500);
	 Declare @PrevConditionExist varchar(10);
	 Set @PrevConditionExist = 'No';
	 
	 -- Base SQL string stetement
	Set @SQLString = 'Select 
	ct.lastname + '','' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,ct.StartTime,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country,
    ct.TrainingCourseName, 
    ct.HowManyAttended,
    ct.CompanyNameWhereTrainingConducted            
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join   Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
    left join TBL_COACH ch on ch.ID = f.CoachID
    left join TBL_REGION rg on ch.RegionID = rg.ID
	where ct.companyid in (Select CompaniesId from tbl_Companies where FranchiseeId = (' + @FranchiseeID + '))'  + ' AND ('
	
	-- Last Name
	if @LastName is not null and @LastName != ''
	Begin
		SET @SQLString = @SQLString + 'ct.lastname like ''' + '%' + @LastName  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Training Course Name
	if @TrainingCourseName is not null and @TrainingCourseName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.TrainingCourseName like ''' + '%' + @TrainingCourseName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Company Name where Training is conducted
	if @CompanyNameWhereTrainingConducted is not null and @CompanyNameWhereTrainingConducted != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CompanyNameWhereTrainingConducted like ''' + '%' + @CompanyNameWhereTrainingConducted  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- How Many Attended
	if @HowManyAttended is not null and @HowManyAttended != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.HowManyAttended like ''' + '%' + @HowManyAttended  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- First Name
	if @FirstName is not null and @FirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.FirstName like ''' + '%' + @FirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Title
	if @Title is not null and @Title != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Title like ''' + '%' + @Title  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- ContactsDepartment
	if @ContactsDepartment is not null and @ContactsDepartment != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ContactsDepartment like ''' + '%' + @ContactsDepartment  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- ContactsRole
	if @ContactsRole is not null and @ContactsRole != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ContactsRole like ''' + '%' + @ContactsRole  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	--@MobilePhone
	if @MobilePhone is not null and @MobilePhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.MobilePhone like ''' + '%' + @MobilePhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	--@HomePhone
	if @HomePhone is not null and @HomePhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.HomePhone like ''' + '%' + @HomePhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- Fax
	if @Fax is not null and @Fax != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Fax like ''' + '%' + @Fax  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
		
	-- PersonalEmail
	if @PersonalEmail is not null and @PersonalEmail != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.PersonalEmail like ''' + '%' + @PersonalEmail  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Address
	if @Address is not null and @Address != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Address like ''' + '%' + @Address  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Zip
	if @Zip is not null and @Zip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Zip like ''' + '%' + @Zip  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For City
	if @City is not null and @City != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.City like ''' + '%' + @City  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For State
	if @State is not null and @State != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.State like ''' + '%' + @State  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Country
	if @Country is not null and @Country != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Country like ''' + '%' + @Country  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Attempted Date
	if @LastAttemptedDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastAttemptedDate = ''' + Convert(Varchar,@LastAttemptedDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Last Emailed Date
	if @LastEmailedDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastEmailedDate = ''' + Convert(Varchar,@LastEmailedDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Last Meeting Date
	if @LastMeetingDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastMeetingDate = ''' + Convert(Varchar,@LastMeetingDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Letter Sent Date
	if @LetterSentDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LetterSentDate = ''' + Convert(Varchar,@LetterSentDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Spouse Name
	if @SpouseName is not null and @SpouseName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.SpouseName like ''' + '%' + @SpouseName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	
	-- For ReferredBy
	if @ReferredBy is not null and @ReferredBy != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ReferredBy like ''' + '%' + @ReferredBy  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Notes
	if @Notes is not null and @Notes != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Notes like ''' + '%' + @Notes  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Phone
	if @Phone is not null and @Phone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Phone like ''' + '%' + @Phone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Email
	if @Email is not null and @Email != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Email like ''' + '%' + @Email  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Is New Appt List
	if @IsNewApptIdList is not null and  @IsNewApptIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsNewAppointment in (' + @IsNewApptIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Appt Source Id List
	if @ApptSourceIdList is not null and  @ApptSourceIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ApptSourceId in (' + @ApptSourceIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Is Reg For Training List
	if @IsRegForTrainingList is not null and  @IsRegForTrainingList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsRegisteredForTraining in (' + @IsRegForTrainingList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Course Type
	if @CourseTypeIdList is not null and  @CourseTypeIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CourseId in (' + @CourseTypeIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Company ID
	if @CompanyIdList is not null and  @CompanyIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.companyid in (' + @CompanyIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Need Call Back List
	if @NeedCallBackList is not null and  @NeedCallBackList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsNeedCallBack in (' + @NeedCallBackList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Email Subscription
	if @EmailSubscriptionList is not null and  @EmailSubscriptionList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsEmailSubscription in (' + @EmailSubscriptionList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Discussion Topic
	if @DiscussionTopic is not null and @DiscussionTopic != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.DiscussionTopic like ''' + '%' + @DiscussionTopic  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Action Step
	if @ActionStep is not null and @ActionStep != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ActionStep like ''' + '%' + @ActionStep  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Contact Date
	if @LastContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LAST_CONTACT_DATE = ''' + Convert(Varchar,@LastContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Next Contact Date
	if @NextContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.NEXT_CONTACT_DATE = ''' + Convert(Varchar,@NextContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Course Training Date
	if @CourseTrngDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CourseTrainingDate = ''' + Convert(Varchar,@CourseTrngDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Birthday
	if @BirthDayDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Birthday = ''' + Convert(Varchar,@BirthDayDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Anniversary
	if @AnniversaryDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Anniversary = ''' + Convert(Varchar,@AnniversaryDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- Company Years
	if @CompanyYears is not null and @CompanyYears != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CompanyYears like ''' + @CompanyYears  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Boss Name
	if @BossName is not null and @BossName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.BossName like ''' + '%' + @BossName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- End of conditons so we need to close with bracket
	SET @SQLString = @SQLString + ')' ;
	-- Order By
	SET @SQLString = @SQLString + ' ORDER BY cp.COMPANYNAME ' ;
    -- Now Print/Execute the Statement
    --Print @SQLString
    EXEC(@SQLString);
	
		
	
	RETURN
	
	
		
	/*select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID 
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack  
	where ct.companyid in (Select CompaniesId from tbl_Companies where FranchiseeId = @FranchiseeID)
	Order by cp.COMPANYNAME
	*/
	
	
	RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByUserID]    Script Date: 06/05/2013 16:21:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_GetAllContactsByUserID]
	
	(
	@UserID varchar(50)
	)
	
AS
	
		
	select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,ct.StartTime,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country,
    ISNULL(ct.TrainingCourseName,'') as TrainingCourseName, 
     ct.HowManyAttended,
     ISNULL(ct.CompanyNameWhereTrainingConducted,'') as CompanyNameWhereTrainingConducted 
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID 
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack  
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
    left join TBL_COACH ch on ch.ID = f.CoachID
    left join TBL_REGION rg on ch.RegionID = rg.ID
	where Upper(ct.CreatedBy) = Upper(@UserID)
	Order by cp.COMPANYNAME
	
	
	RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByUserIDSearch]    Script Date: 06/05/2013 16:21:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE  PROCEDURE [dbo].[sp_GetAllContactsByUserIDSearch]
	
	(
	    @UserID varchar(50),
	    @LastName varchar(50),
		@FirstName varchar(50),
		@Title varchar(50),
		@ContactsDepartment varchar(50),
		@ContactsRole varchar(50),
		@Phone varchar(50),
		@MobilePhone varchar(50),
		@HomePhone varchar(50),
		@Fax varchar(50),
		@Email varchar(50),
		@PersonalEmail varchar(50),
		@Address varchar(150),
		@City varchar(50),
		@State varchar(50),
		@Zip varchar(50),
		@Country varchar(50),
		@IsNewApptIdList varchar(50),
		@ApptSourceIdList varchar(150),
		@IsRegForTrainingList varchar(50),
		@CourseTypeIdList varchar(50),
		@CompanyIdList varchar(50),
		@NeedCallBackList varchar(50),
		@EmailSubscriptionList varchar(50),
		@DiscussionTopic varchar(50),
		@ActionStep varchar(50),
		@LastContactDate datetime,
		@NextContactDate datetime,
		@LastAttemptedDate datetime,
		@LastEmailedDate datetime,
		@LastMeetingDate datetime,
		@LetterSentDate datetime,
		@CourseTrngDate datetime,
		@BirthDayDate datetime,
		@AnniversaryDate datetime,
		@CompanyYears varchar(50),
		@BossName varchar(50),
		@SpouseName varchar(50),
		@ReferredBy varchar(50),
		@Notes varchar(200),
		@TrainingCourseName varchar(150),
        @HowManyAttended varchar(20),
        @CompanyNameWhereTrainingConducted varchar(150)
	)
	
AS
	if @LastContactDate < '2/1/1755'
	 Begin
		 Set @LastContactDate = null
	 End
	 
	if @NextContactDate < '2/1/1755'
	 Begin
		 Set @NextContactDate = null
	 End 
	
	if @CourseTrngDate < '2/1/1755'
	 Begin
		 Set @CourseTrngDate = null
	 End
	
	if @BirthDayDate < '2/1/1755'
	 Begin
		 Set @BirthDayDate = null
	 End
	 
	 if @AnniversaryDate < '2/1/1755'
	 Begin
		 Set @AnniversaryDate = null
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
	 
	 DECLARE @SQLString VARCHAR(7500);
	 Declare @PrevConditionExist varchar(10);
	 Set @PrevConditionExist = 'No';
	 
	 -- Base SQL string stetement
	Set @SQLString = 'Select 
	ct.lastname + '','' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,ct.StartTime,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country,
    ct.TrainingCourseName, 
    ct.HowManyAttended,
    ct.CompanyNameWhereTrainingConducted             
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join   Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
    left join TBL_COACH ch on ch.ID = f.CoachID
    left join TBL_REGION rg on ch.RegionID = rg.ID
	where ('
	-- Last Name
	if @LastName is not null and @LastName != ''
	Begin
		SET @SQLString = @SQLString + 'ct.lastname like ''' + '%' + @LastName  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Training Course Name
	if @TrainingCourseName is not null and @TrainingCourseName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.TrainingCourseName like ''' + '%' + @TrainingCourseName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Company Name where Training is conducted
	if @CompanyNameWhereTrainingConducted is not null and @CompanyNameWhereTrainingConducted != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CompanyNameWhereTrainingConducted like ''' + '%' + @CompanyNameWhereTrainingConducted  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- How Many Attended
	if @HowManyAttended is not null and @HowManyAttended != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.HowManyAttended like ''' + '%' + @HowManyAttended  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- First Name
	if @FirstName is not null and @FirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.FirstName like ''' + '%' + @FirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Title
	if @Title is not null and @Title != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Title like ''' + '%' + @Title  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- ContactsDepartment
	if @ContactsDepartment is not null and @ContactsDepartment != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ContactsDepartment like ''' + '%' + @ContactsDepartment  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- ContactsRole
	if @ContactsRole is not null and @ContactsRole != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ContactsRole like ''' + '%' + @ContactsRole  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	--@MobilePhone
	if @MobilePhone is not null and @MobilePhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.MobilePhone like ''' + '%' + @MobilePhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	--@HomePhone
	if @HomePhone is not null and @HomePhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.HomePhone like ''' + '%' + @HomePhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- Fax
	if @Fax is not null and @Fax != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Fax like ''' + '%' + @Fax  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
		
	-- PersonalEmail
	if @PersonalEmail is not null and @PersonalEmail != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.PersonalEmail like ''' + '%' + @PersonalEmail  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Address
	if @Address is not null and @Address != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Address like ''' + '%' + @Address  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Zip
	if @Zip is not null and @Zip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Zip like ''' + '%' + @Zip  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For City
	if @City is not null and @City != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.City like ''' + '%' + @City  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For State
	if @State is not null and @State != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.State like ''' + '%' + @State  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Country
	if @Country is not null and @Country != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Country like ''' + '%' + @Country  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Attempted Date
	if @LastAttemptedDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastAttemptedDate = ''' + Convert(Varchar,@LastAttemptedDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Last Emailed Date
	if @LastEmailedDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastEmailedDate = ''' + Convert(Varchar,@LastEmailedDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Last Meeting Date
	if @LastMeetingDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastMeetingDate = ''' + Convert(Varchar,@LastMeetingDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Letter Sent Date
	if @LetterSentDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LetterSentDate = ''' + Convert(Varchar,@LetterSentDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Spouse Name
	if @SpouseName is not null and @SpouseName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.SpouseName like ''' + '%' + @SpouseName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	
	-- For ReferredBy
	if @ReferredBy is not null and @ReferredBy != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ReferredBy like ''' + '%' + @ReferredBy  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Notes
	if @Notes is not null and @Notes != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Notes like ''' + '%' + @Notes  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Phone
	if @Phone is not null and @Phone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Phone like ''' + '%' + @Phone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Email
	if @Email is not null and @Email != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Email like ''' + '%' + @Email  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Is New Appt List
	if @IsNewApptIdList is not null and  @IsNewApptIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsNewAppointment in (' + @IsNewApptIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Appt Source Id List
	if @ApptSourceIdList is not null and  @ApptSourceIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ApptSourceId in (' + @ApptSourceIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Is Reg For Training List
	if @IsRegForTrainingList is not null and  @IsRegForTrainingList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsRegisteredForTraining in (' + @IsRegForTrainingList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Course Type
	if @CourseTypeIdList is not null and  @CourseTypeIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CourseId in (' + @CourseTypeIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Company ID
	if @CompanyIdList is not null and  @CompanyIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.companyid in (' + @CompanyIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Need Call Back List
	if @NeedCallBackList is not null and  @NeedCallBackList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsNeedCallBack in (' + @NeedCallBackList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Email Subscription
	if @EmailSubscriptionList is not null and  @EmailSubscriptionList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsEmailSubscription in (' + @EmailSubscriptionList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Discussion Topic
	if @DiscussionTopic is not null and @DiscussionTopic != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.DiscussionTopic like ''' + '%' + @DiscussionTopic  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Action Step
	if @ActionStep is not null and @ActionStep != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ActionStep like ''' + '%' + @ActionStep  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Contact Date
	if @LastContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LAST_CONTACT_DATE = ''' + Convert(Varchar,@LastContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Next Contact Date
	if @NextContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.NEXT_CONTACT_DATE = ''' + Convert(Varchar,@NextContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Course Training Date
	if @CourseTrngDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CourseTrainingDate = ''' + Convert(Varchar,@CourseTrngDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Birthday
	if @BirthDayDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Birthday = ''' + Convert(Varchar,@BirthDayDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Anniversary
	if @AnniversaryDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Anniversary = ''' + Convert(Varchar,@AnniversaryDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- Company Years
	if @CompanyYears is not null and @CompanyYears != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CompanyYears like ''' + @CompanyYears  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Boss Name
	if @BossName is not null and @BossName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.BossName like ''' + '%' + @BossName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- End of conditons so we need to close with bracket
	SET @SQLString = @SQLString + ')' ;
	
	SET @SQLString = @SQLString + ' AND ct.CreatedBy =' + @UserID ;
	
	-- Order By
	SET @SQLString = @SQLString + ' ORDER BY cp.COMPANYNAME ' ;
    -- Now Print/Execute the Statement
    --Print @SQLString
    EXEC(@SQLString);
	
		
	
	RETURN
	
		
	/*select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID 
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack  
	where Upper(ct.CreatedBy) = Upper(@UserID)
	Order by cp.COMPANYNAME
	*/
	
	
	RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsForCompByUserID]    Script Date: 06/05/2013 16:21:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_GetAllContactsForCompByUserID]
	
	(
	@UserID varchar(50),
	@CompanyID int
	)
	
AS
	
		
	select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,ct.StartTime,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country,
    ISNULL(ct.TrainingCourseName,'') as TrainingCourseName, 
     ct.HowManyAttended,
     ISNULL(ct.CompanyNameWhereTrainingConducted,'') as CompanyNameWhereTrainingConducted 
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack 
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
    left join TBL_COACH ch on ch.ID = f.CoachID
    left join TBL_REGION rg on ch.RegionID = rg.ID
	where Upper(ct.CreatedBy) = Upper(@UserID) and ct.COMPANYID = @CompanyID
	Order by cp.COMPANYNAME
	
	
	RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsSearch]    Script Date: 06/05/2013 16:21:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[sp_GetAllContactsSearch]
	
	(
	    @LastName varchar(50),
		@FirstName varchar(50),
		@Title varchar(50),
		@ContactsDepartment varchar(50),
		@ContactsRole varchar(50),
		@Phone varchar(50),
		@MobilePhone varchar(50),
		@HomePhone varchar(50),
		@Fax varchar(50),
		@Email varchar(50),
		@PersonalEmail varchar(50),
		@Address varchar(150),
		@City varchar(50),
		@State varchar(50),
		@Zip varchar(50),
		@Country varchar(50),
		@IsNewApptIdList varchar(50),
		@ApptSourceIdList varchar(150),
		@IsRegForTrainingList varchar(50),
		@CourseTypeIdList varchar(50),
		@CompanyIdList varchar(50),
		@NeedCallBackList varchar(50),
		@EmailSubscriptionList varchar(50),
		@DiscussionTopic varchar(50),
		@ActionStep varchar(50),
		@LastContactDate datetime,
		@NextContactDate datetime,
		@LastAttemptedDate datetime,
		@LastEmailedDate datetime,
		@LastMeetingDate datetime,
		@LetterSentDate datetime,
		@CourseTrngDate datetime,
		@BirthDayDate datetime,
		@AnniversaryDate datetime,
		@CompanyYears varchar(50),
		@BossName varchar(50),
		@SpouseName varchar(50),
		@ReferredBy varchar(50),
		@Notes varchar(200),
		@TrainingCourseName varchar(150),
        @HowManyAttended varchar(20),
        @CompanyNameWhereTrainingConducted varchar(150)
			
	)
	
AS
		
	if @LastContactDate < '2/1/1755'
	 Begin
		 Set @LastContactDate = null
	 End
	 
	if @NextContactDate < '2/1/1755'
	 Begin
		 Set @NextContactDate = null
	 End 
	
	if @CourseTrngDate < '2/1/1755'
	 Begin
		 Set @CourseTrngDate = null
	 End
	
	if @BirthDayDate < '2/1/1755'
	 Begin
		 Set @BirthDayDate = null
	 End
	 
	 if @AnniversaryDate < '2/1/1755'
	 Begin
		 Set @AnniversaryDate = null
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
	 
	 
	 
	 DECLARE @SQLString VARCHAR(7500);
	 Declare @PrevConditionExist varchar(10);
	 Set @PrevConditionExist = 'No';
	 
	 -- Base SQL string stetement
	Set @SQLString = 'Select 
	ct.lastname + '','' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,ct.StartTime,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack,
	f.Name as FranchiseeName,
    rg.Name as RegionName,
    ct.Title, ct.ContactsDepartment , ct.ContactsRole ,
    ct.MobilePhone , ct.HomePhone , ct.Fax , ct.PersonalEmail ,
    ct.Address , ct.City , ct. State , ct. Zip , ct.LastAttemptedDate, 
    ct.LastEmailedDate , ct.LastMeetingDate , ct.LetterSentDate, ct.SpouseName, 
    ct.ReferredBy , ct.Notes , ct.Country,
    ct.TrainingCourseName, 
    ct.HowManyAttended,
    ct.CompanyNameWhereTrainingConducted
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join   Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack
	left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
    left join TBL_COACH ch on ch.ID = f.CoachID
    left join TBL_REGION rg on ch.RegionID = rg.ID
	where ('
	-- Last Name
	if @LastName is not null and @LastName != ''
	Begin
		SET @SQLString = @SQLString + 'ct.lastname like ''' + '%' + @LastName  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- Training Course Name
	if @TrainingCourseName is not null and @TrainingCourseName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.TrainingCourseName like ''' + '%' + @TrainingCourseName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Company Name where Training is conducted
	if @CompanyNameWhereTrainingConducted is not null and @CompanyNameWhereTrainingConducted != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CompanyNameWhereTrainingConducted like ''' + '%' + @CompanyNameWhereTrainingConducted  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- How Many Attended
	if @HowManyAttended is not null and @HowManyAttended != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.HowManyAttended like ''' + '%' + @HowManyAttended  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- First Name
	if @FirstName is not null and @FirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.FirstName like ''' + '%' + @FirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Title
	if @Title is not null and @Title != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Title like ''' + '%' + @Title  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- ContactsDepartment
	if @ContactsDepartment is not null and @ContactsDepartment != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ContactsDepartment like ''' + '%' + @ContactsDepartment  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- ContactsRole
	if @ContactsRole is not null and @ContactsRole != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ContactsRole like ''' + '%' + @ContactsRole  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	--@MobilePhone
	if @MobilePhone is not null and @MobilePhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.MobilePhone like ''' + '%' + @MobilePhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	--@HomePhone
	if @HomePhone is not null and @HomePhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.HomePhone like ''' + '%' + @HomePhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- Fax
	if @Fax is not null and @Fax != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Fax like ''' + '%' + @Fax  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	
	-- PersonalEmail
	if @PersonalEmail is not null and @PersonalEmail != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.PersonalEmail like ''' + '%' + @PersonalEmail  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Address
	if @Address is not null and @Address != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Address like ''' + '%' + @Address  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Zip
	if @Zip is not null and @Zip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Zip like ''' + '%' + @Zip  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For City
	if @City is not null and @City != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.City like ''' + '%' + @City  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For State
	if @State is not null and @State != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.State like ''' + '%' + @State  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Country
	if @Country is not null and @Country != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Country like ''' + '%' + @Country  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Attempted Date
	if @LastAttemptedDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastAttemptedDate = ''' + Convert(Varchar,@LastAttemptedDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Last Emailed Date
	if @LastEmailedDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastEmailedDate = ''' + Convert(Varchar,@LastEmailedDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Last Meeting Date
	if @LastMeetingDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LastMeetingDate = ''' + Convert(Varchar,@LastMeetingDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Letter Sent Date
	if @LetterSentDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LetterSentDate = ''' + Convert(Varchar,@LetterSentDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Spouse Name
	if @SpouseName is not null and @SpouseName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.SpouseName like ''' + '%' + @SpouseName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	
	-- For ReferredBy
	if @ReferredBy is not null and @ReferredBy != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ReferredBy like ''' + '%' + @ReferredBy  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- For Notes
	if @Notes is not null and @Notes != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Notes like ''' + '%' + @Notes  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- Phone
	if @Phone is not null and @Phone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Phone like ''' + '%' + @Phone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Email
	if @Email is not null and @Email != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Email like ''' + '%' + @Email  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Is New Appt List
	if @IsNewApptIdList is not null and  @IsNewApptIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsNewAppointment in (' + @IsNewApptIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Appt Source Id List
	if @ApptSourceIdList is not null and  @ApptSourceIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ApptSourceId in (' + @ApptSourceIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Is Reg For Training List
	if @IsRegForTrainingList is not null and  @IsRegForTrainingList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsRegisteredForTraining in (' + @IsRegForTrainingList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Course Type
	if @CourseTypeIdList is not null and  @CourseTypeIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CourseId in (' + @CourseTypeIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Company ID
	if @CompanyIdList is not null and  @CompanyIdList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.companyid in (' + @CompanyIdList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Need Call Back List
	if @NeedCallBackList is not null and  @NeedCallBackList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsNeedCallBack in (' + @NeedCallBackList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Email Subscription
	if @EmailSubscriptionList is not null and  @EmailSubscriptionList != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.IsEmailSubscription in (' + @EmailSubscriptionList + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Discussion Topic
	if @DiscussionTopic is not null and @DiscussionTopic != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.DiscussionTopic like ''' + '%' + @DiscussionTopic  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Action Step
	if @ActionStep is not null and @ActionStep != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.ActionStep like ''' + '%' + @ActionStep  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Last Contact Date
	if @LastContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.LAST_CONTACT_DATE = ''' + Convert(Varchar,@LastContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Next Contact Date
	if @NextContactDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.NEXT_CONTACT_DATE = ''' + Convert(Varchar,@NextContactDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Course Training Date
	if @CourseTrngDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CourseTrainingDate = ''' + Convert(Varchar,@CourseTrngDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Birthday
	if @BirthDayDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Birthday = ''' + Convert(Varchar,@BirthDayDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- for Anniversary
	if @AnniversaryDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.Anniversary = ''' + Convert(Varchar,@AnniversaryDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- Company Years
	if @CompanyYears is not null and @CompanyYears != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.CompanyYears like ''' + @CompanyYears  + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Boss Name
	if @BossName is not null and @BossName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'ct.BossName like ''' + '%' + @BossName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	
	-- End of conditons so we need to close with bracket
	SET @SQLString = @SQLString + ')' ;
	-- Order By
	SET @SQLString = @SQLString + ' ORDER BY cp.COMPANYNAME ' ;
    -- Now Print/Execute the Statement
    --Print @SQLString
    EXEC(@SQLString);
	
		
	
	RETURN
	
	/*Select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid ,cp.COMPANYNAME,
	-- For Export to Excel
	ct.DiscussionTopic,
	ct.ACTIONSTEP, ct.Birthday,ct.Anniversary,
	ct.CompanyYears, ct.BossName,
	ct.LAST_CONTACT_DATE, ct.NEXT_CONTACT_DATE,
	apts.ApptSourceName, cs.CourseName, ct.CourseTrainingDate,
	ysn.Description as NewApptDesp,
	ysr.Description as IsRegisteredForTraining,
	ysre.Description as IsEmailSubscription,
	ysrc.Description as NeedCallBack   
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	left join Tbl_AppointmentsSource apts on apts.ApptSourceId = ct.ApptSourceId
	left join   Tbl_Course cs on cs.CourseId = ct.CourseId
	left join Tbl_YesNoOptions ysn on ysn.Value = ct.IsNewAppointment 
	left join Tbl_YesNoOptions ysr on ysr.Value = ct.IsRegisteredForTraining
	left join Tbl_YesNoOptions ysre on ysre.Value = ct.IsEmailSubscription 
	left join Tbl_YesNoOptions ysrc on ysrc.Value = ct.IsNeedCallBack    
	Order by cp.COMPANYNAME*/
	
	
	/* SET NOCOUNT ON */
	





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllEvents]    Script Date: 06/05/2013 16:21:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_GetAllEvents]

	 (

	 @Role varchar(50),

	 @UserId varchar(50),

	 @FranchiseeId int,

	 @RegionId int
 
	)

AS

		

	 if (@Role = 'Corporate' or @Role = 'SiteAdmin' or @Role = 'HomeOfficeAdmin')

	 Begin

		 -- full access to all companies and contacts

		 Select StartTime,NextContact_date as Date, CompanyName as Description, '' as Topic,POCPhone as Phone From TBL_Companies where NextContact_date is not null

	    Union

	    Select StartTime,Next_Contact_date as Date, LastName+','+FirstName as Description, IsNull(DiscussionTopic,'') as Topic,Phone as Phone from TBL_CONTACTS where Next_Contact_date is not null

	    Union

	    Select '' as StartTime,BirthDay as Date, LastName+','+FirstName as Description, IsNull(DiscussionTopic,'') as Topic,Phone as Phone from TBL_CONTACTS where BirthDay is not null

	    Union

	    Select '' as StartTime,Anniversary as Date, LastName+','+FirstName as Description, IsNull(DiscussionTopic,'') as Topic,Phone as Phone from TBL_CONTACTS  where Anniversary is not null

	    Union

	    Select StartTime,FollowUpDate as Date, Description, IsNull(Topic,'') as Topic, Phone from Tbl_FollowUpItemsList where UserId = @UserId 
 
	   

	 End

    

    if (@Role = 'Coach')

	 Begin

		 -- full access to all companies and contacts within their region

		 Select c.StartTime as StartTime,c.NextContact_date as Date, c.CompanyName as Description, '' as Topic, c.POCPhone as Phone From TBL_Companies c 

		 join TBL_FRANCHISEE f on c.FranchiseeId = f.ID   join TBL_COACH ch on f.CoachID = ch.ID  

		 where c.NextContact_date is not null and ch.RegionID = @RegionId

	    Union

	    Select ct.StartTime as StartTime,ct.Next_Contact_date as Date, ct.LastName+','+ ct.FirstName as Description, IsNull(ct.DiscussionTopic,'') as Topic, ct.Phone as Phone from TBL_CONTACTS ct

	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f on c.FranchiseeId = f.ID join TBL_COACH ch on f.CoachID = ch.ID 

	    where ct.Next_Contact_date is not null and ch.RegionID = @RegionId

	    Union

	    Select '' as StartTime, ct.BirthDay as Date, ct.LastName+','+ ct.FirstName as Description, IsNull(ct.DiscussionTopic,'') as Topic,ct.Phone as Phone from TBL_CONTACTS ct

	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f on c.FranchiseeId = f.ID join TBL_COACH ch on f.CoachID = ch.ID  

 	   where ct.BirthDay is not null and ch.RegionID = @RegionId

	    Union

	    Select '' as StartTime,ct.Anniversary as Date, ct.LastName+','+ ct.FirstName as Description, IsNull(ct.DiscussionTopic,'') as Topic,ct.Phone as Phone from TBL_CONTACTS ct

	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f on c.FranchiseeId = f.ID join TBL_COACH ch on f.CoachID = ch.ID   

 	   where ct.Anniversary is not null and ch.RegionID = @RegionId

	    Union

	    Select StartTime,FollowUpDate as Date, Description, ISNULL(Topic,'') as Topic, Phone from Tbl_FollowUpItemsList where UserId = @UserId 

	 End




    if (@Role = 'FranchiseeOwner' or @Role = 'Client')

    Begin

        Select c.StartTime as StartTime,c.NextContact_date as Date, c.CompanyName as Description, '' as Topic, c.POCPhone as Phone From TBL_Companies c 

		 join TBL_FRANCHISEE f on c.FranchiseeId = f.ID where c.NextContact_date is not null and f.ID = @FranchiseeId

	    Union

	    Select ct.StartTime as StartTime,ct.Next_Contact_date as Date, ct.LastName+','+ ct.FirstName as Description, IsNull(ct.DiscussionTopic,'') as Topic,ct.Phone as Phone from TBL_CONTACTS ct
 
	   join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f on c.FranchiseeId = f.ID 

	    where ct.Next_Contact_date is not null and f.ID = @FranchiseeId

	    Union

	    Select '' as StartTime,ct.BirthDay as Date, ct.LastName+','+ ct.FirstName as Description, IsNull(ct.DiscussionTopic,'') as Topic,ct.Phone as Phone from TBL_CONTACTS ct

	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f on c.FranchiseeId = f.ID 

	    where ct.BirthDay is not null and f.ID = @FranchiseeId

	    Union

	    Select '' as StartTime,ct.Anniversary as Date,  ct.LastName+','+ ct.FirstName as Description, IsNull(ct.DiscussionTopic,'') as Topic,ct.Phone as Phone from TBL_CONTACTS ct

	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f on c.FranchiseeId = f.ID 

	    where ct.Anniversary is not null and f.ID = @FranchiseeId

	    Union

	    Select StartTime,FollowUpDate as Date, Description, ISNULL(Topic,'') as Topic, Phone from Tbl_FollowUpItemsList where UserId = @UserId 
 
    End




    if (@Role = 'FranchiseeUser')

    Begin

        Select ct.StartTime as StartTime, ct.Next_Contact_date as Date, ct.LastName+','+ ct.FirstName as Description, IsNull(ct.DiscussionTopic,'') as Topic,ct.Phone as Phone from TBL_CONTACTS ct

	    where ct.Next_Contact_date is not null and ct.CreatedBy = @UserId

	    Union
 
	   Select '' as StartTime,ct.BirthDay as Date,  ct.LastName+','+ ct.FirstName as Description, IsNull(ct.DiscussionTopic,'') as Topic,ct.Phone as Phone from TBL_CONTACTS ct

 	   where ct.BirthDay is not null and ct.CreatedBy = @UserId

	    Union

	    Select '' as StartTime,ct.Anniversary as Date,  ct.LastName+','+ ct.FirstName as Description, IsNull(ct.DiscussionTopic,'') as Topic,ct.Phone as Phone from TBL_CONTACTS ct

	    where ct.Anniversary is not null and ct.CreatedBy = @UserId

	    Union

 	   Select StartTime,FollowUpDate as Date, Description, ISNULL(Topic,'') as Topic,Phone from Tbl_FollowUpItemsList where UserId = @UserId 

    End

    

	 RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_GetCompanyDetails]    Script Date: 06/05/2013 16:21:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE  PROCEDURE [dbo].[sp_GetCompanyDetails]
	(
	@COMPANIESID int 
	)
AS
	Select 
	c.COMPANIESID,c.CompanyName, c.Address,c.City, c.State, c.Zip,
	c.POCLastName,c.POCFirstName,
	c.POCPhone,c.COMPANYVALUEGOAL,
	c.RepLastName,c.RepFirstName,c.DiscussionTopic,c.ActionStep,
	ISNULL(c.LastContact_Date, '') as LastContact_Date,
	ISNULL(c.NextContact_Date, '') as NextContact_Date,
	ISNULL(c.StartTime, '') as StartTime,
	ISNULL(c.CreationDate, '') as CreationDate,
	c.FranchiseeId,
	i.IndustryTypeName as Industry,
	ISNULL(i.IndId,1) as IndId,
	y.Description as Description, ISNULL(y.Value,0) as Value,
	yb.Description as BillingDescription, ISNULL(yb.Value,0) as BillingValue,
	c.Country,c.BillingAddress,c.BillingCity,c.BillingZip,c.BillingCountry,
	c.BillingState,
	c.Website,c.Notes,c.CompanyOwnership ,c.CompanyDescription,
	c.POCDepartment, c.POCEmail ,c.POCFax,c.AssistantLastName,
	c.AssistantFirstName,c.AssistantPhone,c.EmpQuantity  
	from tbl_companies c 
	left join Tbl_IndustryType i on c.IndustryId = i.IndId
	left join tbl_YesNoOptions y on c.IsNewCompany = y.Value
	left join Tbl_YesNoOptions yb on yb.Value = c.IsSameBillingAddress 
	where c.COMPANIESID = @COMPANIESID

	RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_GetContactDetails]    Script Date: 06/05/2013 16:21:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[sp_GetContactDetails]

	 (

	 @ContactID int 

	 )

AS

		
 
	select



ct
.CONTACTSID,

ct
.LASTNAME,

ct
.FIRSTNAME, 

ct
.Phone, 

ct
.Email, 

ct
.DiscussionTopic,

ct
.ACTIONSTEP,


ISNULL(ct.LAST_CONTACT_DATE, '') as LAST_CONTACT_DATE,

ISNULL(ct.StartTime, '') as StartTime,


ISNULL(ct.NEXT_CONTACT_DATE, '') as NEXT_CONTACT_DATE,


ISNULL(ct.CourseTrainingDate, '') as CourseTrainingDate,


ISNULL(ct.Birthday,'') as Birthday,


ISNULL(ct.Anniversary,'') as Anniversary,

ct
.CompanyYears,

ct
.BossName,

cp
.COMPANYNAME,cp.COMPANIESID,

yn
.Description as NewApptDescription, ISNULL(yn.Value,0) as Value,

aps
.ApptSourceName,yno.Description as RegForTrngDescription, ISNULL(yno.Value,0) as RegForTrainingId,

ynbe
.Description as BlastEmailDescription, ISNULL(ynbe.Value,0) as BlastEmailId,

yncb
.Description as CallBackDescription, ISNULL(yncb.Value,0) as CallBackValue,

cs
.CourseName, 


ISNULL(cs.courseId,1) as courseId,


ISNULL(aps.ApptSourceId,1) as ApptSourceId,

ct
.Title , ct.ContactsDepartment , ct.ContactsRole ,

ct
.MobilePhone , ct.HomePhone, ct.Fax, ct.PersonalEmail, 

ct
.Address , ct.City , ct.State, ct.Zip ,


ISNULL(ct.LastAttemptedDate, '') as LastAttemptedDate,


ISNULL(ct.LastEmailedDate, '') as LastEmailedDate,


ISNULL(ct.LastMeetingDate, '') as LastMeetingDate,


ISNULL(ct.LetterSentDate, '') as LetterSentDate,

ct
.SpouseName,ct.ReferredBy , ct.Notes , ct.Country,


ISNULL(ct.TrainingCourseName,'') as TrainingCourseName, 

ct
.HowManyAttended,


ISNULL(ct.CompanyNameWhereTrainingConducted,'') as CompanyNameWhereTrainingConducted 


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

/****** Object:  StoredProcedure [dbo].[sp_InsertCompany]    Script Date: 06/05/2013 16:21:15 ******/
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
		@FranchiseeId int,
		@StartTime datetime
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
	
	if @StartTime < '2/1/1755'
	Begin
	  Set @StartTime = null
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
	 LastContact_Date,NextContact_Date,CreationDate, CreatedBy, Notes,FranchiseeId,IsActive, StartTime)
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
	@NextContact_Date,@CreationDate,@CreatedBy,@Notes,@FranchiseeId,1,@StartTime)
	
	set @companyID = @@IDENTITY
	
	-- now create the contact if we have the necessary Information for this contact
	if(@POCLastName != '' and @POCFirstName != '')
	
	Begin
	
	-- Now user this Company Id and create record in the Contact Table
		Insert into TBL_CONTACTS(COMPANYID,LASTNAME,FIRSTNAME,PHONE,EMAIL,NEXT_CONTACT_DATE,IsActive,CreatedBy,CreatedDate,UpdatedDate,IsEmailSubscription,IsNeedCallBack,IsRegisteredForTraining,IsNewAppointment) 
		values
		(@companyID,@POCLastName,@POCFirstName,@POCPhone,@POCEmail,@NextContact_Date,1,@CreatedBy,GetDate(),GetDate(),1,0,0,0)
		set @contactID = @@IDENTITY
	
	End
	
	/* SET NOCOUNT ON */
	RETURN







GO

/****** Object:  StoredProcedure [dbo].[sp_InsertContact]    Script Date: 06/05/2013 16:21:15 ******/
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
        @Notes varchar(1000),
        @TrainingCourseName varchar(150),
        @HowManyAttended int,
        @CompanyNameWhereTrainingConducted varchar(150),
        @StartTime datetime

	 )

	

 AS
		

	 if(@CourseId = 0) 
 
	Begin

	 Set @CourseId = null

	 End
 
    if(@HowManyAttended = 0) 
 
	Begin

	 Set @HowManyAttended = null

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

    if @StartTime < '2/1/1755'
	Begin
	  Set @StartTime = null
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
     LetterSentDate,SpouseName,ReferredBy,Notes,
     TrainingCourseName, HowManyAttended,CompanyNameWhereTrainingConducted,StartTime)

	 values

	 (@COMPANIESID , @LastName , @FirstName ,@Title ,@ContactsDepartment,@ContactsRole,@Phone , @Email,
	 @Value , @ApptSourceId , @RegForTrainingId , @CourseId , @CourseTrngDate , @DiscussionTopic , @ACTIONSTEP, 
     @Last_Contact_Date , @Next_Contact_Date,1,@CreatedBy,1,@CallBackValue,GETDATE(),@Birthday,@Anniversary,@CompanyYears,@BossName,
     @MobilePhone , @HomePhone ,@Fax , @PersonalEmail , @Address , @City , @State , @Zip , @Country ,@LastAttemptedDate , @LastEmailedDate ,
     @LastMeetingDate,@LetterSentDate,@SpouseName,@ReferredBy,@Notes,
     @TrainingCourseName, @HowManyAttended,@CompanyNameWhereTrainingConducted,@StartTime)

	
 
	/* SET NOCOUNT ON */

	 RETURN









GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateCompanyDetails]    Script Date: 06/05/2013 16:21:15 ******/
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
		@Notes varchar(1000),
		@StartTime datetime
		
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
	
	if @StartTime < '2/1/1755'
	Begin
	  Set @StartTime = null
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
	Notes = @Notes,
	StartTime = @StartTime
	where COMPANIESID = @COMPANIESID

	RETURN








GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateContactDetails]    Script Date: 06/05/2013 16:21:15 ******/
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
        @Notes varchar(1000),
        @TrainingCourseName varchar(150),
        @HowManyAttended int,
        @CompanyNameWhereTrainingConducted varchar(150),
        @StartTime datetime

	 )

	

 AS

	 if(@CourseId = 0) 
 
	 Begin

	 Set @CourseId = null

	 End
 
  if(@HowManyAttended = 0) 
 
	Begin

	 Set @HowManyAttended = null

	 End
 
	
	if(@AppsSourceId = 0) 

	 Begin
 
	   Set @AppsSourceId = null

	 End
	 
    if @StartTime < '2/1/1755'
	Begin
	  Set @StartTime = null
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
     Country = @Country,
     TrainingCourseName = @TrainingCourseName, 
     HowManyAttended = @HowManyAttended,
     CompanyNameWhereTrainingConducted = @CompanyNameWhereTrainingConducted,
     StartTime = @StartTime 
	 where CONTACTSID = @ContactsID

	

	 /* SET NOCOUNT ON */

	 RETURN






GO


