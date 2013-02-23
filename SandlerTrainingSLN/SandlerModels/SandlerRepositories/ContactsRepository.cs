using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using SandlerModels.DataIntegration;
using SandlerModels;

/// <summary>
/// Summary description for ContactsDAL
/// </summary>
namespace SandlerRepositories
{
    public partial class ContactsRepository
    {
        DBFactory db = new DBFactory();
        //public ContactsRepository()
        //{
        //    //
        //    // TODO: Add constructor logic here
        //    //
        //}
        public DataSet GetAll(int COMPANIESID, UserModel _user)
        {
            

            if (COMPANIESID == 0)
            {
                if (_user.Role == SandlerRoles.SiteAdmin || _user.Role == SandlerRoles.Corporate || _user.Role == SandlerRoles.HomeOfficeAdmin)
                {
                    return db.ExecuteDataset("sp_GetAllContacts", "Contacts");
                }
                else if (_user.Role == SandlerRoles.Coach)
                {
                    return db.ExecuteDataset("sp_GetAllContactsByCoachID", "Contacts", new SqlParameter("@CoachID", _user.CoachID));
                }
                else if (_user.Role == SandlerRoles.FranchiseeOwner || _user.Role == SandlerRoles.Client)
                {
                    //now we have to bring records as per role - Franchisee Owner Or Client
                    return db.ExecuteDataset("sp_GetAllContactsByFrID", "Contacts", new SqlParameter("@FranchiseeID", _user.FranchiseeID));
                }
                else
                {
                    //This is for Franchisee User
                    return db.ExecuteDataset("sp_GetAllContactsByUserID", "Contacts", new SqlParameter("@UserID", _user.UserId));
                }

            }
            else
            {
                //We have Company ID
                if (_user.Role != SandlerRoles.FranchiseeUser)
                {
                    System.Data.DataSet ds = db.ExecuteDataset("sp_GetAllContactsByCompID", "Contacts", new SqlParameter("@CompanyID", COMPANIESID));
                    return ds;
                }
                else
                {
                    //Only for the Franchisee User
                    System.Data.DataSet ds = db.ExecuteDataset("sp_GetAllContactsForCompByUserID", "Contacts", new SqlParameter("@UserID", _user.UserId), new SqlParameter("@CompanyID", COMPANIESID));
                    return ds;
                }

            }

        }

