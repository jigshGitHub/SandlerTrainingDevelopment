//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Sandler.DB.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class TBL_COMPANIES
    {
        public TBL_COMPANIES()
        {
            this.TBL_CONTACTS = new HashSet<TBL_CONTACTS>();
            this.TBL_DOCS = new HashSet<TBL_DOCS>();
            this.TBL_GA_Tracker = new HashSet<TBL_GA_Tracker>();
            this.TBL_OPPORTUNITIES = new HashSet<TBL_OPPORTUNITIES>();
            this.TBL_OpportunitiesHistory = new HashSet<TBL_OpportunitiesHistory>();
        }
    
        public int COMPANIESID { get; set; }
        public string COMPANYNAME { get; set; }
        public string CITY { get; set; }
        public string STATE { get; set; }
        public string POCLastName { get; set; }
        public string POCFirstName { get; set; }
        public string POCPhone { get; set; }
        public Nullable<bool> IsNewCompany { get; set; }
        public Nullable<int> COMPANYVALUEGOAL { get; set; }
        public Nullable<int> IndustryId { get; set; }
        public string RepLastName { get; set; }
        public string RepFirstName { get; set; }
        public string DiscussionTopic { get; set; }
        public string ACTIONSTEP { get; set; }
        public Nullable<System.DateTime> LASTCONTACT_DATE { get; set; }
        public Nullable<System.DateTime> NEXTCONTACT_DATE { get; set; }
        public Nullable<System.DateTime> CreationDate { get; set; }
        public Nullable<int> FranchiseeId { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }
        public string UpdatedBy { get; set; }
        public string Address { get; set; }
        public string Zip { get; set; }
        public string CompanyOwnership { get; set; }
        public string CompanyDescription { get; set; }
        public string BillingAddress { get; set; }
        public string BillingState { get; set; }
        public string BillingCity { get; set; }
        public string BillingZip { get; set; }
        public string BillingCountry { get; set; }
        public string POCDepartment { get; set; }
        public string POCEmail { get; set; }
        public string POCFax { get; set; }
        public string AssistantLastName { get; set; }
        public string AssistantFirstName { get; set; }
        public string AssistantPhone { get; set; }
        public string Website { get; set; }
        public Nullable<int> EmpQuantity { get; set; }
        public string Notes { get; set; }
        public Nullable<bool> IsSameBillingAddress { get; set; }
        public string Country { get; set; }
        public Nullable<System.DateTime> StartTime { get; set; }
    
        public virtual TBL_FRANCHISEE TBL_FRANCHISEE { get; set; }
        public virtual Tbl_IndustryType Tbl_IndustryType { get; set; }
        public virtual ICollection<TBL_CONTACTS> TBL_CONTACTS { get; set; }
        public virtual ICollection<TBL_DOCS> TBL_DOCS { get; set; }
        public virtual ICollection<TBL_GA_Tracker> TBL_GA_Tracker { get; set; }
        public virtual ICollection<TBL_OPPORTUNITIES> TBL_OPPORTUNITIES { get; set; }
        public virtual ICollection<TBL_OpportunitiesHistory> TBL_OpportunitiesHistory { get; set; }
    }
}
