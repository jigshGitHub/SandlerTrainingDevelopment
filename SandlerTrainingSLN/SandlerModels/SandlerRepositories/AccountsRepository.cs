using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;


/// <summary>
/// 
/// </summary>
namespace SandlerRepositories
{
    public class AccountsRepository
    {
        DBFactory db = new DBFactory();
        public AccountsRepository()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public DataSet GetAll()
        {
            return (db.ExecuteDataset("sp_GetAllAccounts", "Accounts"));
        }
        public DataSet GetById(int id)
        {
            return db.ExecuteDataset("sp_GetAccountDetails", "AccountByID", new SqlParameter("@AccountID",id));
        }
        public void Insert(string Company_Name, string Account_Name, string Sales_Rep, int Account_Value, string Comment, string ACTION_STEP, DateTime Last_Contact_Date, DateTime Next_Contact_Date, string Product)
        {

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
                db.ExecuteNonQuery("sp_InsertAccountSpecial", new SqlParameter("@CompanyName", Company_Name), new SqlParameter("@ActName", Account_Name), new SqlParameter("@Sales_Rep", Sales_Rep), new SqlParameter("@LastDate", Last_Contact_Date), new SqlParameter("@Comment", Comment), new SqlParameter("@ActionStep", ACTION_STEP), new SqlParameter("@Account_Value", Account_Value), new SqlParameter("@Product", Product));
            }
            else
            {
                db.ExecuteNonQuery("sp_InsertAccount", new SqlParameter("@CompanyName", Company_Name), new SqlParameter("@ActName", Account_Name), new SqlParameter("@Sales_Rep", Sales_Rep), new SqlParameter("@LastDate", Last_Contact_Date), new SqlParameter("@NextDate", Next_Contact_Date), new SqlParameter("@Comment", Comment), new SqlParameter("@ActionStep", ACTION_STEP), new SqlParameter("@Account_Value", Account_Value), new SqlParameter("@Product", Product));

            }

        }
        public void Update(int id,string Company_Name, string Account_Name, string Sales_Rep, string Account_Value, string Comment, string ACTION_STEP, DateTime Last_Contact_Date, DateTime Next_Contact_Date, string Product)
        {

            if (Next_Contact_Date.ToString() == "1/1/0001 12:00:00 AM")
            {
                db.ExecuteNonQuery("sp_UpdateAccountDetailsSpecial", new SqlParameter("@AccountID", id), new SqlParameter("@CompanyName", Company_Name), new SqlParameter("@AccountName", Account_Name), new SqlParameter("@Product", Product), new SqlParameter("@LastDate", Last_Contact_Date), new SqlParameter("@Comment", Comment), new SqlParameter("@ActionStep", ACTION_STEP), new SqlParameter("@ActValue", Account_Value), new SqlParameter("@SalesRep", Sales_Rep));
            }
            else
            {
                db.ExecuteNonQuery("sp_UpdateAccountDetails", new SqlParameter("@AccountID", id), new SqlParameter("@CompanyName", Company_Name), new SqlParameter("@AccountName", Account_Name), new SqlParameter("@Product", Product), new SqlParameter("@LastDate", Last_Contact_Date), new SqlParameter("@NextDate", Next_Contact_Date), new SqlParameter("@Comment", Comment), new SqlParameter("@ActionStep", ACTION_STEP), new SqlParameter("@ActValue", Account_Value), new SqlParameter("@SalesRep", Sales_Rep));
            }

        }

    }
}