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
    
    public partial class TBL_OPPORTUNITYSTATUS
    {
        public TBL_OPPORTUNITYSTATUS()
        {
            this.TBL_OPPORTUNITIES = new HashSet<TBL_OPPORTUNITIES>();
        }
    
        public int ID { get; set; }
        public string Name { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<System.Guid> CreateBy { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<System.Guid> LastUpdateBy { get; set; }
        public Nullable<System.DateTime> LastUpdatedDate { get; set; }
        public Nullable<int> SortOrder { get; set; }
    
        public virtual ICollection<TBL_OPPORTUNITIES> TBL_OPPORTUNITIES { get; set; }
    }
}
