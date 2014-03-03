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
    public partial class CompanyView
    {
        public int TotalCount { get; set; }
        public int COMPANIESID { get; set; }
        public string COMPANYNAME { get; set; }
        public string ProductTypeName { get; set; }
        public string IndustryTypeName { get; set; }
        public string RepLastName { get; set; }
        public string RepFirstName { get; set; }
        public string Representative { get; set; }
        public Nullable<int> ProductId { get; set; }
        public Nullable<int> IndustryId { get; set; }
        public string Address { get; set; }
        public string Zip { get; set; }
        public string CreatedBy { get; set; }
        public string CITY { get; set; }
        public string STATE { get; set; }
        public Nullable<int> TotalCompanyValue { get; set; }
        public Nullable<int> CoachID { get; set; }
        public Nullable<int> FranchiseeId { get; set; }
        public Nullable<int> RegionID { get; set; }
        public string RegionName { get; set; }
        public string FranchiseeName { get; set; }
        public string NewCompanyDesp { get; set; }
        public string POCFullName { get; set; }
        public string POCPhone { get; set; }
        public string DiscussionTopic { get; set; }
        public string ActionStep { get; set; }
        public Nullable<DateTime> LASTCONTACT_DATE { get; set; }
        public Nullable<DateTime> NEXTCONTACT_DATE { get; set; }
        public Nullable<DateTime> CreationDate { get; set; }
        public string Country { get; set; }
        public string BillingAddress { get; set; }
        public string BillingState { get; set; }
        public string BillingZip { get; set; }
        public string BillingCity { get; set; }
        public string BillingCountry { get; set; }
        public string CompanyOwnership { get; set; }
        public string CompanyDescription { get; set; }
        public string POCDepartment { get; set; }
        public string POCEmail { get; set; }
        public string POCFax { get; set; }
        public string AssistantLastName { get; set; }
        public string AssistantFirstName { get; set; }
        public string AssistantPhone { get; set; }
        public string Website { get; set; }
        public Nullable<int> EmpQuantity { get; set; }
        public string Notes { get; set; }
        public Nullable<DateTime> StartTime { get; set; }
        public string BillingDescription { get; set; }
    }
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

    public partial class OpportunityView
    {
        public int TotalCount { get; set; }
        public string COMPANYNAME { get; set; }
        public Nullable<int> IndustryId { get; set; }
        public string WhyLost { get; set; }
        public string Type { get; set; }
        public string Status { get; set; }
        public string ProductTypeName { get; set; }
        public string Source { get; set; }
        public int ID { get; set; }
        public int COMPANYID { get; set; }
        public int CONTACTID { get; set; }
        public string NAME { get; set; }
        public int ProductID { get; set; }
        public string SALESREPLASTNAME { get; set; }
        public string SALESREPFIRSTNAME { get; set; }
        public string SALESREP { get; set; }
        public Nullable<int> STATUSID { get; set; }
        public Nullable<decimal> VALUE { get; set; }
        public string WINPROBABILITY { get; set; }
        public Nullable<decimal> WEIGHTEDVALUE { get; set; }
        public Nullable<System.DateTime> CLOSEDATE { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<int> OpportunityID { get; set; }
        public Nullable<int> SourceID { get; set; }
        public Nullable<int> TypeID { get; set; }
        public Nullable<int> WhyLostID { get; set; }
        public string Description { get; set; }
        public string Notes { get; set; }
        public Nullable<decimal> ActualValue { get; set; }
        public Nullable<decimal> ProductCost { get; set; }
        public Nullable<System.DateTime> OppCreationDate { get; set; }
        public string Pain { get; set; }
        public string LengthofProblem { get; set; }
        public string CostToFix { get; set; }
        public string Alternatives { get; set; }
        public Nullable<bool> IsBudgeIdentified { get; set; }
        public Nullable<bool> IsMoveForward { get; set; }
    }
    public class ReponseMessage
    {
        public int responseId { get; set; }
    }
}
