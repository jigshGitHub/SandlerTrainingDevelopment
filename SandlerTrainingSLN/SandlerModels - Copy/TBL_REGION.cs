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
    public partial class TBL_REGION
    {
        public TBL_REGION()
        {
            this.TBL_COACH = new HashSet<TBL_COACH>();
        }
    
        public int ID { get; set; }
        public string Name { get; set; }
        public int CountryID { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<System.DateTime> LastUpdatedDate { get; set; }
        public Nullable<System.Guid> LastUpdatedBy { get; set; }
        public Nullable<System.DateTime> LastCreatedDate { get; set; }
        public Nullable<System.Guid> LastCreatedBy { get; set; }
    
        internal ICollection<TBL_COACH> TBL_COACH { get; set; }
        internal TBL_COUNTRY TBL_COUNTRY { get; set; }
    }
    
}