        public DataSet GetAllForSearch(UserModel _user)
        {
            //get the User Info
            
            SandlerModels.DataIntegration.Contact _contact = (SandlerModels.DataIntegration.Contact)HttpContext.Current.Session["ContactSearchCriteria"];
            //date fields

            _contact.LastContactDate = IsValidDateCheck(_contact.LastContactDate);
            _contact.NextContactDate = IsValidDateCheck(_contact.NextContactDate);
            _contact.CourseTrainingDate = IsValidDateCheck(_contact.CourseTrainingDate);
            _contact.BirthDay = IsValidDateCheck(_contact.BirthDay);
            _contact.Anniversary = IsValidDateCheck(_contact.Anniversary);
            _contact.LastContactDate = IsValidDateCheck(_contact.LastContactDate);
            _contact.LastAttemptedDate = IsValidDateCheck(_contact.LastAttemptedDate);
            _contact.LastEmailedDate = IsValidDateCheck(_contact.LastEmailedDate);
            _contact.LetterSentDate = IsValidDateCheck(_contact.LetterSentDate);
            _contact.LastMeetingDate = IsValidDateCheck(_contact.LastMeetingDate);

            //Now perform search based on User role
            if (_user.Role == SandlerRoles.SiteAdmin || _user.Role == SandlerRoles.Corporate || _user.Role == SandlerRoles.HomeOfficeAdmin)
            {
                //get data
                return db.ExecuteDataset("sp_GetAllContactsSearch", "Contacts",
                    new SqlParameter("@LastName", _contact.LastName),
                    new SqlParameter("@FirstName", _contact.FirstName),
                    new SqlParameter("@Title", _contact.Title),
                    new SqlParameter("@ContactsDepartment", _contact.ContactsDepartment),
                    new SqlParameter("@ContactsRole", _contact.ContactsRole),
                    new SqlParameter("@Phone", _contact.Phone),
                    new SqlParameter("@MobilePhone", _contact.MobilePhone),
                    new SqlParameter("@HomePhone", _contact.HomePhone),
                    new SqlParameter("@Fax", _contact.Fax),
                    new SqlParameter("@Email", _contact.Email),
                    new SqlParameter("@PersonalEmail", _contact.PersonalEmail),
                    new SqlParameter("@Address", _contact.Address),
                    new SqlParameter("@City", _contact.City),
                    new SqlParameter("@State", _contact.State),
                    new SqlParameter("@Zip", _contact.Zip),
                    new SqlParameter("@Country", _contact.Country),
                    new SqlParameter("@IsNewApptIdList", _contact.IsNewApptList),
                    new SqlParameter("@ApptSourceIdList", _contact.ApptSourceList),
                    new SqlParameter("@IsRegForTrainingList", _contact.IsRegisteredForTrainingList),
                    new SqlParameter("@CourseTypeIdList", _contact.CourseIdList),
                    new SqlParameter("@CompanyIdList", _contact.CompanyIdList),
                    new SqlParameter("@NeedCallBackList", _contact.IsNeedCallBackList),
                    new SqlParameter("@EmailSubscriptionList", _contact.IsEmailSubscriptionList),
                    new SqlParameter("@DiscussionTopic", _contact.DiscussionTopic),
                    new SqlParameter("@ActionStep", _contact.ActionStep),
                    new SqlParameter("@LastContactDate", _contact.LastContactDate),
                    new SqlParameter("@NextContactDate", _contact.NextContactDate),
                    new SqlParameter("@LastAttemptedDate", _contact.LastAttemptedDate),
                   new SqlParameter("@LastEmailedDate", _contact.LastEmailedDate),
                   new SqlParameter("@LastMeetingDate", _contact.LastMeetingDate),
                   new SqlParameter("@LetterSentDate", _contact.LetterSentDate),
                    new SqlParameter("@CourseTrngDate", _contact.CourseTrainingDate),
                    new SqlParameter("@BirthDayDate", _contact.BirthDay),
                    new SqlParameter("@AnniversaryDate", _contact.Anniversary),
                    new SqlParameter("@CompanyYears", _contact.CompanyYears),
                    new SqlParameter("@BossName", _contact.BossName),
                    new SqlParameter("@SpouseName", _contact.SpouseName),
                   new SqlParameter("@ReferredBy", _contact.ReferredBy),
                   new SqlParameter("@Notes", _contact.Notes));
            }
            else if (_user.Role == SandlerRoles.Coach)
            {
                //get data
                return db.ExecuteDataset("sp_GetAllContactsByCoachIDSearch", "Contacts",
                    new SqlParameter("@CoachID", _user.CoachID.ToString()),
                    new SqlParameter("@LastName", _contact.LastName),
                    new SqlParameter("@FirstName", _contact.FirstName),
                    new SqlParameter("@Title", _contact.Title),
                    new SqlParameter("@ContactsDepartment", _contact.ContactsDepartment),
                    new SqlParameter("@ContactsRole", _contact.ContactsRole),
                    new SqlParameter("@Phone", _contact.Phone),
                    new SqlParameter("@MobilePhone", _contact.MobilePhone),
                    new SqlParameter("@HomePhone", _contact.HomePhone),
                    new SqlParameter("@Fax", _contact.Fax),
                    new SqlParameter("@Email", _contact.Email),
                    new SqlParameter("@PersonalEmail", _contact.PersonalEmail),
                    new SqlParameter("@Address", _contact.Address),
                    new SqlParameter("@City", _contact.City),
                    new SqlParameter("@State", _contact.State),
                    new SqlParameter("@Zip", _contact.Zip),
                    new SqlParameter("@Country", _contact.Country),
                    new SqlParameter("@IsNewApptIdList", _contact.IsNewApptList),
                    new SqlParameter("@ApptSourceIdList", _contact.ApptSourceList),
                    new SqlParameter("@IsRegForTrainingList", _contact.IsRegisteredForTrainingList),
                    new SqlParameter("@CourseTypeIdList", _contact.CourseIdList),
                    new SqlParameter("@CompanyIdList", _contact.CompanyIdList),
                    new SqlParameter("@NeedCallBackList", _contact.IsNeedCallBackList),
                    new SqlParameter("@EmailSubscriptionList", _contact.IsEmailSubscriptionList),
                    new SqlParameter("@DiscussionTopic", _contact.DiscussionTopic),
                    new SqlParameter("@ActionStep", _contact.ActionStep),
                    new SqlParameter("@LastContactDate", _contact.LastContactDate),
                    new SqlParameter("@NextContactDate", _contact.NextContactDate),
                    new SqlParameter("@LastAttemptedDate", _contact.LastAttemptedDate),
                   new SqlParameter("@LastEmailedDate", _contact.LastEmailedDate),
                   new SqlParameter("@LastMeetingDate", _contact.LastMeetingDate),
                   new SqlParameter("@LetterSentDate", _contact.LetterSentDate),
                    new SqlParameter("@CourseTrngDate", _contact.CourseTrainingDate),
                    new SqlParameter("@BirthDayDate", _contact.BirthDay),
                    new SqlParameter("@AnniversaryDate", _contact.Anniversary),
                    new SqlParameter("@CompanyYears", _contact.CompanyYears),
                    new SqlParameter("@BossName", _contact.BossName),
                    new SqlParameter("@SpouseName", _contact.SpouseName),
                   new SqlParameter("@ReferredBy", _contact.ReferredBy),
                   new SqlParameter("@Notes", _contact.Notes));
            }
            else if (_user.Role == SandlerRoles.FranchiseeOwner || _user.Role == SandlerRoles.Client)
            {
                //now we have to bring records as per role - Franchisee Owner OR Client
                return db.ExecuteDataset("sp_GetAllContactsByFrIDSearch", "Contacts",
                    new SqlParameter("@FranchiseeID", _user.FranchiseeID.ToString()),
                    new SqlParameter("@LastName", _contact.LastName),
                    new SqlParameter("@FirstName", _contact.FirstName),
                    new SqlParameter("@Title", _contact.Title),
                    new SqlParameter("@ContactsDepartment", _contact.ContactsDepartment),
                    new SqlParameter("@ContactsRole", _contact.ContactsRole),
                    new SqlParameter("@Phone", _contact.Phone),
                    new SqlParameter("@MobilePhone", _contact.MobilePhone),
                    new SqlParameter("@HomePhone", _contact.HomePhone),
                    new SqlParameter("@Fax", _contact.Fax),
                    new SqlParameter("@Email", _contact.Email),
                    new SqlParameter("@PersonalEmail", _contact.PersonalEmail),
                    new SqlParameter("@Address", _contact.Address),
                    new SqlParameter("@City", _contact.City),
                    new SqlParameter("@State", _contact.State),
                    new SqlParameter("@Zip", _contact.Zip),
                    new SqlParameter("@Country", _contact.Country),
                    new SqlParameter("@IsNewApptIdList", _contact.IsNewApptList),
                    new SqlParameter("@ApptSourceIdList", _contact.ApptSourceList),
                    new SqlParameter("@IsRegForTrainingList", _contact.IsRegisteredForTrainingList),
                    new SqlParameter("@CourseTypeIdList", _contact.CourseIdList),
                    new SqlParameter("@CompanyIdList", _contact.CompanyIdList),
                    new SqlParameter("@NeedCallBackList", _contact.IsNeedCallBackList),
                    new SqlParameter("@EmailSubscriptionList", _contact.IsEmailSubscriptionList),
                    new SqlParameter("@DiscussionTopic", _contact.DiscussionTopic),
                    new SqlParameter("@ActionStep", _contact.ActionStep),
                    new SqlParameter("@LastContactDate", _contact.LastContactDate),
                    new SqlParameter("@NextContactDate", _contact.NextContactDate),
                    new SqlParameter("@LastAttemptedDate", _contact.LastAttemptedDate),
                   new SqlParameter("@LastEmailedDate", _contact.LastEmailedDate),
                   new SqlParameter("@LastMeetingDate", _contact.LastMeetingDate),
                   new SqlParameter("@LetterSentDate", _contact.LetterSentDate),
                    new SqlParameter("@CourseTrngDate", _contact.CourseTrainingDate),
                    new SqlParameter("@BirthDayDate", _contact.BirthDay),
                    new SqlParameter("@AnniversaryDate", _contact.Anniversary),
                    new SqlParameter("@CompanyYears", _contact.CompanyYears),
                    new SqlParameter("@BossName", _contact.BossName),
                    new SqlParameter("@SpouseName", _contact.SpouseName),
                   new SqlParameter("@ReferredBy", _contact.ReferredBy),
                   new SqlParameter("@Notes", _contact.Notes));
            }
            else
            {
                //This is for Franchisee User
                return db.ExecuteDataset("sp_GetAllContactsByUserIDSearch", "Contacts",
                    new SqlParameter("@UserID", _user.UserId.ToString()),
                    new SqlParameter("@LastName", _contact.LastName),
                    new SqlParameter("@FirstName", _contact.FirstName),
                    new SqlParameter("@Title", _contact.Title),
                    new SqlParameter("@ContactsDepartment", _contact.ContactsDepartment),
                    new SqlParameter("@ContactsRole", _contact.ContactsRole),
                    new SqlParameter("@Phone", _contact.Phone),
                    new SqlParameter("@MobilePhone", _contact.MobilePhone),
                    new SqlParameter("@HomePhone", _contact.HomePhone),
                    new SqlParameter("@Fax", _contact.Fax),
                    new SqlParameter("@Email", _contact.Email),
                    new SqlParameter("@PersonalEmail", _contact.PersonalEmail),
                    new SqlParameter("@Address", _contact.Address),
                    new SqlParameter("@City", _contact.City),
                    new SqlParameter("@State", _contact.State),
                    new SqlParameter("@Zip", _contact.Zip),
                    new SqlParameter("@Country", _contact.Country),
                    new SqlParameter("@IsNewApptIdList", _contact.IsNewApptList),
                    new SqlParameter("@ApptSourceIdList", _contact.ApptSourceList),
                    new SqlParameter("@IsRegForTrainingList", _contact.IsRegisteredForTrainingList),
                    new SqlParameter("@CourseTypeIdList", _contact.CourseIdList),
                    new SqlParameter("@CompanyIdList", _contact.CompanyIdList),
                    new SqlParameter("@NeedCallBackList", _contact.IsNeedCallBackList),
                    new SqlParameter("@EmailSubscriptionList", _contact.IsEmailSubscriptionList),
                    new SqlParameter("@DiscussionTopic", _contact.DiscussionTopic),
                    new SqlParameter("@ActionStep", _contact.ActionStep),
                    new SqlParameter("@LastContactDate", _contact.LastContactDate),
                    new SqlParameter("@NextContactDate", _contact.NextContactDate),
                    new SqlParameter("@LastAttemptedDate", _contact.LastAttemptedDate),
                   new SqlParameter("@LastEmailedDate", _contact.LastEmailedDate),
                   new SqlParameter("@LastMeetingDate", _contact.LastMeetingDate),
                   new SqlParameter("@LetterSentDate", _contact.LetterSentDate),
                    new SqlParameter("@CourseTrngDate", _contact.CourseTrainingDate),
                    new SqlParameter("@BirthDayDate", _contact.BirthDay),
                    new SqlParameter("@AnniversaryDate", _contact.Anniversary),
                    new SqlParameter("@CompanyYears", _contact.CompanyYears),
                    new SqlParameter("@BossName", _contact.BossName),
                    new SqlParameter("@SpouseName", _contact.SpouseName),
                   new SqlParameter("@ReferredBy", _contact.ReferredBy),
                   new SqlParameter("@Notes", _contact.Notes));
            }

        }

