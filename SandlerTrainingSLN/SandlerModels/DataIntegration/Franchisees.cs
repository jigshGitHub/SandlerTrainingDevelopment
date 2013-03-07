using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SandlerModels.DataIntegration
{
    [Serializable]
    public class Franchisees
    {
        private string _name;
        private string _coachId;
        private string _IsMasterFranchiseeExists;
        private string _MasterFranchiseeId;
        private string _lastname;
        private string _firstname;
        private string _title;
        private string _sandlerRoleId;
        private string _officePhone;
        private string _homePhone;
        private string _mobilePhone;
        private string _fax;
        private string _awardLevelId;
        private string _purchaseLevelId;
        private string _certifiedLevelId;
        private string _primaryBusinessId;
        private string _IsContractorPermitted;
        private string _IsSandlerMailRequired;
        private string _IsKOLMember;
        private string _IsAdvBoard;
        private string _IsMktgCommittee;
        private string _IsUsingSandlerCRM;
        private string _IsDHSAwardWinner;
        private string _IsReqToSubmitFinancial;
        private string _IsRepAgreement;
        private string _workEmail;
        private string _workAddress;
        private string _workZip;
        private string _workCity;
        private string _workState;
        private string _workCountry;
        private string _alternateEmail;
        private string _homeAddress;
        private string _homeZip;
        private string _homeCity;
        private string _homeState;
        private string _homeCountry;
        private string _IsSameHomeAddress;
        private string _spouseName;
        private string _yearsWithCompany;
        private string _IsCanPrintLocally;
        private string _IsBuyFromCustomer;
        private string _IsFixedPricePurchase;
        private string _IsBehindInTerDev;
        private string _CostPlusAmountId;
        private string _BehindAmtId;

        private string _territory;
        private string _businessFocusArea;
        private string _closestMetro;
        
        private DateTime _initialContractDate;
        private DateTime _renewalDate;
        private DateTime _contractFormDate;
        private DateTime _dhsAwardDate;
        private DateTime _initialTrngDate;
        private DateTime _birthDay;
        private DateTime _anniversary;


        public string ClosestMetro
        {
            get
            {
                return _closestMetro;

            }
            set
            {
                _closestMetro = value;
            }
        }


        public string BusinessFocusArea
        {
            get
            {
                return _businessFocusArea;

            }
            set
            {
                _businessFocusArea = value;
            }
        }


        public string Territory
        {
            get
            {
                return _territory;

            }
            set
            {
                _territory = value;
            }
        }

        public DateTime InitialContractDate
        {
            get
            {
                return _initialContractDate;

            }
            set
            {
                _initialContractDate = value;
            }
        }
        
        public DateTime RenewalDate
        {
            get
            {
                return _renewalDate;

            }
            set
            {
                _renewalDate = value;
            }
        }

        public DateTime ContractFormDate
        {
            get
            {
                return _contractFormDate;

            }
            set
            {
                _contractFormDate = value;
            }
        }

        public DateTime DHSAwardDate
        {
            get
            {
                return _dhsAwardDate;

            }
            set
            {
                _dhsAwardDate = value;
            }
        }
        
        public DateTime InitialTrngDate
        {
            get
            {
                return _initialTrngDate;

            }
            set
            {
                _initialTrngDate = value;
            }
        }

        public DateTime BirthDay
        {
            get
            {
                return _birthDay;

            }
            set
            {
                _birthDay = value;
            }
        }

        public DateTime Anniversary
        {
            get
            {
                return _anniversary;

            }
            set
            {
                _anniversary = value;
            }
        }

        public string Name
        {
            get
            {
                return _name;

            }
            set
            {
                _name = value;
            }
        }

        public string IsMasterFranchiseeExists
        {
            get
            {
                return _IsMasterFranchiseeExists;

            }
            set
            {
                _IsMasterFranchiseeExists = value;
            }
        }

        public string CoachId
        {
            get
            {
                return _coachId;

            }
            set
            {
                _coachId = value;
            }
        }

        public string MasterFranchiseeId
        {
            get
            {
                return _MasterFranchiseeId;

            }
            set
            {
                _MasterFranchiseeId = value;
            }
        }
        
        public string LastName
        {
            get
            {
                return _lastname;

            }
            set
            {
                _lastname = value;
            }
        }

        public string FirstName
        {
            get
            {
                return _firstname;

            }
            set
            {
                _firstname = value;
            }
        }

        public string Title
        {
            get
            {
                return _title;

            }
            set
            {
                _title = value;
            }
        }

        public string SandlerRoleId
        {
            get
            {
                return _sandlerRoleId;

            }
            set
            {
                _sandlerRoleId = value;
            }
        }
        
        public string OfficePhone
        {
            get
            {
                return _officePhone;

            }
            set
            {
                _officePhone = value;
            }
        }
        
        public string HomePhone
        {
            get
            {
                return _homePhone;

            }
            set
            {
                _homePhone = value;
            }
        }

        public string MobilePhone
        {
            get
            {
                return _mobilePhone;

            }
            set
            {
                _mobilePhone = value;
            }
        }

        public string Fax
        {
            get
            {
                return _fax;

            }
            set
            {
                _fax = value;
            }
        }

        public string AwardLevelId
        {
            get
            {
                return _awardLevelId;

            }
            set
            {
                _awardLevelId = value;
            }
        }

        public string PurchaseLevelId
        {
            get
            {
                return _purchaseLevelId;

            }
            set
            {
                _purchaseLevelId = value;
            }
        }

        public string CertifiedLevelId
        {
            get
            {
                return _certifiedLevelId;

            }
            set
            {
                _certifiedLevelId = value;
            }
        }

        public string PrimaryBusinessId
        {
            get
            {
                return _primaryBusinessId;

            }
            set
            {
                _primaryBusinessId = value;
            }
        }

        public string IsContractorPermitted
        {
            get
            {
                return _IsContractorPermitted;

            }
            set
            {
                _IsContractorPermitted = value;
            }
        }

        public string IsSandlerMailRequired
        {
            get
            {
                return _IsSandlerMailRequired;

            }
            set
            {
                _IsSandlerMailRequired = value;
            }
        }

        public string IsKOLMember
        {
            get
            {
                return _IsKOLMember;

            }
            set
            {
                _IsKOLMember = value;
            }
        }

        public string IsAdvBoard
        {
            get
            {
                return _IsAdvBoard;

            }
            set
            {
                _IsAdvBoard = value;
            }
        }

        public string IsMktgCommittee
        {
            get
            {
                return _IsMktgCommittee;

            }
            set
            {
                _IsMktgCommittee = value;
            }
        }
        
        public string IsUsingSandlerCRM
        {
            get
            {
                return _IsUsingSandlerCRM;

            }
            set
            {
                _IsUsingSandlerCRM = value;
            }
        }
        
        public string IsDHSAwardWinner
        {
            get
            {
                return _IsDHSAwardWinner;

            }
            set
            {
                _IsDHSAwardWinner = value;
            }
        }

        public string IsReqToSubmitFinancial
        {
            get
            {
                return _IsReqToSubmitFinancial;

            }
            set
            {
                _IsReqToSubmitFinancial = value;
            }
        }

        public string IsRepAgreement
        {
            get
            {
                return _IsRepAgreement;

            }
            set
            {
                _IsRepAgreement = value;
            }
        }

        public string WorkEmail
        {
            get
            {
                return _workEmail;

            }
            set
            {
                _workEmail = value;
            }
        }
        
        public string WorkAddress
        {
            get
            {
                return _workAddress;

            }
            set
            {
                _workAddress = value;
            }
        }

        public string WorkZip
        {
            get
            {
                return _workZip;

            }
            set
            {
                _workZip = value;
            }
        }
        
        public string WorkCity
        {
            get
            {
                return _workCity;

            }
            set
            {
                _workCity = value;
            }
        }
        
        public string WorkState
        {
            get
            {
                return _workState;

            }
            set
            {
                _workState = value;
            }
        }

        public string WorkCountry
        {
            get
            {
                return _workCountry;

            }
            set
            {
                _workCountry = value;
            }
        }

        public string AlternateEmail
        {
            get
            {
                return _alternateEmail;

            }
            set
            {
                _alternateEmail = value;
            }
        }
        
        public string HomeAddress
        {
            get
            {
                return _homeAddress;

            }
            set
            {
                _homeAddress = value;
            }
        }

        public string HomeZip
        {
            get
            {
                return _homeZip;

            }
            set
            {
                _homeZip = value;
            }
        }

        public string HomeCity
        {
            get
            {
                return _homeCity;

            }
            set
            {
                _homeCity = value;
            }
        }

        public string HomeState
        {
            get
            {
                return _homeState;

            }
            set
            {
                _homeState = value;
            }
        }

        public string HomeCountry
        {
            get
            {
                return _homeCountry;

            }
            set
            {
                _homeCountry = value;
            }
        }

        public string IsSameHomeAddress
        {
            get
            {
                return _IsSameHomeAddress;

            }
            set
            {
                _IsSameHomeAddress = value;
            }
        }

        public string SpouseName
        {
            get
            {
                return _spouseName;

            }
            set
            {
                _spouseName = value;
            }
        }
        
        public string YearsWithCompany
        {
            get
            {
                return _yearsWithCompany;

            }
            set
            {
                _yearsWithCompany = value;
            }
        }

        public string IsCanPrintLocally
        {
            get
            {
                return _IsCanPrintLocally;

            }
            set
            {
                _IsCanPrintLocally = value;
            }
        }

        public string IsBuyFromCustomer
        {
            get
            {
                return _IsBuyFromCustomer;

            }
            set
            {
                _IsBuyFromCustomer = value;
            }
        }

        public string IsFixedPricePurchase
        {
            get
            {
                return _IsFixedPricePurchase;

            }
            set
            {
                _IsFixedPricePurchase = value;
            }
        }

        public string IsBehindInTerDev
        {
            get
            {
                return _IsBehindInTerDev;

            }
            set
            {
                _IsBehindInTerDev = value;
            }
        }
        
        public string CostPlusAmountId
        {
            get
            {
                return _CostPlusAmountId;

            }
            set
            {
                _CostPlusAmountId = value;
            }
        }
        
        public string BehindAmtId
        {
            get
            {
                return _BehindAmtId;

            }
            set
            {
                _BehindAmtId = value;
            }
        }


    }

}
