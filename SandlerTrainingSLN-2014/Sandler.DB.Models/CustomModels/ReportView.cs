using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sandler.DB.Models
{
    public partial class ReportView
    {
        public int TotalCount { get; set; }
        public int ID { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string FranchiseName { get; set; }
        public string PrimaryOfficeEmail { get; set; }
        public string ContactNumber { get; set; }
        public string LastUpdated { get; set; }
        public string LastUpdatedBy { get; set; }
        public string AwardLevelText { get; set; }
        public string BusinessFocusArea { get; set; }
        public string CertificationLevel { get; set; }
        public string Coach { get; set; }
        public string InitialContractDate { get; set; }
        public string RenewalDate { get; set; }
        public string ContractFormDate { get; set; }
        public string ContractorAllowed { get; set; }
        public string Country { get; set; }
        //public string InitialTrainingDate { get; set; }
        public Nullable<DateTime> InitialTrainingDate { get; set; }
        public string MustSubmit { get; set; }
        public string ProductLevel { get; set; }
        public string Region { get; set; }
        public string EMailRequired { get; set; }
        public string State { get; set; }
        public string UsingCRM { get; set; }
        public string Territory { get; set; }
        public string ClosestMetroArea { get; set; }
        public string ZipCode { get; set; }
        public string MasterFranchise { get; set; }
        public string LocalPrint { get; set; }
        public string BuyFromSSI { get; set; }
        public string FixedPricePurchase { get; set; }
        public string ProductCost { get; set; }
        public string PercentBehind { get; set; }
        public string DHSAwardDate { get; set; }

        public string SandlerRole { get; set; }
        public string Title { get; set; }
        public string Website { get; set; }
        public string Active { get; set; }
        public string Phone { get; set; }
        public string MobilePhone { get; set; }
        public string Fax { get; set; }
        public string FaxNumber { get; set; }
        public string PurchaseLevel { get; set; }
        public string ContractorPermitted { get; set; }
        public string SandlerMailRequired { get; set; }
        public string KOLMember { get; set; }
        public string AdvisoryBoard { get; set; }
        public string MarketingCommittee { get; set; }
        public string UsingSandlerCRM { get; set; }
        public string RequiredToSubmitFinancial { get; set; }
        public string RepresentiveAgreement { get; set; }
        public string PrimaryOfficeAddress { get; set; }
        public string PrimaryOfficeCity { get; set; }
        public string PrimaryOfficeState { get; set; }

        public string PrimaryOfficeZip { get; set; }
        public string PrimaryOfficeCountry { get; set; }
        public string AlternateEmail { get; set; }
        public string SameHomeAddress { get; set; }
        public string HomeAddress { get; set; }
        public string HomeCity { get; set; }
        public string HomeState { get; set; }

        public string HomeZip { get; set; }
        public string HomeCountry { get; set; }
        public string SpouseName { get; set; }
        public string BirthDay { get; set; }
        public string Anniversary { get; set; }
        public string YearsWithCompany { get; set; }
        public string IsMasterFranchisee { get; set; }
        public string CostPlusAmount { get; set; }
        public string BehindinTerritoryDevelop { get; set; }
        public string AmountBehind { get; set; }
        public string Agreement { get; set; }



    }
}
