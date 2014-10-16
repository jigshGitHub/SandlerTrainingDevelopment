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
    public partial class CompanyView
    {
        public int TotalCount { get; set; }
        public int COMPANIESID { get; set; }
        public string COMPANYNAME { get; set; }
        public string ProductTypeName { get; set; }
        public string IndustryTypeName { get; set; }
        public string RepLastName { get; set; }
        public string RepFirstName { get; set; }
        public string Representative { get; set; }
        public Nullable<int> ProductId { get; set; }
        public Nullable<int> IndustryId { get; set; }
        public string Address { get; set; }
        public string Zip { get; set; }
        public string CreatedBy { get; set; }
        public string CITY { get; set; }
        public string STATE { get; set; }
        public Nullable<int> TotalCompanyValue { get; set; }
        public Nullable<int> CoachID { get; set; }
        public Nullable<int> FranchiseeId { get; set; }
        public Nullable<int> RegionID { get; set; }
        public string RegionName { get; set; }
        public string FranchiseeName { get; set; }
        public string NewCompanyDesp { get; set; }
        public string POCFullName { get; set; }
        public string POCPhone { get; set; }
        public string DiscussionTopic { get; set; }
        public string ActionStep { get; set; }
        public Nullable<DateTime> LASTCONTACT_DATE { get; set; }
        public Nullable<DateTime> NEXTCONTACT_DATE { get; set; }
        public Nullable<DateTime> CreationDate { get; set; }
        public string Country { get; set; }
        public string BillingAddress { get; set; }
        public string BillingState { get; set; }
        public string BillingZip { get; set; }
        public string BillingCity { get; set; }
        public string BillingCountry { get; set; }
        public string CompanyOwnership { get; set; }
        public string CompanyDescription { get; set; }
        public string POCDepartment { get; set; }
        public string POCEmail { get; set; }
        public string POCFax { get; set; }
        public string AssistantLastName { get; set; }
        public string AssistantFirstName { get; set; }
        public string AssistantPhone { get; set; }
        public string Website { get; set; }
        public Nullable<int> EmpQuantity { get; set; }
        public string Notes { get; set; }
        public Nullable<DateTime> StartTime { get; set; }
        public string BillingDescription { get; set; }
    }
}
