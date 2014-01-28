using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using SandlerModels;
using SandlerData;
using System.Data;
public partial class ProcessArchive : OpportunityBasePage
{
    private int opportunityId;
    public int OpportunityId
    {
        get
        {
            return opportunityId;
        }
        set
        {
            opportunityId = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //opportunityMenu.MenuEntityTitle = "Opportunities";
        if (!IsPostBack)
        {
            if(!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                OpportunityId = int.Parse(Request.QueryString["id"]);

                ProcessArchieving(OpportunityId, Convert.ToBoolean( Request.QueryString["mode"]));

                Server.Transfer("Index.aspx");

            }
            BindOpportunities(0);
        }

    }

    #region dropdownlists selected index changed events

    protected void ddlCreateDefaultSelection(object sender, EventArgs e)
    {
        DropDownList dropdownList = sender as DropDownList;
        if (!(dropdownList.Items.Count == 0))
        {
            string defaultSelection = "";

            defaultSelection = "All";
            ListItem selectItem = new ListItem(defaultSelection, "0");
            dropdownList.Items.Insert(0, selectItem);
        }
    }

    protected void ddlCompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddlCompany = sender as DropDownList;
        CompanyID = int.Parse(ddlCompany.SelectedValue);
        BindOpportunities(CompanyID);
    }


    #endregion

    #region gvOpportunities Events

    decimal Weighted_valueTotal = 0;
    decimal Total_ValueTotal = 0;


    protected void gvOpportunities_DataBound(object sender, EventArgs e)
    {
        if (gvOpportunities.Rows.Count == 0)
        {
            LblStatus.Text = "There are no archived opportunities available for this company.";
        }
        else
        {
            LblStatus.Text = "";
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
        BindOpportunities(0);
    }

    protected void gvOpportunities_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // add the UnitPrice and QuantityTotal to the running total variables
            Weighted_valueTotal += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Weightedvalue"));
            Total_ValueTotal += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Value"));
            e.Row.Cells[9].Visible = IsArchiveVisible();
        }
        else if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[9].Visible = IsArchiveVisible();
        }
        else if (e.Row.RowType == DataControlRowType.Footer)
        {
            e.Row.Cells[1].Text = "Total";
            e.Row.Cells[4].Text = Weighted_valueTotal.ToString("c");
            e.Row.Cells[5].Text = Total_ValueTotal.ToString("c");

            e.Row.Cells[1].HorizontalAlign = e.Row.Cells[4].HorizontalAlign = e.Row.Cells[5].HorizontalAlign = HorizontalAlign.Center;
            e.Row.Font.Bold = true;
            e.Row.Cells[9].Visible = IsArchiveVisible();
        }
    }
    #endregion

    #region Excel downloading

    public override void VerifyRenderingInServerForm(Control control)
    {
        //This means that you are overriding the default implementation of the method and giving permission to the GridView to be exported as an Excel file.
    }

    protected void btnExportExcel_Click(object sender, ImageClickEventArgs e)
    {
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

    protected void CompanyDS_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["_user"] = CurrentUser;
    }
    
    private void BindOpportunities(int companyId)
    {
        var data = from record in GetArchivedOpportunties(companyId)
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
                       Source = record.Source

                   };
        TotalRecords = data.Count();

        //var filterRecords = 
        gvOpportunities.DataSource = IQueryableExtensions.Page(IQueryableExtensions.Sort(data, SortExpression, IsAscendigSortOrder), PageSize, CurrentPage).AsQueryable();
        gvOpportunities.DataBind();

        gvExport.DataSource = data;
        gvExport.DataBind();
        pager.BindPager(TotalRecords, PageSize, CurrentPage);
    }

    private void ProcessArchieving(int id, bool isActive)
    {
        TBL_OPPORTUNITIES opportunity = null;
        try
        {
            opportunity = GetOpportunity(id);
            opportunity.IsActive = isActive;
            opportunity.UpdatedBy = CurrentUser.UserId.ToString();
            opportunity.UpdatedDate = DateTime.Now;
            Update(opportunity);
            UserOpportunities = null;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private bool IsArchiveVisible()
    {
        return !IsUserReadOnly(SandlerUserActions.Edit, SandlerEntities.Opportunity); ;
    }
}