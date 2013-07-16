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


public partial class CompaniesArchived : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            lblModuleActionHeading.Text = "View Archived Company Records:";
            //We need to store current User's UserId in the hidden field - will be needed when they archive the records
            hidCurrentUserId.Value = CurrentUser.UserId.ToString();
            LblStatus.Text = "";
        }
    }

    protected void SearchArchiveCompanyDS_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["_user"] = CurrentUser;
    }


    protected void gvArchivedCompanies_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton unarchiveButton = e.Row.FindControl("unarchiveButton") as LinkButton;
            HiddenField hdnUserId = e.Row.FindControl("hdnUserId") as HiddenField;
            if (unarchiveButton != null && hdnUserId != null && CurrentUser.Role != SandlerRoles.FranchiseeOwner)
            {
                if (hdnUserId.Value.ToUpper() != CurrentUser.UserId.ToString().ToUpper())
                {
                    unarchiveButton.Visible = false;
                }
            }
        }
    }

    protected void gvArchivedCompanies_DataBound(object sender, EventArgs e)
    {
        if (gvArchivedCompanies.Rows.Count == 0)
        {
            LblStatus.Text = "There are no Archived Companies for this Franchisee at this time.";
            btnExportExcel.Visible = false;
            lblExportToExcel.Visible = false;
            
        }
        else
        {
            LblStatus.Text = "";
            btnExportExcel.Visible = true;
            lblExportToExcel.Visible = true;
            //Get the User Info
            if (CurrentUser.Role == SandlerRoles.Client)
            {
                gvArchivedCompanies.Columns[4].HeaderText = "Sales Rep";
            }
            #region [[ Manage Archive column ]]
            if (CurrentUser.Role == SandlerRoles.Client
                || CurrentUser.Role == SandlerRoles.Coach
                || CurrentUser.Role == SandlerRoles.Corporate
                || CurrentUser.Role == SandlerRoles.HomeOfficeAdmin
                || CurrentUser.Role == SandlerRoles.SiteAdmin)
            {
                //We only need Archive Feature for FrOwner and FrUser so hide complete column if we have any other user role
                GridView gridView = (GridView)sender;
                if (gridView.HeaderRow != null && gridView.HeaderRow.Cells.Count > 0)
                {
                    gridView.HeaderRow.Cells[7].Visible = false;
                }
                foreach (GridViewRow row in gvArchivedCompanies.Rows)
                {
                    row.Cells[7].Visible = false;
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
        gvArchivedCompaniesExport.AllowPaging = false;
        gvArchivedCompaniesExport.AllowSorting = false;
        //Get the User Info

        if (CurrentUser.Role == SandlerRoles.Client)
        {
            gvArchivedCompaniesExport.Columns[4].Visible = false;
        }
        else
        {
            gvArchivedCompaniesExport.Columns[5].Visible = false;
        }
        gvArchivedCompaniesExport.DataBind();
        //Get in to Datatable
        DataTable dt = new DataTable();
        if (gvArchivedCompaniesExport.Rows.Count > 0)
        {
            foreach (TableCell col in gvArchivedCompaniesExport.HeaderRow.Cells)
            {
                dt.Columns.Add(col.Text.Replace("&#39;", "'").Replace("&nbsp;", ""));
            }
            foreach (GridViewRow row in gvArchivedCompaniesExport.Rows)
            {
                DataRow dr = dt.NewRow();

                int z = 0;
                foreach (TableCell col in gvArchivedCompaniesExport.HeaderRow.Cells)
                {
                    dr[z] = row.Cells[z].Text.Replace("&#39;", "'").Replace("&nbsp;", "");
                    z += 1;
                }

                dt.Rows.Add(dr);
            }
            //Get Excel file
            ExportToExcel.DownloadReportResultsWithDT(dt, "AllArchivedCompanies");
        }

        //If Dataset has correct Header Names
        //CompaniesRepository reportRepository = new CompaniesRepository();
        //DataSet ds = new DataSet();
        //ds = reportRepository.GetAllCompanies(CurrentUser);
        //ExportToExcel.DownloadReportResultsWithDT(ds.Tables[0], "AllCompanies");


    }

    protected void gvArchivedCompanies_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        //We come here after the UnArchive operation is done
        if (e.Exception != null)
        {
            LblStatus.Text = "Failed to UnArchive the Company Record. Please try it later again.";
            e.ExceptionHandled = true;
        }

    }
}