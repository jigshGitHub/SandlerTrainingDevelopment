using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerRepositories;
using System.Data;

public partial class Reports_HomeOfficeReports : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string reportName = Request.QueryString["reportName"];
            if (reportName != null && reportName != "")
            {
                Session["reportName"] = reportName;
                LoadReport();
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }
    }
    private void LoadReport()
    {
        string reportName = Session["reportName"].ToString();
        HomeOfficeReportRepository reportRepository = new HomeOfficeReportRepository();
        DataSet ds = new DataSet();
        ds = reportRepository.GetReportByName(reportName,"");
        lblreportDisplayName.Text = reportRepository.reportDisplayName;
        if (ds.Tables[0].Rows.Count > 0)
        {
            
            LblStatus.Text = "";
            btnExportExcel.Visible = true;
            lblExportToExcel.Visible = true;
           // Session["dt"] = ds.Tables[0];
            gvReports.DataSource = ds.Tables[0];
            gvReports.DataBind();
        }
        else
        {
            LblStatus.Text = "There is no data for this report.";
            btnExportExcel.Visible = false;
            lblExportToExcel.Visible = false;
        }

    }
    protected void btnExportExcel_Click(object sender, ImageClickEventArgs e)
    {
        string reportName = Session["reportName"].ToString();
        HomeOfficeReportRepository reportRepository = new HomeOfficeReportRepository();
        DataSet ds = new DataSet();
        ds = reportRepository.GetReportByName(reportName, "Excel");
        if (ds.Tables[0].Rows.Count > 0)
        {
            LblStatus.Text = "";
            btnExportExcel.Visible = true;
            lblExportToExcel.Visible = true;
            ExportToExcel.DownloadReportResults(ds);
        }
        else
        {
            LblStatus.Text = "There is no data for this report.";
            btnExportExcel.Visible = false;
            lblExportToExcel.Visible = false;
        }
    }

    protected void gvReports_SelectedIndexChanged(object sender, EventArgs e)
    {
        hidFranchiseeID.Value = gvReports.SelectedDataKey.Value.ToString();
        Server.Transfer("~/CRM/HomeOffice/Detail.aspx");
    }
    protected void gvReports_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.Pager)
        {
            GridViewRow row = e.Row;
            // Intitialize TableCell list
            List<TableCell> columns = new List<TableCell>();
            foreach (DataControlField column in gvReports.Columns)
            {
                //Get the first Cell /Column
                TableCell cell = row.Cells[0];
                // Then Remove it after
                row.Cells.Remove(cell);
                //And Add it to the List Collections
                columns.Add(cell);
            }

            // Add cells
            row.Cells.AddRange(columns.ToArray());
        }
    }
    protected void gvReports_DataBound(object sender, EventArgs e)
    {
        GridView gridView = (GridView)sender;
                        
        if (gridView.HeaderRow != null && gridView.HeaderRow.Cells.Count > 0)
        {
            gridView.HeaderRow.Cells[0].Visible = false;
        }

        foreach (GridViewRow row in gvReports.Rows)
        {
            row.Cells[0].Visible = false;
        }
    }
    

    public String sortExpression
    {
        get
        {
            if (ViewState["sortExpression"] == null)
            {
                ViewState["sortExpression"] = Convert.ToString(gvReports.Columns[0].SortExpression);
            }
            return Convert.ToString(ViewState["sortExpression"]);
        }
        set
        {
            ViewState["sortExpression"] = value;
        }
    }

    public String sortDirection
    {
        get
        {

            if (ViewState["sortDirection"] == null)
            {
                ViewState["sortDirection"] = SortDirection.Descending;
            }
            if (Convert.ToString(ViewState["sortDirection"]) == Convert.ToString(SortDirection.Descending))
            {
                return "DESC";
            }
            {
                return "ASC";
            }

        }
        set
        {
            if (value == "ASC")
            {
                ViewState["sortDirection"] = SortDirection.Ascending;
            }
            else
            {
                ViewState["sortDirection"] = SortDirection.Descending;
            }


        }

    }
    protected void gvReports_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvReports.PageIndex = e.NewPageIndex;
      
        SortGridView(sortExpression, sortDirection);
    }


    protected void gvReports_Sorting(object sender, GridViewSortEventArgs e)
    {
        if (sortExpression != e.SortExpression)
        {
            //its a new sort expression so default it to ascending
            sortDirection = "";
        }

        sortExpression = e.SortExpression;

        if (sortDirection == "ASC")
        {
            sortDirection = "DESC";
        }
        else
        {
            sortDirection = "ASC";
        }
        SortGridView(sortExpression, sortDirection);


    }

    private void SortGridView(string sortExpression, string direction)
    {

        //GetFormVars();
        LoadReport();

        DataTable dt = gvReports.DataSource as DataTable;
        DataView dv = new DataView(dt);
        if (sortExpression != null && sortExpression != "")
        {
            dv.Sort = sortExpression + " " + direction;
        }
        //else dv.Sort = DataRowID + " " + direction;

        gvReports.DataSource = dv;

        gvReports.DataBind();


    }

    
}