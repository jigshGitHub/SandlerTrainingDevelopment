USE [SandlerDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllFranchiseesSearch]    Script Date: 01/29/2013 21:40:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllFranchiseesSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllFranchiseesSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertFranchisee]    Script Date: 01/29/2013 21:40:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertFranchisee]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_InsertFranchisee]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateFranchiseeDetails]    Script Date: 01/29/2013 21:40:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UpdateFranchiseeDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UpdateFranchiseeDetails]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetMasterFranchiseeOptions]    Script Date: 01/29/2013 21:40:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetMasterFranchiseeOptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetMasterFranchiseeOptions]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetCoachOptions]    Script Date: 01/29/2013 21:40:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetCoachOptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetCoachOptions]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetStateOptions]    Script Date: 01/29/2013 21:40:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetStateOptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetStateOptions]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetCountryOptions]    Script Date: 01/29/2013 21:40:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetCountryOptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetCountryOptions]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetPrimaryBusinessOptions]    Script Date: 01/29/2013 21:40:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetPrimaryBusinessOptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetPrimaryBusinessOptions]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetSandlerRoleOptions]    Script Date: 01/29/2013 21:40:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetSandlerRoleOptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetSandlerRoleOptions]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetBehindAmountOptions]    Script Date: 01/29/2013 21:40:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetBehindAmountOptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetBehindAmountOptions]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetCostPlusAmountOptions]    Script Date: 01/29/2013 21:40:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetCostPlusAmountOptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetCostPlusAmountOptions]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAwardLevelOptions]    Script Date: 01/29/2013 21:40:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAwardLevelOptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAwardLevelOptions]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetCertifiedLevelOptions]    Script Date: 01/29/2013 21:40:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetCertifiedLevelOptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetCertifiedLevelOptions]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetPurchaseLevelOptions]    Script Date: 01/29/2013 21:40:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetPurchaseLevelOptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetPurchaseLevelOptions]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetFranchiseeDetails]    Script Date: 01/29/2013 21:40:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetFranchiseeDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetFranchiseeDetails]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetContactsByUser]    Script Date: 01/29/2013 21:40:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetContactsByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetContactsByUser]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetOpportunitiesByUser]    Script Date: 01/29/2013 21:40:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetOpportunitiesByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetOpportunitiesByUser]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetCompaniesByUser]    Script Date: 01/29/2013 21:40:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetCompaniesByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetCompaniesByUser]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllFranchisee]    Script Date: 01/29/2013 21:40:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllFranchisee]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllFranchisee]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByFrIdSearch]    Script Date: 01/29/2013 21:40:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCompaniesByFrIdSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCompaniesByFrIdSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByCoachIdSearch]    Script Date: 01/29/2013 21:40:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCompaniesByCoachIdSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCompaniesByCoachIdSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesSearch]    Script Date: 01/29/2013 21:40:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCompaniesSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCompaniesSearch]
GO

USE [SandlerDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllFranchiseesSearch]    Script Date: 01/29/2013 21:40:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[sp_GetAllFranchiseesSearch]
	
	(
		@Name varchar(500),
		@LastName varchar(50),
        @FirstName varchar(50),
        @Title varchar(80),
        @OfficePhone varchar(50),
        @MobilePhone varchar(50),
        @Fax varchar(50),
        @WorkEmail varchar(80),
        @WorkAddress varchar(200),
        @WorkCity varchar(50),
        @WorkZip varchar(50),
        @SpouseName varchar(50),
        @YearsWithCompany varchar(50),
        @HomePhone varchar(50),
        @AlternateEmail varchar(80),
        @HomeAddress varchar(200),
        @HomeCity varchar(50),
        @HomeZip varchar(50),
        @InitialContractDate datetime,
        @RenewalDate datetime,
        @ContractFormDate datetime,
        @DHSAwardDate datetime,
        @InitialTrngDate datetime,
        @BirthDay datetime,
        @Anniversary datetime,
		@SandlerRoleID varchar(50),
        @IsPartOfMasterFranchisee varchar(50),
        @MasterFranchiseeID varchar(50),
        @IsCanPrintLocally varchar(50),
        @IsBuyFromCustomer varchar(50),
        @IsFixedPricePurchase varchar(50),
        @CostPlusAmountID varchar(50),
        @IsBehindInTerDev varchar(50),
        @BehindAmountID varchar(50),
        @CoachID varchar(50),
        @AwardLevelID varchar(50),
        @PurchaseLevelID varchar(50),
        @PrimaryBusinessID varchar(50),
        @CertifiedLevelID varchar(50),
        @IsContractorsPermitted varchar(50), 
        @IsKOLMember varchar(50), 
        @IsAdvBoard varchar(50), 
        @IsMktgCommittee varchar(50), 
        @IsUsingSandlerCRM varchar(50), 
        @IsDHSAwardWinner varchar(50), 
        @IsSandlerMailRequired varchar(50), 
        @IsReqToSubmitFinancials varchar(50), 
        @IsRepAgreementForGlobalAcct varchar(50), 
        @WorkStateID varchar(50),
        @WorkCountryID varchar(50),
        @HomeStateID varchar(50),
        @HomeCountryID varchar(50),
        @IsSameHomeAddress varchar(50)
				
	)
	
AS
	
	if @InitialContractDate < '2/1/1755'
	Begin
	  Set @InitialContractDate = null
	End
	if @RenewalDate < '2/1/1755'
	Begin
	  Set @RenewalDate = null
	End
	if @ContractFormDate < '2/1/1755'
	Begin
	  Set @ContractFormDate = null
	End
	if @DHSAwardDate < '2/1/1755'
	Begin
	  Set @DHSAwardDate = null
	End
	if @InitialTrngDate < '2/1/1755'
	 Begin
	  Set @InitialTrngDate = null
	 End
	if @BirthDay < '2/1/1755'
	 Begin
	  Set @BirthDay = null
	 End
	if @Anniversary < '2/1/1755'
	 Begin
	  Set @Anniversary = null
	 End
	
	DECLARE @SQLString VARCHAR(8000);
	Declare @PrevConditionExist varchar(10);
	Set @PrevConditionExist = 'No';
	-- Base SQL string stetement
	Set @SQLString = 'SELECT fr.ID, 
