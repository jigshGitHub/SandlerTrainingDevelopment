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
    
    public partial class Tbl_ACE_Messages
    {
        public int ID { get; set; }
        public Nullable<int> CampaignID { get; set; }
        public Nullable<int> TemplateID { get; set; }
        public Nullable<int> DoucmentID { get; set; }
        public Nullable<int> DaysFromStart { get; set; }
        public string Subject { get; set; }
        public string ResponseReceiver { get; set; }
        public string CallToAction { get; set; }
        public string EmailBody { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<System.Guid> CreatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedOn { get; set; }
        public Nullable<System.DateTime> UpdatedBy { get; set; }
        public Nullable<System.DateTime> SendDate { get; set; }
        public Nullable<System.DateTime> ArchiveDate { get; set; }
    }
}