        public DataSet GetCallList(UserModel _user)
        {
            //Get the User Session
            
            //Get Call List for this user
            return db.ExecuteDataset("sp_GetCallList", "GetCallList",
                new SqlParameter("@Role", _user.Role.ToString()), new SqlParameter("@UserId", _user.UserId.ToString()),
                new SqlParameter("@FranchiseeId", _user.FranchiseeID), new SqlParameter("@RegionId", _user.RegionID));
        }

        public DataSet GetCourseInfo()
        {
            return db.ExecuteDataset("sp_GetCourseInfo", "CourseInfo");
        }

        public DataSet GetRegForTrainingOptions()
        {
            return db.ExecuteDataset("sp_GetRegForTrainingOptions", "RegForTrainingOptions");
        }

        public DataSet GetBlastEmailOptions()
        {
            return db.ExecuteDataset("sp_GetBlastEmailOptions", "BlastEmailOptions");
        }

        public DataSet GetApptSourceOptions()
        {
            return db.ExecuteDataset("sp_GetApptSourceOptions", "ApptSource");
        }

        public DataSet GetById(int id)
        {
            return db.ExecuteDataset("sp_GetContactDetails", "ContactByID", new SqlParameter("@ContactID", id));
        }

        public string IsValidStringEntered(string EnteredValue)
        {
            if (string.IsNullOrEmpty(EnteredValue))
            {
                EnteredValue = "";
            }
            return EnteredValue;
        }

