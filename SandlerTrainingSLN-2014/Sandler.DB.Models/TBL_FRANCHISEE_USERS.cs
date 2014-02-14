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
    
    public partial class TBL_FRANCHISEE_USERS
    {
        public int FranchiseeID { get; set; }
        public System.Guid UserID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string ContactNumber { get; set; }
        public string ADDRESS { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public Nullable<int> CountryID { get; set; }
        public Nullable<bool> IsEmailSubscription { get; set; }
        public int ID { get; set; }
    
        public virtual TBL_COUNTRY TBL_COUNTRY { get; set; }
        public virtual TBL_FRANCHISEE TBL_FRANCHISEE { get; set; }
    }
}