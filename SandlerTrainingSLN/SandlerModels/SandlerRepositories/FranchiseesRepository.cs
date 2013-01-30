using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using SandlerModels;
using SandlerModels.DataIntegration;

namespace SandlerRepositories
{
    public partial class FranchiseesRepository
    {
        DBFactory db = new DBFactory();

        public DataSet sp_GetAllFranchisees()
        {
            return (db.ExecuteDataset("sp_GetAllFranchisee", "Franchisees"));
        }

        public DataSet GetByFranchiseeId(int FrId)
        {
            return db.ExecuteDataset("sp_GetFranchiseeDetails", "FranchiseeByID", new SqlParameter("@FrId", FrId));
        }
        public DataSet GetStateOptions()
        {
            return (db.ExecuteDataset("sp_GetStateOptions", "States"));
        }
        public DataSet GetCountryOptions()
        {
            return (db.ExecuteDataset("sp_GetCountryOptions", "Country"));
        }
        public DataSet GetPurchaseLevelOptions()
        {
            return (db.ExecuteDataset("sp_GetPurchaseLevelOptions", "PurchaseLevel"));
        }
        public DataSet GetAwardLevelOptions()
        {
            return (db.ExecuteDataset("sp_GetAwardLevelOptions", "AwardLevel"));
        }
        public DataSet GetBehindAmountOptions()
        {
            return (db.ExecuteDataset("sp_GetBehindAmountOptions", "BehindAmt"));
        }
        public DataSet GetCostPlusAmountOptions()
        {
            return (db.ExecuteDataset("sp_GetCostPlusAmountOptions", "CostPlusAmt"));
        }
        public DataSet GetPrimaryBusinessOptions()
        {
            return (db.ExecuteDataset("sp_GetPrimaryBusinessOptions", "PrimaryBusiness"));
        }
        public DataSet GetSandlerRoleOptions()
        {
            return (db.ExecuteDataset("sp_GetSandlerRoleOptions", "SandlerRoles"));
        }
        public DataSet GetCertifiedLevelOptions()
        {
            return (db.ExecuteDataset("sp_GetCertifiedLevelOptions", "CertifiedLevel"));
        }
        public DataSet GetCoachOptions()
        {
            return (db.ExecuteDataset("sp_GetCoachOptions", "Coach"));
        }
        public DataSet GetMasterFranchiseehOptions()
        {
            return (db.ExecuteDataset("sp_GetMasterFranchiseeOptions", "MasterFranchisee"));
        }
        
        public DateTime IsValidDateCheck(DateTime inputDate)
        {
            if (inputDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                return default(System.DateTime).AddYears(1754);
            }
            return inputDate;
        }

