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
    
    public partial class LU_BillingState
    {
        public LU_BillingState()
        {
            this.TBL_COMPANIES = new HashSet<TBL_COMPANIES>();
        }
    
        public int ID { get; set; }
        public string Name { get; set; }
    
        public virtual ICollection<TBL_COMPANIES> TBL_COMPANIES { get; set; }
    }
}
