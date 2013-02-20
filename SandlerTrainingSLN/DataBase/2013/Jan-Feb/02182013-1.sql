/****** Object:  StoredProcedure [dbo].[sp_UpdateFranchiseeDetails]    Script Date: 02/17/2013 16:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [dbo].[sp_UpdateFranchiseeDetails]
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
        @FrId int,
        @FranchiseName varchar(500)
		
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
	Name = @FranchiseName,
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







