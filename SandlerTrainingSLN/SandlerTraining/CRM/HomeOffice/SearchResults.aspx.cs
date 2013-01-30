using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerRepositories;
using SandlerModels;
using System.Data;

public partial class CRM_HomeOffice_SearchResults : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["FranchiseeSearchCount"] != null)
            {
                lblInfo.Text = "Total Records found: " + Session["FranchiseeSearchCount"].ToString();
            }
            else
            {
                Response.Redirect("~/CRM/HomeOffice/Search.aspx");
            }
        }
    }
    protected void gvFranchisees_DataBound(object sender, EventArgs e)
    {
        if (gvFranchisees.Rows.Count == 0)
        {
            LblStatus.Text = "There are no results matching with your criteria.";
        }
        else
        {
            LblStatus.Text = "";
            
        }
    }
    protected void gvFranchisees_SelectedIndexChanged(object sender, EventArgs e)
    {
        hidFranchiseeID.Value = gvFranchisees.SelectedDataKey.Value.ToString();
        Server.Transfer("~/CRM/HomeOffice/Detail.aspx");
    }
    protected void btnExportExcel_Click(object sender, ImageClickEventArgs e)
    {
        FranchiseesRepository frRepository = new FranchiseesRepository();
        DataSet ds = new DataSet();
        ds = frRepository.GetFranchiseesForSearch();
        if (ds.Tables[0].Rows.Count > 0)
        {
            LblStatus.Text = "";
            btnExportExcel.Visible = true;
            //We do not need ID column so remove it from the Datasource
            ds.Tables[0].Columns.RemoveAt(0);
            //Now get Export to Excel result
            ExportToExcel.DownloadReportResults(ds);
        }
    }
}