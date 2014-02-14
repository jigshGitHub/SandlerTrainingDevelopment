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
    
    public partial class sp_GetContactsByUser_Result
    {
        public int RegionID { get; set; }
        public string Region { get; set; }
        public int CoachID { get; set; }
        public string CoachName { get; set; }
        public int FranchiseeId { get; set; }
        public string FranchiseeName { get; set; }
        public string COMPANYNAME { get; set; }
        public Nullable<bool> IsNewCompany { get; set; }
        public Nullable<System.DateTime> CreationDate { get; set; }
        public Nullable<int> IndustryId { get; set; }
        public string FullName { get; set; }
        public string ApptSourceName { get; set; }
        public string CourseName { get; set; }
        public string NewApptDespDesc { get; set; }
        public string IsRegisteredForTrainingDesc { get; set; }
        public string IsEmailSubscriptionDesc { get; set; }
        public string NeedCallBackDesc { get; set; }
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
    }
}
