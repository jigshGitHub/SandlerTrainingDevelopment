//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

namespace SandlerModels
{
    public partial class Tbl_IndustryType
    {
        public Tbl_IndustryType()
        {
            this.TBL_COMPANIES = new HashSet<TBL_COMPANIES>();
        }
    
        public int IndId { get; set; }
        public string IndustryTypeName { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<System.DateTime> LastUpdatedDate { get; set; }
        public string LastUpdatedBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public string CreatedBy { get; set; }
    
        public virtual ICollection<TBL_COMPANIES> TBL_COMPANIES { get; set; }
    }
    
}