        public void Insert(int COMPANIESID, string LastName, string FirstName,
            string Title, string ContactsDepartment, string ContactsRole,
            string Phone, string MobilePhone, string HomePhone, string Fax,
            string Email, string PersonalEmail, string Address, string City, string State, string Zip, string Country, int Value,
            int ApptSourceId, int RegForTrainingId, int CourseId, DateTime CourseTrngDate, string DiscussionTopic, string ACTIONSTEP,
            DateTime LastAttemptedDate, DateTime Last_Contact_Date, DateTime LastEmailedDate, DateTime LastMeetingDate, DateTime LetterSentDate,
            DateTime Next_Contact_Date, int CallBackValue, DateTime Birthday, string SpouseName, DateTime Anniversary, int CompanyYears, string BossName,
            string ReferredBy, string Notes, UserModel _user)
        {

            

            CourseTrngDate = IsValidDateCheck(CourseTrngDate);
            Last_Contact_Date = IsValidDateCheck(Last_Contact_Date);
            Next_Contact_Date = IsValidDateCheck(Next_Contact_Date);
            Birthday = IsValidDateCheck(Birthday);
            Anniversary = IsValidDateCheck(Anniversary);
            CourseTrngDate = IsValidDateCheck(CourseTrngDate);
            CourseTrngDate = IsValidDateCheck(CourseTrngDate);
            LastAttemptedDate = IsValidDateCheck(LastAttemptedDate);
            LastEmailedDate = IsValidDateCheck(LastEmailedDate);
            LastMeetingDate = IsValidDateCheck(LastMeetingDate);
            LetterSentDate = IsValidDateCheck(LetterSentDate);

            ReferredBy = IsValidStringEntered(ReferredBy);
            Notes = IsValidStringEntered(Notes);
            SpouseName = IsValidStringEntered(SpouseName);
            BossName = IsValidStringEntered(BossName);
            Title = IsValidStringEntered(Title);
            ContactsDepartment = IsValidStringEntered(ContactsDepartment);
            ContactsRole = IsValidStringEntered(ContactsRole);
            Phone = IsValidStringEntered(Phone);
            MobilePhone = IsValidStringEntered(MobilePhone);
            HomePhone = IsValidStringEntered(HomePhone);
            Fax = IsValidStringEntered(Fax);
            Email = IsValidStringEntered(Email);
            PersonalEmail = IsValidStringEntered(PersonalEmail);
            Address = IsValidStringEntered(Address);
            City = IsValidStringEntered(City);
            State = IsValidStringEntered(State);
            Zip = IsValidStringEntered(Zip);
            Country = IsValidStringEntered(Country);
            DiscussionTopic = IsValidStringEntered(DiscussionTopic);
            ACTIONSTEP = IsValidStringEntered(ACTIONSTEP);

            //Insert and create contact - Both are Avl
            db.ExecuteNonQuery("sp_InsertContact",
                new SqlParameter("@COMPANIESID", COMPANIESID),
                new SqlParameter("@LastName", LastName),
                new SqlParameter("@FirstName", FirstName), new SqlParameter("@Title", Title),
                new SqlParameter("@ContactsDepartment", ContactsDepartment), new SqlParameter("@ContactsRole", ContactsRole),
                new SqlParameter("@Phone", Phone), new SqlParameter("@MobilePhone", MobilePhone),
                new SqlParameter("@HomePhone", HomePhone), new SqlParameter("@Fax", Fax),
                new SqlParameter("@Email", Email), new SqlParameter("@PersonalEmail", PersonalEmail),
                new SqlParameter("@Address", Address), new SqlParameter("@City", City),
                new SqlParameter("@State", State), new SqlParameter("@Zip", Zip),
                new SqlParameter("@Country", Country),
                new SqlParameter("@Value", Value), new SqlParameter("@ApptSourceId", ApptSourceId),
                new SqlParameter("@RegForTrainingId", RegForTrainingId), new SqlParameter("@CourseId", CourseId),
                new SqlParameter("@CourseTrngDate", CourseTrngDate), new SqlParameter("@DiscussionTopic", DiscussionTopic),
                new SqlParameter("@ACTIONSTEP", ACTIONSTEP),
                new SqlParameter("@LastAttemptedDate", LastAttemptedDate),
                new SqlParameter("@LastEmailedDate", LastEmailedDate),
                new SqlParameter("@LastMeetingDate", LastMeetingDate),
                new SqlParameter("@LetterSentDate", LetterSentDate),
                new SqlParameter("@Last_Contact_Date", Last_Contact_Date),
                new SqlParameter("@Next_Contact_Date", Next_Contact_Date), new SqlParameter("@CreatedBy", _user.UserId),
                new SqlParameter("@CallBackValue", CallBackValue),
                new SqlParameter("@Birthday", Birthday), new SqlParameter("@Anniversary", Anniversary),
                new SqlParameter("@CompanyYears", CompanyYears), new SqlParameter("@BossName", BossName),
                new SqlParameter("@SpouseName", SpouseName),
                new SqlParameter("@ReferredBy", ReferredBy),
                new SqlParameter("@Notes", Notes));

            UserEntitiesFactory.ReLoad();
        }