        public DataSet GetFranchiseesForSearch()
        {
            //Get the User Info
            SandlerModels.DataIntegration.Franchisees _frs = (SandlerModels.DataIntegration.Franchisees)HttpContext.Current.Session["FranchiseeSearchCriteria"];

            if (_frs.InitialContractDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                _frs.InitialContractDate = default(System.DateTime).AddYears(1754);
            }
            if (_frs.RenewalDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                _frs.RenewalDate = default(System.DateTime).AddYears(1754);
            }
            if (_frs.InitialTrngDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                _frs.InitialTrngDate = default(System.DateTime).AddYears(1754);
            }
            if (_frs.DHSAwardDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                _frs.DHSAwardDate = default(System.DateTime).AddYears(1754);
            }
            if (_frs.ContractFormDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                _frs.ContractFormDate = default(System.DateTime).AddYears(1754);
            }
            if (_frs.BirthDay.ToString() == "1/1/0001 12:00:00 AM")
            {
                _frs.BirthDay = default(System.DateTime).AddYears(1754);
            }
            if (_frs.Anniversary.ToString() == "1/1/0001 12:00:00 AM")
            {
                _frs.Anniversary = default(System.DateTime).AddYears(1754);
            }
            //Perform the Search
            return db.ExecuteDataset("sp_GetAllFranchiseesSearch", "FrSearch",
                new SqlParameter("@Name", _frs.Name),
                new SqlParameter("@LastName", _frs.LastName),
                new SqlParameter("@FirstName", _frs.FirstName),
                new SqlParameter("@Title", _frs.Title),
                new SqlParameter("@OfficePhone", _frs.OfficePhone),
                new SqlParameter("@MobilePhone", _frs.MobilePhone),
                new SqlParameter("@Fax", _frs.Fax),
                new SqlParameter("@WorkEmail", _frs.WorkEmail),
                new SqlParameter("@WorkAddress", _frs.WorkAddress),
                new SqlParameter("@WorkCity", _frs.WorkCity),
                new SqlParameter("@WorkZip", _frs.WorkZip),
                new SqlParameter("@SpouseName", _frs.SpouseName),
                new SqlParameter("@YearsWithCompany", _frs.YearsWithCompany),
                new SqlParameter("@HomePhone", _frs.HomePhone),
                new SqlParameter("@AlternateEmail", _frs.AlternateEmail),
                new SqlParameter("@HomeAddress", _frs.HomeAddress),
                new SqlParameter("@HomeCity", _frs.HomeCity),
                new SqlParameter("@HomeZip", _frs.HomeZip),
                new SqlParameter("@InitialContractDate", _frs.InitialContractDate),
                new SqlParameter("@RenewalDate", _frs.RenewalDate),
                new SqlParameter("@ContractFormDate", _frs.ContractFormDate),
                new SqlParameter("@DHSAwardDate", _frs.DHSAwardDate),
                new SqlParameter("@InitialTrngDate", _frs.InitialTrngDate),
                new SqlParameter("@BirthDay", _frs.BirthDay),
                new SqlParameter("@Anniversary", _frs.Anniversary),
                new SqlParameter("@SandlerRoleID", _frs.SandlerRoleId),
                new SqlParameter("@IsPartOfMasterFranchisee", _frs.IsMasterFranchiseeExists),
                new SqlParameter("@MasterFranchiseeID", _frs.MasterFranchiseeId),
                new SqlParameter("@IsCanPrintLocally", _frs.IsCanPrintLocally),
                new SqlParameter("@IsBuyFromCustomer", _frs.IsBuyFromCustomer),
                new SqlParameter("@IsFixedPricePurchase", _frs.IsFixedPricePurchase),
                new SqlParameter("@CostPlusAmountID", _frs.CostPlusAmountId),
                new SqlParameter("@IsBehindInTerDev", _frs.IsBehindInTerDev),
                new SqlParameter("@BehindAmountID", _frs.BehindAmtId),
                new SqlParameter("@CoachID", _frs.CoachId),
                new SqlParameter("@AwardLevelID", _frs.AwardLevelId),
                new SqlParameter("@PurchaseLevelID", _frs.PurchaseLevelId),
                new SqlParameter("@PrimaryBusinessID", _frs.PurchaseLevelId),
                new SqlParameter("@CertifiedLevelID", _frs.CertifiedLevelId),
                new SqlParameter("@IsContractorsPermitted", _frs.IsContractorPermitted),
                new SqlParameter("@IsKOLMember", _frs.IsKOLMember),
                new SqlParameter("@IsAdvBoard", _frs.IsAdvBoard),
                new SqlParameter("@IsMktgCommittee", _frs.IsMktgCommittee),
                new SqlParameter("@IsUsingSandlerCRM", _frs.IsUsingSandlerCRM),
                new SqlParameter("@IsDHSAwardWinner", _frs.IsDHSAwardWinner),
                new SqlParameter("@IsSandlerMailRequired", _frs.IsSandlerMailRequired),
                new SqlParameter("@IsReqToSubmitFinancials", _frs.IsReqToSubmitFinancial),
                new SqlParameter("@IsRepAgreementForGlobalAcct", _frs.IsRepAgreement),
                new SqlParameter("@WorkStateID", _frs.WorkState),
                new SqlParameter("@WorkCountryID", _frs.WorkCountry),
                new SqlParameter("@HomeStateID ", _frs.HomeState),
                new SqlParameter("@HomeCountryID", _frs.HomeCountry),
                new SqlParameter("@IsSameHomeAddress", _frs.IsSameHomeAddress)); 
                    
            
        }


        public string IsValidStringEntered(string EnteredValue)
        {
            if (string.IsNullOrEmpty(EnteredValue))
            {
                EnteredValue = "";
            }
            return EnteredValue;
        }

