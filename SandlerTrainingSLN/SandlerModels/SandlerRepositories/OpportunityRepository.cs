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
    public partial class OpportunityRepository
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

        public SqlDataReader GetSalesCyclePortfolioData(string userId)
        {
            SqlDataReader newAppointments = null;
            try
            {
                newAppointments = db.ExecuteReader("sp_GetSalesCyclePortfolioData", new SqlParameter("@userId", userId));
            }
            catch (Exception ex)
            {
            }
            return newAppointments;
        }

        public SqlDataReader GetBenchMarkSalesFranchiseeData(int month, int year, int franchiseeId)
        {
            SqlDataReader data = null;
            try
            {
                data = db.ExecuteReader("sp_GetBenchMarkSalesFranchisee", new SqlParameter("@month", month), new SqlParameter("@year", year), new SqlParameter("@franchiseeId", franchiseeId));
            }
            catch (Exception ex)
            {
            }
            return data;
        }

        public SqlDataReader GetBenchMarkFranchiseeRegionsData(int month, int year, int franchiseeId)
        {
            SqlDataReader data = null;
            try
            {
                data = db.ExecuteReader("sp_GetBenchMarkFranchiseeRegions", new SqlParameter("@month", month), new SqlParameter("@year", year), new SqlParameter("@franchiseeId", franchiseeId));
            }
            catch (Exception ex)
            {
            }
            return data;
        }
        public SqlDataReader GetBenchMarkRegionCountryData(int month, int year, int regionId)
        {
            SqlDataReader data = null;
            try
            {
                data = db.ExecuteReader("sp_GetBenchMarkRegionCountry", new SqlParameter("@month", month), new SqlParameter("@year", year), new SqlParameter("@regionId", regionId));
            }
            catch (Exception ex)
            {
            }
            return data;
        }
        public SqlDataReader GetBenchMarkCountryAllData(int month, int year)
        {
            SqlDataReader data = null;
            try
            {
                data = db.ExecuteReader("sp_GetBenchMarkCountryAll", new SqlParameter("@month", month), new SqlParameter("@year", year));
            }
            catch (Exception ex)
            {
            }
            return data;
        }

    }
}