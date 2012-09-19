using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using SandlerModels;
using SandlerModels.DataIntegration;

namespace SandlerRepositories
{
    public partial class CompaniesRepository
    {
        DBFactory db = new DBFactory();
        //public CompaniesRepository()
        //{
        //    //
        //    // TODO: Add constructor logic here
        //    //
        //}
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
        public DataSet GetCallBackOptions()
        {
            return (db.ExecuteDataset("sp_GetCallBackOptions", "CallBack"));
        }
        public DataSet GetAllCompanies()
        {
            //Get the User Info
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];

            if (_user.Role == SandlerRoles.SiteAdmin || _user.Role == SandlerRoles.Corporate)
            {
                //Corporate User
                return db.ExecuteDataset("sp_GetAllCompanies", "Companies");
            }
            else if (_user.Role == SandlerRoles.Coach)
            {
                //Coach - To do - once User object has RegionId then pass it here
                return db.ExecuteDataset("sp_GetAllCompaniesByCoachId", "CompaniesByCoachId", new SqlParameter("@CoachId", _user.CoachID));
            }
            else
            {
                //Franchisee Owner OR Franchisee User
                return db.ExecuteDataset("sp_GetAllCompaniesByFrId", "CompaniesByFrId", new SqlParameter("@FranchiseeId", _user.FranchiseeID));
            }

        }

        public DataSet GetCompaniesForSearch()
        {
            //Get the User Info
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];
            SandlerModels.DataIntegration.Company _company = (SandlerModels.DataIntegration.Company)HttpContext.Current.Session["CompanySearchCriteria"];

