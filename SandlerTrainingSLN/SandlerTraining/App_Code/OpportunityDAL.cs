using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Sandler.Data;
using Sandler.Data.Utility;
using System.Data;
using System.Data.SqlClient; 


/// <summary>
/// Summary description for OpportunityDAL
/// </summary>
public class OpportunityDAL
{
    DBUtility db = new DBUtility();
    public OpportunityDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataSet GetAllOpportunitiesFordocument()
    {
        return (db.ExecuteDataset("sp_GetAllOpportunities", "Opportunities"));
        
    }
    public DataSet GetAllOpportunities(int ID)
    {
        if (ID == 0)
        {
            return (db.ExecuteDataset("sp_GetAllOpportunities", "Opportunities"));
        }
        else
        {
            System.Data.DataSet ds = db.ExecuteDataset("sp_GetAllOpportunitiesByID", "Opportunities", new SqlParameter("@CompanyID", ID));
            return ds;
        }

    }
    public DataSet GetOpportunitiesById(int ID)
    {
       System.Data.DataSet ds = db.ExecuteDataset("sp_GetAllOpportunitiesByID", "Opportunities", new SqlParameter("@CompanyID", ID));
       return ds;
       
    }
        
    public void InsertOpportunity(int ID, int Acct_ID, string Opp_Name, string Sales_Rep, string Rep_Phone,string Comp_Contact, string Comp_Phone, string Email, string Acct_Opp_Status,int Total_Value,int Weighted_Value, string Win_Probability,   DateTime Close_Date )
    {
        if (string.IsNullOrEmpty(Comp_Phone))
        {
            Comp_Phone = "";
        }
        if (string.IsNullOrEmpty(Rep_Phone))
        {
            Rep_Phone = "";
        }
        if (string.IsNullOrEmpty(Acct_Opp_Status))
        {
            Acct_Opp_Status = "";
        }
        if (string.IsNullOrEmpty(Win_Probability))
        {
            Win_Probability = "";
        }
       
        if (Close_Date.ToString() == "1/1/0001 12:00:00 AM")
        {
            
            db.ExecuteNonQuery("sp_InsertOpportunitySpecial",
               new SqlParameter("@CompanyID", ID), new SqlParameter("@OppName", Opp_Name),
               new SqlParameter("@SalesPhone", Rep_Phone), new SqlParameter("@SalesRep", Sales_Rep),
               new SqlParameter("@CompContact", Comp_Contact), new SqlParameter("@CompPhone", Comp_Phone),
               new SqlParameter("@CompEmail", Email), new SqlParameter("@WeightedValue", Weighted_Value),
               new SqlParameter("@WinProbability", Win_Probability),
               new SqlParameter("@AcctOppStatus", Acct_Opp_Status),
           new SqlParameter("@AcctID", Acct_ID),
           new SqlParameter("@TotalActValue", Total_Value));
        }
        else
        {
        	          
            db.ExecuteNonQuery("sp_InsertOpportunity", 
                new SqlParameter("@CompanyID", ID), new SqlParameter("@OppName", Opp_Name),
                new SqlParameter("@SalesPhone", Rep_Phone), new SqlParameter("@SalesRep", Sales_Rep), 
                new SqlParameter("@CompContact", Comp_Contact), new SqlParameter("@CompPhone", Comp_Phone), 
                new SqlParameter("@CompEmail", Email), new SqlParameter("@WeightedValue", Weighted_Value), 
                new SqlParameter("@WinProbability", Win_Probability),
                new SqlParameter("@AcctOppStatus", Acct_Opp_Status),
            new SqlParameter("@AcctID", Acct_ID),
            new SqlParameter("@CloseDate", Close_Date),
            new SqlParameter("@TotalActValue", Total_Value));

        }



    }
}