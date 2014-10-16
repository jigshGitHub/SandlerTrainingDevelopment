using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sandler.DB.Models
{
    public partial class ContactView
    {
        public int TotalCount { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string FullName { get; set; }
        public string Phone { get; set; }
        public string ReferredBy { get; set; }
        public string Notes { get; set; }
        public string Country { get; set; }
        public string CreatedBy { get; set; }
        public string Email { get; set; }
        public string COMPANYNAME { get; set; }
        public string RegionName { get; set; }
        public Nullable<int> CompanyId { get; set; }
        public int ContactsId { get; set; }
        public Nullable<int> CoachID { get; set; }
        public Nullable<int> FranchiseeId { get; set; }

        public string DiscussionTopic { get; set; }
        public string ACTIONSTEP { get; set; }
        public Nullable<DateTime> Birthday { get; set; }
        public Nullable<DateTime> Anniversary { get; set; }
        public Nullable<int> CompanyYears { get; set; }
        public string BossName { get; set; }
        public Nullable<DateTime> LAST_CONTACT_DATE { get; set; }
        public Nullable<DateTime> NEXT_CONTACT_DATE { get; set; }
        public Nullable<DateTime> StartTime { get; set; }
        public string ApptSourceName { get; set; }
        public string CourseName { get; set; }
        public Nullable<DateTime> CourseTrainingDate { get; set; }
        public string NewApptDesp { get; set; }
        public string IsRegisteredForTraining { get; set; }
        public string IsEmailSubscription { get; set; }
        public string NeedCallBack { get; set; }
        public string FranchiseeName { get; set; }
        public Nullable<int> RegionID { get; set; }
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
        public Nullable<DateTime> LastAttemptedDate { get; set; }
        public Nullable<DateTime> LastEmailedDate { get; set; }
        public Nullable<DateTime> LastMeetingDate { get; set; }
        public Nullable<DateTime> LetterSentDate { get; set; }
        public string SpouseName { get; set; }
        public string TrainingCourseName { get; set; }
        public Nullable<int> HowManyAttended { get; set; }
        public string CompanyNameWhereTrainingConducted { get; set; }
    }    
}