            if (_company.LastContactDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                _company.LastContactDate = default(System.DateTime).AddYears(1754);
            }
            if (_company.NextContactDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                _company.NextContactDate = default(System.DateTime).AddYears(1754);
            }
            if (_company.CreationDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                _company.CreationDate = default(System.DateTime).AddYears(1754);
            }
            //get data
            if (_user.Role == SandlerRoles.SiteAdmin || _user.Role == SandlerRoles.Corporate)
            {
                //Corporate User
                return db.ExecuteDataset("sp_GetAllCompaniesSearch", "CompaniesSearch",
                    new SqlParameter("@CompanyName", _company.CompanyName),
                    new SqlParameter("@RepLastName", _company.RepLastName),
                    new SqlParameter("@RepFirstName", _company.RepFirstName),
                    new SqlParameter("@IndustryIdList", _company.IndId),
                    new SqlParameter("@TotalCompValue", _company.CompValueGoal),
                    new SqlParameter("@IsNewCompanyIdList", _company.IsNewCompany),
                    new SqlParameter("@Address", _company.Address),
                    new SqlParameter("@Zip", _company.Zip),
                    new SqlParameter("@City", _company.City),
                    new SqlParameter("@State", _company.State),
                    new SqlParameter("@POCLastName", _company.POCLastName),
                    new SqlParameter("@POCFirstName", _company.POCFirstName),
                    new SqlParameter("@POCPhone", _company.POCPhone),
                    new SqlParameter("@DiscussionTopic", _company.DiscussionTopic),
                    new SqlParameter("@ActionStep", _company.ActionStep),
                    new SqlParameter("@LastContactDate", _company.LastContactDate),
                    new SqlParameter("@NextContactDate", _company.NextContactDate),
                    new SqlParameter("@CreationDate", _company.CreationDate));
            }
            else if (_user.Role == SandlerRoles.Coach)
            {
                //Coach - To do - once User object has RegionId then pass it here
                return db.ExecuteDataset("sp_GetAllCompaniesByCoachIdSearch", "CompaniesByCoachIdSearch",
                    new SqlParameter("@CoachId", _user.CoachID.ToString()),
                    new SqlParameter("@CompanyName", _company.CompanyName),
                    new SqlParameter("@RepLastName", _company.RepLastName),
                    new SqlParameter("@RepFirstName", _company.RepFirstName),
                    new SqlParameter("@IndustryIdList", _company.IndId),
                    new SqlParameter("@TotalCompValue", _company.CompValueGoal),
                    new SqlParameter("@IsNewCompanyIdList", _company.IsNewCompany),
                    new SqlParameter("@Address", _company.Address),
                    new SqlParameter("@Zip", _company.Zip),
                    new SqlParameter("@City", _company.City),
                    new SqlParameter("@State", _company.State),
                    new SqlParameter("@POCLastName", _company.POCLastName),
                    new SqlParameter("@POCFirstName", _company.POCFirstName),
                    new SqlParameter("@POCPhone", _company.POCPhone),
                    new SqlParameter("@DiscussionTopic", _company.DiscussionTopic),
                    new SqlParameter("@ActionStep", _company.ActionStep),
                    new SqlParameter("@LastContactDate", _company.LastContactDate),
                    new SqlParameter("@NextContactDate", _company.NextContactDate),
                    new SqlParameter("@CreationDate", _company.CreationDate));
            }
            else
            {
                //Franchisee Owner OR Franchisee User
                return db.ExecuteDataset("sp_GetAllCompaniesByFrIdSearch", "CompaniesByFrIdSearch",
                    new SqlParameter("@FranchiseeId", _user.FranchiseeID.ToString()),
                    new SqlParameter("@CompanyName", _company.CompanyName),
                    new SqlParameter("@RepLastName", _company.RepLastName),
                    new SqlParameter("@RepFirstName", _company.RepFirstName),
                    new SqlParameter("@IndustryIdList", _company.IndId),
                    new SqlParameter("@TotalCompValue", _company.CompValueGoal),
                    new SqlParameter("@IsNewCompanyIdList", _company.IsNewCompany),
                    new SqlParameter("@Address", _company.Address),
                    new SqlParameter("@Zip", _company.Zip),
                    new SqlParameter("@City", _company.City),
                    new SqlParameter("@State", _company.State),
                    new SqlParameter("@POCLastName", _company.POCLastName),
                    new SqlParameter("@POCFirstName", _company.POCFirstName),
                    new SqlParameter("@POCPhone", _company.POCPhone),
                    new SqlParameter("@DiscussionTopic", _company.DiscussionTopic),
                    new SqlParameter("@ActionStep", _company.ActionStep),
                    new SqlParameter("@LastContactDate", _company.LastContactDate),
                    new SqlParameter("@NextContactDate", _company.NextContactDate),
                    new SqlParameter("@CreationDate", _company.CreationDate));
            }
        }

        public DataSet GetCompaniesForDDL()
        {
            //Get the User Info
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];

            if (_user.Role == SandlerRoles.SiteAdmin || _user.Role == SandlerRoles.Corporate)
            {
                //Corporate User
                return db.ExecuteDataset("sp_GetCompaniesForDDL", "Companies");
            }
            else if (_user.Role == SandlerRoles.Coach)
            {
                //Coach - To do - once User object has RegionId then pass it here
                return db.ExecuteDataset("sp_GetCompaniesForDDLByCoachId", "CompaniesByCoachId", new SqlParameter("@CoachId", _user.CoachID));
            }
            else
            {
                //Franchisee Owner OR Franchisee User
                return db.ExecuteDataset("sp_GetCompaniesForDDLByFrId", "CompaniesByFrId", new SqlParameter("@FranchiseeId", _user.FranchiseeID));
            }

        }

        public DataSet GetById(int id)
        {
            return db.ExecuteDataset("sp_GetCompanyDetails", "CompanyByID", new SqlParameter("@COMPANIESID", id));
        }

        public void AddProduct(string ProductTypeName, string colorCode)
        {
            //Get the User Session
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];
            //Create the record
            //db.ExecuteNonQuery("sp_AddProduct",
            //    new SqlParameter("@ProductTypeName", ProductTypeName),
            //    new SqlParameter("@CreatedBy", _user.UserId),
            //    new SqlParameter("@FranchiseeId", _user.FranchiseeID));

            ProductTypesRepository productRepository = new ProductTypesRepository();

            Tbl_ProductType newProductType = new Tbl_ProductType();
            newProductType.ColorCode = colorCode;
            newProductType.CreatedBy = _user.UserId.ToString();
            newProductType.CreatedDate = DateTime.Now;
            newProductType.FranchiseeId = _user.FranchiseeID;
            newProductType.IsActive = true;
            newProductType.ProductTypeName = ProductTypeName;

            try
            {
                productRepository.Add(newProductType);
            }
            catch (System.Data.Entity.Validation.DbEntityValidationException ex)
            {

                foreach (var errors in ex.EntityValidationErrors)
                {
                    foreach (var error in errors.ValidationErrors)
                    {
                        throw new Exception(error.PropertyName + " " + error.ErrorMessage);
                    }
                }

            }
        }


        public void Insert(string COMPANYNAME, string Address, string City, string State, string Zip,
            string POCLastName, string POCFirstName, string POCPhone, int Value, int COMPANYVALUEGOAL,
            //int ID, 
            int IndID,
            string RepLastName, string RepFirstName, string DiscussionTopic, string ACTIONSTEP,
            DateTime LastContact_Date, DateTime NextContact_Date, DateTime CreationDate)
        {

            //Get the User Session
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];

            if (LastContact_Date.ToString() == "1/1/0001 12:00:00 AM")
            {
                LastContact_Date = default(System.DateTime).AddYears(1754);
            }

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
                //new SqlParameter("@ID", ID),
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
            UserEntitiesFactory.ReLoad();

        }
        public void Update(int COMPANIESID, string COMPANYNAME, string Address, string City, string State, string Zip,
            string POCLastName, string POCFirstName, string POCPhone, int Value, string COMPANYVALUEGOAL,
            //int ID, 
            int IndID,
            string RepLastName, string RepFirstName, string DiscussionTopic, string ACTIONSTEP,
            DateTime LastContact_Date, DateTime NextContact_Date, DateTime CreationDate, string updatedBy)
        {

            if (LastContact_Date.ToString() == "1/1/0001 12:00:00 AM")
            {
                LastContact_Date = default(System.DateTime).AddYears(1754);
            }


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
                //new SqlParameter("@ID", ID),
                new SqlParameter("@IndID", IndID),
                new SqlParameter("@RepLastName", RepLastName),
                new SqlParameter("@RepFirstName", RepFirstName),
                new SqlParameter("@DiscussionTopic", DiscussionTopic),
                new SqlParameter("@ACTIONSTEP", ACTIONSTEP),
                new SqlParameter("@LastContact_Date", LastContact_Date),
                new SqlParameter("@NextContact_Date", NextContact_Date),
                new SqlParameter("@CreationDate", CreationDate),
                new SqlParameter("@UpdatedBy", updatedBy));

            UserEntitiesFactory.ReLoad();

        }

        public SqlDataReader GetNewClientsProducts(int month, int year, string userId)
        {
            SqlDataReader newAppointments = null;
            try
            {
                newAppointments = db.ExecuteReader("sp_GetNewClientsWithProducts", new SqlParameter("@month", month), new SqlParameter("@year", year), new SqlParameter("@userId", userId));
            }
            catch (Exception ex)
            {
            }
            return newAppointments;
        }

        public SqlDataReader GetClientsAvgLengthWithIndustries(string userId)
        {
            SqlDataReader newAppointments = null;
            try
            {
                newAppointments = db.ExecuteReader("sp_ClientsAvgLengthWithIndustries", new SqlParameter("@userId", userId));
            }
            catch (Exception ex)
            {
            }
            return newAppointments;
        }
    }
}
