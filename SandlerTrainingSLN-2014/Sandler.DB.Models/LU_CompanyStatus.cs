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
    
    public partial class LU_CompanyStatus
    {
        public LU_CompanyStatus()
        {
            this.TBL_COMPANIES = new HashSet<TBL_COMPANIES>();
            this.TBL_CONTACTS = new HashSet<TBL_CONTACTS>();
            this.TBL_OPPORTUNITIES = new HashSet<TBL_OPPORTUNITIES>();
        }
    
        public int ID { get; set; }
        public string Name { get; set; }
    
        public virtual ICollection<TBL_COMPANIES> TBL_COMPANIES { get; set; }
        public virtual ICollection<TBL_CONTACTS> TBL_CONTACTS { get; set; }
        public virtual ICollection<TBL_OPPORTUNITIES> TBL_OPPORTUNITIES { get; set; }
    }
}
