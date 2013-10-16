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
            this.TBL_GA_Tracker = new HashSet<TBL_GA_Tracker>();
            this.TBL_OPPORTUNITIES = new HashSet<TBL_OPPORTUNITIES>();
            this.TBL_OPPORTUNITIES1 = new HashSet<TBL_OPPORTUNITIES>();
            this.TBL_OPPORTUNITIES2 = new HashSet<TBL_OPPORTUNITIES>();
            this.TBL_OpportunitiesHistory = new HashSet<TBL_OpportunitiesHistory>();
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
        public string Title { get; set; }
        public string ContactsDepartment { get; set; }
        public string ContactsRole { get; set; }
        public string MobilePhone { get; set; }
        public string HomePhone { get; set; }
        public string Fax { get; set; }
        public string PersonalEmail { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public Nullable<System.DateTime> LastAttemptedDate { get; set; }
        public Nullable<System.DateTime> LastEmailedDate { get; set; }
        public Nullable<System.DateTime> LastMeetingDate { get; set; }
        public Nullable<System.DateTime> LetterSentDate { get; set; }
        public string SpouseName { get; set; }
        public string ReferredBy { get; set; }
        public string Notes { get; set; }
        public string Country { get; set; }
        public string TrainingCourseName { get; set; }
        public Nullable<int> HowManyAttended { get; set; }
        public string CompanyNameWhereTrainingConducted { get; set; }
        public Nullable<System.DateTime> StartTime { get; set; }
    
        internal Tbl_AppointmentsSource Tbl_AppointmentsSource { get; set; }
        internal TBL_COMPANIES TBL_COMPANIES { get; set; }
        internal Tbl_Course Tbl_Course { get; set; }
        internal ICollection<TBL_GA_Tracker> TBL_GA_Tracker { get; set; }
        internal ICollection<TBL_OPPORTUNITIES> TBL_OPPORTUNITIES { get; set; }
        internal ICollection<TBL_OPPORTUNITIES> TBL_OPPORTUNITIES1 { get; set; }
        internal ICollection<TBL_OPPORTUNITIES> TBL_OPPORTUNITIES2 { get; set; }
        internal ICollection<TBL_OpportunitiesHistory> TBL_OpportunitiesHistory { get; set; }
    }
    
}
