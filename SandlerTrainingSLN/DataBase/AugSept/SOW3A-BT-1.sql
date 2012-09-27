/*
Exeuted 9/26 11:30PM on 139
*/

USE [SandlerDB]
GO

ALTER TABLE TBL_COMPANIES ADD CompanyOwnership varchar(100)
ALTER TABLE TBL_COMPANIES ADD CompanyDescription varchar(100)
ALTER TABLE TBL_COMPANIES ADD BillingAddress varchar(150)
ALTER TABLE TBL_COMPANIES ADD BillingState varchar(50)
ALTER TABLE TBL_COMPANIES ADD BillingCity varchar(50)
ALTER TABLE TBL_COMPANIES ADD BillingZip varchar(50)
ALTER TABLE TBL_COMPANIES ADD BillingCountry varchar(80)
ALTER TABLE TBL_COMPANIES ADD POCDepartment varchar(100)
ALTER TABLE TBL_COMPANIES ADD POCEmail varchar(80)
ALTER TABLE TBL_COMPANIES ADD POCFax varchar(80)
ALTER TABLE TBL_COMPANIES ADD AssistantLastName varchar(50)
ALTER TABLE TBL_COMPANIES ADD AssistantFirstName varchar(50)
ALTER TABLE TBL_COMPANIES ADD AssistantPhone varchar(50)
ALTER TABLE TBL_COMPANIES ADD Website varchar(100)
ALTER TABLE TBL_COMPANIES ADD EmpQuantity int
ALTER TABLE TBL_COMPANIES ADD Notes varchar(300)
ALTER TABLE TBL_COMPANIES ADD IsSameBillingAddress bit
ALTER TABLE TBL_COMPANIES ADD Country varchar(80)

GO


USE [SandlerDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompanies]    Script Date: 09/24/2012 20:28:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCompanies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCompanies]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByCoachId]    Script Date: 09/24/2012 20:28:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCompaniesByCoachId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCompaniesByCoachId]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByCoachIdSearch]    Script Date: 09/24/2012 20:28:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCompaniesByCoachIdSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCompaniesByCoachIdSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByFrId]    Script Date: 09/24/2012 20:28:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCompaniesByFrId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCompaniesByFrId]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByFrIdSearch]    Script Date: 09/24/2012 20:28:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCompaniesByFrIdSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCompaniesByFrIdSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesSearch]    Script Date: 09/24/2012 20:28:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCompaniesSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCompaniesSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetCompanyDetails]    Script Date: 09/24/2012 20:28:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetCompanyDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetCompanyDetails]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertCompany]    Script Date: 09/24/2012 20:28:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertCompany]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_InsertCompany]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateCompanyDetails]    Script Date: 09/24/2012 20:28:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UpdateCompanyDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UpdateCompanyDetails]
GO

USE [SandlerDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompanies]    Script Date: 09/24/2012 20:28:12 ******/
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
	ORDER BY COMPANYNAME
	
	RETURN



GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByCoachId]    Script Date: 09/24/2012 20:28:12 ******/
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
	where cp.FranchiseeId in (Select id from Tbl_Franchisee  where CoachID = @CoachId) 
	ORDER BY COMPANYNAME
	
	
	RETURN



GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByCoachIdSearch]    Script Date: 09/24/2012 20:28:12 ******/
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
		SET @SQLString = @SQLString + 'cp.CompanyOwnership like ''' + '%' + @CompanyOwnership  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Company Description
	if @CompanyDescription is not null and @CompanyDescription != ''
	Begin
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

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByFrId]    Script Date: 09/24/2012 20:28:12 ******/
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
	where cp.FranchiseeId = @FranchiseeId 
	ORDER BY COMPANYNAME
	
	
	
	RETURN



GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByFrIdSearch]    Script Date: 09/24/2012 20:28:12 ******/
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
		SET @SQLString = @SQLString + 'cp.CompanyOwnership like ''' + '%' + @CompanyOwnership  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Company Description
	if @CompanyDescription is not null and @CompanyDescription != ''
	Begin
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

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesSearch]    Script Date: 09/24/2012 20:28:13 ******/
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
	cp.ActionStep,cp.LASTCONTACT_DATE,
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
		SET @SQLString = @SQLString + 'cp.CompanyOwnership like ''' + '%' + @CompanyOwnership  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Company Description
	if @CompanyDescription is not null and @CompanyDescription != ''
	Begin
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

/****** Object:  StoredProcedure [dbo].[sp_GetCompanyDetails]    Script Date: 09/24/2012 20:28:13 ******/
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
	ISNULL(c.CreationDate, '') as CreationDate,
	c.FranchiseeId,
	i.IndustryTypeName as Industry,
	ISNULL(i.IndId,1) as IndId,
	y.Description as Description, y.Value as Value,
	yb.Description as BillingDescription, yb.Value as BillingValue,
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

/****** Object:  StoredProcedure [dbo].[sp_InsertCompany]    Script Date: 09/24/2012 20:28:13 ******/
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
		@Notes varchar(200),
		@FranchiseeId int
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
	
	/* SET NOCOUNT ON */
	RETURN




GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateCompanyDetails]    Script Date: 09/24/2012 20:28:13 ******/
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
		@Notes varchar(200)
		
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

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetBillingOptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetBillingOptions]
GO

Create PROCEDURE [dbo].[sp_GetBillingOptions]
AS
	 SELECT [Description] AS BillingDescription, Value as BillingValue  FROM TBL_YesNoOptions ORDER BY Description/* SET NOCOUNT ON */
	 RETURN
GO

Update dbo.[TBL_Companies] Set IsSameBillingAddress = 0 Where IsSameBillingAddress IS NULL;
GO