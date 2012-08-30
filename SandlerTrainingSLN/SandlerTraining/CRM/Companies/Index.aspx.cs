using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerModels;


public partial class CompanyIndex : BasePage
{
    
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            addCompanyAnchor.Visible = !IsUserReadOnly(SandlerUserActions.Add, SandlerEntities.Company);
            //addProductAnchor.Visible = !IsUserReadOnly(SandlerUserActions.Add, SandlerEntities.Company);
        }
    }
    protected void btnAddCompany_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/CRM/Companies/Add.aspx");
    }
    protected void btnAddProduct_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/CRM/Product/Add.aspx");
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
        }
        else
        {
            LblStatus.Text = "";
            btnExportExcel.Visible = true;
        }

    }
    
    public override void VerifyRenderingInServerForm(Control control)
    {
        //This means that you are overriding the default implementation of the method and giving permission to the GridView to be exported as an Excel file.
    }

    protected void btnExportExcel_Click(object sender, ImageClickEventArgs e)
    {
        //Export results to Excel
        Response.Clear();
        Response.AddHeader("content-disposition", "attachment;filename=AllCompanies.xls");
        Response.Charset = "";
        //Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Response.ContentType = "application/vnd.ms-excel";
        this.EnableViewState = false;
        System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter htmlWrite = new System.Web.UI.HtmlTextWriter(stringWrite);
        gvCompanies.AllowPaging = false;
        gvCompanies.AllowSorting = false;
        gvCompanies.DataBind();
        gvCompanies.Columns[6].Visible = false;
        //Report is the Div which we need to Export - Gridview is under this Div
        Report.RenderControl(htmlWrite);
        Response.Write(stringWrite.ToString());
        Response.End();
        gvCompanies.AllowPaging = true;
        gvCompanies.AllowSorting = true;
        this.EnableViewState = true;
        gvCompanies.DataBind();
    }

    


}