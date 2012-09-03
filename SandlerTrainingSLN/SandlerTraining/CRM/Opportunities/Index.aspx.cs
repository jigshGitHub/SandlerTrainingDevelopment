using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerModels;
using SandlerData;
public partial class OpportunityIndex : OpportunityBasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            addOpportunityAnchor.Visible = !IsUserReadOnly(SandlerUserActions.Add, SandlerEntities.Opportunity);
            searchAnchor.Visible = !IsUserReadOnly(SandlerUserActions.Add, SandlerEntities.Opportunity);

            if (!string.IsNullOrEmpty(Request.QueryString["AllowSearch"]))
                AllowSearch = true;

            if (!string.IsNullOrEmpty(Request.QueryString["currentPage"]))
                CurrentPage = int.Parse(Request.QueryString["currentPage"]);

            if (!AllowSearch)
            {
                SetSearchIndexPanelsVisibility(true);
                BindOpportunitiesForAComnpany(0);
            }
            else
            {
                SetSearchIndexPanelsVisibility(false);
                BindContacts(0);
            }
        }
    }

    private void SetSearchIndexPanelsVisibility(bool visibility)
    {
        pnlIndex.Visible = visibility;
        pnlSerach.Visible = !visibility;
    }

    private void BindOpportunitiesForAComnpany(int companyId)
    {
        var data = from record in GetOpportunities(companyId)
                   select new { ID = record.ID, OPPORTUNITYID = record.OpportunityID.Value, NAME = record.NAME, CompanyName = GetCompany(record.COMPANYID).COMPANYNAME, VALUE = record.VALUE, WEIGHTEDVALUE = record.WEIGHTEDVALUE, CloseDate = record.CLOSEDATE, SalesRep = record.SALESREPFIRSTNAME + " " + record.SALESREPLASTNAME, Status = GetOpportunityStatus(record.STATUSID.Value).Name };
        TotalRecords = data.Count();
        //var filterRecords = 
        gvOpportunities.DataSource = IQueryableExtensions.Page(data, PageSize, CurrentPage).AsQueryable();
        gvOpportunities.DataBind();

        pager.BindPager(TotalRecords, PageSize, CurrentPage);
    }

    private void BindOpportunitiesForASearch()
    {
        int? companyId;
        int? productId;
        int? statusId;
        int? contactId;

        if(ddlCompany.SelectedIndex > 0) companyId = int.Parse(ddlCompany.SelectedValue); else companyId= null;
        if(ddlProducts.SelectedIndex > 0) productId = int.Parse(ddlProducts.SelectedValue); else productId= null;
        if(ddlProductStatus.SelectedIndex > 0) statusId = int.Parse(ddlProductStatus.SelectedValue); else statusId= null;
        if(ddlContacts.SelectedIndex > 0) contactId = int.Parse(ddlContacts.SelectedValue); else contactId= null;

        var data = from record in GetOpportunities(companyId, txtOpportunityID.Text, txtOppName.Text, txtSalesRepFName.Text,txtSalesRepLName.Text, txtSalesRepPhone.Text, productId,statusId,contactId, txtContactPhone.Text, txtEmail.Text)
                   select new { ID = record.ID, OPPORTUNITYID = record.OpportunityID.Value, NAME = record.NAME, CompanyName = GetCompany(record.COMPANYID).COMPANYNAME, VALUE = record.VALUE, WEIGHTEDVALUE = record.WEIGHTEDVALUE, CloseDate = record.CLOSEDATE, SalesRep = record.SALESREPFIRSTNAME + " " + record.SALESREPLASTNAME, Status = GetOpportunityStatus(record.STATUSID.Value).Name };
        TotalRecords = data.Count();
        //var filterRecords = 
        gvOpportunities.DataSource = IQueryableExtensions.Page(data, PageSize, CurrentPage).AsQueryable();
        gvOpportunities.DataBind();

        pager.BindPager(TotalRecords, PageSize, CurrentPage);
    }
    private void BindOpportunitiesForASerach()
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
                case "ddlCompany":
                    defaultSelection = (AllowSearch) ? "--Select company--" : "All";
                    break;
                case "ddlProducts":
                    defaultSelection = "--Select product--";
                    break;
                case "ddlProductStatus":
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
        if (!AllowSearch)
            BindOpportunitiesForAComnpany(int.Parse(ddlCompany.SelectedValue));
        else
            BindContacts(int.Parse(ddlCompany.SelectedValue));
    }

    private void BindContacts(int companyId)
    {
        var data = from records in GetContactsByCompany(companyId)
                   select new { Name = records.FIRSTNAME + " " + records.LASTNAME, ID = records.CONTACTSID };
        ddlContacts.DataSource = data;
        ddlContacts.DataTextField = "Name";
        ddlContacts.DataValueField = "ID";
        ddlContacts.DataBind();
        ddlContacts.Items.Insert(0, new ListItem("--Select contact--", "0"));
    }
    #endregion

    #region gvOpportunities Events

    decimal Weighted_valueTotal = 0;
    decimal Total_ValueTotal = 0;


    protected void gvOpportunities_DataBound(object sender, EventArgs e)
    {
        if (gvOpportunities.Rows.Count == 0)
        {
            LblStatus.Text = "There are no Opportunity available for this company.";
        }
        else
        {
            LblStatus.Text = "";
        }
    }

    protected void gvOpportunities_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // add the UnitPrice and QuantityTotal to the running total variables
            Weighted_valueTotal += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Weightedvalue"));
            Total_ValueTotal += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Value"));
        }
        else if (e.Row.RowType == DataControlRowType.Footer)
        {
            e.Row.Cells[1].Text = "Total";
            e.Row.Cells[4].Text = Weighted_valueTotal.ToString("c");
            e.Row.Cells[5].Text = Total_ValueTotal.ToString("c");

            e.Row.Cells[1].HorizontalAlign = e.Row.Cells[4].HorizontalAlign = e.Row.Cells[5].HorizontalAlign = HorizontalAlign.Center;
            e.Row.Font.Bold = true;
        }
    }

    protected void gvOpportunities_Sorting(object sender, GridViewSortEventArgs e)
    {
        SortExpression = e.SortExpression;
        SortDirection = e.SortDirection.ToString();
    }

    #endregion

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
        gvOpportunities.AllowPaging = false;
        gvOpportunities.AllowSorting = false;
        BindOpportunitiesForAComnpany(int.Parse(ddlCompany.SelectedValue));
        gvOpportunities.Columns[9].Visible = false;

        //Report is the Div which we need to Export - Gridview is under this Div
        Report.RenderControl(htmlWrite);
        Response.Write(stringWrite.ToString());
        Response.End();
        gvOpportunities.AllowPaging = true;
        gvOpportunities.AllowSorting = true;
        this.EnableViewState = true;
        gvOpportunities.DataBind();
    }

    #endregion

    #region commented code
    //public string BindPager()
    //{
    //    int pageCount = (TotalRecords % PageSize > 0) ? ((TotalRecords / PageSize) + 1) : TotalRecords / PageSize;
    //    int currentPage = 1;
    //    System.Text.StringBuilder sb = new System.Text.StringBuilder("");
    //    if (pageCount > 1)
    //    {
    //        sb.Append("<table>");
    //        sb.Append("<tr>");

    //        for (int index = 1; index <= pageCount; index++)
    //        {
    //            if (currentPage == CurrentPage)
    //                sb.Append("<td><a  class=selected href=index.aspx?currentPage=" + currentPage + ">" + index + "</a></td>");
    //            else
    //                sb.Append("<td><a href=index.aspx?currentPage=" + currentPage + ">" + index + "</a></td>");
    //            currentPage++;
    //        }
    //        sb.Append("</tr></table>");
    //    }
    //    return sb.ToString();
    //}
    #endregion

    protected void lbtnSearch_Click(object sender, EventArgs e)
    {

    }
}