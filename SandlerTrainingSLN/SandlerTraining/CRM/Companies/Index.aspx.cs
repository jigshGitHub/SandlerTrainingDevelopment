using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerModels;
using System.Web.UI.HtmlControls;
using SandlerWeb = Sandler.Web;
using System.Data;
using SandlerRepositories;

public partial class CompanyIndex : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        companyMenu.MenuEntityTitle = "Companies";
        
        if (!IsPostBack)
        {
           //companyMenu.MenuEntityTitle = "Companies";
           //We need to store current User's UserId in the hidden field - will be needed when they archive the records
            hidCurrentUserId.Value = CurrentUser.UserId.ToString();
            LblStatus.Text = "";
            hidTableName.Value = "CMP";
        }
    }

    protected void SearchCompanyDS_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["_user"] = CurrentUser;
    }
    
    protected void gvCompanies_SelectedIndexChanged(object sender, EventArgs e)
    {
        hidCompanyID.Value = gvCompanies.SelectedDataKey.Value.ToString();
        Server.Transfer("~/CRM/Companies/Detail.aspx");
    }

    protected void gvCompanies_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton archiveButton = e.Row.FindControl("archiveButton") as LinkButton;
            HiddenField hdnUserId = e.Row.FindControl("hdnUserId") as HiddenField;
            if (archiveButton != null && hdnUserId != null && CurrentUser.Role != SandlerRoles.FranchiseeOwner)
            {
                if (hdnUserId.Value.ToUpper() != CurrentUser.UserId.ToString().ToUpper())
                {
                    archiveButton.Visible = false;
                }
            }
        }
    }
    


    protected void gvCompanies_DataBound(object sender, EventArgs e)
    {
        if (gvCompanies.Rows.Count == 0)
        {
            LblStatus.Text = "There are no Companies entered in the System.";
            btnExportExcel.Visible = false;
            lblExportToExcel.Visible = false;
            companyMenu.MenuEntity.Items.Find(delegate(Sandler.Web.MenuItem item) { return item.Text == "Search"; }).IsVisible = false;
            companyMenu.ReLoadSubMenu();
        }
        else
        {
            LblStatus.Text = "";
            btnExportExcel.Visible = true;
            lblExportToExcel.Visible = true;
            companyMenu.MenuEntity.Items.Find(delegate(Sandler.Web.MenuItem item) { return item.Text == "Search"; }).IsVisible = true;
            companyMenu.ReLoadSubMenu();
            //Get the User Info
            if(CurrentUser.Role == SandlerRoles.Client)
            {
                gvCompanies.Columns[4].HeaderText = "Sales Rep";
            }
            #region [[ Manage Archive column - FranchiseeOwner and FranchiseeUser can only see the column ]]
            if (CurrentUser.Role == SandlerRoles.Client 
                || CurrentUser.Role == SandlerRoles.Coach
                || CurrentUser.Role == SandlerRoles.Corporate
                || CurrentUser.Role == SandlerRoles.HomeOfficeAdmin
                || CurrentUser.Role == SandlerRoles.SiteAdmin
                || CurrentUser.Role == SandlerRoles.HomeOfficeUser)
            {
                //We only need Archive Feature for FrOwner and FrUser so hide complete column if we have any other user role
                GridView gridView = (GridView)sender;
                if (gridView.HeaderRow != null && gridView.HeaderRow.Cells.Count > 0)
                {
                    gridView.HeaderRow.Cells[8].Visible = false;
                }
                foreach (GridViewRow row in gvCompanies.Rows)
                {
                    row.Cells[8].Visible = false;
                }
            }
            #endregion
        }

    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        //This means that you are overriding the default implementation of the method and giving permission to the GridView to be exported as an Excel file.
    }

    protected void btnExportExcel_Click(object sender, ImageClickEventArgs e)
    {
        #region [[Old code]]
        //Export results to Excel
        //trExport.Visible = true;
        //Response.Clear();
        //Response.AddHeader("content-disposition", "attachment;filename=AllCompanies.xls");
        //Response.Charset = "";
        //Response.ContentType = "application/vnd.ms-excel";
        //this.EnableViewState = false;
        //System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        //System.Web.UI.HtmlTextWriter htmlWrite = new System.Web.UI.HtmlTextWriter(stringWrite);
        //gvCompaniesExport.AllowPaging = false;
        //gvCompaniesExport.AllowSorting = false;
        ////Get the User Info
        
        //if (CurrentUser.Role == SandlerRoles.Client)
        //{
        //    gvCompaniesExport.Columns[4].Visible = false;
        //}
        //else
        //{
        //    gvCompaniesExport.Columns[5].Visible = false;
        //}
        //gvCompaniesExport.DataBind();
        ////Report is the Div which we need to Export - Gridview is under this Div
        //Report.RenderControl(htmlWrite);
        //Response.Write(stringWrite.ToString());
        //Response.End();
        //this.EnableViewState = true;
        //trExport.Visible = false;
        #endregion

        //If Custom Headers are used 
        trExport.Visible = true;
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
        //Get in to Datatable
        DataTable dt = new DataTable();
        if (gvCompaniesExport.Rows.Count > 0)
        {
            foreach (TableCell col in gvCompaniesExport.HeaderRow.Cells)
            {
                dt.Columns.Add(col.Text.Replace("&#39;", "'").Replace("&nbsp;", ""));
            }
            foreach (GridViewRow row in gvCompaniesExport.Rows)
            {
                DataRow dr = dt.NewRow();

                int z = 0;
                foreach (TableCell col in gvCompaniesExport.HeaderRow.Cells)
                {
                    dr[z] = row.Cells[z].Text.Replace("&#39;", "'").Replace("&nbsp;", "");
                    z += 1;
                }

                dt.Rows.Add(dr);
            }
            //Get Excel file
            ExportToExcel.DownloadReportResultsWithDT(dt, "AllCompanies");
        }
        
        //If Dataset has correct Header Names
        //CompaniesRepository reportRepository = new CompaniesRepository();
        //DataSet ds = new DataSet();
        //ds = reportRepository.GetAllCompanies(CurrentUser);
        //ExportToExcel.DownloadReportResultsWithDT(ds.Tables[0], "AllCompanies");


    }

    protected void gvCompanies_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        //We come here after the Archive operation is done
        if(e.Exception != null)
        {
            LblStatus.Text = "Failed to Archive the Company Record. Please try it later again.";
            e.ExceptionHandled = true;
        }
                
    }
}