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
    public partial class TBL_CONTACTS
    {
        public TBL_CONTACTS()
        {
            this.TBL_OPPORTUNITIES = new HashSet<TBL_OPPORTUNITIES>();
            this.TBL_OPPORTUNITIES1 = new HashSet<TBL_OPPORTUNITIES>();
            this.TBL_OPPORTUNITIES2 = new HashSet<TBL_OPPORTUNITIES>();
            this.TBL_GA_Tracker = new HashSet<TBL_GA_Tracker>();
        }
    
        public int CONTACTSID { get; set; }
        public Nullable<int> COMPANYID { get; set; }
        public string LASTNAME { get; set; }
        public string FIRSTNAME { get; set; }
        public string PHONE { get; set; }
        public string EMAIL { get; set; }
        public Nullable<bool> IsNewAppointment { get; set; }
        public Nullable<int> ApptSourceId { get; set; }
        public Nullable<bool> IsRegisteredForTraining { get; set; }
        public Nullable<int> CourseId { get; set; }
        public Nullable<System.DateTime> CourseTrainingDate { get; set; }
        public string DiscussionTopic { get; set; }
        public string ACTIONSTEP { get; set; }
        public Nullable<System.DateTime> LAST_CONTACT_DATE { get; set; }
        public Nullable<System.DateTime> NEXT_CONTACT_DATE { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }
        public string UpdatedBy { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<bool> IsEmailSubscription { get; set; }
        public Nullable<System.DateTime> Birthday { get; set; }
        public Nullable<System.DateTime> Anniversary { get; set; }
        public Nullable<int> CompanyYears { get; set; }
        public string BossName { get; set; }
        public Nullable<bool> IsNeedCallBack { get; set; }
        public Nullable<System.DateTime> CallBackCreatedDate { get; set; }
    
        internal Tbl_Course Tbl_Course { get; set; }
        internal Tbl_AppointmentsSource Tbl_AppointmentsSource { get; set; }
        internal TBL_COMPANIES TBL_COMPANIES { get; set; }
        internal ICollection<TBL_OPPORTUNITIES> TBL_OPPORTUNITIES { get; set; }
        internal ICollection<TBL_OPPORTUNITIES> TBL_OPPORTUNITIES1 { get; set; }
        internal ICollection<TBL_OPPORTUNITIES> TBL_OPPORTUNITIES2 { get; set; }
        internal ICollection<TBL_GA_Tracker> TBL_GA_Tracker { get; set; }
    }
    
}
