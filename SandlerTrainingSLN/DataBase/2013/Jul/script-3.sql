/****** Object:  StoredProcedure [dbo].[sp_ArchiveFranchiseeRecord]    Script Date: 07/16/2013 14:14:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ArchiveFranchiseeRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_ArchiveFranchiseeRecord]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllArchivedFranchisee]    Script Date: 07/16/2013 14:14:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllArchivedFranchisee]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllArchivedFranchisee]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllFranchisee]    Script Date: 07/16/2013 14:14:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllFranchisee]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllFranchisee]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllFranchiseesSearch]    Script Date: 07/16/2013 14:14:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllFranchiseesSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllFranchiseesSearch]
GO

/****** Object:  StoredProcedure [dbo].[sp_UnArchiveFranchiseeRecord]    Script Date: 07/16/2013 14:14:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UnArchiveFranchiseeRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UnArchiveFranchiseeRecord]
GO

/****** Object:  StoredProcedure [dbo].[sp_ArchiveFranchiseeRecord]    Script Date: 07/16/2013 14:14:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_ArchiveFranchiseeRecord]
	(	
		
		@FranchiseeID int,
		@CurrentUserId varchar(150)
		
	 )
AS
	-- We need to Archive Pipeline,Contacts and Company records
	
	Update TBL_FRANCHISEE Set IsActive = 0, LastUpdatedBy = @CurrentUserId, LastCreatedDate = GETDATE() where ID = @FranchiseeID
	/* SET NOCOUNT ON */
	RETURN







GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllArchivedFranchisee]    Script Date: 07/16/2013 14:14:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[sp_GetAllArchivedFranchisee]

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
			left outer join Tbl_PrimaryBusiness prmbus on prmbus.PrimaryBusinessId = fr.PrimaryBusinessId
			left outer join Tbl_SandlerRole sndr on sndr.SandlerRoleId = fr.SandlerRoleId
			left outer join Tbl_BehindAmount bhamt on bhamt.BehindAmountId = fr.BehindAmountId
			left outer join tbl_CostPlusAmount cpamt on cpamt.CostPlusAmountId = fr.CostPlusAmountId
			inner join TBL_COACH ch on ch.Id = fr.CoachID
			inner join TBL_REGION rg on rg.Id = ch.regionId
			where (WorkEmail is null or Upper(WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')
			and fr.IsActive = 0
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
			and fr.IsActive = 0
			Order By fr.LastName
      End



RETURN





GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllFranchisee]    Script Date: 07/16/2013 14:14:42 ******/
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
			left outer join Tbl_PrimaryBusiness prmbus on prmbus.PrimaryBusinessId = fr.PrimaryBusinessId
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

/****** Object:  StoredProcedure [dbo].[sp_GetAllFranchiseesSearch]    Script Date: 07/16/2013 14:14:42 ******/
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
left outer join Tbl_PrimaryBusiness prmbus on prmbus.PrimaryBusinessId = fr.PrimaryBusinessId
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

/****** Object:  StoredProcedure [dbo].[sp_UnArchiveFranchiseeRecord]    Script Date: 07/16/2013 14:14:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_UnArchiveFranchiseeRecord]
	(	
		
		@FranchiseeID int,
		@CurrentUserId varchar(150)
		
	 )
AS
	-- We need to Archive Pipeline,Contacts and Company records
	
	Update TBL_FRANCHISEE Set IsActive = 1, LastUpdatedBy = @CurrentUserId, LastCreatedDate = GETDATE() where ID = @FranchiseeID
	/* SET NOCOUNT ON */
	RETURN







GO


