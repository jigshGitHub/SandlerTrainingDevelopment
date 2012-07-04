using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Sandler.Data;
using Sandler.Data.Utility;
using System.Data;
using System.Data.SqlClient; 

/// <summary>
/// Summary description for AccountsDAL
/// </summary>
public class AccountsDAL
{
    DBUtility db = new DBUtility();
    public AccountsDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataSet GetAllAccounts()
    {
        return (db.ExecuteDataset("sp_GetAllAccounts", "Accounts"));
    }
    public void InsertAccount(string Company_Name, string Account_Name, string Sales_Rep, int Account_Value, string Comment, string ACTION_STEP, DateTime Last_Contact_Date, DateTime Next_Contact_Date, string Product)
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
        
}