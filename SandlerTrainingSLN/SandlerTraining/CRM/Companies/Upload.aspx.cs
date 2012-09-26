﻿using System;
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
        TBL_COMPANIES company;
        DataRow excelRow = null;
        try
        {
            if (IsDataValid())
            {
                fileToUpload.SaveAs(FileName);

                SetUpExcel();

                SetUpLogData();

                companyRepository = new SandlerRepositories.CompaniesRepository();

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
                            else
                                companyRepository.Add(company);
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

    private bool IsDataValid()
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
            company.CompanyDescription = excelRow["CompanyDescription"].ToString();
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