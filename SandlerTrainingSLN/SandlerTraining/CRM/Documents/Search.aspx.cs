using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
public partial class CRM_Documents_Search : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Page_Prerender(object sender, EventArgs e)
    {
        pnlResults.Visible = !pnlSearch.Visible;
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

    #endregion

    private void BindDocumentsForASearch()
    {
        int? companyId;
        int? opportunityId;
        int? statusId;

        if (ddlCompanySearch.SelectedIndex > 0) companyId = int.Parse(ddlCompanySearch.SelectedValue); else companyId = null;
        if (ddlOpportunities.SelectedIndex > 0) opportunityId = int.Parse(ddlOpportunities.SelectedValue); else opportunityId = null;
        if (ddlDocStatus.SelectedIndex > 0) statusId = int.Parse(ddlDocStatus.SelectedValue); else statusId = null;

        IQueryable<SandlerModels.TBL_DOCS> documents = from record in new SandlerRepositories.DocumentsRepository().GetAll().Where(d => d.IsActive == true).AsQueryable()
                                                       select record;
                   
        documents = SandlerData.IQueryableExtensions.OptionalWhere(documents, companyId, x => (doc => doc.COMPANYID == companyId));
        documents = SandlerData.IQueryableExtensions.OptionalWhere(documents, opportunityId, x => (doc => doc.OPPSID == opportunityId));
        documents = SandlerData.IQueryableExtensions.OptionalWhere(documents, statusId, x => (doc => doc.DOCSTATUSID == statusId));

        if (!string.IsNullOrEmpty(txtDocName.Text))
            documents = documents.Where(doc => doc.DOCNAME ==txtDocName.Text);

        var data = from record in documents.AsQueryable()
                   select new
                    {
                        DOCSID = record.DOCSID,
                        DocumentName = record.DOCNAME,
                        CompanyName = new SandlerRepositories.CompaniesRepository().GetById(long.Parse(record.COMPANYID.ToString())).COMPANYNAME,
                        OpportunityName = new SandlerRepositories.OpportunitiesRepository().GetById(long.Parse(record.OPPSID.ToString())).NAME,
                        Status = new SandlerRepositories.DocumentsStatusRepository().GetById(long.Parse(record.DOCSTATUSID.ToString())).DocStatusText
                    };
        TotalRecords = data.Count();
        lblResultsCount.Text = "Total records found:" + TotalRecords.ToString();
        //var filterRecords = 
        gvDocuments.DataSource = SandlerData.IQueryableExtensions.Page(data, PageSize, CurrentPage).AsQueryable();
        gvDocuments.DataBind();

        gvExport.DataSource = data;
        gvExport.DataBind();
        pager.BindPager(TotalRecords, PageSize, CurrentPage);
    }

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
            pnlSearch.Visible = true;
        }
        else
        {
            LblStatus.Text = "";
            pnlSearch.Visible = false;
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
        LblStatus.Text = "";
        BindDocumentsForASearch();
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