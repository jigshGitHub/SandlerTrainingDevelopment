using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SandlerModels;
using SandlerRepositories;
using SandlerModels.DataModels;
using System.Configuration;
/// <summary>
/// Summary description for OpportunityBasePage
/// </summary>
public class OpportunityBasePage : BasePage
{
    protected int OpportunityID;
    public OpportunityBasePage()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    protected virtual IQueryable<TBL_OPPORTUNITIES> GetOpportunities(int companyId)
    {
        UserEntities userEntities = UserEntitiesFactory.Get(this.CurrentUser);
        IQueryable<TBL_OPPORTUNITIES> data = userEntities.Opportunities.AsQueryable();
        return (companyId == 0) ? data : data.Where(record => record.COMPANYID == companyId);
    }

    protected virtual IQueryable<TBL_OPPORTUNITIES> GetOpportunities(int? companyId, string opportunityId, string name, string repFirstName, string repLastName, string repPhone, int? productId, int? statusId, int? contactId,string contactPhone, string contactEmail)
    {
        UserEntities userEntities = UserEntitiesFactory.Get(this.CurrentUser);
        IQueryable<TBL_OPPORTUNITIES> data = userEntities.Opportunities.AsQueryable();
        IQueryable<TBL_CONTACTS> contacts = userEntities.Contacts.AsQueryable();

        
        data = SandlerData.IQueryableExtensions.OptionalWhere(data, companyId, x => (opp => opp.COMPANYID == companyId)); 
        data = SandlerData.IQueryableExtensions.OptionalWhere(data, productId, x => (opp => opp.ProductID == productId));
        data = SandlerData.IQueryableExtensions.OptionalWhere(data, statusId, x => (opp => opp.STATUSID == statusId));
        data = SandlerData.IQueryableExtensions.OptionalWhere(data, contactId, x => (opp => opp.CONTACTID == contactId));

        if (!string.IsNullOrEmpty(opportunityId))
            data = data.Where(opp => opp.OpportunityID == int.Parse(opportunityId));
        if (!string.IsNullOrEmpty(name))
            data = data.Where(opp => opp.NAME.Contains(name));
        if (!string.IsNullOrEmpty(repFirstName))
            data = data.Where(opp => opp.SALESREPFIRSTNAME.Contains(repFirstName));
        if (!string.IsNullOrEmpty(repLastName))
            data = data.Where(opp => opp.SALESREPLASTNAME.Contains(repLastName));
        if (!string.IsNullOrEmpty(repPhone))
            data = data.Where(opp => opp.SALESREPPHONE.Contains(repPhone));

        if (!string.IsNullOrEmpty(contactPhone)){
            data = from opp in data
                   from contact in contacts.Where(record => record.PHONE == contactPhone && record.CONTACTSID == opp.CONTACTID)
                   select opp;
        }
        if (!string.IsNullOrEmpty(contactEmail)){
            data = from opp in data
                   from contact in contacts.Where(record => record.EMAIL == contactEmail && record.CONTACTSID == opp.CONTACTID)
                   select opp;
        }

        return data;
    }

    protected virtual TBL_COMPANIES GetCompany(int companyId)
    {
        return new CompaniesRepository().GetById(long.Parse(companyId.ToString()));
    }
    protected virtual IEnumerable<TBL_CONTACTS> GetContactsByCompany(int companyId)
    {
        return UserEntitiesFactory.Get(CurrentUser).GetContactsByCompany(CurrentUser, companyId);
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
        UserEntitiesFactory.ReLoad();
        return opportunity;
    }
    protected virtual TBL_OPPORTUNITIES Update(TBL_OPPORTUNITIES opportunity)
    {
        OpportunitiesRepository opportunitySource = new OpportunitiesRepository();
        opportunitySource.Update(opportunity);
        UserEntitiesFactory.ReLoad();
        return opportunity;
    }

    protected virtual Tbl_ProductType GetProduct(int id)
    {
        ProductTypesRepository productRepository = new ProductTypesRepository();
        return productRepository.GetById(id);
    }

    protected virtual Tbl_AppointmentsSource GetAppointment(int id)
    {
        AppointmentSourceRepository appointmentSource = new AppointmentSourceRepository();
        return appointmentSource.GetById(id);
    }

    protected virtual TBL_OPPORTUNITYSTATUS GetOpportunityStatus(int id)
    {
        OpprtunityStatusRepository opportunitySource = new OpprtunityStatusRepository();
        return opportunitySource.GetById(id);
    }
}