        public void Update(string LastName,string FirstName,string Title, string OfficePhone, string MobilePhone,
        string Fax, string WorkEmail,string WorkAddress,string WorkCity,
        string WorkZip,string SpouseName, int YearsWithCompany, string HomePhone,
        string AlternateEmail ,string HomeAddress, string HomeCity,
        string HomeZip, DateTime InitialContractDate, DateTime RenewalDate,
        DateTime ContractFormDate,DateTime DHSAwardDate,
        DateTime InitialTrngDate,DateTime BirthDay,DateTime Anniversary,
		int SandlerRoleID, int IsPartOfMasterFranchisee, int MasterFranchiseeID,
        int IsCanPrintLocally, int IsBuyFromCustomer, int IsFixedPricePurchase,
        int CostPlusAmountID, int IsBehindInTerDev, int BehindAmountID,
        int CoachID, int AwardLevelID, int PurchaseLevelID, int PrimaryBusinessID,
        int CertifiedLevelID , int IsContractorsPermitted, int IsKOLMember, 
        int IsAdvBoard, int IsMktgCommittee, int IsUsingSandlerCRM, 
        int IsDHSAwardWinner, int IsSandlerMailRequired, int IsReqToSubmitFinancials, 
        int IsRepAgreementForGlobalAcct, int WorkStateID,int WorkCountryID,
        int HomeStateID,int HomeCountryID,int IsSameHomeAddress,int FrId)
        {

            InitialContractDate = IsValidDateCheck(InitialContractDate);
            RenewalDate = IsValidDateCheck(RenewalDate);
            ContractFormDate = IsValidDateCheck(ContractFormDate);
            DHSAwardDate = IsValidDateCheck(DHSAwardDate);
            InitialTrngDate = IsValidDateCheck(InitialTrngDate);
            BirthDay = IsValidDateCheck(BirthDay);
            Anniversary = IsValidDateCheck(Anniversary);

            LastName = IsValidStringEntered(LastName);
            FirstName = IsValidStringEntered(FirstName);
            Title = IsValidStringEntered(Title);
            OfficePhone = IsValidStringEntered(OfficePhone);
            MobilePhone = IsValidStringEntered(MobilePhone);
            Fax = IsValidStringEntered(Fax);
            WorkEmail = IsValidStringEntered(WorkEmail);
            WorkAddress = IsValidStringEntered(WorkAddress);
            WorkCity = IsValidStringEntered(WorkCity);
            WorkZip = IsValidStringEntered(WorkZip);
            SpouseName = IsValidStringEntered(SpouseName);
            HomePhone = IsValidStringEntered(HomePhone);
            AlternateEmail = IsValidStringEntered(AlternateEmail);
            HomeAddress = IsValidStringEntered(HomeAddress);
            HomeCity = IsValidStringEntered(HomeCity);
            HomeZip = IsValidStringEntered(HomeZip);
            
            //Update Franchisee Details
            db.ExecuteNonQuery("sp_UpdateFranchiseeDetails",
                new SqlParameter("@LastName", LastName),
                new SqlParameter("@FirstName", FirstName),
                new SqlParameter("@Title", Title),
                new SqlParameter("@OfficePhone", OfficePhone),
                new SqlParameter("@MobilePhone", MobilePhone),
                new SqlParameter("@Fax", Fax),
                new SqlParameter("@WorkEmail", WorkEmail),
                new SqlParameter("@WorkAddress", WorkAddress),
                new SqlParameter("@WorkCity", WorkCity),
                new SqlParameter("@WorkZip", WorkZip),
                new SqlParameter("@SpouseName", SpouseName),
                new SqlParameter("@YearsWithCompany", YearsWithCompany),
                new SqlParameter("@HomePhone", HomePhone),
                new SqlParameter("@AlternateEmail", AlternateEmail),
                new SqlParameter("@HomeAddress", HomeAddress),
                new SqlParameter("@HomeCity", HomeCity),
                new SqlParameter("@HomeZip", HomeZip),
                new SqlParameter("@InitialContractDate", InitialContractDate),
                new SqlParameter("@RenewalDate", RenewalDate),
                new SqlParameter("@ContractFormDate", ContractFormDate),
                new SqlParameter("@DHSAwardDate", DHSAwardDate),
                new SqlParameter("@InitialTrngDate", InitialTrngDate),
                new SqlParameter("@BirthDay", BirthDay),
                new SqlParameter("@Anniversary", Anniversary),
                new SqlParameter("@SandlerRoleID", SandlerRoleID),
                new SqlParameter("@IsPartOfMasterFranchisee", IsPartOfMasterFranchisee),
                new SqlParameter("@MasterFranchiseeID", MasterFranchiseeID),
                new SqlParameter("@IsCanPrintLocally", IsCanPrintLocally),
                new SqlParameter("@IsBuyFromCustomer", IsBuyFromCustomer),
                new SqlParameter("@IsFixedPricePurchase", IsFixedPricePurchase),
                new SqlParameter("@CostPlusAmountID", CostPlusAmountID),
                new SqlParameter("@IsBehindInTerDev", IsBehindInTerDev),
                new SqlParameter("@BehindAmountID", BehindAmountID),
                new SqlParameter("@CoachID", CoachID),
                new SqlParameter("@AwardLevelID", AwardLevelID),
                new SqlParameter("@PurchaseLevelID", PurchaseLevelID),
                new SqlParameter("@PrimaryBusinessID", PrimaryBusinessID),
                new SqlParameter("@CertifiedLevelID", CertifiedLevelID),
                new SqlParameter("@IsContractorsPermitted", IsContractorsPermitted),
                new SqlParameter("@IsKOLMember", IsKOLMember),
                new SqlParameter("@IsAdvBoard", IsAdvBoard),
                new SqlParameter("@IsMktgCommittee", IsMktgCommittee),
                new SqlParameter("@IsUsingSandlerCRM", IsUsingSandlerCRM),
                new SqlParameter("@IsDHSAwardWinner", IsDHSAwardWinner),
                new SqlParameter("@IsSandlerMailRequired", IsSandlerMailRequired),
                new SqlParameter("@IsReqToSubmitFinancials", IsReqToSubmitFinancials),
                new SqlParameter("@IsRepAgreementForGlobalAcct", IsRepAgreementForGlobalAcct),
                new SqlParameter("@WorkStateID", WorkStateID),
                new SqlParameter("@WorkCountryID", WorkCountryID),
                new SqlParameter("@HomeStateID", HomeStateID),
                new SqlParameter("@HomeCountryID", HomeCountryID),
                new SqlParameter("@IsSameHomeAddress", IsSameHomeAddress),
                new SqlParameter("@FrId", FrId));

            UserEntitiesFactory.ReLoad();

        }


