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
    public partial class TBL_COACH
    {
        public TBL_COACH()
        {
            this.TBL_FRANCHISEE = new HashSet<TBL_FRANCHISEE>();
        }
    
        public int ID { get; set; }
        public System.Guid UserID { get; set; }
        public int RegionID { get; set; }
        public bool IsActive { get; set; }
        public Nullable<System.DateTime> LastCreatedDate { get; set; }
        public Nullable<System.Guid> LastUpdatedBy { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<System.Guid> CreatedBy { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string PhoneNumber { get; set; }
        public string ADDRESS { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public Nullable<bool> IsEmailSubscription { get; set; }
    
        internal aspnet_Users aspnet_Users { get; set; }
        internal TBL_REGION TBL_REGION { get; set; }
        internal ICollection<TBL_FRANCHISEE> TBL_FRANCHISEE { get; set; }
    }
    
}
