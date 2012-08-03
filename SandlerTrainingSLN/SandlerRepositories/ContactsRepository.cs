using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

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
                if (_user.Role == SandlerRoles.SiteAdmin)
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
                    System.Data.DataSet ds = db.ExecuteDataset("sp_GetAllContactsForCompByUserID", "Contacts", new SqlParameter("@UserID", _user.UserId),new SqlParameter("@CompanyID", COMPANIESID));
                    return ds;
                }
                
            }

        }

        public DataSet GetCourseInfo()
        {
            return db.ExecuteDataset("sp_GetCourseInfo", "CourseInfo");
        }

        public DataSet GetRegForTrainingOptions()
        {
            return db.ExecuteDataset("sp_GetRegForTrainingOptions", "RegForTrainingOptions");
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
            DateTime Last_Contact_Date, DateTime Next_Contact_Date)
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

                //Insert and create contact - Both are Avl
                db.ExecuteNonQuery("sp_InsertContact",
                    new SqlParameter("@COMPANIESID", COMPANIESID), new SqlParameter("@LastName", LastName), new SqlParameter("@FirstName", FirstName),
                    new SqlParameter("@Phone", Phone), new SqlParameter("@Email", Email), new SqlParameter("@Value", Value),
                    new SqlParameter("@ApptSourceId", ApptSourceId), new SqlParameter("@RegForTrainingId", RegForTrainingId),
                    new SqlParameter("@CourseId", CourseId), new SqlParameter("@CourseTrngDate", CourseTrngDate),
                    new SqlParameter("@DiscussionTopic", DiscussionTopic), new SqlParameter("@ACTIONSTEP", ACTIONSTEP),
                    new SqlParameter("@Last_Contact_Date", Last_Contact_Date), new SqlParameter("@Next_Contact_Date", Next_Contact_Date),
                    new SqlParameter("@CreatedBy", _user.UserId));
            

        }

        
        public void Update(int Contactsid, int CompanyID, string LastName, string FirstName,string Phone, string Email,
            string DiscussionTopic, string ActionStep, int IsRegisteredForTrng, int IsNewAppt, int CourseId,
            int AppsSourceId,
            DateTime LastDate, DateTime NextDate, DateTime CourseTrngDate)
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
                    new SqlParameter("@UpdatedBy", _user.UserId));

            
        }
    }
}