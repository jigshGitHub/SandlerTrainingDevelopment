using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SandlerModels;
using SandlerRepositories;
using SandlerData.Models;
using System.Configuration;
/// <summary>
/// Summary description for OpportunityBasePage
/// </summary>
public class OpportunityBasePage: BasePage
{
    protected int OpportunityID;
    protected int CurrentPage
    {
        get
        {
            if (ViewState["CurrentPage"] == null)
            {
                ViewState["CurrentPage"] = 1;
            }
            return int.Parse(ViewState["CurrentPage"].ToString());
        }
        set
        {
            ViewState["CurrentPage"] = value;
        }
    }
    protected int PageSize
    {
        get
        {
            if (ViewState["PageSize"] == null)
            {
                ViewState["PageSize"] = ConfigurationManager.AppSettings["OpportunityPageSize"];
            }
            return int.Parse(ViewState["PageSize"].ToString());
        }
        set
        {
            ViewState["PageSize"] = value;
        }
    }
    protected string SortExpression
    {
        get
        {
            if (ViewState["SortExpression"] == null)
            {
                ViewState["SortExpression"] = "ID";
            }
            return ViewState["SortExpression"].ToString();
        }
        set
        {
            ViewState["SortExpression"] = value;
        }
    }
    protected string SortDirection
    {
        get
        {
            if (ViewState["SortDirection"] == null)
            {
                ViewState["SortDirection"] = "ASC";
            }
            return ViewState["SortDirection"].ToString();
        }
        set
        {
            ViewState["SortDirection"] = value;
        }
    }
    protected int TotalRecords
    {
        get
        {
            return int.Parse(ViewState["TotalRecords"].ToString());
        }
        set
        {
            ViewState["TotalRecords"] = value;
        }
    }
    public OpportunityBasePage()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    protected virtual IQueryable<TBL_OPPORTUNITIES> GetOpportunities(int companyId)
    {
        UserEntities userEntities = new UserEntities();
        IQueryable<TBL_OPPORTUNITIES> data = userEntities.Getopportunities(CurrentUser).AsQueryable();
        return (companyId == 0) ? data : data.Where(record => record.COMPANYID == companyId);
    }

    protected virtual IEnumerable<TBL_CONTACTS> GetContactsByCompany(int companyId)
    {
        return new UserEntities().GetContactsByCompany(CurrentUser, companyId);
    }

    protected virtual TBL_CONTACTS GetContact(long contactId)
    {
        ContactsRepository contactsSource = new ContactsRepository();
        return contactsSource.GetById(contactId);
    }

    protected virtual TBL_OPPORTUNITIES GetOpportunity(int id)
    {
        OpportunitiesRepository opportunitySource = new OpportunitiesRepository();
        return opportunitySource.GetById(id);
    }

    protected virtual TBL_OPPORTUNITIES Save(TBL_OPPORTUNITIES opportunity)
    {
        OpportunitiesRepository opportunitySource = new OpportunitiesRepository();
        opportunitySource.Add(opportunity);
        return opportunity;
    }
    protected virtual TBL_OPPORTUNITIES Update(TBL_OPPORTUNITIES opportunity)
    {
        OpportunitiesRepository opportunitySource = new OpportunitiesRepository();
        opportunitySource.Update(opportunity);
        return opportunity;
    }
}