        public void InsertFranchisee
            (
            string Name,string LastName, string FirstName, string Title, int SandlerRoleValue, int IsMasterFranchiseeExistsValue,
            int MasterFranchiseeId, int IsCanPrintLocallyValue, int IsBuyFromCustomerValue, int IsFixedPricePurchaseValue,
            int CostPlusAmountValue, int IsBehindInTerDevValue, int BehindAmountValue, int CoachId, string OfficePhone, string MobilePhone,
            string Fax, int AwardLevelValue, int PurchaseLevelValue, int CertifiedLevelValue, int PrimaryBusinessValue, DateTime InitialContractDate,
            DateTime RenewalDate, DateTime ContractFormDate, int IsContractorPermittedValue, int IsKOLMemberValue, 
            int IsAdvBoardValue, int IsMktgCommitteeValue,
            int IsUsingSandlerCRMValue, int IsDHSAwardWinnerValue, DateTime DHSAwardDate, DateTime InitialTrngDate, int IsSandlerMailRequiredValue,
            int IsReqToSubmitFinancialValue,int IsRepAgreementValue, string WorkEmail, string WorkAddress, string WorkCity, int WorkStateValue, 
            string WorkZip, int WorkCountryValue, string SpouseName,
            DateTime BirthDay, DateTime Anniversary, int YearswithCompany, string HomePhone, string AlternateEmail, 
            int IsSameHomeAddressValue, string HomeAddress,
            string HomeCity, int HomeStateValue, string HomeZip, int HomeCountryValue
            )
        {

            //Get the User Session
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];

            InitialContractDate = IsValidDateCheck(InitialContractDate);
            RenewalDate = IsValidDateCheck(RenewalDate);
            ContractFormDate = IsValidDateCheck(ContractFormDate);
            DHSAwardDate = IsValidDateCheck(DHSAwardDate);
            InitialTrngDate = IsValidDateCheck(InitialTrngDate);
            BirthDay = IsValidDateCheck(BirthDay);
            Anniversary = IsValidDateCheck(Anniversary);

            LastName = IsValidStringEntered(LastName);
            FirstName = IsValidStringEntered(FirstName);
            Title = IsValidStringEntered(Title);
            OfficePhone = IsValidStringEntered(OfficePhone);
            MobilePhone = IsValidStringEntered(MobilePhone);
            Fax = IsValidStringEntered(Fax);
            WorkEmail = IsValidStringEntered(WorkEmail);
            WorkAddress = IsValidStringEntered(WorkAddress);
            WorkCity = IsValidStringEntered(WorkCity);
            WorkZip = IsValidStringEntered(WorkZip);
            SpouseName = IsValidStringEntered(SpouseName);
            HomePhone = IsValidStringEntered(HomePhone);
            AlternateEmail = IsValidStringEntered(AlternateEmail);
            HomeAddress = IsValidStringEntered(HomeAddress);
            HomeCity = IsValidStringEntered(HomeCity);
            HomeZip = IsValidStringEntered(HomeZip);

