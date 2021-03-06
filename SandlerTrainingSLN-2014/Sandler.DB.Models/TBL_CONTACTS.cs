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
        public string FACEBOOKID { get; set; }
        public string TWITTERID { get; set; }
        public string LINKEDINID { get; set; }
        public Nullable<System.DateTime> Date_BootcampTraining { get; set; }
        public Nullable<System.DateTime> Date_CoachingTraining { get; set; }
        public Nullable<System.DateTime> Date_CoachingTrainingRenewal { get; set; }
        public Nullable<System.DateTime> Date_ExecutiveBriefing { get; set; }
        public Nullable<System.DateTime> Date_FoundationsTraining { get; set; }
        public Nullable<System.DateTime> Date_LeadershipTraining { get; set; }
        public Nullable<System.DateTime> Date_ManagementTraining { get; set; }
        public Nullable<System.DateTime> Date_ManagementTrainingRenewal { get; set; }
        public Nullable<System.DateTime> Date_PCTraining { get; set; }
        public Nullable<System.DateTime> Date_PCTrainingRenewal { get; set; }
        public Nullable<System.DateTime> Date_SCCTraining { get; set; }
        public Nullable<System.DateTime> Date_SCCTrainingRenewal { get; set; }
        public Nullable<System.DateTime> Date_SESTraining { get; set; }
        public Nullable<System.DateTime> Date_SESTrainingRenewal { get; set; }
        public Nullable<System.DateTime> Date_Workshop { get; set; }
        public Nullable<int> DISC_ConscientiousnessValue { get; set; }
        public Nullable<int> DISC_DominanceValue { get; set; }
        public Nullable<int> DISC_InfluenceValue { get; set; }
        public Nullable<int> DISC_SteadinessValue { get; set; }
        public string DISCDesignation { get; set; }
        public Nullable<int> LU_CompanySourceId { get; set; }
        public Nullable<int> LU_CompanyStatusId { get; set; }
        public Nullable<int> LU_ContactStatusId { get; set; }
        public Nullable<int> LU_ExecBriefingTopicId { get; set; }
        public Nullable<int> LU_KAREDesignationId { get; set; }
        public Nullable<int> LU_NextActionStepId { get; set; }
        public Nullable<int> LU_POCCertificationLevelId { get; set; }
        public Nullable<int> LU_POCCompanyRoleId { get; set; }
        public Nullable<int> LU_StateId { get; set; }
        public Nullable<int> LU_WorkshopTopicId { get; set; }
        public Nullable<bool> YN_EmailOptOut { get; set; }
        public Nullable<bool> YN_IsAlumnus { get; set; }
        public string column_a { get; set; }
        public string column_b { get; set; }
        public string column_c { get; set; }
        public string column_d { get; set; }
        public string column_e { get; set; }
        public Nullable<int> column_f { get; set; }
        public Nullable<int> column_g { get; set; }
        public Nullable<int> column_h { get; set; }
        public Nullable<int> column_i { get; set; }
        public Nullable<int> column_j { get; set; }
        public Nullable<System.DateTime> column_k { get; set; }
        public Nullable<System.DateTime> column_l { get; set; }
        public Nullable<System.DateTime> column_m { get; set; }
        public Nullable<System.DateTime> column_n { get; set; }
        public Nullable<System.DateTime> column_o { get; set; }
    
        public virtual Tbl_AppointmentsSource Tbl_AppointmentsSource { get; set; }
        public virtual TBL_COMPANIES TBL_COMPANIES { get; set; }
        public virtual Tbl_Course Tbl_Course { get; set; }
        public virtual ICollection<TBL_GA_Tracker> TBL_GA_Tracker { get; set; }
        public virtual ICollection<TBL_OPPORTUNITIES> TBL_OPPORTUNITIES { get; set; }
        public virtual ICollection<TBL_OPPORTUNITIES> TBL_OPPORTUNITIES1 { get; set; }
        public virtual ICollection<TBL_OPPORTUNITIES> TBL_OPPORTUNITIES2 { get; set; }
        public virtual ICollection<TBL_OpportunitiesHistory> TBL_OpportunitiesHistory { get; set; }
        public virtual LU_CompanySource LU_CompanySource { get; set; }
        public virtual LU_CompanyStatus LU_CompanyStatus { get; set; }
        public virtual LU_ContactStatus LU_ContactStatus { get; set; }
        public virtual LU_ExecBriefingTopic LU_ExecBriefingTopic { get; set; }
        public virtual LU_KAREDesignation LU_KAREDesignation { get; set; }
        public virtual LU_NextActionStep LU_NextActionStep { get; set; }
        public virtual LU_POCCertificationLevel LU_POCCertificationLevel { get; set; }
        public virtual LU_POCCompanyRole LU_POCCompanyRole { get; set; }
        public virtual LU_State LU_State { get; set; }
        public virtual LU_WorkshopTopic LU_WorkshopTopic { get; set; }
    }
}
