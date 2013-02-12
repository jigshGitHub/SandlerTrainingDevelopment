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
    SortDirection sortingDirection { get { return (SortDirection)Session["sortingDirection"]; } set { Session["sortingDirection"] = value; } }
    String sortingExpression { get { return (String)Session["sortingExpression"]; } set { Session["sortingExpression"] = value; } }
    String filteringExpression { get { return (String)Session["filteringExpression"]; } set { Session["filteringExpression"] = value; } }

    protected void Page_Load(object sender, EventArgs e)
    {
        franchiseeMenu.MenuEntityTitle = "HomeOffice";
        
        UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];
        if(_user.Role == SandlerRoles.HomeOfficeAdmin)
        {txtGridSearch.Visible = false;
       btnGridSearch.Visible = false;}
       
        

        if (filteringExpression != null)
        {
            SearchFranchiseeDS.FilterExpression = filteringExpression; // there should be something like src.Filter( ... ) ?
        }

        if (sortingExpression != null)
        {
            gvFranchisees.Sort(sortingExpression, sortingDirection);
        }
    }

    protected void gv_Sorting(object sender, GridViewSortEventArgs e)
    {
        sortingDirection = e.SortDirection;
        sortingExpression = e.SortExpression;
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
            lblExportToExcel.Visible = false;
            franchiseeMenu.ReLoadSubMenu();
        }
        else
        {
            LblStatus.Text = "";
            btnExportExcel.Visible = true;
            lblExportToExcel.Visible = true;
            //This is to make sure that View/Detail link will be visible only to HomeOfficeAdmin User
            GridView gridView = (GridView)sender;
            if (gridView.HeaderRow != null && gridView.HeaderRow.Cells.Count > 0)
            {
                gridView.HeaderRow.Cells[7].Visible = !IsUserReadOnly(SandlerUserActions.Edit, SandlerEntities.HomeOffice);
            }
            foreach (GridViewRow row in gvFranchisees.Rows)
            {
                row.Cells[7].Visible = !IsUserReadOnly(SandlerUserActions.Edit, SandlerEntities.HomeOffice);
            }
            //Done
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
            lblExportToExcel.Visible = true;
            //We do not need ID column so remove it from the Datasource
            ds.Tables[0].Columns.RemoveAt(0);
            //Now get Export to Excel result
            ExportToExcel.DownloadReportResults(ds);
        }
   }
   
}