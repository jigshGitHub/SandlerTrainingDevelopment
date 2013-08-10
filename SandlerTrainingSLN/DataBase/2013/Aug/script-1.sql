/****** Object:  StoredProcedure [dbo].[sp_GetAllFranchisee]    Script Date: 08/10/2013 13:11:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllFranchisee]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllFranchisee]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllFranchiseesSearch]    Script Date: 08/10/2013 13:11:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllFranchiseesSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllFranchiseesSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportardd]    Script Date: 08/10/2013 13:11:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportardd]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportardd]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportctra]    Script Date: 08/10/2013 13:11:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportctra]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportctra]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportdhsa]    Script Date: 08/10/2013 13:11:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportdhsa]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportdhsa]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbyawlevel]    Script Date: 08/10/2013 13:11:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbyawlevel]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbyawlevel]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbybusarea]    Script Date: 08/10/2013 13:11:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbybusarea]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbybusarea]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbycertlevel]    Script Date: 08/10/2013 13:11:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbycertlevel]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbycertlevel]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbycoach]    Script Date: 08/10/2013 13:11:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbycoach]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbycoach]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbycontdetails]    Script Date: 08/10/2013 13:11:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbycontdetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbycontdetails]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbycountry]    Script Date: 08/10/2013 13:11:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbycountry]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbycountry]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbyregion]    Script Date: 08/10/2013 13:11:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbyregion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbyregion]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbystate]    Script Date: 08/10/2013 13:11:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbystate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbystate]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbytrngdate]    Script Date: 08/10/2013 13:11:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbytrngdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbytrngdate]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbyusingcrm]    Script Date: 08/10/2013 13:11:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbyusingcrm]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbyusingcrm]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrmd]    Script Date: 08/10/2013 13:11:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrmd]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrmd]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportglaa]    Script Date: 08/10/2013 13:11:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportglaa]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportglaa]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmfrd]    Script Date: 08/10/2013 13:11:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportmfrd]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportmfrd]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmsfc]    Script Date: 08/10/2013 13:11:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportmsfc]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportmsfc]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmsfr]    Script Date: 08/10/2013 13:11:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportmsfr]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportmsfr]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmsrbyadvboard]    Script Date: 08/10/2013 13:11:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportmsrbyadvboard]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportmsrbyadvboard]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmsrbykeyopnldr]    Script Date: 08/10/2013 13:11:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportmsrbykeyopnldr]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportmsrbykeyopnldr]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmsrbymktgcom]    Script Date: 08/10/2013 13:11:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportmsrbymktgcom]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportmsrbymktgcom]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportprpl]    Script Date: 08/10/2013 13:11:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportprpl]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportprpl]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportsere]    Script Date: 08/10/2013 13:11:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportsere]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportsere]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportzcbt]    Script Date: 08/10/2013 13:11:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportzcbt]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportzcbt]
GO


/****** Object:  StoredProcedure [dbo].[sp_GetAllFranchisee]    Script Date: 08/10/2013 13:11:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_GetAllFranchisee]

(
	 @Role varchar(50)
)

AS

    if (@Role = 'HomeOfficeAdmin')

	 Begin
	 
			SELECT fr.ID, 			
			fr.LastName as "Last Name", 
			fr.FirstName as "First Name",
			fr.Name as "Franchise Name",fr.Name as Name,
			fr.Title,
			fr.OfficePhone,
			fr.HomePhone,
			fr.MobilePhone,
			fr.Fax, 
			fr.WorkEmail as "Primary Office Email", 
			fr.WorkAddress as "Primary Office Address", 
			fr.WorkCity as "Primary Office City",
			fr.WorkZip as "Primary Office Zip",
			fr.AlternateEmail,fr.HomeAddress, fr.HomeCity, fr.HomeZip,
			fr.Territory,fr.BusinessFocusArea,fr.ClosestMetroArea,
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
			ISNULL(cnt1.Name,'') as "Primary Office Country",
			ISNULL(cnt2.Name,'') as HomeCountry,
			(ch.FirstName + ' ' + ch.LastName) as CoachName, 
			ISNULL(fr.LastCreatedDate, '') as LastUpdatedDate,
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
			left outer join Tbl_SandlerRole sndr on sndr.SandlerRoleId = fr.SandlerRoleId
			left outer join Tbl_BehindAmount bhamt on bhamt.BehindAmountId = fr.BehindAmountId
			left outer join tbl_CostPlusAmount cpamt on cpamt.CostPlusAmountId = fr.CostPlusAmountId
			inner join TBL_COACH ch on ch.Id = fr.CoachID
			inner join TBL_REGION rg on rg.Id = ch.regionId
			where (WorkEmail is null or Upper(WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')
			and fr.IsActive = 1
			Order By fr.LastName
      End


if (@Role != 'HomeOfficeAdmin')

	 Begin
	 
			SELECT fr.ID, 			
			fr.LastName as "Last Name", 
			fr.FirstName as "First Name",
			fr.Name as "Franchise Name",fr.Name as Name,
			fr.OfficePhone,
			fr.WorkEmail as "Primary Office Email", 
			ISNULL(fr.LastCreatedDate, '') as LastUpdatedDate
			FROM TBL_Franchisee fr
			where (WorkEmail is null or Upper(WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')
			and fr.IsActive = 1
			Order By fr.LastName
      End



RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllFranchiseesSearch]    Script Date: 08/10/2013 13:11:04 ******/
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
        @IsSameHomeAddress varchar(50),
        @Territory varchar(120),
        @BusinessFocusArea varchar(50),
        @ClosestMetroArea varchar(50)
				
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
fr.LastName as "Last Name", 
fr.FirstName as "First Name",fr.Name as "Franchise Name",
fr.Title,
fr.OfficePhone,
fr.HomePhone,
fr.MobilePhone,
fr.Fax, 
fr.WorkEmail as "Primary Office Email", 
fr.WorkAddress as "Primary Office Address", 
fr.WorkCity as "Primary Office City",
fr.WorkZip as "Primary Office Zip",
fr.AlternateEmail,fr.HomeAddress, fr.HomeCity, fr.HomeZip,
fr.Territory,fr.BusinessFocusArea,fr.ClosestMetroArea,
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
ISNULL(cnt1.Name,'''') as "Primary Office Country",
ISNULL(cnt2.Name,'''') as HomeCountry,
(ch.FirstName + '''' + ch.LastName) as CoachName,
ISNULL(fr.LastCreatedDate, '''') as LastUpdatedDate, 
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
left outer join Tbl_SandlerRole sndr on sndr.SandlerRoleId = fr.SandlerRoleId
left outer join Tbl_BehindAmount bhamt on bhamt.BehindAmountId = fr.BehindAmountId
left outer join tbl_CostPlusAmount cpamt on cpamt.CostPlusAmountId = fr.CostPlusAmountId
inner join TBL_COACH ch on ch.Id = fr.CoachID
inner join TBL_REGION rg on rg.Id = ch.regionId
	where fr.IsActive = 1 and  (fr.WorkEmail is null or Upper(fr.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'') and ('
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
	-- Territory
	if @Territory is not null and @Territory != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.Territory like ''' + '%' + @Territory  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End	
	-- BusinessFocusArea
	if @BusinessFocusArea is not null and @BusinessFocusArea != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.BusinessFocusArea like ''' + '%' + @BusinessFocusArea  + '%' + ''''
		Set @PrevConditionExist = 'Yes'; 
	End	
	-- ClosestMetroArea
	if @ClosestMetroArea is not null and @ClosestMetroArea != ''
	Begin
		if @PrevConditionExist = 'Yes'
		Begin
			SET @SQLString = @SQLString + ' OR '
		end
		SET @SQLString = @SQLString + 'fr.ClosestMetroArea like ''' + '%' + @ClosestMetroArea  + '%' + ''''
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

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportardd]    Script Date: 08/10/2013 13:11:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE  PROCEDURE [dbo].[sp_GetHomeOfficeReportardd]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,	
	D.MasterFranchiseeName AS 'Master Franchise',			
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
		Case when A.IsCanPrintLocally='1' Then 'Yes' else 'No' end as 'Local Print',			
	Case when A.IsBuyFromCustomer='1' Then 'Yes' else 'No' end as 'Buy From SSI',			
	Case when A.IsFixedPricePurchase='1' Then 'Yes' else 'No' end as 'Fixed Price Purchase',
	b.CostPlusAmountText as 'Product Cost',
	c.BehindAmountText as 'Territory Develop',	
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		Left Join dbo.Tbl_CostPlusAmount B on a.CostPlusAmountId=b.CostPlusAmountId
		left join dbo.Tbl_BehindAmount C on a.BehindAmountId = C.BehindAmountId
		Join DBO.Tbl_MasterFranchisee D on D.MasterFranchiseeId=a.MasterFranchiseeId
		where a.SandlerRoleId=1	
		ORDER BY D.MasterFranchiseeName
	Else
		SELECT 		
		AB.MasterFranchiseeName AS 'Master Franchise',			
		Isnull(A.NAME,'') AS 'Franchise Name',
		Case when A.IsCanPrintLocally='1' Then 'Yes' else 'No' end as 'Local Print',			
	Case when A.IsBuyFromCustomer='1' Then 'Yes' else 'No' end as 'Buy From SSI',			
	Case when A.IsFixedPricePurchase='1' Then 'Yes' else 'No' end as 'Fixed Price Purchase',
	p.CostPlusAmountText as 'Product Cost',
	q.BehindAmountText as 'Territory Develop',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated',			
			i.UserName as 'Last Updated By',
			Convert(varchar(12),A.CreatedDate,101) AS 'Created Date',J.UserName as 'Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'') as 'Address',IsNull(A.Address2,'') as 'Address Line 2',
			Isnull(A.City,'') City,Isnull(A.State,'') State,Isnull(A.Zip,'') Zip,Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,'') Phone,
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,'') Fax, Isnull(a.FaxNumber,'') as 'Fax Number',
			Convert(varchar(12),A.DHSAwardDate,101) as 'Award Date',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',
			Convert(varchar(12),A.InitialContractDate,101) as 'Initial Contact Date',
			Convert(varchar(12),A.RenewalDate,101) as 'Renewal Date',
			Convert(varchar(12),A.ContractFormDate,101) as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			Convert(varchar(12),A.DHSAwardDate,101) as 'DHS Award Date',
			Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Primary Office Email',Isnull(a.WorkAddress,'') as 'Primary Office Address',Isnull(a.WorkCity,'') as 'Primary Office City',
			Isnull(d.Name,'') as 'Primary Office State',Isnull(a.WorkZip,'') as 'Primary Office Zip',Isnull(e.Name,'') as 'Primary Office Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			Convert(varchar(12),A.Birthday,101) as 'Birth Day',
			Convert(varchar(12),A.Anniversary,101) as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',	
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',			
			a.Territory as 'Territory',
	a.BusinessFocusArea as 'Business Focus Area',	
	a.ClosestMetroArea as 'Closest Metro Area'
		FROM DBO.TBL_FRANCHISEE A
		Join DBO.Tbl_MasterFranchisee AB on Ab.MasterFranchiseeId=a.MasterFranchiseeId
		and a.SandlerRoleId=1
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		ORDER BY AB.MasterFranchiseeName
	
	
	



GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportctra]    Script Date: 08/10/2013 13:11:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportctra]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,	
	case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Allowed',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A
		where (A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')	
		AND A.SandlerRoleId in (1,6)					
		ORDER BY A.IsContractorPermitted
	Else
		SELECT 		
		case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Allowed',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated',		
			i.UserName as 'Last Updated By',
			CASE WHEN (Convert(varchar(12),A.CreatedDate,101)='01/01/1900' OR A.CreatedDate=NULL) THEN NULL ELSE Convert(varchar(12),A.CreatedDate,101) END as 'Created Date',J.UserName as 'Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'') as 'Address',IsNull(A.Address2,'') as 'Address Line 2',
			Isnull(A.City,'') City,Isnull(A.State,'') State,Isnull(A.Zip,'') Zip,Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,'') Phone,
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,'') Fax, Isnull(a.FaxNumber,'') as 'Fax Number',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',
			CASE WHEN (Convert(varchar(12),A.InitialContractDate,101)='01/01/1900' OR A.InitialContractDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialContractDate,101) END as 'Initial Contact Date',
			CASE WHEN (Convert(varchar(12),A.RenewalDate,101)='01/01/1900' OR A.RenewalDate=NULL) THEN NULL ELSE Convert(varchar(12),A.RenewalDate,101) END as 'Renewal Date',
			CASE WHEN (Convert(varchar(12),A.ContractFormDate,101)='01/01/1900' OR A.ContractFormDate=NULL) THEN NULL ELSE Convert(varchar(12),A.ContractFormDate,101) END as 'Contact Form Date',			
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			CASE WHEN (Convert(varchar(12),A.DHSAwardDate,101)='01/01/1900' OR A.DHSAwardDate=NULL) THEN NULL ELSE Convert(varchar(12),A.DHSAwardDate,101) END as 'DHS Award Date',
			CASE WHEN (Convert(varchar(12),A.InitialTrngDate,101)='01/01/1900' OR A.InitialTrngDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialTrngDate,101) END as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Primary Office Email',Isnull(a.WorkAddress,'') as 'Primary Office Address',Isnull(a.WorkCity,'') as 'Primary Office City',
			Isnull(d.Name,'') as 'Primary Office State',Isnull(a.WorkZip,'') as 'Primary Office Zip',Isnull(e.Name,'') as 'Primary Office Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			CASE WHEN (Convert(varchar(12),A.Birthday,101)='01/01/1900' OR A.Birthday=NULL) THEN NULL ELSE Convert(varchar(12),A.Birthday,101) END as 'Birth Day',
			CASE WHEN (Convert(varchar(12),A.Anniversary,101)='01/01/1900' OR A.Anniversary=NULL) THEN NULL ELSE Convert(varchar(12),A.Anniversary,101) END as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From SSI',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind',
			a.Territory as 'Territory',
	a.BusinessFocusArea as 'Business Focus Area',	
	a.ClosestMetroArea as 'Closest Metro Area'
		FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where (A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')
		AND A.SandlerRoleId in (1,6)
		ORDER BY A.IsContractorPermitted
	
	
	






GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportdhsa]    Script Date: 08/10/2013 13:11:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportdhsa]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,				
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
		Isnull(A.NAME,'') AS 'Franchise Name',
		CASE WHEN (Convert(varchar(12),A.DHSAwardDate,101)='01/01/1900' OR A.DHSAwardDate=NULL) THEN NULL ELSE Convert(varchar(12),A.DHSAwardDate,101) END as 'DHS Award Date',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A						
		where a.IsDHSAwardWinner =1 and 
		(A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')
		ORDER BY A.NAME
	Else
		SELECT 						
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
		Isnull(A.NAME,'') AS 'Franchise Name',	
		CASE WHEN (Convert(varchar(12),A.DHSAwardDate,101)='01/01/1900' OR A.DHSAwardDate=NULL) THEN NULL ELSE Convert(varchar(12),A.DHSAwardDate,101) END as 'DHS Award Date',	
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated',	
			i.UserName as 'Last Updated By',
			CASE WHEN (Convert(varchar(12),A.CreatedDate,101)='01/01/1900' OR A.CreatedDate=NULL) THEN NULL ELSE Convert(varchar(12),A.CreatedDate,101) END as 'Created Date',J.UserName as 'Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'') as 'Address',IsNull(A.Address2,'') as 'Address Line 2',
			Isnull(A.City,'') City,Isnull(A.State,'') State,Isnull(A.Zip,'') Zip,Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,'') Phone,
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,'') Fax, Isnull(a.FaxNumber,'') as 'Fax Number',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',
			CASE WHEN (Convert(varchar(12),A.InitialContractDate,101)='01/01/1900' OR A.InitialContractDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialContractDate,101) END as 'Initial Contact Date',
			CASE WHEN (Convert(varchar(12),A.RenewalDate,101)='01/01/1900' OR A.RenewalDate=NULL) THEN NULL ELSE Convert(varchar(12),A.RenewalDate,101) END as 'Renewal Date',
			CASE WHEN (Convert(varchar(12),A.ContractFormDate,101)='01/01/1900' OR A.ContractFormDate=NULL) THEN NULL ELSE Convert(varchar(12),A.ContractFormDate,101) END as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			CASE WHEN (Convert(varchar(12),A.DHSAwardDate,101)='01/01/1900' OR A.DHSAwardDate=NULL) THEN NULL ELSE Convert(varchar(12),A.DHSAwardDate,101) END as 'DHS Award Date',
			CASE WHEN (Convert(varchar(12),A.InitialTrngDate,101)='01/01/1900' OR A.InitialTrngDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialTrngDate,101) END as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Primary Office Email',Isnull(a.WorkAddress,'') as 'Primary Office Address',Isnull(a.WorkCity,'') as 'Primary Office City',
			Isnull(d.Name,'') as 'Primary Office State',Isnull(a.WorkZip,'') as 'Primary Office Zip',Isnull(e.Name,'') as 'Primary Office Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			CASE WHEN (Convert(varchar(12),A.Birthday,101)='01/01/1900' OR A.Birthday=NULL) THEN NULL ELSE Convert(varchar(12),A.Birthday,101) END as 'Birth Day',
			CASE WHEN (Convert(varchar(12),A.Anniversary,101)='01/01/1900' OR A.Anniversary=NULL) THEN NULL ELSE Convert(varchar(12),A.Anniversary,101) END as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From SSI',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind',
			a.Territory as 'Territory',
	a.BusinessFocusArea as 'Business Focus Area',	
	a.ClosestMetroArea as 'Closest Metro Area'
		FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where a.IsDHSAwardWinner =1 and
		(A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')
		ORDER BY A.NAME
	
	
	






GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbyawlevel]    Script Date: 08/10/2013 13:11:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbyawlevel]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,		
		B.AwardLevelText as 'Award Level',		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
Isnull(A.NAME,'') AS 'Franchise Name',								
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		Left Join dbo.Tbl_AwardLevel B on a.AwardLevelId=B.AwardLevelId
		where A.AwardLevelId is not null and
		(A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')			
		AND A.SandlerRoleId in (1,6)
		ORDER BY B.AwardLevelText				
	Else
		SELECT 	
		l.AwardLevelText as 'Award Level',		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
	Isnull(A.NAME,'') AS 'Franchise Name',
	CASE WHEN (Convert(varchar(12),A.DHSAwardDate,101)='01/01/1900' OR A.DHSAwardDate=NULL) THEN NULL ELSE Convert(varchar(12),A.DHSAwardDate,101) END as 'DHS Award Date',			
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated',		
			i.UserName as 'Last Updated By',
			CASE WHEN (Convert(varchar(12),A.CreatedDate,101)='01/01/1900' OR A.CreatedDate=NULL) THEN NULL ELSE Convert(varchar(12),A.CreatedDate,101) END as 'Created Date',J.UserName as 'Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'') as 'Address',IsNull(A.Address2,'') as 'Address Line 2',
			Isnull(A.City,'') City,Isnull(A.State,'') State,Isnull(A.Zip,'') Zip,Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,'') Phone,
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,'') Fax, Isnull(a.FaxNumber,'') as 'Fax Number',
			Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',
			CASE WHEN (Convert(varchar(12),A.InitialContractDate,101)='01/01/1900' OR A.InitialContractDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialContractDate,101) END as 'Initial Contact Date',
			CASE WHEN (Convert(varchar(12),A.RenewalDate,101)='01/01/1900' OR A.RenewalDate=NULL) THEN NULL ELSE Convert(varchar(12),A.RenewalDate,101) END as 'Renewal Date',
			CASE WHEN (Convert(varchar(12),A.ContractFormDate,101)='01/01/1900' OR A.ContractFormDate=NULL) THEN NULL ELSE Convert(varchar(12),A.ContractFormDate,101) END as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			CASE WHEN (Convert(varchar(12),A.InitialTrngDate,101)='01/01/1900' OR A.InitialTrngDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialTrngDate,101) END as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Primary Office Email',Isnull(a.WorkAddress,'') as 'Primary Office Address',Isnull(a.WorkCity,'') as 'Primary Office City',
			Isnull(d.Name,'') as 'Primary Office State',Isnull(a.WorkZip,'') as 'Primary Office Zip',Isnull(e.Name,'') as 'Primary Office Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			CASE WHEN (Convert(varchar(12),A.Birthday,101)='01/01/1900' OR A.Birthday=NULL) THEN NULL ELSE Convert(varchar(12),A.Birthday,101) END as 'Birth Day',
			CASE WHEN (Convert(varchar(12),A.Anniversary,101)='01/01/1900' OR A.Anniversary=NULL) THEN NULL ELSE Convert(varchar(12),A.Anniversary,101) END as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From SSI',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind',
			a.Territory as 'Territory',
	a.BusinessFocusArea as 'Business Focus Area',	
	a.ClosestMetroArea as 'Closest Metro Area'
		FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where A.AwardLevelId is not null and
		(A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')			
		AND A.SandlerRoleId in (1,6)
		ORDER BY l.AwardLevelText
	
	
	






GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbybusarea]    Script Date: 08/10/2013 13:11:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbybusarea]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,	
	A.BusinessFocusArea as 'Business Focus Area',		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		where a.BusinessFocusArea != ''
		ORDER BY a.BusinessFocusArea
	Else
		SELECT 	
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated',			
			i.UserName as 'Last Updated By',
			Convert(varchar(12),A.CreatedDate,101) AS 'Created Date',J.UserName as 'Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'') as 'Address',IsNull(A.Address2,'') as 'Address Line 2',
			Isnull(A.City,'') City,Isnull(A.State,'') State,Isnull(A.Zip,'') Zip,Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,'') Phone,
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,'') Fax, Isnull(a.FaxNumber,'') as 'Fax Number',
			Convert(varchar(12),A.DHSAwardDate,101) as 'Award Date',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',
			Convert(varchar(12),A.InitialContractDate,101) as 'Initial Contact Date',
			Convert(varchar(12),A.RenewalDate,101) as 'Renewal Date',
			Convert(varchar(12),A.ContractFormDate,101) as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			Convert(varchar(12),A.DHSAwardDate,101) as 'DHS Award Date',
			Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Primary Office Email',Isnull(a.WorkAddress,'') as 'Primary Office Address',Isnull(a.WorkCity,'') as 'Primary Office City',
			Isnull(d.Name,'') as 'Primary Office State',Isnull(a.WorkZip,'') as 'Primary Office Zip',Isnull(e.Name,'') as 'Primary Office Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			Convert(varchar(12),A.Birthday,101) as 'Birth Day',
			Convert(varchar(12),A.Anniversary,101) as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From SSI',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind',
			a.Territory as 'Territory',
	a.BusinessFocusArea as 'Business Focus Area',	
	a.ClosestMetroArea as 'Closest Metro Area'
		FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where 
		a.BusinessFocusArea != ''
		ORDER BY a.BusinessFocusArea
	
	


GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbycertlevel]    Script Date: 08/10/2013 13:11:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbycertlevel]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,	
	B.CertifiedLevelText as 'Certification Level',		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
		Isnull(A.NAME,'') AS 'Franchise Name',
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		left join dbo.Tbl_CertifiedLevel B on a.CertifiedLevelId = B.CertifiedLevelId
		where A.CertifiedLevelId is not null and
		(A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')
		AND A.SandlerRoleId in (1,6)
		ORDER BY B.CertifiedLevelText							
	Else
		SELECT 	
		n.CertifiedLevelText as 'Certification Level',		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated',			
			i.UserName as 'Last Updated By',
			CASE WHEN (Convert(varchar(12),A.CreatedDate,101)='01/01/1900' OR A.CreatedDate=NULL) THEN NULL ELSE Convert(varchar(12),A.CreatedDate,101) END as 'Created Date',J.UserName as 'Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'') as 'Address',IsNull(A.Address2,'') as 'Address Line 2',
			Isnull(A.City,'') City,Isnull(A.State,'') State,Isnull(A.Zip,'') Zip,Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,'') Phone,
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,'') Fax, Isnull(a.FaxNumber,'') as 'Fax Number',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			CASE WHEN (Convert(varchar(12),A.InitialContractDate,101)='01/01/1900' OR A.InitialContractDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialContractDate,101) END as 'Initial Contact Date',
			CASE WHEN (Convert(varchar(12),A.RenewalDate,101)='01/01/1900' OR A.RenewalDate=NULL) THEN NULL ELSE Convert(varchar(12),A.RenewalDate,101) END as 'Renewal Date',
			CASE WHEN (Convert(varchar(12),A.ContractFormDate,101)='01/01/1900' OR A.ContractFormDate=NULL) THEN NULL ELSE Convert(varchar(12),A.ContractFormDate,101) END as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			CASE WHEN (Convert(varchar(12),A.DHSAwardDate,101)='01/01/1900' OR A.DHSAwardDate=NULL) THEN NULL ELSE Convert(varchar(12),A.DHSAwardDate,101) END as 'DHS Award Date',
			CASE WHEN (Convert(varchar(12),A.InitialTrngDate,101)='01/01/1900' OR A.InitialTrngDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialTrngDate,101) END as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Primary Office Email',Isnull(a.WorkAddress,'') as 'Primary Office Address',Isnull(a.WorkCity,'') as 'Primary Office City',
			Isnull(d.Name,'') as 'Primary Office State',Isnull(a.WorkZip,'') as 'Primary Office Zip',Isnull(e.Name,'') as 'Primary Office Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			CASE WHEN (Convert(varchar(12),A.Birthday,101)='01/01/1900' OR A.Birthday=NULL) THEN NULL ELSE Convert(varchar(12),A.Birthday,101) END as 'Birth Day',
			CASE WHEN (Convert(varchar(12),A.Anniversary,101)='01/01/1900' OR A.Anniversary=NULL) THEN NULL ELSE Convert(varchar(12),A.Anniversary,101) END as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From SSI',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind',
			a.Territory as 'Territory',
	a.BusinessFocusArea as 'Business Focus Area',	
	a.ClosestMetroArea as 'Closest Metro Area'
		FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where A.CertifiedLevelId is not null and
		(A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')	
		AND A.SandlerRoleId in (1,6)		
		ORDER BY n.CertifiedLevelText
	
	
	






GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbycoach]    Script Date: 08/10/2013 13:11:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbycoach]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,		
		Isnull(B.FIRSTNAME,'')+' '+Isnull(B.LASTNAME,'') AS Coach,		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
Isnull(A.NAME,'') AS 'Franchise Name',						
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated'	
		FROM DBO.TBL_FRANCHISEE A	
		JOIN DBO.TBL_COACH B ON A.COACHID = B.ID
		where (A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')	
		AND A.SandlerRoleId in (1,6)
		ORDER BY B.FIRSTNAME+' '+B.LASTNAME				
	Else
		SELECT 	
		Isnull(B.FIRSTNAME,'')+' '+Isnull(B.LASTNAME,'') AS Coach,		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
Isnull(A.NAME,'') AS 'Franchise Name',			
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated',		
			i.UserName as 'Last Updated By',
			CASE WHEN (Convert(varchar(12),A.CreatedDate,101)='01/01/1900' OR A.CreatedDate=NULL) THEN NULL ELSE Convert(varchar(12),A.CreatedDate,101) END as 'Created Date',J.UserName as 'Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'') as 'Address',IsNull(A.Address2,'') as 'Address Line 2',
			Isnull(A.City,'') City,Isnull(A.State,'') State,Isnull(A.Zip,'') Zip,Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,'') Phone,
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,'') Fax, Isnull(a.FaxNumber,'') as 'Fax Number',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',
			CASE WHEN (Convert(varchar(12),A.InitialContractDate,101)='01/01/1900' OR A.InitialContractDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialContractDate,101) END as 'Initial Contact Date',
			CASE WHEN (Convert(varchar(12),A.RenewalDate,101)='01/01/1900' OR A.RenewalDate=NULL) THEN NULL ELSE Convert(varchar(12),A.RenewalDate,101) END as 'Renewal Date',
			CASE WHEN (Convert(varchar(12),A.ContractFormDate,101)='01/01/1900' OR A.ContractFormDate=NULL) THEN NULL ELSE Convert(varchar(12),A.ContractFormDate,101) END as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			CASE WHEN (Convert(varchar(12),A.DHSAwardDate,101)='01/01/1900' OR A.DHSAwardDate=NULL) THEN NULL ELSE Convert(varchar(12),A.DHSAwardDate,101) END as 'DHS Award Date',
			CASE WHEN (Convert(varchar(12),A.InitialTrngDate,101)='01/01/1900' OR A.InitialTrngDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialTrngDate,101) END as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Primary Office Email',Isnull(a.WorkAddress,'') as 'Primary Office Address',Isnull(a.WorkCity,'') as 'Primary Office City',
			Isnull(d.Name,'') as 'Primary Office State',Isnull(a.WorkZip,'') as 'Primary Office Zip',Isnull(e.Name,'') as 'Primary Office Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			CASE WHEN (Convert(varchar(12),A.Birthday,101)='01/01/1900' OR A.Birthday=NULL) THEN NULL ELSE Convert(varchar(12),A.Birthday,101) END as 'Birth Day',
			CASE WHEN (Convert(varchar(12),A.Anniversary,101)='01/01/1900' OR A.Anniversary=NULL) THEN NULL ELSE Convert(varchar(12),A.Anniversary,101) END as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From SSI',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind',
			a.Territory as 'Territory',
	a.BusinessFocusArea as 'Business Focus Area',	
	a.ClosestMetroArea as 'Closest Metro Area'
		FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId	
		where (A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')	
		AND A.SandlerRoleId in (1,6)
		ORDER BY B.FIRSTNAME+' '+B.LASTNAME
	
	
	






GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbycontdetails]    Script Date: 08/10/2013 13:11:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbycontdetails]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,		
		Isnull(A.NAME,'') AS 'Franchise Name',
		CASE WHEN (Convert(varchar(12),A.InitialContractDate,101)='01/01/1900' OR A.InitialContractDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialContractDate,101) END as 'Initial Contract Date',
		CASE WHEN (Convert(varchar(12),A.RenewalDate,101)='01/01/1900' OR A.RenewalDate=NULL) THEN NULL ELSE Convert(varchar(12),A.RenewalDate,101) END as 'Renewal Date',
		CASE WHEN (Convert(varchar(12),A.ContractFormDate,101)='01/01/1900' OR A.ContractFormDate=NULL) THEN NULL ELSE Convert(varchar(12),A.ContractFormDate,101) END as 'Contract Form Date',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		where (A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')		
		AND A.SandlerRoleId in (1,6)
		ORDER BY A.NAME					
	Else
		SELECT 	
		Isnull(A.NAME,'') AS 'Franchise Name',
		Convert(varchar(12),A.InitialContractDate,101) as 'Initial Contract Date',
		CASE WHEN (Convert(varchar(12),A.RenewalDate,101)='01/01/1900' OR A.RenewalDate=NULL) THEN NULL ELSE Convert(varchar(12),A.RenewalDate,101) END as 'Renewal Date',
		Convert(varchar(12),A.ContractFormDate,101) as 'Contract Form Date',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated',	
			i.UserName as 'Last Updated By',
			CASE WHEN (Convert(varchar(12),A.CreatedDate,101)='01/01/1900' OR A.CreatedDate=NULL) THEN NULL ELSE Convert(varchar(12),A.CreatedDate,101) END as 'Created Date',J.UserName as 'Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'') as 'Address',IsNull(A.Address2,'') as 'Address Line 2',
			Isnull(A.City,'') City,Isnull(A.State,'') State,Isnull(A.Zip,'') Zip,Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,'') Phone,
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,'') Fax, Isnull(a.FaxNumber,'') as 'Fax Number',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			CASE WHEN (Convert(varchar(12),A.DHSAwardDate,101)='01/01/1900' OR A.DHSAwardDate=NULL) THEN NULL ELSE Convert(varchar(12),A.DHSAwardDate,101) END as 'DHS Award Date',
			CASE WHEN (Convert(varchar(12),A.InitialTrngDate,101)='01/01/1900' OR A.InitialTrngDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialTrngDate,101) END as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Primary Office Email',Isnull(a.WorkAddress,'') as 'Primary Office Address',Isnull(a.WorkCity,'') as 'Primary Office City',
			Isnull(d.Name,'') as 'Primary Office State',Isnull(a.WorkZip,'') as 'Primary Office Zip',Isnull(e.Name,'') as 'Primary Office Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			CASE WHEN (Convert(varchar(12),A.Birthday,101)='01/01/1900' OR A.Birthday=NULL) THEN NULL ELSE Convert(varchar(12),A.Birthday,101) END as 'Birth Day',
			CASE WHEN (Convert(varchar(12),A.Anniversary,101)='01/01/1900' OR A.Anniversary=NULL) THEN NULL ELSE Convert(varchar(12),A.Anniversary,101) END as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From SSI',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind',
			a.Territory as 'Territory',
	a.BusinessFocusArea as 'Business Focus Area',	
	a.ClosestMetroArea as 'Closest Metro Area'
		FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where (A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')		
		AND A.SandlerRoleId in (1,6)
		ORDER BY A.NAME
	
	
	






GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbycountry]    Script Date: 08/10/2013 13:11:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbycountry]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,		
		Isnull(B.Name,'') as Country,						
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		Left Join dbo.TBL_COUNTRY B on A.CountryID=B.ID
		where (A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')
		AND A.SandlerRoleId in (1,6)
		ORDER BY B.Name					
	Else
		SELECT 	
		Isnull(c.Name,'') as Country,			
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated',	
			i.UserName as 'Last Updated By',
			CASE WHEN (Convert(varchar(12),A.CreatedDate,101)='01/01/1900' OR A.CreatedDate=NULL) THEN NULL ELSE Convert(varchar(12),A.CreatedDate,101) END as 'Created Date',J.UserName as 'Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'') as 'Address',IsNull(A.Address2,'') as 'Address Line 2',
			Isnull(A.City,'') City,Isnull(A.State,'') State,Isnull(A.Zip,'') Zip,
			Isnull(A.PhoneNumber,'') Phone,
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,'') Fax, Isnull(a.FaxNumber,'') as 'Fax Number',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',
			CASE WHEN (Convert(varchar(12),A.InitialContractDate,101)='01/01/1900' OR A.InitialContractDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialContractDate,101) END as 'Initial Contact Date',
			CASE WHEN (Convert(varchar(12),A.RenewalDate,101)='01/01/1900' OR A.RenewalDate=NULL) THEN NULL ELSE Convert(varchar(12),A.RenewalDate,101) END as 'Renewal Date',
			CASE WHEN (Convert(varchar(12),A.ContractFormDate,101)='01/01/1900' OR A.ContractFormDate=NULL) THEN NULL ELSE Convert(varchar(12),A.ContractFormDate,101) END as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			CASE WHEN (Convert(varchar(12),A.DHSAwardDate,101)='01/01/1900' OR A.DHSAwardDate=NULL) THEN NULL ELSE Convert(varchar(12),A.DHSAwardDate,101) END as 'DHS Award Date',
			CASE WHEN (Convert(varchar(12),A.InitialTrngDate,101)='01/01/1900' OR A.InitialTrngDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialTrngDate,101) END as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Primary Office Email',Isnull(a.WorkAddress,'') as 'Primary Office Address',Isnull(a.WorkCity,'') as 'Primary Office City',
			Isnull(d.Name,'') as 'Primary Office State',Isnull(a.WorkZip,'') as 'Primary Office Zip',Isnull(e.Name,'') as 'Primary Office Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			CASE WHEN (Convert(varchar(12),A.Birthday,101)='01/01/1900' OR A.Birthday=NULL) THEN NULL ELSE Convert(varchar(12),A.Birthday,101) END as 'Birth Day',
			CASE WHEN (Convert(varchar(12),A.Anniversary,101)='01/01/1900' OR A.Anniversary=NULL) THEN NULL ELSE Convert(varchar(12),A.Anniversary,101) END as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From SSI',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind',
			a.Territory as 'Territory',
	a.BusinessFocusArea as 'Business Focus Area',	
	a.ClosestMetroArea as 'Closest Metro Area'
		FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where (A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')	
		AND A.SandlerRoleId in (1,6)		
		ORDER BY C.Name
	
	
	






GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbyregion]    Script Date: 08/10/2013 13:11:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbyregion]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,		
		c.Name as Region,		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
Isnull(A.NAME,'') AS 'Franchise Name',						
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		join dbo.TBL_REGION C on b.RegionID=c.ID
		where (A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')
		AND A.SandlerRoleId in (1,6)
		ORDER BY c.id				
	Else
		SELECT 	
		h.name as 'Region',					
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated',	
			i.UserName as 'Last Updated By',
			CASE WHEN (Convert(varchar(12),A.CreatedDate,101)='01/01/1900' OR A.CreatedDate=NULL) THEN NULL ELSE Convert(varchar(12),A.CreatedDate,101) END as 'Created Date',J.UserName as 'Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'') as 'Address',IsNull(A.Address2,'') as 'Address Line 2',
			Isnull(A.City,'') City,Isnull(A.State,'') State,Isnull(A.Zip,'') Zip,Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,'') Phone,
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,'') Fax, Isnull(a.FaxNumber,'') as 'Fax Number',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',
			CASE WHEN (Convert(varchar(12),A.InitialContractDate,101)='01/01/1900' OR A.InitialContractDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialContractDate,101) END as 'Initial Contact Date',
			CASE WHEN (Convert(varchar(12),A.RenewalDate,101)='01/01/1900' OR A.RenewalDate=NULL) THEN NULL ELSE Convert(varchar(12),A.RenewalDate,101) END as 'Renewal Date',
			CASE WHEN (Convert(varchar(12),A.ContractFormDate,101)='01/01/1900' OR A.ContractFormDate=NULL) THEN NULL ELSE Convert(varchar(12),A.ContractFormDate,101) END as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			CASE WHEN (Convert(varchar(12),A.DHSAwardDate,101)='01/01/1900' OR A.DHSAwardDate=NULL) THEN NULL ELSE Convert(varchar(12),A.DHSAwardDate,101) END as 'DHS Award Date',
			CASE WHEN (Convert(varchar(12),A.InitialTrngDate,101)='01/01/1900' OR A.InitialTrngDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialTrngDate,101) END as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Primary Office Email',Isnull(a.WorkAddress,'') as 'Primary Office Address',Isnull(a.WorkCity,'') as 'Primary Office City',
			Isnull(d.Name,'') as 'Primary Office State',Isnull(a.WorkZip,'') as 'Primary Office Zip',Isnull(e.Name,'') as 'Primary Office Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			CASE WHEN (Convert(varchar(12),A.Birthday,101)='01/01/1900' OR A.Birthday=NULL) THEN NULL ELSE Convert(varchar(12),A.Birthday,101) END as 'Birth Day',
			CASE WHEN (Convert(varchar(12),A.Anniversary,101)='01/01/1900' OR A.Anniversary=NULL) THEN NULL ELSE Convert(varchar(12),A.Anniversary,101) END as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From SSI',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind',
			a.Territory as 'Territory',
	a.BusinessFocusArea as 'Business Focus Area',	
	a.ClosestMetroArea as 'Closest Metro Area'
		FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where (A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')		
		AND A.SandlerRoleId in (1,6)
		ORDER BY H.ID
	
	
	






GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbystate]    Script Date: 08/10/2013 13:11:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbystate]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,		
		a.State,		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
Isnull(A.NAME,'') AS 'Franchise Name',						
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		Left Join dbo.TBL_COUNTRY B on A.CountryID=B.ID
		where (A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')
		AND A.SandlerRoleId in (1,6)
		ORDER BY a.State			
	Else
		SELECT 	
		a.State,			
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
	Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated',			
			i.UserName as 'Last Updated By',
			CASE WHEN (Convert(varchar(12),A.CreatedDate,101)='01/01/1900' OR A.CreatedDate=NULL) THEN NULL ELSE Convert(varchar(12),A.CreatedDate,101) END as 'Created Date',J.UserName as 'Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'') as 'Address',IsNull(A.Address2,'') as 'Address Line 2',
			Isnull(A.City,'') City,Isnull(A.Zip,'') Zip,Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,'') Phone,
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,'') Fax, Isnull(a.FaxNumber,'') as 'Fax Number',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',
			CASE WHEN (Convert(varchar(12),A.InitialContractDate,101)='01/01/1900' OR A.InitialContractDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialContractDate,101) END as 'Initial Contact Date',
			CASE WHEN (Convert(varchar(12),A.RenewalDate,101)='01/01/1900' OR A.RenewalDate=NULL) THEN NULL ELSE Convert(varchar(12),A.RenewalDate,101) END as 'Renewal Date',
			CASE WHEN (Convert(varchar(12),A.ContractFormDate,101)='01/01/1900' OR A.ContractFormDate=NULL) THEN NULL ELSE Convert(varchar(12),A.ContractFormDate,101) END as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			CASE WHEN (Convert(varchar(12),A.DHSAwardDate,101)='01/01/1900' OR A.DHSAwardDate=NULL) THEN NULL ELSE Convert(varchar(12),A.DHSAwardDate,101) END as 'DHS Award Date',
			CASE WHEN (Convert(varchar(12),A.InitialTrngDate,101)='01/01/1900' OR A.InitialTrngDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialTrngDate,101) END as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Primary Office Email',Isnull(a.WorkAddress,'') as 'Primary Office Address',Isnull(a.WorkCity,'') as 'Primary Office City',
			Isnull(d.Name,'') as 'Primary Office State',Isnull(a.WorkZip,'') as 'Primary Office Zip',Isnull(e.Name,'') as 'Primary Office Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			CASE WHEN (Convert(varchar(12),A.Birthday,101)='01/01/1900' OR A.Birthday=NULL) THEN NULL ELSE Convert(varchar(12),A.Birthday,101) END as 'Birth Day',
			CASE WHEN (Convert(varchar(12),A.Anniversary,101)='01/01/1900' OR A.Anniversary=NULL) THEN NULL ELSE Convert(varchar(12),A.Anniversary,101) END as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From SSI',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind',
			a.Territory as 'Territory',
	a.BusinessFocusArea as 'Business Focus Area',	
	a.ClosestMetroArea as 'Closest Metro Area'
		FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where (A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')		
		AND A.SandlerRoleId in (1,6)
		ORDER BY a.State
	
	
	






GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbytrngdate]    Script Date: 08/10/2013 13:11:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbytrngdate]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,		
		CASE WHEN (Convert(varchar(12),A.InitialTrngDate,101)='01/01/1900' OR A.InitialTrngDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialTrngDate,101) END as 'Initial Training Date',				
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
Isnull(A.NAME,'') AS 'Franchise Name',				
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A
		where (A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')			
		AND A.SandlerRoleId in (1,6)
		ORDER BY A.InitialTrngDate					
	Else
		SELECT 	
		CASE WHEN (Convert(varchar(12),A.InitialTrngDate,101)='01/01/1900' OR A.InitialTrngDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialTrngDate,101) END as 'Initial Training Date',		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
Isnull(A.NAME,'') AS 'Franchise Name',			
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated',			
			i.UserName as 'Last Updated By',
			CASE WHEN (Convert(varchar(12),A.CreatedDate,101)='01/01/1900' OR A.CreatedDate=NULL) THEN NULL ELSE Convert(varchar(12),A.CreatedDate,101) END as 'Created Date',J.UserName as 'Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'') as 'Address',IsNull(A.Address2,'') as 'Address Line 2',
			Isnull(A.City,'') City,Isnull(A.State,'') State,Isnull(A.Zip,'') Zip,Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,'') Phone,
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,'') Fax, Isnull(a.FaxNumber,'') as 'Fax Number',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',
			CASE WHEN (Convert(varchar(12),A.InitialContractDate,101)='01/01/1900' OR A.InitialContractDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialContractDate,101) END as 'Initial Contact Date',
			CASE WHEN (Convert(varchar(12),A.RenewalDate,101)='01/01/1900' OR A.RenewalDate=NULL) THEN NULL ELSE Convert(varchar(12),A.RenewalDate,101) END as 'Renewal Date',
			CASE WHEN (Convert(varchar(12),A.ContractFormDate,101)='01/01/1900' OR A.ContractFormDate=NULL) THEN NULL ELSE Convert(varchar(12),A.ContractFormDate,101) END as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			CASE WHEN (Convert(varchar(12),A.DHSAwardDate,101)='01/01/1900' OR A.DHSAwardDate=NULL) THEN NULL ELSE Convert(varchar(12),A.DHSAwardDate,101) END as 'DHS Award Date',			
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Primary Office Email',Isnull(a.WorkAddress,'') as 'Primary Office Address',Isnull(a.WorkCity,'') as 'Primary Office City',
			Isnull(d.Name,'') as 'Primary Office State',Isnull(a.WorkZip,'') as 'Primary Office Zip',Isnull(e.Name,'') as 'Primary Office Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			CASE WHEN (Convert(varchar(12),A.Birthday,101)='01/01/1900' OR A.Birthday=NULL) THEN NULL ELSE Convert(varchar(12),A.Birthday,101) END as 'Birth Day',
			CASE WHEN (Convert(varchar(12),A.Anniversary,101)='01/01/1900' OR A.Anniversary=NULL) THEN NULL ELSE Convert(varchar(12),A.Anniversary,101) END as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From SSI',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind',
			a.Territory as 'Territory',
	a.BusinessFocusArea as 'Business Focus Area',	
	a.ClosestMetroArea as 'Closest Metro Area'
		FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where (A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')
		AND A.SandlerRoleId in (1,6)		
		ORDER BY A.InitialTrngDate
	
	
	






GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbyusingcrm]    Script Date: 08/10/2013 13:11:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbyusingcrm]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,	
	case when a.IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using CRM',			
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A
		where (A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')						
		AND A.SandlerRoleId in (1,6)
		ORDER BY a.IsUsingSandlerCRM
	Else
		SELECT 			
		case when a.IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using CRM',		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated',			
			i.UserName as 'Last Updated By',
			CASE WHEN (Convert(varchar(12),A.CreatedDate,101)='01/01/1900' OR A.CreatedDate=NULL) THEN NULL ELSE Convert(varchar(12),A.CreatedDate,101) END as 'Created Date',J.UserName as 'Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'') as 'Address',IsNull(A.Address2,'') as 'Address Line 2',
			Isnull(A.City,'') City,Isnull(A.State,'') State,Isnull(A.Zip,'') Zip,Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,'') Phone,
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,'') Fax, Isnull(a.FaxNumber,'') as 'Fax Number',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',
			CASE WHEN (Convert(varchar(12),A.InitialContractDate,101)='01/01/1900' OR A.InitialContractDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialContractDate,101) END as 'Initial Contact Date',
			CASE WHEN (Convert(varchar(12),A.RenewalDate,101)='01/01/1900' OR A.RenewalDate=NULL) THEN NULL ELSE Convert(varchar(12),A.RenewalDate,101) END as 'Renewal Date',
			CASE WHEN (Convert(varchar(12),A.ContractFormDate,101)='01/01/1900' OR A.ContractFormDate=NULL) THEN NULL ELSE Convert(varchar(12),A.ContractFormDate,101) END as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',			
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			CASE WHEN (Convert(varchar(12),A.DHSAwardDate,101)='01/01/1900' OR A.DHSAwardDate=NULL) THEN NULL ELSE Convert(varchar(12),A.DHSAwardDate,101) END as 'DHS Award Date',
			CASE WHEN (Convert(varchar(12),A.InitialTrngDate,101)='01/01/1900' OR A.InitialTrngDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialTrngDate,101) END as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Primary Office Email',Isnull(a.WorkAddress,'') as 'Primary Office Address',Isnull(a.WorkCity,'') as 'Primary Office City',
			Isnull(d.Name,'') as 'Primary Office State',Isnull(a.WorkZip,'') as 'Primary Office Zip',Isnull(e.Name,'') as 'Primary Office Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			CASE WHEN (Convert(varchar(12),A.Birthday,101)='01/01/1900' OR A.Birthday=NULL) THEN NULL ELSE Convert(varchar(12),A.Birthday,101) END as 'Birth Day',
			CASE WHEN (Convert(varchar(12),A.Anniversary,101)='01/01/1900' OR A.Anniversary=NULL) THEN NULL ELSE Convert(varchar(12),A.Anniversary,101) END as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From SSI',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind',
			a.Territory as 'Territory',
	a.BusinessFocusArea as 'Business Focus Area',	
	a.ClosestMetroArea as 'Closest Metro Area'
		FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where (A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')	
		AND A.SandlerRoleId in (1,6)
		ORDER BY a.IsUsingSandlerCRM
	
	
	






GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrmd]    Script Date: 08/10/2013 13:11:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportfrmd]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,			
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		where a.SandlerRoleId=4 and
		(A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')
		ORDER BY A.NAME
	Else
		SELECT 				
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated',		
			i.UserName as 'Last Updated By',
			CASE WHEN (Convert(varchar(12),A.CreatedDate,101)='01/01/1900' OR A.CreatedDate=NULL) THEN NULL ELSE Convert(varchar(12),A.CreatedDate,101) END as 'Created Date',J.UserName as 'Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'') as 'Address',IsNull(A.Address2,'') as 'Address Line 2',
			Isnull(A.City,'') City,Isnull(A.State,'') State,Isnull(A.Zip,'') Zip,Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,'') Phone,
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,'') Fax, Isnull(a.FaxNumber,'') as 'Fax Number',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',
			CASE WHEN (Convert(varchar(12),A.InitialContractDate,101)='01/01/1900' OR A.InitialContractDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialContractDate,101) END as 'Initial Contact Date',
			CASE WHEN (Convert(varchar(12),A.RenewalDate,101)='01/01/1900' OR A.RenewalDate=NULL) THEN NULL ELSE Convert(varchar(12),A.RenewalDate,101) END as 'Renewal Date',
			CASE WHEN (Convert(varchar(12),A.ContractFormDate,101)='01/01/1900' OR A.ContractFormDate=NULL) THEN NULL ELSE Convert(varchar(12),A.ContractFormDate,101) END as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			CASE WHEN (Convert(varchar(12),A.DHSAwardDate,101)='01/01/1900' OR A.DHSAwardDate=NULL) THEN NULL ELSE Convert(varchar(12),A.DHSAwardDate,101) END as 'DHS Award Date',
			CASE WHEN (Convert(varchar(12),A.InitialTrngDate,101)='01/01/1900' OR A.InitialTrngDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialTrngDate,101) END as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Primary Office Email',Isnull(a.WorkAddress,'') as 'Primary Office Address',Isnull(a.WorkCity,'') as 'Primary Office City',
			Isnull(d.Name,'') as 'Primary Office State',Isnull(a.WorkZip,'') as 'Primary Office Zip',Isnull(e.Name,'') as 'Primary Office Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			CASE WHEN (Convert(varchar(12),A.Birthday,101)='01/01/1900' OR A.Birthday=NULL) THEN NULL ELSE Convert(varchar(12),A.Birthday,101) END as 'Birth Day',
			CASE WHEN (Convert(varchar(12),A.Anniversary,101)='01/01/1900' OR A.Anniversary=NULL) THEN NULL ELSE Convert(varchar(12),A.Anniversary,101) END as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From SSI',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind',
			a.Territory as 'Territory',
	a.BusinessFocusArea as 'Business Focus Area',	
	a.ClosestMetroArea as 'Closest Metro Area'
		FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where a.SandlerRoleId=4 and
		(A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')
		ORDER BY A.NAME
	
	
	






GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportglaa]    Script Date: 08/10/2013 13:11:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportglaa]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,	
		case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Agreement?',		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A
		where (A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')					
		ORDER BY a.IsRepAgreement
	Else
		SELECT 		
		case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Agreement?',		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated',		
			i.UserName as 'Last Updated By',
			CASE WHEN (Convert(varchar(12),A.CreatedDate,101)='01/01/1900' OR A.CreatedDate=NULL) THEN NULL ELSE Convert(varchar(12),A.CreatedDate,101) END as 'Created Date',J.UserName as 'Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'') as 'Address',IsNull(A.Address2,'') as 'Address Line 2',
			Isnull(A.City,'') City,Isnull(A.State,'') State,Isnull(A.Zip,'') Zip,Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,'') Phone,
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,'') Fax, Isnull(a.FaxNumber,'') as 'Fax Number',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',
			CASE WHEN (Convert(varchar(12),A.InitialContractDate,101)='01/01/1900' OR A.InitialContractDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialContractDate,101) END as 'Initial Contact Date',
			CASE WHEN (Convert(varchar(12),A.RenewalDate,101)='01/01/1900' OR A.RenewalDate=NULL) THEN NULL ELSE Convert(varchar(12),A.RenewalDate,101) END as 'Renewal Date',
			CASE WHEN (Convert(varchar(12),A.ContractFormDate,101)='01/01/1900' OR A.ContractFormDate=NULL) THEN NULL ELSE Convert(varchar(12),A.ContractFormDate,101) END as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			CASE WHEN (Convert(varchar(12),A.DHSAwardDate,101)='01/01/1900' OR A.DHSAwardDate=NULL) THEN NULL ELSE Convert(varchar(12),A.DHSAwardDate,101) END as 'DHS Award Date',
			CASE WHEN (Convert(varchar(12),A.InitialTrngDate,101)='01/01/1900' OR A.InitialTrngDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialTrngDate,101) END as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',			
			Isnull(a.WorkEmail,'') as 'Primary Office Email',Isnull(a.WorkAddress,'') as 'Primary Office Address',Isnull(a.WorkCity,'') as 'Primary Office City',
			Isnull(d.Name,'') as 'Primary Office State',Isnull(a.WorkZip,'') as 'Primary Office Zip',Isnull(e.Name,'') as 'Primary Office Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			CASE WHEN (Convert(varchar(12),A.Birthday,101)='01/01/1900' OR A.Birthday=NULL) THEN NULL ELSE Convert(varchar(12),A.Birthday,101) END as 'Birth Day',
			CASE WHEN (Convert(varchar(12),A.Anniversary,101)='01/01/1900' OR A.Anniversary=NULL) THEN NULL ELSE Convert(varchar(12),A.Anniversary,101) END as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From SSI',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind',
			a.Territory as 'Territory',
	a.BusinessFocusArea as 'Business Focus Area',	
	a.ClosestMetroArea as 'Closest Metro Area'
		FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where (A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')
		ORDER BY a.IsRepAgreement
	
	
	






GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmfrd]    Script Date: 08/10/2013 13:11:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportmfrd]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,	
	D.MasterFranchiseeName AS 'Master Franchise',			
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
		Case when A.IsCanPrintLocally='1' Then 'Yes' else 'No' end as 'Local Print',			
	Case when A.IsBuyFromCustomer='1' Then 'Yes' else 'No' end as 'Buy From SSI',			
	Case when A.IsFixedPricePurchase='1' Then 'Yes' else 'No' end as 'Fixed Price Purchase',
	b.CostPlusAmountText as 'Product Cost',
	c.BehindAmountText as 'Territory Develop',	
		CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		Left Join dbo.Tbl_CostPlusAmount B on a.CostPlusAmountId=b.CostPlusAmountId
		left join dbo.Tbl_BehindAmount C on a.BehindAmountId = C.BehindAmountId
		Join DBO.Tbl_MasterFranchisee D on D.MasterFranchiseeId=a.MasterFranchiseeId
		where a.SandlerRoleId=1	and
		(A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')
		ORDER BY D.MasterFranchiseeName
	Else
		SELECT 		
		AB.MasterFranchiseeName AS 'Master Franchise',			
		Isnull(A.NAME,'') AS 'Franchise Name',
		Case when A.IsCanPrintLocally='1' Then 'Yes' else 'No' end as 'Local Print',			
	Case when A.IsBuyFromCustomer='1' Then 'Yes' else 'No' end as 'Buy From SSI',			
	Case when A.IsFixedPricePurchase='1' Then 'Yes' else 'No' end as 'Fixed Price Purchase',
	p.CostPlusAmountText as 'Product Cost',
	q.BehindAmountText as 'Territory Develop',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated',				
			i.UserName as 'Last Updated By',
			CASE WHEN (Convert(varchar(12),A.CreatedDate,101)='01/01/1900' OR A.CreatedDate=NULL) THEN NULL ELSE Convert(varchar(12),A.CreatedDate,101) END as 'Created Date',J.UserName as 'Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'') as 'Address',IsNull(A.Address2,'') as 'Address Line 2',
			Isnull(A.City,'') City,Isnull(A.State,'') State,Isnull(A.Zip,'') Zip,Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,'') Phone,
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,'') Fax, Isnull(a.FaxNumber,'') as 'Fax Number',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',
			CASE WHEN (Convert(varchar(12),A.InitialContractDate,101)='01/01/1900' OR A.InitialContractDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialContractDate,101) END as 'Initial Contact Date',
			CASE WHEN (Convert(varchar(12),A.RenewalDate,101)='01/01/1900' OR A.RenewalDate=NULL) THEN NULL ELSE Convert(varchar(12),A.RenewalDate,101) END as 'Renewal Date',
			CASE WHEN (Convert(varchar(12),A.ContractFormDate,101)='01/01/1900' OR A.ContractFormDate=NULL) THEN NULL ELSE Convert(varchar(12),A.ContractFormDate,101) END as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			CASE WHEN (Convert(varchar(12),A.DHSAwardDate,101)='01/01/1900' OR A.DHSAwardDate=NULL) THEN NULL ELSE Convert(varchar(12),A.DHSAwardDate,101) END as 'DHS Award Date',
			CASE WHEN (Convert(varchar(12),A.InitialTrngDate,101)='01/01/1900' OR A.InitialTrngDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialTrngDate,101) END as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Primary Office Email',Isnull(a.WorkAddress,'') as 'Primary Office Address',Isnull(a.WorkCity,'') as 'Primary Office City',
			Isnull(d.Name,'') as 'Primary Office State',Isnull(a.WorkZip,'') as 'Primary Office Zip',Isnull(e.Name,'') as 'Primary Office Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			CASE WHEN (Convert(varchar(12),A.Birthday,101)='01/01/1900' OR A.Birthday=NULL) THEN NULL ELSE Convert(varchar(12),A.Birthday,101) END as 'Birth Day',
			CASE WHEN (Convert(varchar(12),A.Anniversary,101)='01/01/1900' OR A.Anniversary=NULL) THEN NULL ELSE Convert(varchar(12),A.Anniversary,101) END as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',	
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',			
			a.Territory as 'Territory',
	a.BusinessFocusArea as 'Business Focus Area',	
	a.ClosestMetroArea as 'Closest Metro Area'
		FROM DBO.TBL_FRANCHISEE A
		Join DBO.Tbl_MasterFranchisee AB on Ab.MasterFranchiseeId=a.MasterFranchiseeId
		and a.SandlerRoleId=1
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where (A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')
		ORDER BY AB.MasterFranchiseeName
	
	
	






GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmsfc]    Script Date: 08/10/2013 13:11:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportmsfc]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,	
	case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Must Submit',	
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		where (A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')
		AND A.SandlerRoleId in (1,6)
		ORDER BY a.IsReqToSubmitFinancial
	Else
		SELECT 		
		case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Must Submit',			
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated',				
			i.UserName as 'Last Updated By',
			CASE WHEN (Convert(varchar(12),A.CreatedDate,101)='01/01/1900' OR A.CreatedDate=NULL) THEN NULL ELSE Convert(varchar(12),A.CreatedDate,101) END as 'Created Date',J.UserName as 'Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'') as 'Address',IsNull(A.Address2,'') as 'Address Line 2',
			Isnull(A.City,'') City,Isnull(A.State,'') State,Isnull(A.Zip,'') Zip,Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,'') Phone,
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,'') Fax, Isnull(a.FaxNumber,'') as 'Fax Number',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',
			CASE WHEN (Convert(varchar(12),A.InitialContractDate,101)='01/01/1900' OR A.InitialContractDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialContractDate,101) END as 'Initial Contact Date',
			CASE WHEN (Convert(varchar(12),A.RenewalDate,101)='01/01/1900' OR A.RenewalDate=NULL) THEN NULL ELSE Convert(varchar(12),A.RenewalDate,101) END as 'Renewal Date',
			CASE WHEN (Convert(varchar(12),A.ContractFormDate,101)='01/01/1900' OR A.ContractFormDate=NULL) THEN NULL ELSE Convert(varchar(12),A.ContractFormDate,101) END as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			CASE WHEN (Convert(varchar(12),A.DHSAwardDate,101)='01/01/1900' OR A.DHSAwardDate=NULL) THEN NULL ELSE Convert(varchar(12),A.DHSAwardDate,101) END as 'DHS Award Date',
			CASE WHEN (Convert(varchar(12),A.InitialTrngDate,101)='01/01/1900' OR A.InitialTrngDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialTrngDate,101) END as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Primary Office Email',Isnull(a.WorkAddress,'') as 'Primary Office Address',Isnull(a.WorkCity,'') as 'Primary Office City',
			Isnull(d.Name,'') as 'Primary Office State',Isnull(a.WorkZip,'') as 'Primary Office Zip',Isnull(e.Name,'') as 'Primary Office Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			CASE WHEN (Convert(varchar(12),A.Birthday,101)='01/01/1900' OR A.Birthday=NULL) THEN NULL ELSE Convert(varchar(12),A.Birthday,101) END as 'Birth Day',
			CASE WHEN (Convert(varchar(12),A.Anniversary,101)='01/01/1900' OR A.Anniversary=NULL) THEN NULL ELSE Convert(varchar(12),A.Anniversary,101) END as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From SSI',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind',
			a.Territory as 'Territory',
	a.BusinessFocusArea as 'Business Focus Area',	
	a.ClosestMetroArea as 'Closest Metro Area'
		FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where (A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')
		AND A.SandlerRoleId in (1,6)
		ORDER BY a.IsReqToSubmitFinancial
	
	
	






GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmsfr]    Script Date: 08/10/2013 13:11:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportmsfr]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,	
	B.MasterFranchiseeName AS 'Master Franchise',			
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		Join DBO.Tbl_MasterFranchisee B on b.MasterFranchiseeId=a.MasterFranchiseeId
		and a.SandlerRoleId<>1 and a.IsMasterFranchiseeExists =1
		where (A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')		
		ORDER BY B.MasterFranchiseeName
	Else
		SELECT 		
		AB.MasterFranchiseeName AS 'Master Franchise',			
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated',			
			i.UserName as 'Last Updated By',
			CASE WHEN (Convert(varchar(12),A.CreatedDate,101)='01/01/1900' OR A.CreatedDate=NULL) THEN NULL ELSE Convert(varchar(12),A.CreatedDate,101) END as 'Created Date',J.UserName as 'Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'') as 'Address',IsNull(A.Address2,'') as 'Address Line 2',
			Isnull(A.City,'') City,Isnull(A.State,'') State,Isnull(A.Zip,'') Zip,Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,'') Phone,
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,'') Fax, Isnull(a.FaxNumber,'') as 'Fax Number',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',
			CASE WHEN (Convert(varchar(12),A.InitialContractDate,101)='01/01/1900' OR A.InitialContractDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialContractDate,101) END as 'Initial Contact Date',
			CASE WHEN (Convert(varchar(12),A.RenewalDate,101)='01/01/1900' OR A.RenewalDate=NULL) THEN NULL ELSE Convert(varchar(12),A.RenewalDate,101) END as 'Renewal Date',
			CASE WHEN (Convert(varchar(12),A.ContractFormDate,101)='01/01/1900' OR A.ContractFormDate=NULL) THEN NULL ELSE Convert(varchar(12),A.ContractFormDate,101) END as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			CASE WHEN (Convert(varchar(12),A.DHSAwardDate,101)='01/01/1900' OR A.DHSAwardDate=NULL) THEN NULL ELSE Convert(varchar(12),A.DHSAwardDate,101) END as 'DHS Award Date',
			CASE WHEN (Convert(varchar(12),A.InitialTrngDate,101)='01/01/1900' OR A.InitialTrngDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialTrngDate,101) END as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Primary Office Email',Isnull(a.WorkAddress,'') as 'Primary Office Address',Isnull(a.WorkCity,'') as 'Primary Office City',
			Isnull(d.Name,'') as 'Primary Office State',Isnull(a.WorkZip,'') as 'Primary Office Zip',Isnull(e.Name,'') as 'Primary Office Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			CASE WHEN (Convert(varchar(12),A.Birthday,101)='01/01/1900' OR A.Birthday=NULL) THEN NULL ELSE Convert(varchar(12),A.Birthday,101) END as 'Birth Day',
			CASE WHEN (Convert(varchar(12),A.Anniversary,101)='01/01/1900' OR A.Anniversary=NULL) THEN NULL ELSE Convert(varchar(12),A.Anniversary,101) END as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From SSI',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind',
			a.Territory as 'Territory',
	a.BusinessFocusArea as 'Business Focus Area',	
	a.ClosestMetroArea as 'Closest Metro Area'
		FROM DBO.TBL_FRANCHISEE A
		Join DBO.Tbl_MasterFranchisee AB on Ab.MasterFranchiseeId=a.MasterFranchiseeId
		and a.SandlerRoleId<>1 and a.IsMasterFranchiseeExists =1	
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where (A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')
		ORDER BY AB.MasterFranchiseeName
	
	
	






GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmsrbyadvboard]    Script Date: 08/10/2013 13:11:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportmsrbyadvboard]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,				
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A						
		where a.IsAdvBoard =1 and
		(A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')
		ORDER BY A.NAME
	Else
		SELECT 						
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated',				
			i.UserName as 'Last Updated By',
			CASE WHEN (Convert(varchar(12),A.CreatedDate,101)='01/01/1900' OR A.CreatedDate=NULL) THEN NULL ELSE Convert(varchar(12),A.CreatedDate,101) END as 'Created Date',J.UserName as 'Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'') as 'Address',IsNull(A.Address2,'') as 'Address Line 2',
			Isnull(A.City,'') City,Isnull(A.State,'') State,Isnull(A.Zip,'') Zip,Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,'') Phone,
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,'') Fax, Isnull(a.FaxNumber,'') as 'Fax Number',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',
			CASE WHEN (Convert(varchar(12),A.InitialContractDate,101)='01/01/1900' OR A.InitialContractDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialContractDate,101) END as 'Initial Contact Date',
			CASE WHEN (Convert(varchar(12),A.RenewalDate,101)='01/01/1900' OR A.RenewalDate=NULL) THEN NULL ELSE Convert(varchar(12),A.RenewalDate,101) END as 'Renewal Date',
			CASE WHEN (Convert(varchar(12),A.ContractFormDate,101)='01/01/1900' OR A.ContractFormDate=NULL) THEN NULL ELSE Convert(varchar(12),A.ContractFormDate,101) END as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			CASE WHEN (Convert(varchar(12),A.DHSAwardDate,101)='01/01/1900' OR A.DHSAwardDate=NULL) THEN NULL ELSE Convert(varchar(12),A.DHSAwardDate,101) END as 'DHS Award Date',
			CASE WHEN (Convert(varchar(12),A.InitialTrngDate,101)='01/01/1900' OR A.InitialTrngDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialTrngDate,101) END as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Primary Office Email',Isnull(a.WorkAddress,'') as 'Primary Office Address',Isnull(a.WorkCity,'') as 'Primary Office City',
			Isnull(d.Name,'') as 'Primary Office State',Isnull(a.WorkZip,'') as 'Primary Office Zip',Isnull(e.Name,'') as 'Primary Office Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			CASE WHEN (Convert(varchar(12),A.Birthday,101)='01/01/1900' OR A.Birthday=NULL) THEN NULL ELSE Convert(varchar(12),A.Birthday,101) END as 'Birth Day',
			CASE WHEN (Convert(varchar(12),A.Anniversary,101)='01/01/1900' OR A.Anniversary=NULL) THEN NULL ELSE Convert(varchar(12),A.Anniversary,101) END as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From SSI',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind',
			a.Territory as 'Territory',
	a.BusinessFocusArea as 'Business Focus Area',	
	a.ClosestMetroArea as 'Closest Metro Area'
		FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where a.IsAdvBoard =1 and (A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')
		ORDER BY A.NAME
	
	
	






GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmsrbykeyopnldr]    Script Date: 08/10/2013 13:11:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportmsrbykeyopnldr]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,				
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A						
		where a.IsKOLMember=1 and 
		(A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')
		ORDER BY A.NAME
	Else
		SELECT 						
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated',					
			i.UserName as 'Last Updated By',
			CASE WHEN (Convert(varchar(12),A.CreatedDate,101)='01/01/1900' OR A.CreatedDate=NULL) THEN NULL ELSE Convert(varchar(12),A.CreatedDate,101) END as 'Created Date',J.UserName as 'Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'') as 'Address',IsNull(A.Address2,'') as 'Address Line 2',
			Isnull(A.City,'') City,Isnull(A.State,'') State,Isnull(A.Zip,'') Zip,Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,'') Phone,
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,'') Fax, Isnull(a.FaxNumber,'') as 'Fax Number',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',
			CASE WHEN (Convert(varchar(12),A.InitialContractDate,101)='01/01/1900' OR A.InitialContractDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialContractDate,101) END as 'Initial Contact Date',
			CASE WHEN (Convert(varchar(12),A.RenewalDate,101)='01/01/1900' OR A.RenewalDate=NULL) THEN NULL ELSE Convert(varchar(12),A.RenewalDate,101) END as 'Renewal Date',
			CASE WHEN (Convert(varchar(12),A.ContractFormDate,101)='01/01/1900' OR A.ContractFormDate=NULL) THEN NULL ELSE Convert(varchar(12),A.ContractFormDate,101) END as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			CASE WHEN (Convert(varchar(12),A.DHSAwardDate,101)='01/01/1900' OR A.DHSAwardDate=NULL) THEN NULL ELSE Convert(varchar(12),A.DHSAwardDate,101) END as 'DHS Award Date',
			CASE WHEN (Convert(varchar(12),A.InitialTrngDate,101)='01/01/1900' OR A.InitialTrngDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialTrngDate,101) END as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Primary Office Email',Isnull(a.WorkAddress,'') as 'Primary Office Address',Isnull(a.WorkCity,'') as 'Primary Office City',
			Isnull(d.Name,'') as 'Primary Office State',Isnull(a.WorkZip,'') as 'Primary Office Zip',Isnull(e.Name,'') as 'Primary Office Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			CASE WHEN (Convert(varchar(12),A.Birthday,101)='01/01/1900' OR A.Birthday=NULL) THEN NULL ELSE Convert(varchar(12),A.Birthday,101) END as 'Birth Day',
			CASE WHEN (Convert(varchar(12),A.Anniversary,101)='01/01/1900' OR A.Anniversary=NULL) THEN NULL ELSE Convert(varchar(12),A.Anniversary,101) END as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From SSI',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind',
			a.Territory as 'Territory',
	a.BusinessFocusArea as 'Business Focus Area',	
	a.ClosestMetroArea as 'Closest Metro Area'
		FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where a.IsKOLMember=1 and
		(A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')
		ORDER BY A.NAME
	
	
	






GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmsrbymktgcom]    Script Date: 08/10/2013 13:11:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportmsrbymktgcom]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A						
		where a.IsMktgCommittee =1 and
		(A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')
		ORDER BY A.NAME
	Else
		SELECT 						
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated',			
			i.UserName as 'Last Updated By',
			CASE WHEN (Convert(varchar(12),A.CreatedDate,101)='01/01/1900' OR A.CreatedDate=NULL) THEN NULL ELSE Convert(varchar(12),A.CreatedDate,101) END as 'Created Date',J.UserName as 'Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'') as 'Address',IsNull(A.Address2,'') as 'Address Line 2',
			Isnull(A.City,'') City,Isnull(A.State,'') State,Isnull(A.Zip,'') Zip,Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,'') Phone,
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,'') Fax, Isnull(a.FaxNumber,'') as 'Fax Number',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',
			CASE WHEN (Convert(varchar(12),A.InitialContractDate,101)='01/01/1900' OR A.InitialContractDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialContractDate,101) END as 'Initial Contact Date',
			CASE WHEN (Convert(varchar(12),A.RenewalDate,101)='01/01/1900' OR A.RenewalDate=NULL) THEN NULL ELSE Convert(varchar(12),A.RenewalDate,101) END as 'Renewal Date',
			CASE WHEN (Convert(varchar(12),A.ContractFormDate,101)='01/01/1900' OR A.ContractFormDate=NULL) THEN NULL ELSE Convert(varchar(12),A.ContractFormDate,101) END as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			CASE WHEN (Convert(varchar(12),A.DHSAwardDate,101)='01/01/1900' OR A.DHSAwardDate=NULL) THEN NULL ELSE Convert(varchar(12),A.DHSAwardDate,101) END as 'DHS Award Date',
			CASE WHEN (Convert(varchar(12),A.InitialTrngDate,101)='01/01/1900' OR A.InitialTrngDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialTrngDate,101) END as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Primary Office Email',Isnull(a.WorkAddress,'') as 'Primary Office Address',Isnull(a.WorkCity,'') as 'Primary Office City',
			Isnull(d.Name,'') as 'Primary Office State',Isnull(a.WorkZip,'') as 'Primary Office Zip',Isnull(e.Name,'') as 'Primary Office Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			CASE WHEN (Convert(varchar(12),A.Birthday,101)='01/01/1900' OR A.Birthday=NULL) THEN NULL ELSE Convert(varchar(12),A.Birthday,101) END as 'Birth Day',
			CASE WHEN (Convert(varchar(12),A.Anniversary,101)='01/01/1900' OR A.Anniversary=NULL) THEN NULL ELSE Convert(varchar(12),A.Anniversary,101) END as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From SSI',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind',
			a.Territory as 'Territory',
	a.BusinessFocusArea as 'Business Focus Area',	
	a.ClosestMetroArea as 'Closest Metro Area'
		FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where a.IsMktgCommittee =1 and
		(A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')
		ORDER BY A.NAME
	
	
	






GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportprpl]    Script Date: 08/10/2013 13:11:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportprpl]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,	
	b.PurchaseLevelText as 'Product Level',			
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		left join dbo.Tbl_PurchaseLevel B on a.PurchaseLevelId = B.PurchaseLevelId
		where (A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')
		AND A.SandlerRoleId in (1,6)
		ORDER BY b.PurchaseLevelText
	Else
		SELECT 		
		M.PurchaseLevelText as 'Product Level',		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
	Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated',			
			i.UserName as 'Last Updated By',
			CASE WHEN (Convert(varchar(12),A.CreatedDate,101)='01/01/1900' OR A.CreatedDate=NULL) THEN NULL ELSE Convert(varchar(12),A.CreatedDate,101) END as 'Created Date',J.UserName as 'Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'') as 'Address',IsNull(A.Address2,'') as 'Address Line 2',
			Isnull(A.City,'') City,Isnull(A.State,'') State,Isnull(A.Zip,'') Zip,Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,'') Phone,
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,'') Fax, Isnull(a.FaxNumber,'') as 'Fax Number',
			Isnull(l.AwardLevelText,'') as 'Award Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',
			CASE WHEN (Convert(varchar(12),A.InitialContractDate,101)='01/01/1900' OR A.InitialContractDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialContractDate,101) END as 'Initial Contact Date',
			CASE WHEN (Convert(varchar(12),A.RenewalDate,101)='01/01/1900' OR A.RenewalDate=NULL) THEN NULL ELSE Convert(varchar(12),A.RenewalDate,101) END as 'Renewal Date',
			CASE WHEN (Convert(varchar(12),A.ContractFormDate,101)='01/01/1900' OR A.ContractFormDate=NULL) THEN NULL ELSE Convert(varchar(12),A.ContractFormDate,101) END as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			CASE WHEN (Convert(varchar(12),A.DHSAwardDate,101)='01/01/1900' OR A.DHSAwardDate=NULL) THEN NULL ELSE Convert(varchar(12),A.DHSAwardDate,101) END as 'DHS Award Date',
			CASE WHEN (Convert(varchar(12),A.InitialTrngDate,101)='01/01/1900' OR A.InitialTrngDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialTrngDate,101) END as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Primary Office Email',Isnull(a.WorkAddress,'') as 'Primary Office Address',Isnull(a.WorkCity,'') as 'Primary Office City',
			Isnull(d.Name,'') as 'Primary Office State',Isnull(a.WorkZip,'') as 'Primary Office Zip',Isnull(e.Name,'') as 'Primary Office Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			CASE WHEN (Convert(varchar(12),A.Birthday,101)='01/01/1900' OR A.Birthday=NULL) THEN NULL ELSE Convert(varchar(12),A.Birthday,101) END as 'Birth Day',
			CASE WHEN (Convert(varchar(12),A.Anniversary,101)='01/01/1900' OR A.Anniversary=NULL) THEN NULL ELSE Convert(varchar(12),A.Anniversary,101) END as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From SSI',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind',
			a.Territory as 'Territory',
	a.BusinessFocusArea as 'Business Focus Area',	
	a.ClosestMetroArea as 'Closest Metro Area'
		FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where (A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')
		AND A.SandlerRoleId in (1,6)
		ORDER BY M.PurchaseLevelText
	
	
	






GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportsere]    Script Date: 08/10/2013 13:11:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportsere]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,	
	case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'EMail Required',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A 
		where (A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')						
		AND A.SandlerRoleId in (1,6)
		ORDER BY A.IsSandlerMailRequired
	Else
		SELECT 		
		case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'EMail Required',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated',			
			i.UserName as 'Last Updated By',
			CASE WHEN (Convert(varchar(12),A.CreatedDate,101)='01/01/1900' OR A.CreatedDate=NULL) THEN NULL ELSE Convert(varchar(12),A.CreatedDate,101) END as 'Created Date',J.UserName as 'Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'') as 'Address',IsNull(A.Address2,'') as 'Address Line 2',
			Isnull(A.City,'') City,Isnull(A.State,'') State,Isnull(A.Zip,'') Zip,Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,'') Phone,
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,'') Fax, Isnull(a.FaxNumber,'') as 'Fax Number',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',
			CASE WHEN (Convert(varchar(12),A.InitialContractDate,101)='01/01/1900' OR A.InitialContractDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialContractDate,101) END as 'Initial Contact Date',
			CASE WHEN (Convert(varchar(12),A.RenewalDate,101)='01/01/1900' OR A.RenewalDate=NULL) THEN NULL ELSE Convert(varchar(12),A.RenewalDate,101) END as 'Renewal Date',
			CASE WHEN (Convert(varchar(12),A.ContractFormDate,101)='01/01/1900' OR A.ContractFormDate=NULL) THEN NULL ELSE Convert(varchar(12),A.ContractFormDate,101) END as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			CASE WHEN (Convert(varchar(12),A.DHSAwardDate,101)='01/01/1900' OR A.DHSAwardDate=NULL) THEN NULL ELSE Convert(varchar(12),A.DHSAwardDate,101) END as 'DHS Award Date',
			CASE WHEN (Convert(varchar(12),A.InitialTrngDate,101)='01/01/1900' OR A.InitialTrngDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialTrngDate,101) END as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Primary Office Email',Isnull(a.WorkAddress,'') as 'Primary Office Address',Isnull(a.WorkCity,'') as 'Primary Office City',
			Isnull(d.Name,'') as 'Primary Office State',Isnull(a.WorkZip,'') as 'Primary Office Zip',Isnull(e.Name,'') as 'Primary Office Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			CASE WHEN (Convert(varchar(12),A.Birthday,101)='01/01/1900' OR A.Birthday=NULL) THEN NULL ELSE Convert(varchar(12),A.Birthday,101) END as 'Birth Day',
			CASE WHEN (Convert(varchar(12),A.Anniversary,101)='01/01/1900' OR A.Anniversary=NULL) THEN NULL ELSE Convert(varchar(12),A.Anniversary,101) END as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From SSI',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind',
			a.Territory as 'Territory',
	a.BusinessFocusArea as 'Business Focus Area',	
	a.ClosestMetroArea as 'Closest Metro Area'
		FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where (A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')
		AND A.SandlerRoleId in (1,6)
		ORDER BY A.IsSandlerMailRequired
	
	
	






GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportzcbt]    Script Date: 08/10/2013 13:11:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportzcbt]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,	
	a.Territory as 'Territory',a.State,
	a.BusinessFocusArea as 'Business Focus Area',	
	a.ClosestMetroArea as 'Closest Metro Area',
		a.Zip as 'Zip Code',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated'			
		FROM DBO.TBL_FRANCHISEE A
		where (A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')	
		AND A.SandlerRoleId in (1,6)
		ORDER BY a.Territory
	Else
		SELECT 		
		a.Territory as 'Territory',a.State,
	a.BusinessFocusArea as 'Business Focus Area',	
	a.ClosestMetroArea as 'Closest Metro Area',
		a.Zip as 'Zip Code',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
		Isnull(A.NAME,'') AS 'Franchise Name',
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)='01/01/1900' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as 'Last Updated',			
			i.UserName as 'Last Updated By',
			CASE WHEN (Convert(varchar(12),A.CreatedDate,101)='01/01/1900' OR A.CreatedDate=NULL) THEN NULL ELSE Convert(varchar(12),A.CreatedDate,101) END as 'Created Date',
			J.UserName as 'Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(A.EMAILADDRESS,'') as Email,Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'') as 'Address',IsNull(A.Address2,'') as 'Address Line 2',
			Isnull(A.City,'') City,Isnull(A.State,'') State,Isnull(A.Zip,'') Zip,Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,'') Phone,Isnull(a.OfficePhone,'') as 'Primary Office Phone',
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,'') Fax, Isnull(a.FaxNumber,'') as 'Fax Number',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',
			CASE WHEN (Convert(varchar(12),A.InitialContractDate,101)='01/01/1900' OR A.InitialContractDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialContractDate,101) END as 'Initial Contact Date',
			CASE WHEN (Convert(varchar(12),A.RenewalDate,101)='01/01/1900' OR A.RenewalDate=NULL) THEN NULL ELSE Convert(varchar(12),A.RenewalDate,101) END as 'Renewal Date',
			CASE WHEN (Convert(varchar(12),A.ContractFormDate,101)='01/01/1900' OR A.ContractFormDate=NULL) THEN NULL ELSE Convert(varchar(12),A.ContractFormDate,101) END as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			CASE WHEN (Convert(varchar(12),A.DHSAwardDate,101)='01/01/1900' OR A.DHSAwardDate=NULL) THEN NULL ELSE Convert(varchar(12),A.DHSAwardDate,101) END as 'DHS Award Date',
			CASE WHEN (Convert(varchar(12),A.InitialTrngDate,101)='01/01/1900' OR A.InitialTrngDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialTrngDate,101) END as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Primary Office Email',Isnull(a.WorkAddress,'') as 'Primary Office Address',Isnull(a.WorkCity,'') as 'Primary Office City',
			Isnull(d.Name,'') as 'Primary Office State',Isnull(a.WorkZip,'') as 'Primary Office Zip',Isnull(e.Name,'') as 'Primary Office Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			CASE WHEN (Convert(varchar(12),A.Birthday,101)='01/01/1900' OR A.Birthday=NULL) THEN NULL ELSE Convert(varchar(12),A.Birthday,101) END as 'Birth Day',
			CASE WHEN (Convert(varchar(12),A.Anniversary,101)='01/01/1900' OR A.Anniversary=NULL) THEN NULL ELSE Convert(varchar(12),A.Anniversary,101) END as 'Anniversary',
			a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From SSI',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind',
			a.Territory as 'Territory',
	a.BusinessFocusArea as 'Business Focus Area',	
	a.ClosestMetroArea as 'Closest Metro Area'
		FROM DBO.TBL_FRANCHISEE A		
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where (A.WorkEmail is null or Upper(A.WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')
		AND A.SandlerRoleId in (1,6)
		ORDER BY a.Territory
	
	
	






GO


