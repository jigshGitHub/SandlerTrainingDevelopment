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
        public DataSet GetAll(int COMPANIESID)
        {
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];

            if (COMPANIESID == 0)
            {
                if (_user.Role == SandlerRoles.SiteAdmin || _user.Role == SandlerRoles.Corporate)
                {
                    return db.ExecuteDataset("sp_GetAllContacts", "Contacts");
                }
                else if (_user.Role == SandlerRoles.Coach)
                {
                    return db.ExecuteDataset("sp_GetAllContactsByCoachID", "Contacts", new SqlParameter("@CoachID", _user.CoachID));
                }
                else if (_user.Role == SandlerRoles.FranchiseeOwner)
                {
                    //now we have to bring records as per role - Franchisee Owner
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
                    System.Data.DataSet ds = db.ExecuteDataset("sp_GetAllContactsForCompByUserID", "Contacts", new SqlParameter("@UserID", _user.UserId), new SqlParameter("@CompanyID", COMPANIESID));
                    return ds;
                }

            }

        }

        public DataSet GetAllForSearch()
        {
            //get the User Info
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];
            SandlerModels.DataIntegration.Contact _contact = (SandlerModels.DataIntegration.Contact)HttpContext.Current.Session["ContactSearchCriteria"];
            //date fields
            if (_contact.LastContactDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                _contact.LastContactDate = default(System.DateTime).AddYears(1754);
            }
            if (_contact.NextContactDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                _contact.NextContactDate = default(System.DateTime).AddYears(1754);
            }
            if (_contact.CourseTrainingDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                _contact.CourseTrainingDate = default(System.DateTime).AddYears(1754);
            }
            if (_contact.BirthDay.ToString() == "1/1/0001 12:00:00 AM")
            {
                _contact.BirthDay = default(System.DateTime).AddYears(1754);
            }
            if (_contact.Anniversary.ToString() == "1/1/0001 12:00:00 AM")
            {
                _contact.Anniversary = default(System.DateTime).AddYears(1754);
            }
            //Now perform search based on User role
            if (_user.Role == SandlerRoles.SiteAdmin || _user.Role == SandlerRoles.Corporate)
            {
                //get data
                return db.ExecuteDataset("sp_GetAllContactsSearch", "Contacts",
                    new SqlParameter("@LastName", _contact.LastName),
                    new SqlParameter("@FirstName", _contact.FirstName),
                    new SqlParameter("@Phone", _contact.Phone),
                    new SqlParameter("@Email", _contact.Email),
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
                    new SqlParameter("@CourseTrngDate", _contact.CourseTrainingDate),
                    new SqlParameter("@BirthDayDate", _contact.BirthDay),
                    new SqlParameter("@AnniversaryDate", _contact.Anniversary),
                    new SqlParameter("@CompanyYears", _contact.CompanyYears),
                    new SqlParameter("@BossName", _contact.BossName));
            }
            else if (_user.Role == SandlerRoles.Coach)
            {
                //get data
                return db.ExecuteDataset("sp_GetAllContactsByCoachIDSearch", "Contacts",
                    new SqlParameter("@CoachID", _user.CoachID.ToString()),
                    new SqlParameter("@LastName", _contact.LastName),
                    new SqlParameter("@FirstName", _contact.FirstName),
                    new SqlParameter("@Phone", _contact.Phone),
                    new SqlParameter("@Email", _contact.Email),
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
                    new SqlParameter("@CourseTrngDate", _contact.CourseTrainingDate),
                    new SqlParameter("@BirthDayDate", _contact.BirthDay),
                    new SqlParameter("@AnniversaryDate", _contact.Anniversary),
                    new SqlParameter("@CompanyYears", _contact.CompanyYears),
                    new SqlParameter("@BossName", _contact.BossName));
            }
            else if (_user.Role == SandlerRoles.FranchiseeOwner)
            {
                //now we have to bring records as per role - Franchisee Owner
                return db.ExecuteDataset("sp_GetAllContactsByFrIDSearch", "Contacts",
                    new SqlParameter("@FranchiseeID", _user.FranchiseeID.ToString()),
                    new SqlParameter("@LastName", _contact.LastName),
                    new SqlParameter("@FirstName", _contact.FirstName),
                    new SqlParameter("@Phone", _contact.Phone),
                    new SqlParameter("@Email", _contact.Email),
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
                    new SqlParameter("@CourseTrngDate", _contact.CourseTrainingDate),
                    new SqlParameter("@BirthDayDate", _contact.BirthDay),
                    new SqlParameter("@AnniversaryDate", _contact.Anniversary),
                    new SqlParameter("@CompanyYears", _contact.CompanyYears),
                    new SqlParameter("@BossName", _contact.BossName));
            }
            else
            {
                //This is for Franchisee User
                return db.ExecuteDataset("sp_GetAllContactsByUserIDSearch", "Contacts",
                    new SqlParameter("@UserID", _user.UserId.ToString()),
                    new SqlParameter("@LastName", _contact.LastName),
                    new SqlParameter("@FirstName", _contact.FirstName),
                    new SqlParameter("@Phone", _contact.Phone),
                    new SqlParameter("@Email", _contact.Email),
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
                    new SqlParameter("@CourseTrngDate", _contact.CourseTrainingDate),
                    new SqlParameter("@BirthDayDate", _contact.BirthDay),
                    new SqlParameter("@AnniversaryDate", _contact.Anniversary),
                    new SqlParameter("@CompanyYears", _contact.CompanyYears),
                    new SqlParameter("@BossName", _contact.BossName));
            }

        }

        public DataSet GetCallList()
        {
            //Get the User Session
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];
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
        public void Insert(int COMPANIESID, string LastName, string FirstName, string Phone, string Email, int Value,
            int ApptSourceId, int RegForTrainingId, int CourseId, DateTime CourseTrngDate, string DiscussionTopic, string ACTIONSTEP,
            DateTime Last_Contact_Date, DateTime Next_Contact_Date, int CallBackValue, DateTime Birthday, DateTime Anniversary, int CompanyYears, string BossName)
        {

            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];

            if (CourseTrngDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                CourseTrngDate = default(System.DateTime).AddYears(1754);
            }

            if (Last_Contact_Date.ToString() == "1/1/0001 12:00:00 AM")
            {
                Last_Contact_Date = default(System.DateTime).AddYears(1754);
            }

            if (Birthday.ToString() == "1/1/0001 12:00:00 AM")
            {
                Birthday = default(System.DateTime).AddYears(1754);
            }

            if (Anniversary.ToString() == "1/1/0001 12:00:00 AM")
            {
                Anniversary = default(System.DateTime).AddYears(1754);
            }

            if (string.IsNullOrEmpty(BossName))
            {
                BossName = "";
            }

            //Insert and create contact - Both are Avl
            db.ExecuteNonQuery("sp_InsertContact",
                new SqlParameter("@COMPANIESID", COMPANIESID), new SqlParameter("@LastName", LastName), new SqlParameter("@FirstName", FirstName),
                new SqlParameter("@Phone", Phone), new SqlParameter("@Email", Email), new SqlParameter("@Value", Value),
                new SqlParameter("@ApptSourceId", ApptSourceId), new SqlParameter("@RegForTrainingId", RegForTrainingId),
                new SqlParameter("@CourseId", CourseId), new SqlParameter("@CourseTrngDate", CourseTrngDate),
                new SqlParameter("@DiscussionTopic", DiscussionTopic), new SqlParameter("@ACTIONSTEP", ACTIONSTEP),
                new SqlParameter("@Last_Contact_Date", Last_Contact_Date), new SqlParameter("@Next_Contact_Date", Next_Contact_Date),
                new SqlParameter("@CreatedBy", _user.UserId), new SqlParameter("@CallBackValue", CallBackValue),
                new SqlParameter("@Birthday", Birthday),
                new SqlParameter("@Anniversary", Anniversary),
                new SqlParameter("@CompanyYears", CompanyYears),
                new SqlParameter("@BossName", BossName));



            UserEntitiesFactory.ReLoad();
        }


        public void Update(int Contactsid, int CompanyID, string LastName, string FirstName, string Phone, string Email,
            string DiscussionTopic, string ActionStep, int IsRegisteredForTrng, int IsNewAppt, int CourseId,
            int AppsSourceId,
            DateTime LastDate, DateTime NextDate, DateTime CourseTrngDate, int BlastEmailSubscription, int CallBackValue, DateTime BirthDate, DateTime AnniversaryDate, int CompanyYears, string BossName)
        {
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];

            if (CourseTrngDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                CourseTrngDate = default(System.DateTime).AddYears(1754);
            }

            if (LastDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                LastDate = default(System.DateTime).AddYears(1754);
            }

            if (BirthDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                BirthDate = default(System.DateTime).AddYears(1754);
            }

            if (AnniversaryDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                AnniversaryDate = default(System.DateTime).AddYears(1754);
            }

            if (string.IsNullOrEmpty(BossName))
            {
                BossName = "";
            }

            //Both Are Avl
            db.ExecuteNonQuery("sp_UpdateContactDetails",
                   new SqlParameter("@ContactsID", Contactsid),
                   new SqlParameter("@CompanyID", CompanyID),
                   new SqlParameter("@LastName", LastName),
                   new SqlParameter("@FirstName", FirstName),
                   new SqlParameter("@Phone", Phone),
                   new SqlParameter("@Email", Email),
                   new SqlParameter("@DiscussionTopic", DiscussionTopic),
                   new SqlParameter("@ActionStep", ActionStep),
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
                   new SqlParameter("@BossName", BossName));

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