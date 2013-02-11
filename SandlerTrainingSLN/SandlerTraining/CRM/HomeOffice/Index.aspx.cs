using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerModels;
using System.Web.UI.HtmlControls;
using SandlerWeb = Sandler.Web;
using SandlerRepositories;
using System.Data;

public partial class CRM_HomeOffice_Index : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        franchiseeMenu.MenuEntityTitle = "HomeOffice";
    }

    protected void gvFranchisees_SelectedIndexChanged(object sender, EventArgs e)
    {
        hidFranchiseeID.Value = gvFranchisees.SelectedDataKey.Value.ToString();
        Server.Transfer("~/CRM/HomeOffice/Detail.aspx");
    }

    protected void gvFranchisees_DataBound(object sender, EventArgs e)
    {
        if (gvFranchisees.Rows.Count == 0)
        {
            LblStatus.Text = "There are no Franchisees entered in the System.";
            btnExportExcel.Visible = false;
            //franchiseeMenu.MenuEntity.Items.Find(delegate(Sandler.Web.MenuItem item) { return item.Text == "Detailed Search"; }).IsVisible = false;
            franchiseeMenu.ReLoadSubMenu();
        }
        else
        {
            LblStatus.Text = "";
            btnExportExcel.Visible = true;
            //franchiseeMenu.MenuEntity.Items.Find(delegate(Sandler.Web.MenuItem item) { return item.Text == "Detailed Search"; }).IsVisible = true;

            GridView gridView = (GridView)sender;

            if (gridView.HeaderRow != null && gridView.HeaderRow.Cells.Count > 0)
            {
                gridView.HeaderRow.Cells[4].Visible = !IsUserReadOnly(SandlerUserActions.Edit, SandlerEntities.HomeOffice);
            }

            foreach (GridViewRow row in gvFranchisees.Rows)
            {
                row.Cells[4].Visible = !IsUserReadOnly(SandlerUserActions.Edit, SandlerEntities.HomeOffice);
            }


            franchiseeMenu.ReLoadSubMenu();
            
        }



    }
    protected void btnExportExcel_Click(object sender, ImageClickEventArgs e)
    {
        FranchiseesRepository frRepository = new FranchiseesRepository();
        DataSet ds = new DataSet();
        ds = frRepository.sp_GetAllFranchisees();
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
    //protected void gvFranchisees_RowCreated(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        LinkButton viewDetailButton = (LinkButton)e.Row.FindControl("LinkButton1");
    //        viewDetailButton.Visible = !IsUserReadOnly(SandlerUserActions.Edit, SandlerEntities.HomeOffice);
    //    }


    //}
}