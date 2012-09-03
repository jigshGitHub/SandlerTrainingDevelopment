using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRM_Contacts_SearchResults : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["ContactSearchCount"] != null)
            {
                lblInfo.Text = "Total Records found: " + Session["ContactSearchCount"].ToString();
            }
            else
            {
                Response.Redirect("~/CRM/Contacts/Search.aspx");
            }
        }
    }
    protected void gvContacts_DataBound(object sender, EventArgs e)
    {
        if (gvContacts.Rows.Count == 0)
        {
            LblStatus.Text = "There are no results matching with your criteria.";
        }
        else
        {
            LblStatus.Text = "";
        }
    }
    protected void gvContacts_SelectedIndexChanged(object sender, EventArgs e)
    {
        hidContactID.Value = gvContacts.SelectedDataKey.Value.ToString();
        Server.Transfer("~/CRM/Contacts/Detail.aspx");
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
        gvContactsExport.AllowPaging = false;
        gvContactsExport.AllowSorting = false;
        gvContactsExport.DataBind();
        //Report is the Div which we need to Export - Gridview is under this Div
        Report.RenderControl(htmlWrite);
        Response.Write(stringWrite.ToString());
        Response.End();
        this.EnableViewState = true;
        trExport.Visible = false;
    }
}