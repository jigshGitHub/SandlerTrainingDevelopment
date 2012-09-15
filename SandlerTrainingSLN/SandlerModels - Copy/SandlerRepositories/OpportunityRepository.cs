using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using SandlerModels;


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

        public SqlDataReader GetByUserId(string userId)
        {
            SqlDataReader opportunties = null;
            try
            {
                opportunties = db.ExecuteReader("sp_GetOpportunities", new SqlParameter("@userId", userId));
            }
            catch (Exception ex)
            {
            }
            return opportunties;
        }
        
        public DataSet GetByCompId(int COMPANIESID)
        {
            //Get the User Info
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];
            if (_user.Role != SandlerRoles.FranchiseeUser)
            {
                System.Data.DataSet ds = db.ExecuteDataset("sp_GetAllOpportunitiesByID", "Opportunities", new SqlParameter("@CompanyID", COMPANIESID));
                return ds;
            }
            else
            {
                System.Data.DataSet ds = db.ExecuteDataset("sp_GetAllOpportunitiesByUserID", "Opportunities", new SqlParameter("@CompanyID", COMPANIESID), new SqlParameter("@UserID", _user.UserId));
                return ds;
            }
            
        }
    }
}