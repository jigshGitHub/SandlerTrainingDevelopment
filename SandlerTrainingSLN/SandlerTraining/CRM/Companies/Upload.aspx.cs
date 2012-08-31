using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class CRM_Companies_Upload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        string fileName = fileToUpload.ResolveClientUrl(fileToUpload.FileName);
        //http://www.microsoft.com/en-us/download/confirmation.aspx?id=23734

        try
        {
            fileToUpload.SaveAs(Server.MapPath(fileName));
            DataTable dtExcel = new DataTable();
            //string SourceConstr = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source='" + Server.MapPath(fileName) + "';Extended Properties= 'Excel 8.0;HDR=Yes;IMEX=1'";
            string SourceConstr = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source='" + Server.MapPath(fileName) + "';Extended Properties=Excel 8.0";
            OleDbConnection con = new OleDbConnection(SourceConstr);
            string query = "Select * from [Sheet1$]";
            OleDbDataAdapter data = new OleDbDataAdapter(query, con);
            data.Fill(dtExcel);
            SandlerRepositories.CompaniesRepository companyRepository = new SandlerRepositories.CompaniesRepository();
            SandlerModels.TBL_COMPANIES company;
            for (int i = 0; i < dtExcel.Rows.Count; i++)
            {
                try
                {
                    company = new SandlerModels.TBL_COMPANIES();
                    company.ACTIONSTEP = dtExcel.Rows[i]["ACTIONSTEP"].ToString();
                    company.Address = dtExcel.Rows[i]["ADDRESS"].ToString();
                    company.CITY = dtExcel.Rows[i]["CITY"].ToString();
                    company.COMPANYNAME = dtExcel.Rows[i]["COMPANYNAME"].ToString();
                    company.COMPANYVALUEGOAL = string.IsNullOrEmpty(dtExcel.Rows[i]["COMPANYVALUEGOAL"].ToString()) ? 0 : int.Parse(dtExcel.Rows[i]["COMPANYVALUEGOAL"].ToString());

                    company.CreatedDate = DateTime.Now;
                    company.CreationDate = Convert.ToDateTime(dtExcel.Rows[i]["CreationDate"].ToString());
                    company.DiscussionTopic = dtExcel.Rows[i]["DiscussionTopic"].ToString();
                    company.FranchiseeId = 1;
                    company.IndustryId = int.Parse(dtExcel.Rows[i]["IndustryId"].ToString());
                    company.IsNewCompany = (dtExcel.Rows[i]["IsNewCompany"].ToString() == "0") ? false : true;
                    company.LASTCONTACT_DATE = Convert.ToDateTime(dtExcel.Rows[i]["LASTCONTACT_DATE"].ToString());
                    company.NEXTCONTACT_DATE = Convert.ToDateTime(dtExcel.Rows[i]["NEXTCONTACT_DATE"].ToString());

                    company.POCFirstName = dtExcel.Rows[i]["POCFirstName"].ToString();
                    company.POCLastName = dtExcel.Rows[i]["POCLastName"].ToString();
                    company.POCPhone = dtExcel.Rows[i]["POCPhone"].ToString();
                    company.RepFirstName = dtExcel.Rows[i]["RepFirstName"].ToString();
                    company.RepLastName = dtExcel.Rows[i]["RepLastName"].ToString();
                    company.STATE = dtExcel.Rows[i]["STATE"].ToString();
                    company.ZIP = dtExcel.Rows[i]["ZIP"].ToString();

                    dtExcel.Rows[i]["IsActive"] = false;
                }
                catch (Exception ex)
                {

                }

            }

            System.IO.File.Delete(Server.MapPath(fileName));
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {

        }
    }
}