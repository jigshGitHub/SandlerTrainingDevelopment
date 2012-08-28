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
            
            if(!string.IsNullOrEmpty(Request.QueryString["currentPage"]))
                CurrentPage = int.Parse(Request.QueryString["currentPage"]);

            BindGrid(0);
        }
    }

    private void BindGrid(int companyId)
    {
        //var data = from record in GetOpportunities(companyId)
        //           select new { ID = record.ID, OPPORTUNITYID = record.OpportunityID.Value, NAME = record.NAME, CompanyName = record.TBL_COMPANIES.COMPANYNAME, VALUE = record.VALUE, WEIGHTEDVALUE = record.WEIGHTEDVALUE, CloseDate = record.CLOSEDATE, SalesRep = record.SALESREPFIRSTNAME + " " + record.SALESREPLASTNAME, Status = record.TBL_OPPORTUNITYSTATUS.Name };
        //TotalRecords = data.Count();
        //gvOpportunities.DataSource = data.Skip(SkipRecords).Take(PageSize);
        //gvOpportunities.DataBind();
        //Status = GetOpportunityStatus(GetContact(long.Parse(record.CONTACTID.ToString())).ApptSourceId.Value).Name
        var data = from record in GetOpportunities(companyId)
                   select new { ID = record.ID, OPPORTUNITYID = record.OpportunityID.Value, NAME = record.NAME, CompanyName = GetCompany(record.COMPANYID).COMPANYNAME, VALUE = record.VALUE, WEIGHTEDVALUE = record.WEIGHTEDVALUE, CloseDate = record.CLOSEDATE, SalesRep = record.SALESREPFIRSTNAME + " " + record.SALESREPLASTNAME, Status = GetOpportunityStatus(record.STATUSID.Value).Name };
        TotalRecords = data.Count();
        //var filterRecords = 
        gvOpportunities.DataSource = IQueryableExtensions.Page(data ,PageSize, CurrentPage).AsQueryable();                                     
        gvOpportunities.DataBind();

        pager.BindPager(TotalRecords, PageSize, CurrentPage);
    }

    public string BindPager()
    {
        int pageCount = (TotalRecords % PageSize > 0) ? ((TotalRecords / PageSize) + 1) : TotalRecords / PageSize;
        int currentPage = 1;
        System.Text.StringBuilder sb = new System.Text.StringBuilder("");
        if (pageCount > 1)
        {
            sb.Append("<table>");
            sb.Append("<tr>");

            for (int index = 1; index <= pageCount; index++)
            {
                if (currentPage == CurrentPage)
                    sb.Append("<td><a  class=selected href=index.aspx?currentPage=" + currentPage + ">" + index + "</a></td>");
                else
                    sb.Append("<td><a href=index.aspx?currentPage=" + currentPage + ">" + index + "</a></td>");
                currentPage++;
            }
            sb.Append("</tr></table>");
        }
        return sb.ToString();
    }
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
    protected void ddlCompany_DataBound(object sender, EventArgs e)
    {
        if (!(ddlCompany.Items.Count == 0))
        {
            ListItem selectItem = new ListItem("All", "0");
            ddlCompany.Items.Insert(0, selectItem);
        }
    }
    decimal Weighted_valueTotal = 0;
    decimal Total_ValueTotal = 0;
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
    protected void ddlCompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGrid(int.Parse(ddlCompany.SelectedValue));
    }
    protected void gvOpportunities_Sorting(object sender, GridViewSortEventArgs e)
    {
        SortExpression = e.SortExpression;
        SortDirection = e.SortDirection.ToString();
    }
}