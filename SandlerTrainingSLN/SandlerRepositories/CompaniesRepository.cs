using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

using SandlerModels;

namespace SandlerRepositories
{
    public class CompaniesRepository
    {
        DBFactory db = new DBFactory();
        public CompaniesRepository()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public DataSet GetAllProducts()
        {
            return (db.ExecuteDataset("sp_GetAllProducts", "Products"));
        }
        public DataSet GetAllIndustries()
        {
            return (db.ExecuteDataset("sp_GetAllIndustries", "Industries"));
        }
        public DataSet GetNewItemOptions()
        {
            return (db.ExecuteDataset("sp_GetNewItemOptions", "NewItemOptions"));
        }
        public DataSet GetAllCompanies(object CurrentUser)
        {
            UserModel _user = (UserModel)CurrentUser;

            if (_user.Role ==  SandlerRoles.SiteAdmin)
            {
                //Corporate User
                return db.ExecuteDataset("sp_GetAllCompanies", "Companies");
            }
            else if (_user.Role == SandlerRoles.Coach)
            {
                //Coach - To do - once User object has RegionId then pass it here
                return db.ExecuteDataset("sp_GetAllCompaniesByRegionId", "CompaniesByRegionId", new SqlParameter("@CoachId", _user.CoachID));
            }
            else
            {
                //Franchisee Owner - Franchisee User does not have access to this feature
                return db.ExecuteDataset("sp_GetAllCompaniesByFrId", "CompaniesByFrId", new SqlParameter("@FranchiseeId", _user.FranchiseeID));
            }
            
        }
        public DataSet GetById(int id)
        {
            return db.ExecuteDataset("sp_GetCompanyDetails", "CompanyByID", new SqlParameter("@COMPANIESID", id));
        }
        public void Insert(string COMPANYNAME, string Address, string City, string State, string Zip, 
            string POCLastName, string POCFirstName, string POCPhone, int Value, int COMPANYVALUEGOAL, int ID, int IndID,
            string RepLastName, string RepFirstName, string DiscussionTopic, string ACTIONSTEP,
            DateTime LastContact_Date, DateTime NextContact_Date, DateTime CreationDate, object CurrentUser)
        {
            //Get the User Session
            UserModel _user = (UserModel)CurrentUser;
            //Create the record
            db.ExecuteNonQuery("sp_InsertCompany", 
                new SqlParameter("@COMPANYNAME", COMPANYNAME),
                new SqlParameter("@Address", Address),
                new SqlParameter("@City", City),
                new SqlParameter("@State", State),
                new SqlParameter("@Zip", Zip),
                new SqlParameter("@POCLastName", POCLastName),
                new SqlParameter("@POCFirstName", POCFirstName),
                new SqlParameter("@POCPhone", POCPhone),
                new SqlParameter("@Value", Value),
                new SqlParameter("@COMPANYVALUEGOAL", COMPANYVALUEGOAL),
                new SqlParameter("@ID", ID),
                new SqlParameter("@IndID", IndID),
                new SqlParameter("@RepLastName", RepLastName),
                new SqlParameter("@RepFirstName", RepFirstName),
                new SqlParameter("@DiscussionTopic", DiscussionTopic),
                new SqlParameter("@ACTIONSTEP", ACTIONSTEP),
                new SqlParameter("@LastContact_Date", LastContact_Date),
                new SqlParameter("@NextContact_Date", NextContact_Date),
                new SqlParameter("@CreationDate", CreationDate),
                new SqlParameter("@CreatedBy", _user.UserId),
                new SqlParameter("@FranchiseeId", _user.FranchiseeID));
 
        }
        public void Update(int COMPANIESID, string COMPANYNAME, string Address, string City, string State, string Zip,
            string POCLastName, string POCFirstName, string POCPhone, int Value, string COMPANYVALUEGOAL, int ID, int IndID,
            string RepLastName, string RepFirstName, string DiscussionTopic, string ACTIONSTEP,
            DateTime LastContact_Date, DateTime NextContact_Date, DateTime CreationDate, string updatedBy)
        {
                    
           
            //Update Company Details
            db.ExecuteNonQuery("sp_UpdateCompanyDetails",
                new SqlParameter("@COMPANIESID", COMPANIESID),
                new SqlParameter("@COMPANYNAME", COMPANYNAME),
                new SqlParameter("@Address", Address),
                new SqlParameter("@City", City),
                new SqlParameter("@State", State),
                new SqlParameter("@Zip", Zip),
                new SqlParameter("@POCLastName", POCLastName),
                new SqlParameter("@POCFirstName", POCFirstName),
                new SqlParameter("@POCPhone", POCPhone),
                new SqlParameter("@Value", Value),
                new SqlParameter("@COMPANYVALUEGOAL", COMPANYVALUEGOAL),
                new SqlParameter("@ID", ID),
                new SqlParameter("@IndID", IndID),
                new SqlParameter("@RepLastName", RepLastName),
                new SqlParameter("@RepFirstName", RepFirstName),
                new SqlParameter("@DiscussionTopic", DiscussionTopic),
                new SqlParameter("@ACTIONSTEP", ACTIONSTEP),
                new SqlParameter("@LastContact_Date", LastContact_Date),
                new SqlParameter("@NextContact_Date", NextContact_Date),
                new SqlParameter("@CreationDate", CreationDate),
                new SqlParameter("@UpdatedBy", updatedBy));

        }

    }
}