fr.Name,
fr.LastName, 
fr.FirstName,
fr.Title,
fr.OfficePhone,
fr.HomePhone,
fr.MobilePhone,
fr.Fax, fr.WorkEmail, fr.WorkAddress, fr.WorkCity,fr.WorkZip,
fr.AlternateEmail,fr.HomeAddress, fr.HomeCity, fr.HomeZip,
ISNULL(fr.SpouseName,'') as SpouseName,ISNULL(fr.YearswithCompany,'') as YearswithCompany,
ISNULL(ysn1.Description, ''No'') as IsCanPrintLocally,
ISNULL(ysn2.Description, ''No'') as IsBuyFromCustomer,
ISNULL(ysn3.Description, ''No'') as IsMasterFranchiseeExists,
ISNULL(ysn4.Description, ''No'') as IsFixedPricePurchase,
ISNULL(ysn5.Description, ''No'') as IsBehindInTerDev,
ISNULL(ysn6.Description, ''No'') as IsContractorPermitted,
ISNULL(ysn7.Description, ''No'') as IsSandlerMailRequired,
ISNULL(ysn8.Description, ''No'') as IsKOLMember,
ISNULL(ysn9.Description, ''No'') as IsAdvBoard,
ISNULL(ysn10.Description, ''No'') as IsMktgCommittee,
ISNULL(ysn11.Description, ''No'') as IsUsingSandlerCRM,
ISNULL(ysn12.Description, ''No'') as IsDHSAwardWinner,
ISNULL(ysn13.Description, ''No'') as IsReqToSubmitFinancial,
ISNULL(ysn14.Description, ''No'') as IsRepAgreement,
ISNULL(ysn15.Description, ''No'') as IsSameHomeAddress,
ISNULL(bhamt.BehindAmountText,'''') as BehindAmount,
ISNULL(sndr.SandlerRoleText,'''') as SandlerRole,
ISNULL(awdl.AwardLevelText,'''') as AwardLevel,
ISNULL(pusl.PurchaseLevelText,'''') as PurchaseLevel,
ISNULL(cerl.CertifiedLevelText,'''') as CertifiedLevel,
ISNULL(prmbus.PrimaryBusinessText,'''') as PrimaryBusiness,
ISNULL(fr.InitialContractDate, '''') as InitialContractDate, 
ISNULL(fr.RenewalDate, '''') as RenewalDate, 
ISNULL(fr.ContractFormDate, '''') as ContractFormDate, 
ISNULL(fr.DHSAwardDate, '''') as DHSAwardDate, 
ISNULL(fr.InitialTrngDate, '''') as InitialTrngDate, 
ISNULL(fr.BirthDay, '''') as BirthDay, 
ISNULL(fr.Anniversary, '''') as Anniversary, 
ISNULL(mfz.MasterFranchiseeName,'''') as MasterFrName,
ISNULL(cpamt.CostPlusAmountText,'''') as CostPlusAmount,
ISNULL(state1.Name,'''') as WorkState,
ISNULL(state2.Name,'''') as HomeState,
ISNULL(cnt1.Name,'''') as WorkCountry,
ISNULL(cnt2.Name,'''') as HomeCountry,
(ch.FirstName + '''' + ch.LastName) as CoachName, 
rg.Name as RegionName
FROM TBL_Franchisee fr
left outer join tbl_MasterFranchisee mfz on mfz.MasterFranchiseeId = fr.MasterFranchiseeId
left outer join Tbl_YesNoOptions ysn1 on ysn1.Value = fr.IsCanPrintLocally
left outer join Tbl_YesNoOptions ysn2 on ysn2.Value = fr.IsBuyFromCustomer
left outer join Tbl_YesNoOptions ysn3 on ysn3.Value = fr.IsMasterFranchiseeExists
left outer join Tbl_YesNoOptions ysn4 on ysn4.Value = fr.IsFixedPricePurchase
left outer join Tbl_YesNoOptions ysn5 on ysn5.Value = fr.IsBehindInTerDev
left outer join Tbl_YesNoOptions ysn6 on ysn6.Value = fr.IsContractorPermitted
left outer join Tbl_YesNoOptions ysn7 on ysn7.Value = fr.IsSandlerMailRequired
left outer join Tbl_YesNoOptions ysn8 on ysn8.Value = fr.IsKOLMember
left outer join Tbl_YesNoOptions ysn9 on ysn9.Value = fr.IsAdvBoard
left outer join Tbl_YesNoOptions ysn10 on ysn10.Value = fr.IsMktgCommittee
left outer join Tbl_YesNoOptions ysn11 on ysn11.Value = fr.IsUsingSandlerCRM
left outer join Tbl_YesNoOptions ysn12 on ysn12.Value = fr.IsDHSAwardWinner
left outer join Tbl_YesNoOptions ysn13 on ysn13.Value = fr.IsReqToSubmitFinancial
left outer join Tbl_YesNoOptions ysn14 on ysn14.Value = fr.IsRepAgreement
left outer join Tbl_YesNoOptions ysn15 on ysn15.Value = fr.IsSameHomeAddress
left outer join Tbl_State state1  on state1.Id = fr.WorkStateId
left outer join Tbl_State state2  on state2.Id = fr.HomeStateId
left outer join Tbl_Country cnt1  on cnt1.Id = fr.WorkCountryId
left outer join Tbl_Country cnt2  on cnt2.Id = fr.HomeCountryId
left outer join Tbl_AwardLevel awdl on awdl.AwardLevelId = fr.AwardLevelId
left outer join Tbl_PurchaseLevel pusl on pusl.PurchaseLevelId = fr.PurchaseLevelId
left outer join Tbl_CertifiedLevel cerl on cerl.CertifiedLevelId = fr.CertifiedLevelId
left outer join Tbl_PrimaryBusiness prmbus on prmbus.PrimaryBusinessId = fr.PrimaryBusinessId
left outer join Tbl_SandlerRole sndr on sndr.SandlerRoleId = fr.SandlerRoleId
left outer join Tbl_BehindAmount bhamt on bhamt.BehindAmountId = fr.BehindAmountId
left outer join tbl_CostPlusAmount cpamt on cpamt.CostPlusAmountId = fr.CostPlusAmountId
inner join TBL_COACH ch on ch.Id = fr.CoachID
inner join TBL_REGION rg on rg.Id = ch.regionId
	where ('
	-- Add based on the selection by the user - at least one selection will be there
	if @Name is not null and @Name != ''
	Begin
		SET @SQLString = @SQLString + 'fr.NAME like ''' + '%' + @Name  + '%' + '''' 
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Last Name
	if @LastName is not null and @LastName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.LastName like ''' + '%' + @LastName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- First Name
	if @FirstName is not null and @FirstName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.FirstName like ''' + '%' + @FirstName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Title
	if @Title is not null and @Title != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.Title like ''' + '%' + @Title  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- OfficePhone
	if @OfficePhone is not null and @OfficePhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.OfficePhone like ''' + '%' + @OfficePhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- MobilePhone
	if @MobilePhone is not null and @MobilePhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.MobilePhone like ''' + '%' + @MobilePhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- Fax
	if @Fax is not null and @Fax != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.Fax like ''' + '%' + @Fax  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- WorkEmail
	if @WorkEmail is not null and @WorkEmail != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.WorkEmail like ''' + '%' + @WorkEmail  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- WorkAddress
	if @WorkAddress is not null and @WorkAddress != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.WorkAddress like ''' + '%' + @WorkAddress  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- WorkCity
	if @WorkCity is not null and @WorkCity != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.WorkCity like ''' + '%' + @WorkCity  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- WorkZip
	if @WorkZip is not null and @WorkZip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.WorkZip like ''' + '%' + @WorkZip  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- SpouseName
	if @SpouseName is not null and @SpouseName != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.SpouseName like ''' + '%' + @SpouseName  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Years with Company
	if @YearsWithCompany is not null and @YearsWithCompany != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.YearsWithCompany = (' + @YearsWithCompany + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	-- HomePhone
	if @HomePhone is not null and @HomePhone != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.HomePhone like ''' + '%' + @HomePhone  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- AlternateEmail
	if @AlternateEmail is not null and @AlternateEmail != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.AlternateEmail like ''' + '%' + @AlternateEmail  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- HomeAddress
	if @HomeAddress is not null and @HomeAddress != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.HomeAddress like ''' + '%' + @HomeAddress  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End	
	-- HomeCity
	if @HomeCity is not null and @HomeCity != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.HomeCity like ''' + '%' + @HomeCity  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End	
	-- HomeZip
	if @HomeZip is not null and @HomeZip != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.HomeZip like ''' + '%' + @HomeZip  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End		
	-- For Initial Contract Date
	if @InitialContractDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.InitialContractDate = ''' + Convert(Varchar,@InitialContractDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Renewal Date
	if @RenewalDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.RenewalDate = ''' + Convert(Varchar,@RenewalDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Contract Form Date
	if @ContractFormDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.ContractFormDate = ''' + Convert(Varchar,@ContractFormDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For DHS Award Date
	if @DHSAwardDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.DHSAwardDate = ''' + Convert(Varchar,@DHSAwardDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Initial Trng Date
	if @InitialTrngDate is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.InitialTrngDate = ''' + Convert(Varchar,@InitialTrngDate,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For BirthDay
	if @BirthDay is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.BirthDay = ''' + Convert(Varchar,@BirthDay,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	-- For Anniversary
	if @Anniversary is not null
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.Anniversary = ''' + Convert(Varchar,@Anniversary,101) + ''''
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Sandler Role ID
	if @SandlerRoleID is not null and @SandlerRoleID != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.SandlerRoleId in (' + @SandlerRoleID + ')'
		Set @PrevConditionExist = 'Yes'; 
	End
	--for Is Part Of Master Franchisee
	if @IsPartOfMasterFranchisee is not null and @IsPartOfMasterFranchisee != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.IsMasterFranchiseeExists in (' + @IsPartOfMasterFranchisee + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--for Master Franchisee ID
	if @MasterFranchiseeID is not null and @MasterFranchiseeID != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.MasterFranchiseeID in (' + @MasterFranchiseeID + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--for Can Print Locally
	if @IsCanPrintLocally is not null and @IsCanPrintLocally != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.IsCanPrintLocally in (' + @IsCanPrintLocally + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--for Is Buy From Customer
	if @IsBuyFromCustomer is not null and @IsBuyFromCustomer != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.IsBuyFromCustomer in (' + @IsBuyFromCustomer + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--for Is Fixed Price Purchase
	if @IsFixedPricePurchase is not null and @IsFixedPricePurchase != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.IsFixedPricePurchase in (' + @IsFixedPricePurchase + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--for Cost Plus Amount ID
	if @CostPlusAmountID is not null and @CostPlusAmountID != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.CostPlusAmountID in (' + @CostPlusAmountID + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--for Behind Amount ID
	if @BehindAmountID is not null and @BehindAmountID != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.BehindAmountID in (' + @BehindAmountID + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--for CoachID
	if @CoachID is not null and @CoachID != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.CoachID in (' + @CoachID + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--for AwardLevelID
	if @AwardLevelID is not null and @AwardLevelID != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.AwardLevelID in (' + @AwardLevelID + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--for PurchaseLevelID
	if @PurchaseLevelID is not null and @PurchaseLevelID != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.PurchaseLevelID in (' + @PurchaseLevelID + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--for Primary Business ID
	if @PrimaryBusinessID is not null and @PrimaryBusinessID != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.PrimaryBusinessID in (' + @PrimaryBusinessID + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--for Certified Level ID
	if @CertifiedLevelID is not null and @CertifiedLevelID != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.CertifiedLevelID in (' + @CertifiedLevelID + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--Is Contractors Permitted
	if @IsContractorsPermitted is not null and @IsContractorsPermitted != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.IsContractorPermitted in (' + @IsContractorsPermitted + ')'
		Set @PrevConditionExist = 'Yes'; 
	End		
	--Is IsKOLMember
	if @IsKOLMember is not null and @IsKOLMember != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.IsKOLMember in (' + @IsKOLMember + ')'
		Set @PrevConditionExist = 'Yes'; 
	End		
	--Is IsAdvBoard
	if @IsAdvBoard is not null and @IsAdvBoard != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.IsAdvBoard in (' + @IsAdvBoard + ')'
		Set @PrevConditionExist = 'Yes'; 
	End		
	--Is IsMktgCommittee
	if @IsMktgCommittee is not null and @IsMktgCommittee != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.IsMktgCommittee in (' + @IsMktgCommittee + ')'
		Set @PrevConditionExist = 'Yes'; 
	End		
	--Is IsUsingSandlerCRM
	if @IsUsingSandlerCRM is not null and @IsUsingSandlerCRM != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.IsUsingSandlerCRM in (' + @IsUsingSandlerCRM + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--Is IsDHSAwardWinner
	if @IsDHSAwardWinner is not null and @IsDHSAwardWinner != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.IsDHSAwardWinner in (' + @IsDHSAwardWinner + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--Is IsSandlerMailRequired
	if @IsSandlerMailRequired is not null and @IsSandlerMailRequired != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.IsSandlerMailRequired in (' + @IsSandlerMailRequired + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--Is IsReqToSubmitFinancials
	if @IsReqToSubmitFinancials is not null and @IsReqToSubmitFinancials != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.IsReqToSubmitFinancial in (' + @IsReqToSubmitFinancials + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--Is IsRepAgreementForGlobalAcct
	if @IsRepAgreementForGlobalAcct is not null and @IsRepAgreementForGlobalAcct != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.IsRepAgreement in (' + @IsRepAgreementForGlobalAcct + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--Is WorkStateId
	if @WorkStateID is not null and @WorkStateID != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.WorkStateId in (' + @WorkStateID + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--Is WorkCountryID
	if @WorkCountryID is not null and @WorkCountryID != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.WorkCountryID in (' + @WorkCountryID + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--Is HomeStateID
	if @HomeStateID is not null and @HomeStateID != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.HomeStateID in (' + @HomeStateID + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--Is @HomeCountryID
	if @HomeCountryID is not null and @HomeCountryID != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.HomeCountryID in (' + @HomeCountryID + ')'
		Set @PrevConditionExist = 'Yes'; 
	End	
	--Is IsSameHomeAddress
	if @IsSameHomeAddress is not null and @IsSameHomeAddress != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.IsSameHomeAddress in (' + @IsSameHomeAddress + ')'
		Set @PrevConditionExist = 'Yes'; 
	End		
		
	-- End of conditons so we need to close with bracket
	SET @SQLString = @SQLString + ')' ;
	-- Order By
	SET @SQLString = @SQLString + ' ORDER BY fr.NAME ' ;
    -- Now Print/Execute the Statement
    Print @SQLString
    EXEC(@SQLString);
	
		
	
	RETURN
	
	


GO

/****** Object:  StoredProcedure [dbo].[sp_InsertFranchisee]    Script Date: 01/29/2013 21:40:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[sp_InsertFranchisee]
	(	
		@Name varchar(500),
		@LastName varchar(50),
        @FirstName varchar(50),
        @Title varchar(80),
        @OfficePhone varchar(50),
        @MobilePhone varchar(50),
        @Fax varchar(50),
        @WorkEmail varchar(80),
        @WorkAddress varchar(200),
        @WorkCity varchar(50),
        @WorkZip varchar(50),
        @SpouseName varchar(50),
        @YearsWithCompany int,
        @HomePhone varchar(50),
        @AlternateEmail varchar(80),
        @HomeAddress varchar(200),
        @HomeCity varchar(50),
        @HomeZip varchar(50),
        @InitialContractDate datetime,
        @RenewalDate datetime,
        @ContractFormDate datetime,
        @DHSAwardDate datetime,
        @InitialTrngDate datetime,
        @BirthDay datetime,
        @Anniversary datetime,
		@SandlerRoleID int,
        @IsPartOfMasterFranchisee int,
        @MasterFranchiseeID int,
        @IsCanPrintLocally int,
        @IsBuyFromCustomer int,
        @IsFixedPricePurchase int,
        @CostPlusAmountID int,
        @IsBehindInTerDev int,
        @BehindAmountID int,
        @CoachID int,
        @AwardLevelID int,
        @PurchaseLevelID int,
        @PrimaryBusinessID int,
        @CertifiedLevelID int,
        @IsContractorsPermitted int, 
        @IsKOLMember int, 
        @IsAdvBoard int, 
        @IsMktgCommittee int, 
        @IsUsingSandlerCRM int, 
        @IsDHSAwardWinner int, 
        @IsSandlerMailRequired int, 
        @IsReqToSubmitFinancials int, 
        @IsRepAgreementForGlobalAcct int, 
        @WorkStateID int,
        @WorkCountryID int,
        @HomeStateID int,
        @HomeCountryID int,
        @IsSameHomeAddress int
	 )
AS
	
	if @InitialContractDate < '2/1/1755'
	Begin
	  Set @InitialContractDate = null
	End
	if @RenewalDate < '2/1/1755'
	Begin
	  Set @RenewalDate = null
	End
	if @ContractFormDate < '2/1/1755'
	Begin
	  Set @ContractFormDate = null
	End
	if @DHSAwardDate < '2/1/1755'
	Begin
	  Set @DHSAwardDate = null
	End
	if @InitialTrngDate < '2/1/1755'
	 Begin
	  Set @InitialTrngDate = null
	 End
	if @BirthDay < '2/1/1755'
	 Begin
	  Set @BirthDay = null
	 End
	if @Anniversary < '2/1/1755'
	 Begin
	  Set @Anniversary = null
	 End
	if(@SandlerRoleID = 0) 
 	 Begin
	 Set @SandlerRoleID = null
	 End
	
	 if(@MasterFranchiseeID = 0) 
 	 Begin
	 Set @MasterFranchiseeID = null
	 End
	 
	 if(@BehindAmountID = 0) 
 	 Begin
	 Set @BehindAmountID = null
	 End
	
	 if(@AwardLevelID = 0) 
 	 Begin
	 Set @AwardLevelID = null
	 End
		
	 if(@PurchaseLevelID = 0) 
 	 Begin
	 Set @PurchaseLevelID = null
	 End
	
	 if(@CoachID = 0) 
 	 Begin
	 Set @CoachID = null
	 End
	
	if(@PrimaryBusinessID = 0) 
 	 Begin
	 Set @PrimaryBusinessID = null
	 End
	
	if(@CertifiedLevelID = 0) 
 	 Begin
	 Set @CertifiedLevelID = null
	 End
	
	if(@WorkStateID = 0) 
 	 Begin
	 Set @WorkStateID = null
	 End
	 
	 if(@WorkCountryID = 0) 
 	 Begin
	 Set @WorkCountryID = null
	 End
	 
	 if(@HomeStateID = 0) 
 	 Begin
	 Set @HomeStateID = null
	 End
	 
	 if(@HomeCountryID = 0) 
 	 Begin
	 Set @HomeCountryID = null
	 End
	
	 if(@CostPlusAmountID = 0) 
 	 Begin
	 Set @CostPlusAmountID = null
	 End
	
	if(@YearsWithCompany = 0) 
 	 Begin
	 Set @YearsWithCompany = null
	 End
	
	
	
	
	Insert into tbl_Franchisee
	(Name,LastName,FirstName, Title,
	OfficePhone,MobilePhone,Fax,WorkEmail,WorkAddress,WorkCity,
	WorkZip,SpouseName,YearsWithCompany, HomePhone,AlternateEmail,HomeAddress,HomeCity,HomeZip,
	InitialContractDate, RenewalDate, ContractFormDate, DHSAwardDate, InitialTrngDate,BirthDay,
	Anniversary,SandlerRoleID,
        IsMasterFranchiseeExists,
        MasterFranchiseeID,
        IsCanPrintLocally,
        IsBuyFromCustomer,
        IsFixedPricePurchase,
        CostPlusAmountID,
        IsBehindInTerDev,
        BehindAmountID,
        CoachID,
        AwardLevelID,
        PurchaseLevelID,
        PrimaryBusinessID,
        CertifiedLevelID,
        IsContractorPermitted, 
        IsKOLMember, 
        IsAdvBoard, 
        IsMktgCommittee, 
        IsUsingSandlerCRM, 
        IsDHSAwardWinner, 
        IsSandlerMailRequired, 
        IsReqToSubmitFinancial, 
        IsRepAgreement, 
        WorkStateID,
        WorkCountryID,
        HomeStateID,
        HomeCountryID,
        IsSameHomeAddress,
        CreatedDate
	
	)
	values
	(@Name,@LastName,
        @FirstName,
        @Title,
        @OfficePhone,
        @MobilePhone,
        @Fax,
        @WorkEmail,
        @WorkAddress,
        @WorkCity,
        @WorkZip,
        @SpouseName,
        @YearsWithCompany,
        @HomePhone,
        @AlternateEmail,
        @HomeAddress,
        @HomeCity,
        @HomeZip,
        @InitialContractDate,
        @RenewalDate,
        @ContractFormDate,
        @DHSAwardDate,
        @InitialTrngDate,
        @BirthDay,
        @Anniversary,
		@SandlerRoleID,
        @IsPartOfMasterFranchisee,
        @MasterFranchiseeID,
        @IsCanPrintLocally,
        @IsBuyFromCustomer,
        @IsFixedPricePurchase,
        @CostPlusAmountID,
        @IsBehindInTerDev,
        @BehindAmountID,
        @CoachID,
        @AwardLevelID,
        @PurchaseLevelID,
        @PrimaryBusinessID,
        @CertifiedLevelID,
        @IsContractorsPermitted, 
        @IsKOLMember, 
        @IsAdvBoard, 
        @IsMktgCommittee, 
        @IsUsingSandlerCRM, 
        @IsDHSAwardWinner, 
        @IsSandlerMailRequired, 
        @IsReqToSubmitFinancials, 
        @IsRepAgreementForGlobalAcct, 
        @WorkStateID,
        @WorkCountryID,
        @HomeStateID,
        @HomeCountryID,
        @IsSameHomeAddress, GETDATE())
	
	/* SET NOCOUNT ON */
	RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateFranchiseeDetails]    Script Date: 01/29/2013 21:40:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_UpdateFranchiseeDetails]
	(
		
		@LastName varchar(50),
        @FirstName varchar(50),
        @Title varchar(80),
        @OfficePhone varchar(50),
        @MobilePhone varchar(50),
        @Fax varchar(50),
        @WorkEmail varchar(80),
        @WorkAddress varchar(200),
        @WorkCity varchar(50),
        @WorkZip varchar(50),
        @SpouseName varchar(50),
        @YearsWithCompany int,
        @HomePhone varchar(50),
        @AlternateEmail varchar(80),
        @HomeAddress varchar(200),
        @HomeCity varchar(50),
        @HomeZip varchar(50),
        @InitialContractDate datetime,
        @RenewalDate datetime,
        @ContractFormDate datetime,
        @DHSAwardDate datetime,
        @InitialTrngDate datetime,
        @BirthDay datetime,
        @Anniversary datetime,
		@SandlerRoleID int,
        @IsPartOfMasterFranchisee int,
        @MasterFranchiseeID int,
        @IsCanPrintLocally int,
        @IsBuyFromCustomer int,
        @IsFixedPricePurchase int,
        @CostPlusAmountID int,
        @IsBehindInTerDev int,
        @BehindAmountID int,
        @CoachID int,
        @AwardLevelID int,
        @PurchaseLevelID int,
        @PrimaryBusinessID int,
        @CertifiedLevelID int,
        @IsContractorsPermitted int, 
        @IsKOLMember int, 
        @IsAdvBoard int, 
        @IsMktgCommittee int, 
        @IsUsingSandlerCRM int, 
        @IsDHSAwardWinner int, 
        @IsSandlerMailRequired int, 
        @IsReqToSubmitFinancials int, 
        @IsRepAgreementForGlobalAcct int, 
        @WorkStateID int,
        @WorkCountryID int,
        @HomeStateID int,
        @HomeCountryID int,
        @IsSameHomeAddress int,
        @FrId int
		
	)
AS
	
	if @InitialContractDate < '2/1/1755'
	Begin
	  Set @InitialContractDate = null
	End
	if @RenewalDate < '2/1/1755'
	Begin
	  Set @RenewalDate = null
	End
	if @ContractFormDate < '2/1/1755'
	Begin
	  Set @ContractFormDate = null
	End
	if @DHSAwardDate < '2/1/1755'
	Begin
	  Set @DHSAwardDate = null
	End
	if @InitialTrngDate < '2/1/1755'
	 Begin
	  Set @InitialTrngDate = null
	 End
	if @BirthDay < '2/1/1755'
	 Begin
	  Set @BirthDay = null
	 End
	if @Anniversary < '2/1/1755'
	 Begin
	  Set @Anniversary = null
	 End
	if(@SandlerRoleID = 0) 
 	 Begin
	 Set @SandlerRoleID = null
	 End
	
	 if(@MasterFranchiseeID = 0) 
 	 Begin
	 Set @MasterFranchiseeID = null
	 End
	 
	 if(@BehindAmountID = 0) 
 	 Begin
	 Set @BehindAmountID = null
	 End
	
	 if(@AwardLevelID = 0) 
 	 Begin
	 Set @AwardLevelID = null
	 End
		
	 if(@PurchaseLevelID = 0) 
 	 Begin
	 Set @PurchaseLevelID = null
	 End
	
	 if(@CoachID = 0) 
 	 Begin
	 Set @CoachID = null
	 End
	
	if(@PrimaryBusinessID = 0) 
 	 Begin
	 Set @PrimaryBusinessID = null
	 End
	
	if(@CertifiedLevelID = 0) 
 	 Begin
	 Set @CertifiedLevelID = null
	 End
	
	if(@WorkStateID = 0) 
 	 Begin
	 Set @WorkStateID = null
	 End
	 
	 if(@WorkCountryID = 0) 
 	 Begin
	 Set @WorkCountryID = null
	 End
	 
	 if(@HomeStateID = 0) 
 	 Begin
	 Set @HomeStateID = null
	 End
	 
	 if(@HomeCountryID = 0) 
 	 Begin
	 Set @HomeCountryID = null
	 End
	
	 if(@CostPlusAmountID = 0) 
 	 Begin
	 Set @CostPlusAmountID = null
	 End
	
	if(@YearsWithCompany = 0) 
 	 Begin
	 Set @YearsWithCompany = null
	 End
	 
	Update tbl_Franchisee

	Set 
	LastName = @LastName,FirstName = @FirstName,Title = @Title,
	CoachId = @CoachID,
	IsMasterFranchiseeExists = @IsPartOfMasterFranchisee,
	MasterFranchiseeId = @MasterFranchiseeID,
	SandlerRoleId = @SandlerRoleID,
	OfficePhone = @OfficePhone,	HomePhone = @HomePhone,	Fax = @Fax,
	AwardLevelId = @AwardLevelID,PurchaseLevelId = @PurchaseLevelID,
	CertifiedLevelId = @CertifiedLevelID,PrimaryBusinessId = @PrimaryBusinessID,
	InitialContractDate = @InitialContractDate,	RenewalDate = @RenewalDate,	ContractFormDate = @ContractFormDate,
	IsContractorPermitted = @IsContractorsPermitted,IsSandlerMailRequired = @IsSandlerMailRequired,
	IsKOLMember = @IsKOLMember,IsAdvBoard = @IsAdvBoard,IsMktgCommittee = @IsMktgCommittee,
	IsUsingSandlerCRM = @IsUsingSandlerCRM, IsDHSAwardWinner = @IsDHSAwardWinner,
	DHSAwardDate = @DHSAwardDate, InitialTrngDate = @InitialTrngDate,
	IsReqToSubmitFinancial = @IsReqToSubmitFinancials, IsRepAgreement = @IsRepAgreementForGlobalAcct,
	WorkEmail = @WorkEmail,WorkAddress = @WorkAddress, WorkCity = @WorkCity, WorkZip = @WorkZip,
	WorkStateId = @WorkStateID, WorkCountryId = @WorkCountryId,
	AlternateEmail = @AlternateEmail,
	IsSameHomeAddress = @IsSameHomeAddress,
	HomeAddress = @HomeAddress, HomeCity = @HomeCity, HomeZip = @HomeZip,
	HomeStateId = @HomeStateID, HomeCountryId = @HomeCountryId,
	SpouseName = @SpouseName, Birthday = @Birthday,
	Anniversary = @Anniversary, YearsWithCompany = @YearsWithCompany,
	IsCanPrintLocally = @IsCanPrintLocally, IsBuyFromCustomer = @IsBuyFromCustomer,
	IsFixedPricePurchase = @IsFixedPricePurchase, IsBehindinTerDev = @IsBehindinTerDev,
	CostPlusAmountId = @CostPlusAmountID,
	BehindAmountId = @BehindAmountId,
	LastCreatedDate = GETDATE()
	
	where ID = @FrId

	RETURN







GO

/****** Object:  StoredProcedure [dbo].[sp_GetMasterFranchiseeOptions]    Script Date: 01/29/2013 21:40:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



Create PROCEDURE [dbo].[sp_GetMasterFranchiseeOptions]

AS

	 SELECT MasterFranchiseeId, MasterFranchiseeName FROM TBL_MasterFranchisee ORDER BY MasterFranchiseeId

	 RETURN










GO

/****** Object:  StoredProcedure [dbo].[sp_GetCoachOptions]    Script Date: 01/29/2013 21:40:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_GetCoachOptions]

AS

	 SELECT Id, (FirstName + ' ' + LastName + ' - Region ' + Convert(varchar(3),RegionId))as Name 
	 FROM TBL_Coach 
	 ORDER BY RegionId

	 RETURN










GO

/****** Object:  StoredProcedure [dbo].[sp_GetStateOptions]    Script Date: 01/29/2013 21:40:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



create PROCEDURE [dbo].[sp_GetStateOptions]

AS

	 SELECT Id, Name  FROM TBL_State ORDER BY Id

	 RETURN










GO

/****** Object:  StoredProcedure [dbo].[sp_GetCountryOptions]    Script Date: 01/29/2013 21:40:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



create PROCEDURE [dbo].[sp_GetCountryOptions]

AS

	 SELECT Id, Name, Code FROM TBL_Country ORDER BY Id

	 RETURN










GO

/****** Object:  StoredProcedure [dbo].[sp_GetPrimaryBusinessOptions]    Script Date: 01/29/2013 21:40:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



create PROCEDURE [dbo].[sp_GetPrimaryBusinessOptions]

AS

	 SELECT PrimaryBusinessId, PrimaryBusinessText FROM TBL_PrimaryBusiness ORDER BY PrimaryBusinessId

	 RETURN










GO

/****** Object:  StoredProcedure [dbo].[sp_GetSandlerRoleOptions]    Script Date: 01/29/2013 21:40:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



create PROCEDURE [dbo].[sp_GetSandlerRoleOptions]

AS

	 SELECT SandlerRoleId, SandlerRoleText FROM TBL_SandlerRole ORDER BY SandlerRoleId

	 RETURN










GO

/****** Object:  StoredProcedure [dbo].[sp_GetBehindAmountOptions]    Script Date: 01/29/2013 21:40:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



create PROCEDURE [dbo].[sp_GetBehindAmountOptions]

AS

	 SELECT BehindAmountId, BehindAmountText FROM TBL_BehindAmount ORDER BY BehindAmountId

	 RETURN










GO

/****** Object:  StoredProcedure [dbo].[sp_GetCostPlusAmountOptions]    Script Date: 01/29/2013 21:40:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



create PROCEDURE [dbo].[sp_GetCostPlusAmountOptions]

AS

	 SELECT CostPlusAmountId, CostPlusAmountText FROM TBL_CostPlusAmount ORDER BY CostPlusAmountId

	 RETURN










GO

/****** Object:  StoredProcedure [dbo].[sp_GetAwardLevelOptions]    Script Date: 01/29/2013 21:40:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



Create PROCEDURE [dbo].[sp_GetAwardLevelOptions]

AS

	 SELECT AwardLevelId, AwardLevelText FROM TBL_AwardLevel ORDER BY AwardLevelId

	 RETURN










GO

/****** Object:  StoredProcedure [dbo].[sp_GetCertifiedLevelOptions]    Script Date: 01/29/2013 21:40:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



Create PROCEDURE [dbo].[sp_GetCertifiedLevelOptions]

AS

	 SELECT CertifiedLevelId, CertifiedLevelText FROM TBL_CertifiedLevel ORDER BY CertifiedLevelId

	 RETURN










GO

/****** Object:  StoredProcedure [dbo].[sp_GetPurchaseLevelOptions]    Script Date: 01/29/2013 21:40:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



Create PROCEDURE [dbo].[sp_GetPurchaseLevelOptions]

AS

	 SELECT PurchaseLevelId, PurchaseLevelText FROM TBL_PurchaseLevel ORDER BY PurchaseLevelId

	 RETURN










GO

/****** Object:  StoredProcedure [dbo].[sp_GetFranchiseeDetails]    Script Date: 01/29/2013 21:40:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetFranchiseeDetails]
	
	(
		@FrID int
	)
	
AS
	SELECT fr.ID, 
fr.Name,
fr.LastName, 
fr.FirstName,
fr.Title,
fr.OfficePhone,
fr.HomePhone,
fr.MobilePhone,
fr.Fax, fr.WorkEmail, fr.WorkAddress, fr.WorkCity,fr.WorkZip,
fr.AlternateEmail,fr.HomeAddress, fr.HomeCity, fr.HomeZip,
ISNULL(fr.SpouseName,'') as SpouseName,ISNULL(fr.YearswithCompany,'') as YearswithCompany,
ISNULL(ysn1.Description, 'No') as IsCanPrintLocally,ISNULL(ysn1.Value,0) as IsCanPrintLocallyValue,
ISNULL(ysn2.Description, 'No') as IsBuyFromCustomer,ISNULL(ysn2.Value,0) as IsBuyFromCustomerValue,
ISNULL(ysn3.Description, 'No') as IsMasterFranchiseeExists,ISNULL(ysn3.Value,0) as IsMasterFranchiseeExistsValue,
ISNULL(ysn4.Description, 'No') as IsFixedPricePurchase,ISNULL(ysn4.Value,0) as IsFixedPricePurchaseValue,
ISNULL(ysn5.Description, 'No') as IsBehindInTerDev,ISNULL(ysn5.Value,0) as IsBehindInTerDevValue,
ISNULL(ysn6.Description, 'No') as IsContractorPermitted,ISNULL(ysn6.Value,0) as IsContractorPermittedValue,
ISNULL(ysn7.Description, 'No') as IsSandlerMailRequired,ISNULL(ysn7.Value,0) as IsSandlerMailRequiredValue,
ISNULL(ysn8.Description, 'No') as IsKOLMember,ISNULL(ysn8.Value,0) as IsKOLMemberValue,
ISNULL(ysn9.Description, 'No') as IsAdvBoard,ISNULL(ysn9.Value,0) as IsAdvBoardValue,
ISNULL(ysn10.Description, 'No') as IsMktgCommittee,ISNULL(ysn10.Value,0) as IsMktgCommitteeValue,
ISNULL(ysn11.Description, 'No') as IsUsingSandlerCRM,ISNULL(ysn11.Value,0) as IsUsingSandlerCRMValue,
ISNULL(ysn12.Description, 'No') as IsDHSAwardWinner,ISNULL(ysn12.Value,0) as IsDHSAwardWinnerValue,
ISNULL(ysn13.Description, 'No') as IsReqToSubmitFinancial,ISNULL(ysn13.Value,0) as IsReqToSubmitFinancialValue,
ISNULL(ysn14.Description, 'No') as IsRepAgreement,ISNULL(ysn14.Value,0) as IsRepAgreementValue,
ISNULL(ysn15.Description, 'No') as IsSameHomeAddress,ISNULL(ysn15.Value,0) as IsSameHomeAddressValue,
ISNULL(bhamt.BehindAmountText,'') as BehindAmount,ISNULL(fr.BehindAmountId,1) as BehindAmountValue,
ISNULL(sndr.SandlerRoleText,'') as SandlerRole,ISNULL(fr.SandlerRoleId,1) as SandlerRoleValue,
ISNULL(awdl.AwardLevelText,'') as AwardLevel,ISNULL(fr.AwardLevelId,1) as AwardLevelValue,
ISNULL(pusl.PurchaseLevelText,'') as PurchaseLevel,ISNULL(fr.PurchaseLevelId,1) as PurchaseLevelValue,
ISNULL(cerl.CertifiedLevelText,'') as CertifiedLevel,ISNULL(fr.CertifiedLevelId,1) as CertifiedLevelValue,
ISNULL(prmbus.PrimaryBusinessText,'') as PrimaryBusiness,ISNULL(fr.PrimaryBusinessId,1) as PrimaryBusinessValue,
ISNULL(fr.InitialContractDate, '') as InitialContractDate, 
ISNULL(fr.RenewalDate, '') as RenewalDate, 
ISNULL(fr.ContractFormDate, '') as ContractFormDate, 
ISNULL(fr.DHSAwardDate, '') as DHSAwardDate, 
ISNULL(fr.InitialTrngDate, '') as InitialTrngDate, 
ISNULL(fr.BirthDay, '') as BirthDay, 
ISNULL(fr.Anniversary, '') as Anniversary, 
ISNULL(mfz.MasterFranchiseeName,'') as MasterFrName,
ISNULL(cpamt.CostPlusAmountText,'') as CostPlusAmount,ISNULL(fr.CostPlusAmountId,1) as CostPlusAmountValue,
ISNULL(state1.Name,'') as WorkState,ISNULL(fr.WorkStateId,1) as WorkStateValue,
ISNULL(state2.Name,'') as HomeState,ISNULL(fr.HomeStateId,1) as HomeStateValue,
ISNULL(cnt1.Name,'') as WorkCountry,ISNULL(fr.WorkCountryId,1) as WorkCountryValue,
ISNULL(cnt2.Name,'') as HomeCountry,ISNULL(fr.HomeCountryId,1) as HomeCountryValue,
(ch.FirstName + '' + ch.LastName) as CoachName, ch.ID as CoachId,
ISNULL(fr.MasterFranchiseeId,1) as MasterFranchiseeId,
rg.Name as RegionName
FROM TBL_Franchisee fr
left outer join tbl_MasterFranchisee mfz on mfz.MasterFranchiseeId = fr.MasterFranchiseeId
left outer join Tbl_YesNoOptions ysn1 on ysn1.Value = fr.IsCanPrintLocally
left outer join Tbl_YesNoOptions ysn2 on ysn2.Value = fr.IsBuyFromCustomer
left outer join Tbl_YesNoOptions ysn3 on ysn3.Value = fr.IsMasterFranchiseeExists
left outer join Tbl_YesNoOptions ysn4 on ysn4.Value = fr.IsFixedPricePurchase
left outer join Tbl_YesNoOptions ysn5 on ysn5.Value = fr.IsBehindInTerDev
left outer join Tbl_YesNoOptions ysn6 on ysn6.Value = fr.IsContractorPermitted
left outer join Tbl_YesNoOptions ysn7 on ysn7.Value = fr.IsSandlerMailRequired
left outer join Tbl_YesNoOptions ysn8 on ysn8.Value = fr.IsKOLMember
left outer join Tbl_YesNoOptions ysn9 on ysn9.Value = fr.IsAdvBoard
left outer join Tbl_YesNoOptions ysn10 on ysn10.Value = fr.IsMktgCommittee
left outer join Tbl_YesNoOptions ysn11 on ysn11.Value = fr.IsUsingSandlerCRM
left outer join Tbl_YesNoOptions ysn12 on ysn12.Value = fr.IsDHSAwardWinner
left outer join Tbl_YesNoOptions ysn13 on ysn13.Value = fr.IsReqToSubmitFinancial
left outer join Tbl_YesNoOptions ysn14 on ysn14.Value = fr.IsRepAgreement
left outer join Tbl_YesNoOptions ysn15 on ysn15.Value = fr.IsSameHomeAddress
left outer join Tbl_State state1  on state1.Id = fr.WorkStateId
left outer join Tbl_State state2  on state2.Id = fr.HomeStateId
left outer join Tbl_Country cnt1  on cnt1.Id = fr.WorkCountryId
left outer join Tbl_Country cnt2  on cnt2.Id = fr.HomeCountryId
left outer join Tbl_AwardLevel awdl on awdl.AwardLevelId = fr.AwardLevelId
left outer join Tbl_PurchaseLevel pusl on pusl.PurchaseLevelId = fr.PurchaseLevelId
left outer join Tbl_CertifiedLevel cerl on cerl.CertifiedLevelId = fr.CertifiedLevelId
left outer join Tbl_PrimaryBusiness prmbus on prmbus.PrimaryBusinessId = fr.PrimaryBusinessId
left outer join Tbl_SandlerRole sndr on sndr.SandlerRoleId = fr.SandlerRoleId
left outer join Tbl_BehindAmount bhamt on bhamt.BehindAmountId = fr.BehindAmountId
left outer join tbl_CostPlusAmount cpamt on cpamt.CostPlusAmountId = fr.CostPlusAmountId
inner join TBL_COACH ch on ch.Id = fr.CoachID
inner join TBL_REGION rg on rg.Id = ch.regionId

	where fr.ID = @FrID
	
	

	RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_GetContactsByUser]    Script Date: 01/29/2013 21:40:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE Procedure [dbo].[sp_GetContactsByUser]
@userId UniqueIdentifier	

AS 
Begin

	DECLARE @RoleName VARCHAR(256)
    DECLARE @franchiseeId int
    
    Select @RoleName = RoleName From vw_aspnet_Roles r
    INNER JOIN vw_aspnet_UsersInRoles ur ON ur.RoleId = r.RoleId
    WHERE ur.UserId = @userId;
    
    PRINT @RoleName;
    
    IF @RoleName = 'Corporate' or @RoleName = 'HomeOfficeAdmin' or @RoleName = 'HomeOfficeUser'
	Begin
    
		Select *  
		FROM [vw_Contacts];
		
		Return;
	END
	
	IF @RoleName = 'Coach'
	BEGIN
		
		Select vw.*  
		FROM [vw_Contacts] vw
		INNER JOIN TBL_COACH ch WITH(NOLOCK) ON ch.ID = vw.CoachId
		WHERE ch.UserID = @userId;
		
	END 
	
	IF (@RoleName = 'FranchiseeOwner' OR @RoleName = 'Client')
	Begin
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		PRINT '@franchiseeId=' + CAST(@franchiseeId as varchar(10));
		
		Select vw.*  
		FROM [vw_Contacts] vw
		INNER JOIN TBL_Franchisee f WITH(NOLOCK) ON f.ID = vw.FranchiseeID
		WHERE vw.FranchiseeID = @franchiseeId;
		Return;
	END
	
	IF @RoleName = 'FranchiseeUser'
	BEGIN
		
		Select vw.*  
		FROM [vw_Contacts] vw
		WHERE vw.CreatedBy = CAST(@userId AS VARCHAR(100));
		
	END 
	
	
	
End



GO

/****** Object:  StoredProcedure [dbo].[sp_GetOpportunitiesByUser]    Script Date: 01/29/2013 21:40:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[sp_GetOpportunitiesByUser]
@userId UniqueIdentifier	

AS 
Begin

	DECLARE @RoleName VARCHAR(256)
    DECLARE @franchiseeId int
    
    Select @RoleName = RoleName From vw_aspnet_Roles r
    INNER JOIN vw_aspnet_UsersInRoles ur ON ur.RoleId = r.RoleId
    WHERE ur.UserId = @userId;
    
    PRINT @RoleName;
    
    IF @RoleName = 'Corporate' or @RoleName = 'HomeOfficeAdmin' or @RoleName = 'HomeOfficeUser'
	Begin
    
		Select *  
		FROM [vw_Opportunities];
		
		Return;
	END
	
	IF @RoleName = 'Coach'
	BEGIN
		
		Select vw.*  
		FROM [vw_Opportunities] vw
		INNER JOIN TBL_COACH ch WITH(NOLOCK) ON ch.ID = vw.CoachId
		WHERE ch.UserID = @userId;
		
	END 
	
	IF (@RoleName = 'FranchiseeOwner' OR @RoleName = 'Client')
	Begin
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		PRINT '@franchiseeId=' + CAST(@franchiseeId as varchar(10));
		
		Select vw.*  
		FROM [vw_Opportunities] vw
		INNER JOIN TBL_Franchisee f WITH(NOLOCK) ON f.ID = vw.FranchiseeID
		WHERE vw.FranchiseeID = @franchiseeId;
		Return;
	END
	
	IF @RoleName = 'FranchiseeUser'
	BEGIN
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		Select vw.*  
		FROM [vw_Opportunities] vw
		WHERE vw.CreatedBy = @userId;
		
	END 
	
End


GO

/****** Object:  StoredProcedure [dbo].[sp_GetCompaniesByUser]    Script Date: 01/29/2013 21:40:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE Procedure [dbo].[sp_GetCompaniesByUser]
@userId UniqueIdentifier	

AS 
Begin

	DECLARE @RoleName VARCHAR(256)
    DECLARE @franchiseeId int
    
    Select @RoleName = RoleName From vw_aspnet_Roles r
    INNER JOIN vw_aspnet_UsersInRoles ur ON ur.RoleId = r.RoleId
    WHERE ur.UserId = @userId;
    
    PRINT @RoleName;
    
    IF @RoleName = 'Corporate'
	Begin
    
		Select *  
		FROM [vw_Companies];
		
		Return;
	END
	
	IF @RoleName = 'Coach'
	BEGIN
		
		Select vw.*  
		FROM [vw_Companies] vw
		INNER JOIN TBL_COACH ch WITH(NOLOCK) ON ch.ID = vw.CoachId
		WHERE ch.UserID = @userId;
		
	END 
	
	IF (@RoleName = 'FranchiseeOwner' OR @RoleName = 'FranchiseeUser' OR @RoleName = 'Client')
	Begin
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		PRINT '@franchiseeId=' + CAST(@franchiseeId as varchar(10));
		
		Select vw.*  
		FROM [vw_Companies] vw
		INNER JOIN TBL_Franchisee f WITH(NOLOCK) ON f.ID = vw.FranchiseeID
		WHERE vw.FranchiseeID = @franchiseeId;
		Return;
	END	
	
	IF @RoleName = 'HomeOfficeAdmin' or @RoleName = 'HomeOfficeUser'
	Begin
    
		Select *  
		FROM [vw_Companies];
		
		Return;
	END
	
End


GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllFranchisee]    Script Date: 01/29/2013 21:40:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE

PROCEDURE [dbo].[sp_GetAllFranchisee]

/*
(
@parameter1 int = 5,
@parameter2 datatype OUTPUT
)
*/
AS

SELECT fr.ID, 
fr.Name,
fr.LastName, 
fr.FirstName,
fr.Title,
fr.OfficePhone,
fr.HomePhone,
fr.MobilePhone,
fr.Fax, fr.WorkEmail, fr.WorkAddress, fr.WorkCity,fr.WorkZip,
fr.AlternateEmail,fr.HomeAddress, fr.HomeCity, fr.HomeZip,
ISNULL(fr.SpouseName,'') as SpouseName,ISNULL(fr.YearswithCompany,'') as YearswithCompany,
ISNULL(ysn1.Description, 'No') as IsCanPrintLocally,
ISNULL(ysn2.Description, 'No') as IsBuyFromCustomer,
ISNULL(ysn3.Description, 'No') as IsMasterFranchiseeExists,
ISNULL(ysn4.Description, 'No') as IsFixedPricePurchase,
ISNULL(ysn5.Description, 'No') as IsBehindInTerDev,
ISNULL(ysn6.Description, 'No') as IsContractorPermitted,
ISNULL(ysn7.Description, 'No') as IsSandlerMailRequired,
ISNULL(ysn8.Description, 'No') as IsKOLMember,
ISNULL(ysn9.Description, 'No') as IsAdvBoard,
ISNULL(ysn10.Description, 'No') as IsMktgCommittee,
ISNULL(ysn11.Description, 'No') as IsUsingSandlerCRM,
ISNULL(ysn12.Description, 'No') as IsDHSAwardWinner,
ISNULL(ysn13.Description, 'No') as IsReqToSubmitFinancial,
ISNULL(ysn14.Description, 'No') as IsRepAgreement,
ISNULL(ysn15.Description, 'No') as IsSameHomeAddress,
ISNULL(bhamt.BehindAmountText,'') as BehindAmount,
ISNULL(sndr.SandlerRoleText,'') as SandlerRole,
ISNULL(awdl.AwardLevelText,'') as AwardLevel,
ISNULL(pusl.PurchaseLevelText,'') as PurchaseLevel,
ISNULL(cerl.CertifiedLevelText,'') as CertifiedLevel,
ISNULL(prmbus.PrimaryBusinessText,'') as PrimaryBusiness,
ISNULL(fr.InitialContractDate, '') as InitialContractDate, 
ISNULL(fr.RenewalDate, '') as RenewalDate, 
ISNULL(fr.ContractFormDate, '') as ContractFormDate, 
ISNULL(fr.DHSAwardDate, '') as DHSAwardDate, 
ISNULL(fr.InitialTrngDate, '') as InitialTrngDate, 
ISNULL(fr.BirthDay, '') as BirthDay, 
ISNULL(fr.Anniversary, '') as Anniversary, 
ISNULL(mfz.MasterFranchiseeName,'') as MasterFrName,
ISNULL(cpamt.CostPlusAmountText,'') as CostPlusAmount,
ISNULL(state1.Name,'') as WorkState,
ISNULL(state2.Name,'') as HomeState,
ISNULL(cnt1.Name,'') as WorkCountry,
ISNULL(cnt2.Name,'') as HomeCountry,
(ch.FirstName + ' ' + ch.LastName) as CoachName, 
rg.Name as RegionName
FROM TBL_Franchisee fr
left outer join tbl_MasterFranchisee mfz on mfz.MasterFranchiseeId = fr.MasterFranchiseeId
left outer join Tbl_YesNoOptions ysn1 on ysn1.Value = fr.IsCanPrintLocally
left outer join Tbl_YesNoOptions ysn2 on ysn2.Value = fr.IsBuyFromCustomer
left outer join Tbl_YesNoOptions ysn3 on ysn3.Value = fr.IsMasterFranchiseeExists
left outer join Tbl_YesNoOptions ysn4 on ysn4.Value = fr.IsFixedPricePurchase
left outer join Tbl_YesNoOptions ysn5 on ysn5.Value = fr.IsBehindInTerDev
left outer join Tbl_YesNoOptions ysn6 on ysn6.Value = fr.IsContractorPermitted
left outer join Tbl_YesNoOptions ysn7 on ysn7.Value = fr.IsSandlerMailRequired
left outer join Tbl_YesNoOptions ysn8 on ysn8.Value = fr.IsKOLMember
left outer join Tbl_YesNoOptions ysn9 on ysn9.Value = fr.IsAdvBoard
left outer join Tbl_YesNoOptions ysn10 on ysn10.Value = fr.IsMktgCommittee
left outer join Tbl_YesNoOptions ysn11 on ysn11.Value = fr.IsUsingSandlerCRM
left outer join Tbl_YesNoOptions ysn12 on ysn12.Value = fr.IsDHSAwardWinner
left outer join Tbl_YesNoOptions ysn13 on ysn13.Value = fr.IsReqToSubmitFinancial
left outer join Tbl_YesNoOptions ysn14 on ysn14.Value = fr.IsRepAgreement
left outer join Tbl_YesNoOptions ysn15 on ysn15.Value = fr.IsSameHomeAddress
left outer join Tbl_State state1  on state1.Id = fr.WorkStateId
left outer join Tbl_State state2  on state2.Id = fr.HomeStateId
left outer join Tbl_Country cnt1  on cnt1.Id = fr.WorkCountryId
left outer join Tbl_Country cnt2  on cnt2.Id = fr.HomeCountryId
left outer join Tbl_AwardLevel awdl on awdl.AwardLevelId = fr.AwardLevelId
left outer join Tbl_PurchaseLevel pusl on pusl.PurchaseLevelId = fr.PurchaseLevelId
left outer join Tbl_CertifiedLevel cerl on cerl.CertifiedLevelId = fr.CertifiedLevelId
left outer join Tbl_PrimaryBusiness prmbus on prmbus.PrimaryBusinessId = fr.PrimaryBusinessId
left outer join Tbl_SandlerRole sndr on sndr.SandlerRoleId = fr.SandlerRoleId
left outer join Tbl_BehindAmount bhamt on bhamt.BehindAmountId = fr.BehindAmountId
left outer join tbl_CostPlusAmount cpamt on cpamt.CostPlusAmountId = fr.CostPlusAmountId
inner join TBL_COACH ch on ch.Id = fr.CoachID
inner join TBL_REGION rg on rg.Id = ch.regionId
Order By fr.ID

RETURN
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByFrIdSearch]    Script Date: 01/29/2013 21:40:19 ******/
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

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByCoachIdSearch]    Script Date: 01/29/2013 21:40:19 ******/
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

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesSearch]    Script Date: 01/29/2013 21:40:19 ******/
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


