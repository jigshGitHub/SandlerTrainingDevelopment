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
    
    public partial class Tbl_DocumentStatus
    {
        public Tbl_DocumentStatus()
        {
            this.TBL_DOCS = new HashSet<TBL_DOCS>();
        }
    
        public int DocStatusId { get; set; }
        public string DocStatusText { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public string UpdatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedOn { get; set; }
    
        public virtual ICollection<TBL_DOCS> TBL_DOCS { get; set; }
    }
}
