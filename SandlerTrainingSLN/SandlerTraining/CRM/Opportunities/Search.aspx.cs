using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerModels;
using SandlerData;
public partial class OpportunitySearch : OpportunityBasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["currentPage"]))
                CurrentPage = int.Parse(Request.QueryString["currentPage"]);

            //BindContacts(0);
        }
    }

    protected void Page_Prerender(object sender, EventArgs e)
    {
        //opportunityMenu.MenuEntity.Items.Find(delegate(Sandler.Web.MenuItem item) { return item.Text == "Search"; }).IsVisible = !pnlSearch.Visible;
        //opportunityMenu.ReLoadSubMenu();
        pnlResults.Visible = !pnlSearch.Visible;
    }

    private void BindOpportunitiesForASearch()
    {
        int? companyId;
        int? productId;
        int? statusId;
        int? contactId;

        if (ddlCompanySearch.SelectedIndex > 0) companyId = int.Parse(ddlCompanySearch.SelectedValue); else companyId = null;
        if (ddlProducts.SelectedIndex > 0) productId = int.Parse(ddlProducts.SelectedValue); else productId = null;
        if (ddlProductStatus.SelectedIndex > 0) statusId = int.Parse(ddlProductStatus.SelectedValue); else statusId = null;
        if (ddlContacts.SelectedIndex > 0) contactId = int.Parse(ddlContacts.SelectedValue); else contactId = null;

        var data = from record in GetOpportunities(companyId, txtOpportunityID.Text, txtOppName.Text, txtSalesRepFName.Text, txtSalesRepLName.Text, txtSalesRepPhone.Text, productId, statusId, contactId, txtContactPhone.Text, txtEmail.Text)
                   select new
                   {
                       ID = record.ID,
                       OPPORTUNITYID = record.OpportunityID.Value,
                       NAME = record.NAME,
                       CompanyName = GetCompany(record.COMPANYID).COMPANYNAME,
                       VALUE = record.VALUE,
                       WEIGHTEDVALUE = record.WEIGHTEDVALUE,
                       CloseDate = record.CLOSEDATE,
                       SalesRep = record.SALESREPFIRSTNAME + " " + record.SALESREPLASTNAME,
                       Status = record.Status,//GetOpportunityStatus(record.STATUSID.Value).Name,
                       //ContactName = GetContact(record.CONTACTID).FIRSTNAME + GetContact(record.CONTACTID).LASTNAME,
                       //ContactPhone = GetContact(record.CONTACTID).PHONE,
                       //ContactEmail = GetContact(record.CONTACTID).EMAIL,
                       PrimaryContact = record.PrimaryContactFirstName + " " + record.PrimaryContactLastName + ", " + record.PrimaryContactEmail,
                       SecondaryContact1 = record.SeconadryContact1FirstName + " " + record.SeconadryContact1LastName + ", " + record.SeconadryContact1Email,
                       SecondaryContact2 = record.SeconadryContact2FirstName + " " + record.SeconadryContact2LastName + ", " + record.SeconadryContact2Email,
                       Product = record.ProductTypeName,//GetProduct(record.ProductID).ProductTypeName,
                       Franchisee = record.FranchiseeName,
                       Region = record.Region,
                       OppType = record.Type,
                       WhyLost = record.WhyLost,
                       Description = record.Description,
                       Notes = record.Notes,
                       ActualValue = (record.ActualValue.HasValue) ? record.ActualValue.Value.ToString() : "",
                       Source = record.Source
                   };
        TotalRecords = data.Count();
        lblResultsCount.Text = "Total records found:" + TotalRecords.ToString();
        //var filterRecords = 
        gvOpportunities.DataSource = IQueryableExtensions.Page(data, PageSize, CurrentPage).AsQueryable();
        gvOpportunities.DataBind();

        gvExport.DataSource = data;
        gvExport.DataBind();
        pager.BindPager(TotalRecords, PageSize, CurrentPage);
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

    protected void ddlContacts_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddlContacts = sender as DropDownList;
        if (ddlContacts.SelectedIndex > 0)
        {
            TBL_CONTACTS contact = GetContact(long.Parse(ddlContacts.SelectedValue));
            SetContact(contact.PHONE, contact.EMAIL);
        }
        else
            SetContact("", "");

    }

    private void SetContact(string phone, string email)
    {
        txtContactPhone.Text = phone;
        txtEmail.Text = email;
    }
    #endregion

    #region gvOpportunities Events

    decimal Weighted_valueTotal = 0;
    decimal Total_ValueTotal = 0;


    protected void gvOpportunities_DataBound(object sender, EventArgs e)
    {
        if (gvOpportunities.Rows.Count == 0)
        {
            LblStatus.Text = "There are no Opportunity available.";
            pnlSearch.Visible = true;
        }
        else
        {
            LblStatus.Text = "";
            pnlSearch.Visible = false;
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
        //SortDirection = e.SortDirection.ToString();
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
        LblStatus.Text = "";
        BindOpportunitiesForASearch();
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