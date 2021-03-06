﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerModels;
using SandlerData;
using System.Data;

public partial class OpportunityIndex : OpportunityBasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        opportunityMenu.MenuEntityTitle = "Opportunities";
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["currentPage"]))
                CurrentPage = int.Parse(Request.QueryString["currentPage"]);
            CompanyID = 0;
            BindOpportunitiesForAComnpany(0);
        }
    }
    protected void CompanyDS_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["_user"] = CurrentUser;
    }
    private void BindOpportunitiesForAComnpany(int companyId)
    {
        var data = from record in GetOpportunities(companyId)
                   select new
                   {
                       ID = record.ID,
                       OPPORTUNITYID = record.OpportunityID.Value,
                       NAME = record.NAME,
                       CompanyName = GetCompany(record.COMPANYID).COMPANYNAME,
                       VALUE = record.VALUE,
                       WEIGHTEDVALUE = record.WEIGHTEDVALUE,
                       CloseDate = record.CLOSEDATE,
                       CreationDate = (record.OppCreationDate.HasValue) ? record.OppCreationDate.Value.ToString():"",
                       SalesRep = record.SALESREPFIRSTNAME + " " + record.SALESREPLASTNAME,
                       Status = record.Status,//GetOpportunityStatus(record.STATUSID.Value).Name,
                       //ContactName = GetContact(record.CONTACTID).FIRSTNAME + GetContact(record.CONTACTID).LASTNAME,
                       //ContactPhone = GetContact(record.CONTACTID).PHONE,
                       //ContactEmail = GetContact(record.CONTACTID).EMAIL,
                       PrimaryContact = record.PrimaryContactFirstName + " " + record.PrimaryContactLastName + ", " + record.PrimaryContactEmail,
                       SecondaryContact1 = record.SeconadryContact1FirstName + " " + record.SeconadryContact1LastName + ", " + record.SeconadryContact1Email,
                       SecondaryContact2 = record.SeconadryContact2FirstName + " " + record.SeconadryContact2LastName + ", " + record.SeconadryContact2Email,
                       Product = record.ProductTypeName,//GetProduct(record.ProductID).ProductTypeName,
                       ProductCost = record.ProductCost,
                       Franchisee = record.FranchiseeName,
                       Region = record.Region,
                       OppType = record.Type,
                       WhyLost = record.WhyLost,
                       Description = record.Description,
                       Notes = record.Notes,
                       ActualValue = (record.ActualValue.HasValue) ? record.ActualValue.Value.ToString() : "",
                       Source = record.Source,
                       StatusID = (record.STATUSID.HasValue) ? record.STATUSID.Value : 1,
                       SalesRepFN = record.SALESREPFIRSTNAME,
                       SalesRepLN = record.SALESREPLASTNAME
                   };
        TotalRecords = userEntities.OpportunitiesCount;// data.Count();
        gvOpportunities.DataSource = IQueryableExtensions.Sort(data.Skip((CurrentPage - 1) * PageSize).Take(PageSize), SortExpression, IsAscendigSortOrder);
        //IQueryableExtensions.Page(IQueryableExtensions.Sort(data, SortExpression, IsAscendigSortOrder), PageSize, CurrentPage).AsQueryable();
        gvOpportunities.DataBind();

        pager.BindPager(TotalRecords, PageSize, CurrentPage);
    }

    private bool IsArchiveVisible()
    {
        return !IsUserReadOnly(SandlerUserActions.Edit, SandlerEntities.Opportunity); ;
    }

    private void BindFieldsToOpportunity(TBL_OPPORTUNITIES opportunity, GridViewRow row)
    {
        opportunity.NAME = (row.FindControl("txtName") as TextBox).Text;
        if (!string.IsNullOrEmpty((row.FindControl("txtValue") as TextBox).Text))
            opportunity.VALUE = decimal.Parse((row.FindControl("txtValue") as TextBox).Text);
        if (!string.IsNullOrEmpty((row.FindControl("txtCloseDt") as TextBox).Text))
            opportunity.CLOSEDATE = Convert.ToDateTime((row.FindControl("txtCloseDt") as TextBox).Text);
        opportunity.SALESREPFIRSTNAME = (row.FindControl("txtSalesFN") as TextBox).Text;
        opportunity.SALESREPLASTNAME = (row.FindControl("txtSalesLN") as TextBox).Text;
        if ((row.FindControl("ddlProductStatus") as DropDownList).SelectedIndex > 0)
            opportunity.STATUSID = int.Parse((row.FindControl("ddlProductStatus") as DropDownList).SelectedValue);
        else
            opportunity.STATUSID = null;
        opportunity.Notes = (row.FindControl("txtNotes") as TextBox).Text;
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
                case "ddlCompany":
                    defaultSelection = "All";
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
        CompanyID = int.Parse(ddlCompany.SelectedValue);
        BindOpportunitiesForAComnpany(CompanyID);
    }


    #endregion

    #region gvOpportunities Events

    decimal Weighted_valueTotal = 0;
    decimal PageValueTotal = 0;

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
            PageValueTotal += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Value"));
            e.Row.Cells[10].Visible = IsArchiveVisible();
        }
        else if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[10].Visible = IsArchiveVisible();
        }
        else if (e.Row.RowType == DataControlRowType.Footer)
        {
            e.Row.Cells[2].Text = "Page Total<br />Grand Total";
            //e.Row.Cells[4].Text = Weighted_valueTotal.ToString("c");
            e.Row.Cells[5].Text = string.Format("{0}<br />{1}",PageValueTotal.ToString("c"), TotalValue.ToString("c"));

            e.Row.Cells[1].HorizontalAlign = e.Row.Cells[4].HorizontalAlign = e.Row.Cells[5].HorizontalAlign = HorizontalAlign.Center;
            e.Row.Font.Bold = true;
            e.Row.Cells[10].Visible = IsArchiveVisible();
        }
    }

    protected void gvOpportunities_Sorting(object sender, GridViewSortEventArgs e)
    {
        if (SortExpression == e.SortExpression)
        {
            IsAscendigSortOrder = !IsAscendigSortOrder;
        }
        else
        {
            IsAscendigSortOrder = true;
        }
        SortExpression = e.SortExpression;
        BindOpportunitiesForAComnpany(CompanyID);
    }

    protected void gvOpportunities_Editing(object sender, GridViewEditEventArgs e)
    {
        gvOpportunities.EditIndex = e.NewEditIndex;
        BindOpportunitiesForAComnpany(CompanyID);
    }
    
    protected void gvOpportunities_CancelEditing(object sender, GridViewCancelEditEventArgs e)
    {
        gvOpportunities.EditIndex = -1;
        BindOpportunitiesForAComnpany(CompanyID);
    }

    protected void gvOpportunities_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        TBL_OPPORTUNITIES opportunity = GetOpportunity(int.Parse(e.Keys[0].ToString()));

        BindFieldsToOpportunity(opportunity, gvOpportunities.Rows[e.RowIndex] as GridViewRow);
        
        Update(opportunity);
        gvOpportunities.EditIndex = -1;
        BindOpportunitiesForAComnpany(CompanyID);
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
        //Response.Clear();
        //Response.AddHeader("content-disposition", "attachment;filename=AllOpportunities.xls");
        //Response.Charset = "";
        ////Response.Cache.SetCacheability(HttpCacheability.NoCache)
        //Response.ContentType = "application/vnd.ms-excel";
        //this.EnableViewState = false;
        //System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        //System.Web.UI.HtmlTextWriter htmlWrite = new System.Web.UI.HtmlTextWriter(stringWrite);
        
        ////Report is the Div which we need to Export - Gridview is under this Div
        //gvExport.RenderControl(htmlWrite);
        //Response.Write(stringWrite.ToString());
        //Response.End();

        var data = from record in GetOpportunities(CompanyID)
                   select new
                   {
                       ID = record.ID,
                       OPPORTUNITYID = record.OpportunityID.Value,
                       NAME = record.NAME,
                       CompanyName = GetCompany(record.COMPANYID).COMPANYNAME,
                       VALUE = record.VALUE,
                       WEIGHTEDVALUE = record.WEIGHTEDVALUE,
                       CloseDate = record.CLOSEDATE,
                       CreationDate = (record.OppCreationDate.HasValue) ? record.OppCreationDate.Value.ToString() : "",
                       SalesRep = record.SALESREPFIRSTNAME + " " + record.SALESREPLASTNAME,
                       Status = record.Status,//GetOpportunityStatus(record.STATUSID.Value).Name,
                       //ContactName = GetContact(record.CONTACTID).FIRSTNAME + GetContact(record.CONTACTID).LASTNAME,
                       //ContactPhone = GetContact(record.CONTACTID).PHONE,
                       //ContactEmail = GetContact(record.CONTACTID).EMAIL,
                       PrimaryContact = record.PrimaryContactFirstName + " " + record.PrimaryContactLastName + ", " + record.PrimaryContactEmail,
                       SecondaryContact1 = record.SeconadryContact1FirstName + " " + record.SeconadryContact1LastName + ", " + record.SeconadryContact1Email,
                       SecondaryContact2 = record.SeconadryContact2FirstName + " " + record.SeconadryContact2LastName + ", " + record.SeconadryContact2Email,
                       Product = record.ProductTypeName,//GetProduct(record.ProductID).ProductTypeName,
                       ProductCost = record.ProductCost,
                       Franchisee = record.FranchiseeName,
                       Region = record.Region,
                       OppType = record.Type,
                       WhyLost = record.WhyLost,
                       Description = record.Description,
                       Notes = record.Notes,
                       ActualValue = (record.ActualValue.HasValue) ? record.ActualValue.Value.ToString() : "",
                       Source = record.Source,
                       StatusID = record.STATUSID,
                       SalesRepFN = record.SALESREPFIRSTNAME,
                       SalesRepLN = record.SALESREPLASTNAME
                   };
        
        gvExport.DataSource = data;
        gvExport.DataBind();
        //Get in to Datatable
        DataTable dt = new DataTable();
        if (gvExport.Rows.Count > 0)
        {
            foreach (TableCell col in gvExport.HeaderRow.Cells)
            {
                dt.Columns.Add(col.Text.Replace("&#39;", "'").Replace("&nbsp;", ""));
            }
            foreach (GridViewRow row in gvExport.Rows)
            {
                DataRow dr = dt.NewRow();

                int z = 0;
                foreach (TableCell col in gvExport.HeaderRow.Cells)
                {
                    dr[z] = row.Cells[z].Text.Replace("&#39;", "'").Replace("&nbsp;", "");
                    z += 1;
                }

                dt.Rows.Add(dr);
            }
            //Get Excel file
            ExportToExcel.DownloadReportResultsWithDT(dt, "AllOpportunities");
        }
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

}