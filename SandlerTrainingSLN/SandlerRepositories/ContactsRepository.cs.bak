using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;



/// <summary>
/// Summary description for ContactsDAL
/// </summary>
namespace SandlerRepositories
{
    public class ContactsRepository
    {
        DBFactory db = new DBFactory();
        public ContactsRepository()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public DataSet GetAll(int ID)
        {
            if (ID == 0)
            {
                return (db.ExecuteDataset("sp_GetAllContacts", "Contacts"));
            }
            else
            {
                System.Data.DataSet ds = db.ExecuteDataset("sp_GetAllContactsByID", "Contacts", new SqlParameter("@CompanyID", ID));
                return ds;
            }

        }
        public DataSet GetAllCompanies()
        {
            return (db.ExecuteDataset("sp_GetAllCompanies", "Companies"));
        }
        public DataSet GetById(int id)
        {
            return db.ExecuteDataset("sp_GetContactDetails", "ContactByID", new SqlParameter("@ContactID", id));
        }
        public void Insert(int ID, string Full_Name, string Email, string Phone, int Total_ACT_Value, string Comment, string ACTION_STEP, DateTime Last_Contact_Date, DateTime Next_Contact_Date)
        {
            if (string.IsNullOrEmpty(Email))
            {
                Email = "";
            }
            if (string.IsNullOrEmpty(Phone))
            {
                Phone = "";
            }
            if (string.IsNullOrEmpty(Comment))
            {
                Comment = "";
            }
            if (string.IsNullOrEmpty(ACTION_STEP))
            {
                ACTION_STEP = "";
            }
            if (Next_Contact_Date.ToString() == "1/1/0001 12:00:00 AM")
            {
                db.ExecuteNonQuery("sp_InsertContactSpecial", new SqlParameter("@FullName", Full_Name), new SqlParameter("@Phone", Phone), new SqlParameter("@Email", Email), new SqlParameter("@LastDate", Last_Contact_Date), new SqlParameter("@CompanyID", ID), new SqlParameter("@Comment", Comment), new SqlParameter("@ActionStep", ACTION_STEP), new SqlParameter("@TotalActValue", Total_ACT_Value));
            }
            else
            {
                db.ExecuteNonQuery("sp_InsertContact", new SqlParameter("@FullName", Full_Name), new SqlParameter("@Phone", Phone), new SqlParameter("@Email", Email), new SqlParameter("@LastDate", Last_Contact_Date), new SqlParameter("@NextDate", Next_Contact_Date), new SqlParameter("@CompanyID", ID), new SqlParameter("@Comment", Comment), new SqlParameter("@ActionStep", ACTION_STEP), new SqlParameter("@TotalActValue", Total_ACT_Value));

            }

        }

        public void Update(int id, string FullName, string PhoneNumber, string Email, string TotalAccountValue, string Comment, string ActionStep, DateTime LastDate, string CompanyID, DateTime NextDate)
        {
            if (NextDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                db.ExecuteNonQuery("sp_UpdateContactDetailsSpecial", new SqlParameter("@ContactID", id), new SqlParameter("@FullName", FullName), new SqlParameter("@Phone", PhoneNumber), new SqlParameter("@Email", Email), new SqlParameter("@LastDate", LastDate), new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@Comment", Comment), new SqlParameter("@ActionStep", ActionStep), new SqlParameter("@TotalActValue", TotalAccountValue));
            }
            else
            {
                db.ExecuteNonQuery("sp_UpdateContactDetails", new SqlParameter("@ContactID",id), new SqlParameter("@FullName", FullName), new SqlParameter("@Phone", PhoneNumber), new SqlParameter("@Email", Email), new SqlParameter("@LastDate", LastDate), new SqlParameter("@NextDate", NextDate), new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@Comment", Comment), new SqlParameter("@ActionStep", ActionStep), new SqlParameter("@TotalActValue", TotalAccountValue));

            }
        }
    }
}