            //Create the record
            db.ExecuteNonQuery("sp_InsertFranchisee",
                new SqlParameter("@Name", Name), 
                new SqlParameter("@LastName", LastName),
                 new SqlParameter("@FirstName", FirstName),
                 new SqlParameter("@Title", Title),
                 new SqlParameter("@OfficePhone", OfficePhone),
                 new SqlParameter("@MobilePhone", MobilePhone),
                 new SqlParameter("@Fax", Fax),
                 new SqlParameter("@WorkEmail", WorkEmail),
                 new SqlParameter("@WorkAddress", WorkAddress),
                 new SqlParameter("@WorkCity", WorkCity),
                 new SqlParameter("@WorkZip", WorkZip),
                 new SqlParameter("@SpouseName", SpouseName),
                 new SqlParameter("@YearsWithCompany", YearswithCompany),
                 new SqlParameter("@HomePhone", HomePhone),
                 new SqlParameter("@AlternateEmail", AlternateEmail),
                 new SqlParameter("@HomeAddress", HomeAddress),
                 new SqlParameter("@HomeCity", HomeCity),
                 new SqlParameter("@HomeZip", HomeZip),
                 new SqlParameter("@InitialContractDate", InitialContractDate),
                 new SqlParameter("@RenewalDate", RenewalDate),
                 new SqlParameter("@ContractFormDate", ContractFormDate),
                 new SqlParameter("@DHSAwardDate", DHSAwardDate),
                 new SqlParameter("@InitialTrngDate", InitialTrngDate),
                 new SqlParameter("@BirthDay", BirthDay),
                 new SqlParameter("@Anniversary", Anniversary),
                 new SqlParameter("@SandlerRoleID", SandlerRoleValue),
                 new SqlParameter("@IsPartOfMasterFranchisee", IsMasterFranchiseeExistsValue),
                 new SqlParameter("@MasterFranchiseeID", MasterFranchiseeId),
                 new SqlParameter("@IsCanPrintLocally", IsCanPrintLocallyValue),
                 new SqlParameter("@IsBuyFromCustomer", IsBuyFromCustomerValue),
                 new SqlParameter("@IsFixedPricePurchase", IsFixedPricePurchaseValue),
                 new SqlParameter("@CostPlusAmountID", CostPlusAmountValue),
                 new SqlParameter("@IsBehindInTerDev", IsBehindInTerDevValue),
                 new SqlParameter("@BehindAmountID", BehindAmountValue),
                 new SqlParameter("@CoachID", CoachId),
                 new SqlParameter("@AwardLevelID", AwardLevelValue),
                 new SqlParameter("@PurchaseLevelID", PurchaseLevelValue),
                 new SqlParameter("@PrimaryBusinessID", PrimaryBusinessValue),
                 new SqlParameter("@CertifiedLevelID", CertifiedLevelValue),
                 new SqlParameter("@IsContractorsPermitted", IsContractorPermittedValue),
                 new SqlParameter("@IsKOLMember", IsKOLMemberValue),
                 new SqlParameter("@IsAdvBoard", IsAdvBoardValue),
                 new SqlParameter("@IsMktgCommittee", IsMktgCommitteeValue),
                 new SqlParameter("@IsUsingSandlerCRM", IsUsingSandlerCRMValue),
                 new SqlParameter("@IsDHSAwardWinner", IsDHSAwardWinnerValue),
                 new SqlParameter("@IsSandlerMailRequired", IsSandlerMailRequiredValue),
                 new SqlParameter("@IsReqToSubmitFinancials", IsReqToSubmitFinancialValue),
                 new SqlParameter("@IsRepAgreementForGlobalAcct", IsRepAgreementValue),
                 new SqlParameter("@WorkStateID", WorkStateValue),
                 new SqlParameter("@WorkCountryID", WorkCountryValue),
                 new SqlParameter("@HomeStateID", HomeStateValue),
                 new SqlParameter("@HomeCountryID", HomeCountryValue),
                 new SqlParameter("@IsSameHomeAddress", IsSameHomeAddressValue));

            UserEntitiesFactory.ReLoad();

        }

    }
}
