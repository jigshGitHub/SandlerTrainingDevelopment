using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRM_Contacts_CallList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void gvCallList_SelectedIndexChanged(object sender, EventArgs e)
    {
        hidContactID.Value = gvCallList.SelectedDataKey.Value.ToString();
        Server.Transfer("~/CRM/Contacts/Detail.aspx");
    }
    protected void gvCallList_DataBound(object sender, EventArgs e)
    {
        if (gvCallList.Rows.Count == 0)
        {
            LblStatus.Text = "Your call list is empty for now.";
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
        Response.AddHeader("content-disposition", "attachment;filename=CallList.xls");
        Response.Charset = "";
        //Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Response.ContentType = "application/vnd.ms-excel";
        this.EnableViewState = false;
        System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter htmlWrite = new System.Web.UI.HtmlTextWriter(stringWrite);
        gvCallList.AllowPaging = false;
        gvCallList.AllowSorting = false;
        gvCallList.DataBind();
        gvCallList.Columns[6].Visible = false;
        //Report is the Div which we need to Export - Gridview is under this Div
        Report.RenderControl(htmlWrite);
        Response.Write(stringWrite.ToString());
        Response.End();
        gvCallList.AllowPaging = true;
        gvCallList.AllowSorting = true;
        this.EnableViewState = true;
        gvCallList.DataBind();
    }
}