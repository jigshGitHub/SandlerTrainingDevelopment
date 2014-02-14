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
    
    public partial class TBL_OPPORTUNITIES
    {
        public TBL_OPPORTUNITIES()
        {
            this.TBL_DOCS = new HashSet<TBL_DOCS>();
            this.TBL_OpportunitiesHistory = new HashSet<TBL_OpportunitiesHistory>();
        }
    
        public int ID { get; set; }
        public int COMPANYID { get; set; }
        public int CONTACTID { get; set; }
        public string NAME { get; set; }
        public int ProductID { get; set; }
        public string SALESREPLASTNAME { get; set; }
        public string SALESREPFIRSTNAME { get; set; }
        public string SALESREPPHONE { get; set; }
        public Nullable<int> STATUSID { get; set; }
        public Nullable<decimal> VALUE { get; set; }
        public string WINPROBABILITY { get; set; }
        public Nullable<decimal> WEIGHTEDVALUE { get; set; }
        public Nullable<System.DateTime> CLOSEDATE { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }
        public string UpdatedBy { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<int> OpportunityID { get; set; }
        public Nullable<int> SourceID { get; set; }
        public Nullable<int> TypeID { get; set; }
        public Nullable<int> WhyLostID { get; set; }
        public string Description { get; set; }
        public string Notes { get; set; }
        public Nullable<decimal> ActualValue { get; set; }
        public Nullable<int> SeconadryContactId1 { get; set; }
        public Nullable<int> SeconadryContactId2 { get; set; }
        public Nullable<decimal> ProductCost { get; set; }
        public Nullable<System.DateTime> CreationDate { get; set; }
        public string Pain { get; set; }
        public string LengthOfProblem { get; set; }
        public string Alternatives { get; set; }
        public string CostToFix { get; set; }
        public Nullable<bool> IsBudgeIdentified { get; set; }
        public Nullable<bool> IsMoveForward { get; set; }
    
        public virtual TBL_COMPANIES TBL_COMPANIES { get; set; }
        public virtual ICollection<TBL_DOCS> TBL_DOCS { get; set; }
        public virtual TBL_OpportunitySource TBL_OpportunitySource { get; set; }
        public virtual TBL_OPPORTUNITYSTATUS TBL_OPPORTUNITYSTATUS { get; set; }
        public virtual TBL_OpportunityTypes TBL_OpportunityTypes { get; set; }
        public virtual TBL_OpportunityWhyLost TBL_OpportunityWhyLost { get; set; }
        public virtual Tbl_ProductType Tbl_ProductType { get; set; }
        public virtual ICollection<TBL_OpportunitiesHistory> TBL_OpportunitiesHistory { get; set; }
        public virtual TBL_CONTACTS TBL_CONTACTS { get; set; }
        public virtual TBL_CONTACTS TBL_CONTACTS1 { get; set; }
        public virtual TBL_CONTACTS TBL_CONTACTS2 { get; set; }
    }
}
