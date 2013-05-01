using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using SandlerModels;
using SandlerModels.DataIntegration;
using System.Configuration;
public partial class CRM_Companies_Upload : UploaderBasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        }
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        FileName = Server.MapPath(ConfigurationManager.AppSettings["DocumentsUploadLocation"] + fileToUpload.ResolveClientUrl(fileToUpload.FileName));
        //http://www.microsoft.com/en-us/download/confirmation.aspx?id=23734
        //For 64 bit http://www.microsoft.com/en-us/download/details.aspx?id=13255
        SandlerRepositories.CompaniesRepository companyRepository;
        SandlerRepositories.ContactsRepository contactRepository;
        TBL_COMPANIES company;
        TBL_CONTACTS contact;
        DataRow excelRow = null;
        try
        {
            if (IsDataFileAvailable())
            {
                fileToUpload.SaveAs(FileName);

                SetUpExcel();

                SetUpLogData();

                companyRepository = new SandlerRepositories.CompaniesRepository();
                contactRepository = new SandlerRepositories.ContactsRepository();
                for (int i = 0; i < ExcelData.Rows.Count; i++)
                {
                    try
                    {
                        excelRow = ExcelData.Rows[i];

                        if (!string.IsNullOrEmpty(excelRow["COMPANYNAME"].ToString()))
                        {
                            company = new SandlerModels.TBL_COMPANIES();

                            FillCompany(company, excelRow);

                            if (companyRepository.Exists(company))
                            {
                                excelRow["Errormessage"] = "Company exists for this frenchisee";
                                CreateLogRow(excelRow);
                            }
                            else if (!IsRequiredDataAvailable(company))
                            {
                                excelRow["Errormessage"] = "Required data not available";
                                CreateLogRow(excelRow);
                            }
                            else
                            {
                                companyRepository.Add(company);
                                
                                //Create contacts data for POC
                                contact = new TBL_CONTACTS();
                                contact.COMPANYID = company.COMPANIESID;
                                FillContact(contact, excelRow);
                                contactRepository.Add(contact);

                            }
                        }

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
                    catch (Exception ex)
                    {
                        excelRow["Errormessage"] = ex.Message;

                        CreateLogRow(excelRow);

                    }

                }

                showHideDialogFlag.Value = "0";

                System.IO.File.Delete(FileName);
                pnlFileUpload.Visible = false;

                UserEntitiesFactory.ReLoad();
                BindLogGrid();
                
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {

        }
    }

    private bool IsDataFileAvailable()
    {
        bool isDataValid = true;
        lblFileToUpload.Text = "";
        if (string.IsNullOrEmpty(fileToUpload.FileName))
        {
            lblFileToUpload.Text = "Please browse the file to upload the data.";
            isDataValid = false;
        }
        return isDataValid;
    }

    private void FillCompany(TBL_COMPANIES company, DataRow excelRow)
    {
        try
        {
            company.ACTIONSTEP = excelRow["ACTIONSTEP"].ToString();
            company.Address = excelRow["ADDRESS"].ToString();
            company.AssistantFirstName = excelRow["AssistantFirstName"].ToString();
            company.AssistantLastName = excelRow["AssistantLastName"].ToString();
            company.AssistantPhone = excelRow["AssistantPhone"].ToString();
            company.BillingAddress = (excelRow["IsSameBillingAddress"].ToString() == "0") ? excelRow["BillingAddress"].ToString() : excelRow["Address"].ToString();
            company.BillingCity = (excelRow["IsSameBillingAddress"].ToString() == "0") ? excelRow["BillingCity"].ToString() : excelRow["CITY"].ToString();
            company.BillingState = (excelRow["IsSameBillingAddress"].ToString() == "0") ? excelRow["BillingState"].ToString() : excelRow["STATE"].ToString();
            company.BillingZip = (excelRow["IsSameBillingAddress"].ToString() == "0") ? excelRow["BillingZip"].ToString() : excelRow["ZIP"].ToString();
            company.BillingCountry = (excelRow["IsSameBillingAddress"].ToString() == "0") ? excelRow["BillingCountry"].ToString() : excelRow["Country"].ToString();
            company.CITY = excelRow["CITY"].ToString();
            int lengthToTruncate = excelRow["CompanyDescription"].ToString().Length > 100 ? 100 : excelRow["CompanyDescription"].ToString().Length;
            company.CompanyDescription = excelRow["CompanyDescription"].ToString().Substring(0, lengthToTruncate);
            company.COMPANYNAME = excelRow["COMPANYNAME"].ToString();
            company.COMPANYVALUEGOAL = string.IsNullOrEmpty(excelRow["COMPANYVALUEGOAL"].ToString()) ? 0 : int.Parse(excelRow["COMPANYVALUEGOAL"].ToString());
            company.Country = excelRow["Country"].ToString();
            company.CreatedBy = CurrentUser.UserId.ToString();
            company.CreatedDate = DateTime.Now;
            company.CreationDate = Convert.ToDateTime(excelRow["CreationDate"].ToString());
            company.DiscussionTopic = excelRow["DiscussionTopic"].ToString();
            if (!string.IsNullOrEmpty(excelRow["EmpQuantity"].ToString()))
                company.EmpQuantity = int.Parse(excelRow["EmpQuantity"].ToString());
            company.FranchiseeId = CurrentUser.FranchiseeID;
            if(!string.IsNullOrEmpty(excelRow["IndustryId"].ToString()))
                company.IndustryId = int.Parse(excelRow["IndustryId"].ToString());
            company.IsActive = true;
            if (!string.IsNullOrEmpty(excelRow["IsNewCompany"].ToString()))
                company.IsNewCompany = (excelRow["IsNewCompany"].ToString() == "0") ? false : true;
            if (!string.IsNullOrEmpty(excelRow["IsSameBillingAddress"].ToString()))
                company.IsSameBillingAddress = (excelRow["IsSameBillingAddress"].ToString() == "0") ? false : true;
            if (!string.IsNullOrEmpty(excelRow["LASTCONTACT_DATE"].ToString()))
                company.LASTCONTACT_DATE = Convert.ToDateTime(excelRow["LASTCONTACT_DATE"].ToString());
            if (!string.IsNullOrEmpty(excelRow["NEXTCONTACT_DATE"].ToString()))
                company.NEXTCONTACT_DATE = Convert.ToDateTime(excelRow["NEXTCONTACT_DATE"].ToString());
            company.Notes = excelRow["Notes"].ToString();
            company.POCDepartment = excelRow["POCDepartment"].ToString();
            company.POCEmail = excelRow["POCEmail"].ToString();
            company.POCFax = excelRow["POCFax"].ToString();
            company.POCFirstName = excelRow["POCFirstName"].ToString();
            company.POCLastName = excelRow["POCLastName"].ToString();
            company.POCPhone = excelRow["POCPhone"].ToString();
            company.RepFirstName = excelRow["RepFirstName"].ToString();
            company.RepLastName = excelRow["RepLastName"].ToString();
            company.STATE = excelRow["STATE"].ToString();
            company.Website = excelRow["Website"].ToString();
            company.Zip = excelRow["ZIP"].ToString();

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void FillContact(TBL_CONTACTS contact, DataRow excelRow)
    {
        try
        {            
            contact.FIRSTNAME = excelRow["POCFirstName"].ToString();
            contact.LASTNAME = excelRow["POCLastName"].ToString();
            contact.IsEmailSubscription = true;
            contact.CreatedBy = CurrentUser.UserId.ToString();
            contact.CreatedDate = DateTime.Now;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private bool IsRequiredDataAvailable(TBL_COMPANIES company)
    {
        return (!string.IsNullOrEmpty(company.COMPANYNAME) && !string.IsNullOrEmpty(company.POCFirstName) && !string.IsNullOrEmpty(company.POCLastName));
    }

    private void BindLogGrid()
    {
        try
        {
            if (LogData.Rows.Count > 0)
            {
                gvCompanies.DataSource = LogData;
                gvCompanies.DataBind();

                lblMessage.Text = "Following records are not being uploaded";
            }
            else
            {
                Response.Redirect("~/CRM/Companies/Index.aspx");
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

}