        public DateTime IsValidDateCheck(DateTime inputDate)
        {
            if (inputDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                return default(System.DateTime).AddYears(1754);
            }
            return inputDate;
        }

        public void Update(int Contactsid, int CompanyID, string LastName, string FirstName,
            string Title, string ContactsDepartment, string ContactsRole, string Phone,
            string MobilePhone, string HomePhone, string Fax, string Email, string PersonalEmail,
            string Address, string City, string State, string Zip, string Country,
            string DiscussionTopic, string ActionStep,
            DateTime LastAttemptedDate, DateTime LastEmailedDate, DateTime LastMeetingDate, DateTime LetterSentDate,
            int IsRegisteredForTrng, int IsNewAppt, int CourseId,
            int AppsSourceId, DateTime LastDate, DateTime NextDate, DateTime CourseTrngDate, int BlastEmailSubscription, int CallBackValue, DateTime BirthDate,
            DateTime AnniversaryDate, int CompanyYears, string BossName, string SpouseName, string ReferredBy, string Notes, UserModel _user)
        {
            
            //date fields
            CourseTrngDate = IsValidDateCheck(CourseTrngDate);
            LastDate = IsValidDateCheck(LastDate);
            NextDate = IsValidDateCheck(NextDate);
            BirthDate = IsValidDateCheck(BirthDate);
            AnniversaryDate = IsValidDateCheck(AnniversaryDate);
            CourseTrngDate = IsValidDateCheck(CourseTrngDate);
            CourseTrngDate = IsValidDateCheck(CourseTrngDate);
            LastAttemptedDate = IsValidDateCheck(LastAttemptedDate);
            LastEmailedDate = IsValidDateCheck(LastEmailedDate);
            LastMeetingDate = IsValidDateCheck(LastMeetingDate);
            LetterSentDate = IsValidDateCheck(LetterSentDate);
            //string fields
            ReferredBy = IsValidStringEntered(ReferredBy);
            Notes = IsValidStringEntered(Notes);
            SpouseName = IsValidStringEntered(SpouseName);
            BossName = IsValidStringEntered(BossName);
            Title = IsValidStringEntered(Title);
            ContactsDepartment = IsValidStringEntered(ContactsDepartment);
            ContactsRole = IsValidStringEntered(ContactsRole);
            Phone = IsValidStringEntered(Phone);
            MobilePhone = IsValidStringEntered(MobilePhone);
            HomePhone = IsValidStringEntered(HomePhone);
            Fax = IsValidStringEntered(Fax);
            Email = IsValidStringEntered(Email);
            PersonalEmail = IsValidStringEntered(PersonalEmail);
            Address = IsValidStringEntered(Address);
            City = IsValidStringEntered(City);
            State = IsValidStringEntered(State);
            Zip = IsValidStringEntered(Zip);
            Country = IsValidStringEntered(Country);
            DiscussionTopic = IsValidStringEntered(DiscussionTopic);
            ActionStep = IsValidStringEntered(ActionStep);

            //Both Are Avl
            db.ExecuteNonQuery("sp_UpdateContactDetails",
                   new SqlParameter("@ContactsID", Contactsid),
                   new SqlParameter("@CompanyID", CompanyID),
                   new SqlParameter("@LastName", LastName),
                   new SqlParameter("@FirstName", FirstName),
                   new SqlParameter("@Title", Title),
                   new SqlParameter("@ContactsDepartment", ContactsDepartment),
                   new SqlParameter("@ContactsRole", ContactsRole),
                   new SqlParameter("@Phone", Phone),
                   new SqlParameter("@MobilePhone", MobilePhone),
                   new SqlParameter("@HomePhone", HomePhone),
                   new SqlParameter("@Fax", Fax),
                   new SqlParameter("@Email", Email),
                   new SqlParameter("@PersonalEmail", PersonalEmail),
                   new SqlParameter("@Address", Address), new SqlParameter("@City", City),
                   new SqlParameter("@State", State), new SqlParameter("@Zip", Zip),
                   new SqlParameter("@Country", Country),
                   new SqlParameter("@DiscussionTopic", DiscussionTopic),
                   new SqlParameter("@ActionStep", ActionStep),
                   new SqlParameter("@LastAttemptedDate", LastAttemptedDate),
                   new SqlParameter("@LastEmailedDate", LastEmailedDate),
                   new SqlParameter("@LastMeetingDate", LastMeetingDate),
                   new SqlParameter("@LetterSentDate", LetterSentDate),
                   new SqlParameter("@IsRegisteredForTrng", IsRegisteredForTrng),
                   new SqlParameter("@IsNewAppt", IsNewAppt),
                   new SqlParameter("@CourseId", CourseId),
                   new SqlParameter("@AppsSourceId", AppsSourceId),
                   new SqlParameter("@LastDate", LastDate),
                   new SqlParameter("@NextDate", NextDate),
                   new SqlParameter("@CourseTrngDate", CourseTrngDate),
                   new SqlParameter("@UpdatedBy", _user.UserId),
                   new SqlParameter("@BlastEmailSubscription", BlastEmailSubscription),
                   new SqlParameter("@CallBackValue", CallBackValue),
                   new SqlParameter("@BirthDate", BirthDate),
                   new SqlParameter("@AnniversaryDate", AnniversaryDate),
                   new SqlParameter("@CompanyYears", CompanyYears),
                   new SqlParameter("@BossName", BossName),
                   new SqlParameter("@SpouseName", SpouseName),
                   new SqlParameter("@ReferredBy", ReferredBy),
                   new SqlParameter("@Notes", Notes));

            UserEntitiesFactory.ReLoad();
        }

        public SqlDataReader GetNewAppointments(int month, int year, string userId)
        {
            SqlDataReader newAppointments = null;
            try
            {
                newAppointments = db.ExecuteReader("sp_GetNewAppointmentsWithAppointmentSource", new SqlParameter("@month", month), new SqlParameter("@year", year), new SqlParameter("@userId", userId));
            }
            catch (Exception ex)
            {
            }
            return newAppointments;
        }
    }
}