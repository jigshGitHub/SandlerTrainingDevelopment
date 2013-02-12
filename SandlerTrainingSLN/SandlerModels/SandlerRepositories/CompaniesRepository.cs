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
        public DataSet GetBillingOptions()
        {
            return (db.ExecuteDataset("sp_GetBillingOptions", "GetBillingOptions"));
        }
        public DataSet GetCallBackOptions()
        {
            return (db.ExecuteDataset("sp_GetCallBackOptions", "CallBack"));
        }
        public DataSet GetAllFranchisee()
        {
            return (db.ExecuteDataset("sp_GetAllFranchisee", "GetAllFranchisees"));
        }


        public DataSet GetAllCompanies()
        {
            //Get the User Info
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];

            if (_user.Role == SandlerRoles.SiteAdmin || _user.Role == SandlerRoles.Corporate || _user.Role == SandlerRoles.HomeOfficeAdmin)
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
                //Franchisee Owner OR Franchisee User OR Client - We get by FranchiseeId
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
            if (_user.Role == SandlerRoles.SiteAdmin || _user.Role == SandlerRoles.Corporate || _user.Role == SandlerRoles.HomeOfficeAdmin)
            {

                //Corporate User
                return db.ExecuteDataset("sp_GetAllCompaniesSearch", "CompaniesSearch",
                    new SqlParameter("@CompanyName", _company.CompanyName),
                    new SqlParameter("@CompanyOwnership", _company.CompanyOwnership),
                    new SqlParameter("@CompanyDescription", _company.CompanyDescription),
                    new SqlParameter("@RepLastName", _company.RepLastName),
                    new SqlParameter("@RepFirstName", _company.RepFirstName),
                    new SqlParameter("@IndustryIdList", _company.IndId),
                    new SqlParameter("@TotalCompValue", _company.CompValueGoal),
                    new SqlParameter("@IsNewCompanyIdList", _company.IsNewCompany),
                    new SqlParameter("@IsSameBillingAdrsList", _company.IsSameBillingAddress),
                    new SqlParameter("@Address", _company.Address),
                    new SqlParameter("@Zip", _company.Zip),
                    new SqlParameter("@City", _company.City),
                    new SqlParameter("@State", _company.State),
                    new SqlParameter("@Country", _company.Country),
                    new SqlParameter("@BillingAddress", _company.BillingAddress),
                    new SqlParameter("@BillingZip", _company.BillingZip),
                    new SqlParameter("@BillingCity", _company.BillingCity),
                    new SqlParameter("@BillingState", _company.BillingState),
                    new SqlParameter("@BillingCountry", _company.BillingCountry),
                    new SqlParameter("@POCLastName", _company.POCLastName),
                    new SqlParameter("@POCFirstName", _company.POCFirstName),
                    new SqlParameter("@POCPhone", _company.POCPhone),
                    new SqlParameter("@POCDepartment", _company.POCDepartment),
                    new SqlParameter("@POCEmail", _company.POCEmail),
                    new SqlParameter("@POCFax", _company.POCFax),
                    new SqlParameter("@AssistantLastName", _company.AssistantLastName),
                    new SqlParameter("@AssistantFirstName", _company.AssistantFirstName),
                    new SqlParameter("@AssistantPhone", _company.AssistantPhone),
                    new SqlParameter("@Website", _company.WebSite),
                    new SqlParameter("@EmpQuantity", _company.EmpQuantity),
                    new SqlParameter("@Notes", _company.Notes),
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
                    new SqlParameter("@CompanyOwnership", _company.CompanyOwnership),
                    new SqlParameter("@CompanyDescription", _company.CompanyDescription),
                    new SqlParameter("@RepLastName", _company.RepLastName),
                    new SqlParameter("@RepFirstName", _company.RepFirstName),
                    new SqlParameter("@IndustryIdList", _company.IndId),
                    new SqlParameter("@TotalCompValue", _company.CompValueGoal),
                    new SqlParameter("@IsNewCompanyIdList", _company.IsNewCompany),
                    new SqlParameter("@IsSameBillingAdrsList", _company.IsSameBillingAddress),
                    new SqlParameter("@Address", _company.Address),
                    new SqlParameter("@Zip", _company.Zip),
                    new SqlParameter("@City", _company.City),
                    new SqlParameter("@State", _company.State),
                    new SqlParameter("@Country", _company.Country),
                    new SqlParameter("@BillingAddress", _company.BillingAddress),
                    new SqlParameter("@BillingZip", _company.BillingZip),
                    new SqlParameter("@BillingCity", _company.BillingCity),
                    new SqlParameter("@BillingState", _company.BillingState),
                    new SqlParameter("@BillingCountry", _company.BillingCountry),
                    new SqlParameter("@POCLastName", _company.POCLastName),
                    new SqlParameter("@POCFirstName", _company.POCFirstName),
                    new SqlParameter("@POCPhone", _company.POCPhone),
                    new SqlParameter("@POCDepartment", _company.POCDepartment),
                    new SqlParameter("@POCEmail", _company.POCEmail),
                    new SqlParameter("@POCFax", _company.POCFax),
                    new SqlParameter("@AssistantLastName", _company.AssistantLastName),
                    new SqlParameter("@AssistantFirstName", _company.AssistantFirstName),
                    new SqlParameter("@AssistantPhone", _company.AssistantPhone),
                    new SqlParameter("@Website", _company.WebSite),
                    new SqlParameter("@EmpQuantity", _company.EmpQuantity),
                    new SqlParameter("@Notes", _company.Notes),
                    new SqlParameter("@DiscussionTopic", _company.DiscussionTopic),
                    new SqlParameter("@ActionStep", _company.ActionStep),
                    new SqlParameter("@LastContactDate", _company.LastContactDate),
                    new SqlParameter("@NextContactDate", _company.NextContactDate),
                    new SqlParameter("@CreationDate", _company.CreationDate));
            }
            else
            {
                //Franchisee Owner OR Franchisee User OR Client
                return db.ExecuteDataset("sp_GetAllCompaniesByFrIdSearch", "CompaniesByFrIdSearch",
                    new SqlParameter("@FranchiseeId", _user.FranchiseeID.ToString()),
                    new SqlParameter("@CompanyName", _company.CompanyName),
                    new SqlParameter("@CompanyOwnership", _company.CompanyOwnership),
                    new SqlParameter("@CompanyDescription", _company.CompanyDescription),
                    new SqlParameter("@RepLastName", _company.RepLastName),
                    new SqlParameter("@RepFirstName", _company.RepFirstName),
                    new SqlParameter("@IndustryIdList", _company.IndId),
                    new SqlParameter("@TotalCompValue", _company.CompValueGoal),
                    new SqlParameter("@IsNewCompanyIdList", _company.IsNewCompany),
                    new SqlParameter("@IsSameBillingAdrsList", _company.IsSameBillingAddress),
                    new SqlParameter("@Address", _company.Address),
                    new SqlParameter("@Zip", _company.Zip),
                    new SqlParameter("@City", _company.City),
                    new SqlParameter("@State", _company.State),
                    new SqlParameter("@Country", _company.Country),
                    new SqlParameter("@BillingAddress", _company.BillingAddress),
                    new SqlParameter("@BillingZip", _company.BillingZip),
                    new SqlParameter("@BillingCity", _company.BillingCity),
                    new SqlParameter("@BillingState", _company.BillingState),
                    new SqlParameter("@BillingCountry", _company.BillingCountry),
                    new SqlParameter("@POCLastName", _company.POCLastName),
                    new SqlParameter("@POCFirstName", _company.POCFirstName),
                    new SqlParameter("@POCPhone", _company.POCPhone),
                    new SqlParameter("@POCDepartment", _company.POCDepartment),
                    new SqlParameter("@POCEmail", _company.POCEmail),
                    new SqlParameter("@POCFax", _company.POCFax),
                    new SqlParameter("@AssistantLastName", _company.AssistantLastName),
                    new SqlParameter("@AssistantFirstName", _company.AssistantFirstName),
                    new SqlParameter("@AssistantPhone", _company.AssistantPhone),
                    new SqlParameter("@Website", _company.WebSite),
                    new SqlParameter("@EmpQuantity", _company.EmpQuantity),
                    new SqlParameter("@Notes", _company.Notes),
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

            if (_user.Role == SandlerRoles.SiteAdmin || _user.Role == SandlerRoles.Corporate || _user.Role == SandlerRoles.HomeOfficeAdmin)
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
                //Franchisee Owner OR Franchisee User OR Client
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

        public void InsertCompany(
            string COMPANYNAME,
            string CompanyOwnership,
            string CompanyDescription,
            string Address, string City, string State, string Zip,
            string Country, int BillingValue,
            string BillingAddress, string BillingCity, string BillingState, string BillingZip,
            string BillingCountry,
            string POCLastName, string POCFirstName, string POCPhone,
            string POCDepartment, string POCEmail, string POCFax, string AssistantLastName,
            string AssistantFirstName, string AssistantPhone, int Value,
            string Website, int EmpQuantity, int COMPANYVALUEGOAL,
            int IndID, string RepLastName, string RepFirstName, string DiscussionTopic, string ACTIONSTEP,
            DateTime LastContact_Date, DateTime NextContact_Date, DateTime CreationDate, string Notes
            )
        {

            //Get the User Session
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];

            LastContact_Date = IsValidDateCheck(LastContact_Date);
            NextContact_Date = IsValidDateCheck(NextContact_Date);
            CreationDate = IsValidDateCheck(CreationDate);

            RepLastName = IsValidStringEntered(RepLastName);
            RepFirstName = IsValidStringEntered(RepFirstName);
            DiscussionTopic = IsValidStringEntered(DiscussionTopic);
            ACTIONSTEP = IsValidStringEntered(ACTIONSTEP);
            CompanyOwnership = IsValidStringEntered(CompanyOwnership);
            CompanyDescription = IsValidStringEntered(CompanyDescription);
            Country = IsValidStringEntered(Country);
            Website = IsValidStringEntered(Website);
            Address = IsValidStringEntered(Address);
            City = IsValidStringEntered(City);
            State = IsValidStringEntered(State);
            Zip = IsValidStringEntered(Zip);
            Country = IsValidStringEntered(Country);
            BillingAddress = IsValidStringEntered(BillingAddress);
            BillingCity = IsValidStringEntered(BillingCity);
            BillingState = IsValidStringEntered(BillingState);
            BillingZip = IsValidStringEntered(BillingZip);
            BillingCountry = IsValidStringEntered(BillingCountry);
            POCDepartment = IsValidStringEntered(POCDepartment);
            POCEmail = IsValidStringEntered(POCEmail);
            POCFax = IsValidStringEntered(POCFax);
            AssistantLastName = IsValidStringEntered(AssistantLastName);
            AssistantFirstName = IsValidStringEntered(AssistantFirstName);
            AssistantPhone = IsValidStringEntered(AssistantPhone);
            Notes = IsValidStringEntered(Notes);
            POCLastName = IsValidStringEntered(POCLastName);
            POCFirstName = IsValidStringEntered(POCFirstName);
            POCPhone = IsValidStringEntered(POCPhone);

            //Create the record
            db.ExecuteNonQuery("sp_InsertCompany",
                new SqlParameter("@COMPANYNAME", COMPANYNAME),
                new SqlParameter("@CompanyOwnership", CompanyOwnership),
                new SqlParameter("@CompanyDescription", CompanyDescription),
                new SqlParameter("@Address", Address),
                new SqlParameter("@City", City),
                new SqlParameter("@State", State),
                new SqlParameter("@Zip", Zip),
                new SqlParameter("@Country", Country),
                new SqlParameter("@BillingValue", BillingValue),
                new SqlParameter("@BillingAddress", BillingAddress),
                new SqlParameter("@BillingCity", BillingCity),
                new SqlParameter("@BillingState", BillingState),
                new SqlParameter("@BillingZip", BillingZip),
                new SqlParameter("@BillingCountry", BillingCountry),
                new SqlParameter("@POCLastName", POCLastName),
                new SqlParameter("@POCFirstName", POCFirstName),
                new SqlParameter("@POCPhone", POCPhone),
                new SqlParameter("@POCDepartment", POCDepartment),
                new SqlParameter("@POCEmail", POCEmail),
                new SqlParameter("@POCFax", POCFax),
                new SqlParameter("@AssistantLastName", AssistantLastName),
                new SqlParameter("@AssistantFirstName", AssistantFirstName),
                new SqlParameter("@AssistantPhone", AssistantPhone),
                new SqlParameter("@Value", Value),
                new SqlParameter("@Website", Website),
                new SqlParameter("@EmpQuantity", EmpQuantity),
                new SqlParameter("@COMPANYVALUEGOAL", COMPANYVALUEGOAL),
                new SqlParameter("@IndID", IndID),
                new SqlParameter("@RepLastName", RepLastName),
                new SqlParameter("@RepFirstName", RepFirstName),
                new SqlParameter("@DiscussionTopic", DiscussionTopic),
                new SqlParameter("@ACTIONSTEP", ACTIONSTEP),
                new SqlParameter("@LastContact_Date", LastContact_Date),
                new SqlParameter("@NextContact_Date", NextContact_Date),
                new SqlParameter("@CreationDate", CreationDate),
                new SqlParameter("@CreatedBy", _user.UserId),
                new SqlParameter("@Notes", Notes),
                new SqlParameter("@FranchiseeId", _user.FranchiseeID));
            UserEntitiesFactory.ReLoad();

        }

        public DateTime IsValidDateCheck(DateTime inputDate)
        {
            if (inputDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                return default(System.DateTime).AddYears(1754);
            }
            return inputDate;
        }

        public string IsValidStringEntered(string EnteredValue)
        {
            if (string.IsNullOrEmpty(EnteredValue))
            {
                EnteredValue = "";
            }
            return EnteredValue;
        }

        public void Update(int COMPANIESID, string COMPANYNAME,
            string CompanyOwnership,
            string CompanyDescription,
            string Address, string City, string State, string Zip,
            string Country, int BillingValue,
            string BillingAddress, string BillingCity, string BillingState, string BillingZip,
            string BillingCountry,
            string POCLastName, string POCFirstName, string POCPhone,
            string POCDepartment, string POCEmail, string POCFax, string AssistantLastName,
            string AssistantFirstName, string AssistantPhone, int Value,
            string Website, string EmpQuantity, string COMPANYVALUEGOAL,
            int IndID, string RepLastName, string RepFirstName, string DiscussionTopic, string ACTIONSTEP,
            DateTime LastContact_Date, DateTime NextContact_Date, DateTime CreationDate, string updatedBy, string Notes)
        {

            LastContact_Date = IsValidDateCheck(LastContact_Date);
            NextContact_Date = IsValidDateCheck(NextContact_Date);
            CreationDate = IsValidDateCheck(CreationDate);

            RepLastName = IsValidStringEntered(RepLastName);
            RepFirstName = IsValidStringEntered(RepFirstName);
            DiscussionTopic = IsValidStringEntered(DiscussionTopic);
            ACTIONSTEP = IsValidStringEntered(ACTIONSTEP);
            CompanyOwnership = IsValidStringEntered(CompanyOwnership);
            CompanyDescription = IsValidStringEntered(CompanyDescription);
            Country = IsValidStringEntered(Country);
            Website = IsValidStringEntered(Website);
            Address = IsValidStringEntered(Address);
            City = IsValidStringEntered(City);
            State = IsValidStringEntered(State);
            Zip = IsValidStringEntered(Zip);
            Country = IsValidStringEntered(Country);
            BillingAddress = IsValidStringEntered(BillingAddress);
            BillingCity = IsValidStringEntered(BillingCity);
            BillingState = IsValidStringEntered(BillingState);
            BillingZip = IsValidStringEntered(BillingZip);
            BillingCountry = IsValidStringEntered(BillingCountry);
            POCDepartment = IsValidStringEntered(POCDepartment);
            POCEmail = IsValidStringEntered(POCEmail);
            POCFax = IsValidStringEntered(POCFax);
            AssistantLastName = IsValidStringEntered(AssistantLastName);
            AssistantFirstName = IsValidStringEntered(AssistantFirstName);
            AssistantPhone = IsValidStringEntered(AssistantPhone);
            Notes = IsValidStringEntered(Notes);
            POCLastName = IsValidStringEntered(POCLastName);
            POCFirstName = IsValidStringEntered(POCFirstName);
            POCPhone = IsValidStringEntered(POCPhone);

            //Update Company Details
            db.ExecuteNonQuery("sp_UpdateCompanyDetails",
                new SqlParameter("@COMPANIESID", COMPANIESID),
                new SqlParameter("@COMPANYNAME", COMPANYNAME),
                new SqlParameter("@CompanyOwnership", CompanyOwnership),
                new SqlParameter("@CompanyDescription", CompanyDescription),
                new SqlParameter("@Address", Address),
                new SqlParameter("@City", City),
                new SqlParameter("@State", State),
                new SqlParameter("@Zip", Zip),
                new SqlParameter("@Country", Country),
                new SqlParameter("@BillingValue", BillingValue),
                new SqlParameter("@BillingAddress", BillingAddress),
                new SqlParameter("@BillingCity", BillingCity),
                new SqlParameter("@BillingState", BillingState),
                new SqlParameter("@BillingZip", BillingZip),
                new SqlParameter("@BillingCountry", BillingCountry),
                new SqlParameter("@POCLastName", POCLastName),
                new SqlParameter("@POCFirstName", POCFirstName),
                new SqlParameter("@POCPhone", POCPhone),
                new SqlParameter("@POCDepartment", POCDepartment),
                new SqlParameter("@POCEmail", POCEmail),
                new SqlParameter("@POCFax", POCFax),
                new SqlParameter("@AssistantLastName", AssistantLastName),
                new SqlParameter("@AssistantFirstName", AssistantFirstName),
                new SqlParameter("@AssistantPhone", AssistantPhone),
                new SqlParameter("@Value", Value),
                new SqlParameter("@Website", Website),
                new SqlParameter("@EmpQuantity", EmpQuantity),
                new SqlParameter("@COMPANYVALUEGOAL", COMPANYVALUEGOAL),
                new SqlParameter("@IndID", IndID),
                new SqlParameter("@RepLastName", RepLastName),
                new SqlParameter("@RepFirstName", RepFirstName),
                new SqlParameter("@DiscussionTopic", DiscussionTopic),
                new SqlParameter("@ACTIONSTEP", ACTIONSTEP),
                new SqlParameter("@LastContact_Date", LastContact_Date),
                new SqlParameter("@NextContact_Date", NextContact_Date),
                new SqlParameter("@CreationDate", CreationDate),
                new SqlParameter("@UpdatedBy", updatedBy),
                new SqlParameter("@Notes", Notes));

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

        public SqlDataReader GetClosedSalesAnalysis(int month, int year, string userId, string analysisType, string searchNewCompany, string companyIds)
        {
            SqlDataReader newAppointments = null;
            try
            {
                object searchNewCompanyParamVal = (string.IsNullOrEmpty(searchNewCompany)) ? DBNull.Value : searchNewCompany as object;
                object companyIdsParamVal = (string.IsNullOrEmpty(companyIds)) ? DBNull.Value : companyIds as object;
                newAppointments = db.ExecuteReader("sp_GetClosedSalesAnalysis", new SqlParameter("@month", month), new SqlParameter("@year", year), new SqlParameter("@userId", userId), new SqlParameter("@analysisType", analysisType), new SqlParameter("@searchNewCompany", searchNewCompanyParamVal), new SqlParameter("@companyIds", companyIdsParamVal));
            }
            catch (Exception ex)
            {
            }
            return newAppointments;
        }

        public SqlDataReader GetPipelineOpportunityAnalysis(int month, int year, string userId, string analysisType, string searchNewCompany, string companyIds)
        {
            SqlDataReader newAppointments = null;
            try
            {
                object searchNewCompanyParamVal = (string.IsNullOrEmpty(searchNewCompany)) ? DBNull.Value : searchNewCompany as object;
                object companyIdsParamVal = (string.IsNullOrEmpty(companyIds)) ? DBNull.Value : companyIds as object;
                newAppointments = db.ExecuteReader("sp_PipelineOpportunityAnalysis", new SqlParameter("@month", month), new SqlParameter("@year", year), new SqlParameter("@userId", userId), new SqlParameter("@analysisType", analysisType), new SqlParameter("@searchNewCompany", searchNewCompanyParamVal), new SqlParameter("@companyIds", companyIdsParamVal));
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
