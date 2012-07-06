using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;



/// <summary>
/// Summary description for OpportunityDAL
/// </summary>
namespace SandlerRepositories
{
    public class OpportunityRepository
    {
        DBFactory db = new DBFactory();
        public OpportunityRepository()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public DataSet GetAllForDocument()
        {
            return (db.ExecuteDataset("sp_GetAllOpportunities", "Opportunities"));

        }
        public DataSet GetAll(int ID)
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
        public DataSet GetById(int ID)
        {
            System.Data.DataSet ds = db.ExecuteDataset("sp_GetAllOpportunitiesByID", "Opportunities", new SqlParameter("@CompanyID", ID));
            return ds;

        }
        public DataSet GetDetailsById(int ID)
        {
            return db.ExecuteDataset("sp_GetOpportunityDetails", "OppByID", new SqlParameter("@OppID",ID));
        }
        public void Insert(int ID, int Acct_ID, string Opp_Name, string Sales_Rep, string Rep_Phone, string Comp_Contact, string Comp_Phone, string Email, string Acct_Opp_Status, int Total_Value, int Weighted_Value, string Win_Probability, DateTime Close_Date)
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

        public void Update(int ID, int Acct_ID, string Opp_Name, string Sales_Rep, string Rep_Phone, string Comp_Contact, string Comp_Phone, string Email, string Acct_Opp_Status, string Total_Value, string Weighted_Value, string Win_Probability, DateTime CloseDate)
        {
            if (CloseDate.ToString() == "1/1/0001 12:00:00 AM")
            {

                db.ExecuteNonQuery("sp_UpdateOpportunityDetailsSpecial", new SqlParameter("@OppId", ID), new SqlParameter("@CompanyID", Acct_ID),
                    new SqlParameter("@OppName", Opp_Name), new SqlParameter("@SalesPhone", Rep_Phone),
                    new SqlParameter("@SalesRep", Sales_Rep), new SqlParameter("@CompContact", Comp_Contact),
                    new SqlParameter("@CompPhone", Comp_Phone), new SqlParameter("@CompEmail", Email),
                    new SqlParameter("@WeightedValue", Weighted_Value), new SqlParameter("@WinProbability", Win_Probability),
                    new SqlParameter("@AcctOppStatus", Acct_Opp_Status), new SqlParameter("@AcctID", Acct_ID),
                    new SqlParameter("@TotalActValue", Total_Value));
            }
            else
            {
                db.ExecuteNonQuery("sp_UpdateOpportunityDetails", new SqlParameter("@OppId", ID), new SqlParameter("@CompanyID", Acct_ID),
                     new SqlParameter("@OppName", Opp_Name), new SqlParameter("@SalesPhone", Rep_Phone),
                    new SqlParameter("@SalesRep", Sales_Rep), new SqlParameter("@CompContact", Comp_Contact),
                    new SqlParameter("@CompPhone", Comp_Phone), new SqlParameter("@CompEmail", Email),
                    new SqlParameter("@WeightedValue", Weighted_Value), new SqlParameter("@WinProbability", Win_Probability),
                    new SqlParameter("@AcctOppStatus", Acct_Opp_Status), new SqlParameter("@AcctID", Acct_ID),
                    new SqlParameter("@CloseDate", CloseDate), new SqlParameter("@TotalActValue", Total_Value));

            }
        }
    }
}