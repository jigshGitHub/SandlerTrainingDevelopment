using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using SandlerModels;

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
        FileName = fileToUpload.ResolveClientUrl(fileToUpload.FileName);
        //http://www.microsoft.com/en-us/download/confirmation.aspx?id=23734
        SandlerRepositories.CompaniesRepository companyRepository;
        TBL_COMPANIES company;
        DataRow excelRow = null;
        try
        {
            fileToUpload.SaveAs(Server.MapPath(FileName));

            SetUpExcel();

            SetUpLogData();

            companyRepository = new SandlerRepositories.CompaniesRepository();

            for(int i=0 ; i < ExcelData.Rows.Count; i++)
            {
                try
                {
                    excelRow = ExcelData.Rows[i];

                    company = new SandlerModels.TBL_COMPANIES();

                    FillCompany(company, excelRow);            

                    //companyRepository.Add(company);

                }
                catch (Exception ex)
                {
                    excelRow["Errormessage"] = ex.Message;

                    CreateLogRow(excelRow);
                    
                }

            }
            
            showHideDialogFlag.Value = "0";

            System.IO.File.Delete(Server.MapPath(FileName));
            pnlFileUpload.Visible = false;

            BingLogGrid();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {

        }
    }

    private void FillCompany(TBL_COMPANIES company, DataRow excelRow)
    {
        try
        {
            company.ACTIONSTEP = excelRow["ACTIONSTEP"].ToString();
            company.Address = excelRow["ADDRESS"].ToString();
            company.CITY = excelRow["CITY"].ToString();
            company.COMPANYNAME = excelRow["COMPANYNAME"].ToString();
            company.COMPANYVALUEGOAL = string.IsNullOrEmpty(excelRow["COMPANYVALUEGOAL"].ToString()) ? 0 : int.Parse(excelRow["COMPANYVALUEGOAL"].ToString());
            company.CreatedBy = CurrentUser.UserId.ToString();
            company.CreatedDate = DateTime.Now;
            company.CreationDate = Convert.ToDateTime(excelRow["CreationDate"].ToString());
            company.DiscussionTopic = excelRow["DiscussionTopic"].ToString();
            company.FranchiseeId = CurrentUser.FranchiseeID;
            company.IndustryId = int.Parse(excelRow["IndustryId"].ToString());
            company.IsNewCompany = (excelRow["IsNewCompany"].ToString() == "0") ? false : true;
            if (!string.IsNullOrEmpty(excelRow["LASTCONTACT_DATE"].ToString()))
                company.LASTCONTACT_DATE = Convert.ToDateTime(excelRow["LASTCONTACT_DATE"].ToString());
            if (!string.IsNullOrEmpty(excelRow["NEXTCONTACT_DATE"].ToString()))
                company.NEXTCONTACT_DATE = Convert.ToDateTime(excelRow["NEXTCONTACT_DATE"].ToString());

            company.POCFirstName = excelRow["POCFirstName"].ToString();
            company.POCLastName = excelRow["POCLastName"].ToString();
            company.POCPhone = excelRow["POCPhone"].ToString();
            company.RepFirstName = excelRow["RepFirstName"].ToString();
            company.RepLastName = excelRow["RepLastName"].ToString();
            company.STATE = excelRow["STATE"].ToString();
            company.ZIP = excelRow["ZIP"].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void BingLogGrid()
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