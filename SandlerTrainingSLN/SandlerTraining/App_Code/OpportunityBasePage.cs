using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SandlerModels;
using SandlerRepositories;
using SandlerData.Models;
/// <summary>
/// Summary description for OpportunityBasePage
/// </summary>
public class OpportunityBasePage: BasePage
{
    protected int ID;
    protected int SkipRecords
    {
        get
        {
            if (ViewState["Skiprecords"] == null)
            {
                ViewState["Skiprecords"] = 0;
            }
            return int.Parse(ViewState["Skiprecords"].ToString());
        }
        set
        {
            ViewState["Skiprecords"] = value;
        }
    }
    protected int MaxPageRecords
    {
        get
        {
            if (ViewState["MaxPageRecords"] == null)
            {
                ViewState["MaxPageRecords"] = 20;
            }
            return int.Parse(ViewState["MaxPageRecords"].ToString());
        }
        set
        {
            ViewState["MaxPageRecords"] = value;
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