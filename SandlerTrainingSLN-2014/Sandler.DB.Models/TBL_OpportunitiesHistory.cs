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
    
    public partial class TBL_OpportunitiesHistory
    {
        public int ID { get; set; }
        public int OpportunityID { get; set; }
        public int CompanyID { get; set; }
        public int ContactID { get; set; }
        public string Notes { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }
        public Nullable<System.Guid> CreatedBy { get; set; }
        public Nullable<System.Guid> UpdatedBy { get; set; }
        public Nullable<int> STATUSID { get; set; }
    
        public virtual TBL_COMPANIES TBL_COMPANIES { get; set; }
        public virtual TBL_OPPORTUNITIES TBL_OPPORTUNITIES { get; set; }
        public virtual TBL_CONTACTS TBL_CONTACTS { get; set; }
    }
}
