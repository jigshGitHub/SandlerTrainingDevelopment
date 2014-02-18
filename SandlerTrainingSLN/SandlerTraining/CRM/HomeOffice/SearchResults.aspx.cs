using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerRepositories;
using SandlerModels;
using System.Data;

public partial class CRM_HomeOffice_SearchResults : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["FranchiseeSearchCount"] != null)
            {
                lblInfo.Text = "Total Records found: " + Session["FranchiseeSearchCount"].ToString();
                //We need to store current User's UserId in the hidden field - will be needed when they archive the records
                hidCurrentUserId.Value = CurrentUser.UserId.ToString();
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
            GridView gridView = (GridView)sender;
            if (gridView.HeaderRow != null && gridView.HeaderRow.Cells.Count > 0)
            {
                gridView.HeaderRow.Cells[7].Visible = !IsUserReadOnly(SandlerUserActions.Add, SandlerEntities.HomeOffice);
                gridView.HeaderRow.Cells[8].Visible = !IsUserReadOnly(SandlerUserActions.View, SandlerEntities.HomeOffice);
            }
            foreach (GridViewRow row in gvFranchisees.Rows)
            {
                row.Cells[7].Visible = !IsUserReadOnly(SandlerUserActions.Add, SandlerEntities.HomeOffice);
                row.Cells[8].Visible = !IsUserReadOnly(SandlerUserActions.View, SandlerEntities.HomeOffice);
            }
            
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