using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
public partial class CRM_Documents_Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    #region dropdownlists selected index changed events

    protected void ddlCreateDefaultSelection(object sender, EventArgs e)
    {
        DropDownList dropdownList = sender as DropDownList;
        if (!(dropdownList.Items.Count == 0))
        {
            string defaultSelection = "";
            switch (dropdownList.ID)
            {
                case "ddlCompanySearch":
                    defaultSelection = "--Select company--";
                    break;
                case "ddlDocStatus":
                    defaultSelection = "--Select status--";
                    break;
                default:
                    break;

            }

            ListItem selectItem = new ListItem(defaultSelection, "0");
            dropdownList.Items.Insert(0, selectItem);
        }
    }

    protected void ddlCompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddlCompany = sender as DropDownList;
        //BindOpportunitiesForAComnpany(int.Parse(ddlCompany.SelectedValue));
    }


    #endregion

    protected void gvDocuments_SelectedIndexChanged(object sender, EventArgs e)
    {
        hidDocumentID.Value = gvDocuments.SelectedDataKey.Value.ToString();
        Server.Transfer("~/CRM/Documents/Detail.aspx");
    }
    protected void gvDocuments_DataBound(object sender, EventArgs e)
    {
        if (gvDocuments.Rows.Count == 0)
        {
            LblStatus.Text = "There are no documents attached to the selected opportunity.";
        }
        else
        {
            LblStatus.Text = "";
            gvDocuments.Visible = true;
        }

    }

    protected void gvDocuments_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HyperLink moduleLink = e.Row.FindControl("ModuleLink") as HyperLink;
            HiddenField docFullName = e.Row.FindControl("hdnDocFullName") as HiddenField;
            if (moduleLink != null && docFullName != null)
            {
                moduleLink.NavigateUrl = string.Format(@"{0}\{1}", ConfigurationManager.AppSettings["DocumentsUploadLocation"], docFullName.Value);
            }
        }
    }
    protected void lbtnSearch_Click(object sender, EventArgs e)
    {

    }

    #region Excel downloading

    public override void VerifyRenderingInServerForm(Control control)
    {
        //This means that you are overriding the default implementation of the method and giving permission to the GridView to be exported as an Excel file.
    }

    protected void btnExportExcel_Click(object sender, ImageClickEventArgs e)
    {
        //Export results to Excel
        Response.Clear();
        Response.AddHeader("content-disposition", "attachment;filename=AllOpportunities.xls");
        Response.Charset = "";
        //Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Response.ContentType = "application/vnd.ms-excel";
        this.EnableViewState = false;
        System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter htmlWrite = new System.Web.UI.HtmlTextWriter(stringWrite);

        //Report is the Div which we need to Export - Gridview is under this Div
        gvExport.RenderControl(htmlWrite);
        Response.Write(stringWrite.ToString());
        Response.End();
    }

    #endregion
}