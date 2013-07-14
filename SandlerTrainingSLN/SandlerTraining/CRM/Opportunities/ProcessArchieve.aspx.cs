using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using SandlerModels;
using SandlerData;

public partial class ProcessArchieve : OpportunityBasePage
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
        opportunityMenu.MenuEntityTitle = "Opportunities";
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

    #endregion

    private void BindOpportunities(int companyId)
    {
        var data = from record in GetArchievedOpportunties(companyId)
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
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}