using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerModels;
using System.Web.UI.HtmlControls;
using SandlerWeb = Sandler.Web;
public partial class CompanyIndex : BasePage
{


    protected void Page_Load(object sender, EventArgs e)
    {
        companyMenu.MenuEntityTitle = "Companies";
        if (!IsPostBack)
        {
//            companyMenu.MenuEntityTitle = "Companies";
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
            
        }

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
        Response.AddHeader("content-disposition", "attachment;filename=AllCompanies.xls");
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