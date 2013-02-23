using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerRepositories;
using SandlerModels;

public partial class CRM_Companies_SearchResults : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["CompanySearchCount"] != null)
            {
                lblInfo.Text = "Total Records found: " + Session["CompanySearchCount"].ToString(); 
            }
            else
            {
                Response.Redirect("~/CRM/Companies/Search.aspx");
            }
        }
    }
    protected void SearchCompanyDS_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["_user"] = CurrentUser;
    }
    protected void gvCompanies_DataBound(object sender, EventArgs e)
    {
        if (gvCompanies.Rows.Count == 0)
        {
            LblStatus.Text = "There are no results matching with your criteria.";
        }
        else
        {
            LblStatus.Text = "";
            //Get the User Info
            
            if (CurrentUser.Role == SandlerRoles.Client)
            {
                gvCompanies.Columns[4].HeaderText = "Sales Rep";
            }
        }
    }
    protected void gvCompanies_SelectedIndexChanged(object sender, EventArgs e)
    {
        hidCompanyID.Value = gvCompanies.SelectedDataKey.Value.ToString();
        Server.Transfer("~/CRM/Companies/Detail.aspx");
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        //This means that you are overriding the default implementation of the method and giving permission to the GridView to be exported as an Excel file.
    }
    protected void btnExportExcel_Click(object sender, ImageClickEventArgs e)
    {
        //Export results to Excel
        trExport.Visible = true;
        Response.Clear();
        Response.AddHeader("content-disposition", "attachment;filename=SearchResults.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        this.EnableViewState = false;
        System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter htmlWrite = new System.Web.UI.HtmlTextWriter(stringWrite);
        gvCompaniesExport.AllowPaging = false;
        gvCompaniesExport.AllowSorting = false;
        //Get the User Info
        
        if (CurrentUser.Role == SandlerRoles.Client)
        {
            gvCompaniesExport.Columns[4].Visible = false;
        }
        else
        {
            gvCompaniesExport.Columns[5].Visible = false;
        }
        gvCompaniesExport.DataBind();
        //Report is the Div which we need to Export - Gridview is under this Div
        Report.RenderControl(htmlWrite);
        Response.Write(stringWrite.ToString());
        Response.End();
        this.EnableViewState = true;
        trExport.Visible = false;
    }
    
}