using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SandlerModels;
using SandlerRepositories;
using SandlerModels.DataIntegration;
using System.Configuration;
/// <summary>
/// Summary description for OpportunityBasePage
/// </summary>
/// 
public class OpportunityBaseVM
{
    public string ID{get;set;}
    public string OPPORTUNITYID{get;set;}
    public string NAME{get;set;}
    public string CompanyName{get;set;}
    public string VALUE{get;set;}
    public string WEIGHTEDVALUE{get;set;}
    public string CloseDate{get;set;}
    public string CreationDate{get;set;}
    public string SalesRep{get;set;}
    public string Status{get;set;}
    public string PrimaryContact{get;set;}
    public string SecondaryContact1{get;set;}
    public string SecondaryContact2{get;set;}
    public string Product{get;set;}
    public string ProductCost{get;set;}
    public string Franchisee{get;set;}
    public string Region{get;set;}
    public string OppType{get;set;}
    public string WhyLost{get;set;}
    public string Description{get;set;}
    public string Notes{get;set;}
    public string ActualValue{get;set;}
    public string Source{get;set;}
    public string StatusID {get;set;}
    public string SalesRepFN {get;set;}
    public string SalesRepLN{get;set;}
    public int TotalCount { get; set; }
}
public class OpportunityBasePage : BasePage
{
    protected int OpportunityID;
    public int CompanyID
    {
        get
        {
            return int.Parse(ViewState["CompanyID"].ToString());
        }
        set
        {
            ViewState["CompanyID"] = value;
        }
    }

    public decimal TotalValue
    {
        get
        {
            return decimal.Parse(ViewState["TotalValue"].ToString());
        }
        set
        {
            ViewState["TotalValue"] = value;
        }
    }
    public OpportunityBasePage()
    {
    }

    protected virtual IQueryable<Opportunity> GetOpportunities(int companyId)
    {
        if (Session["UserOpps"] == null)
        {
            IQueryable<Opportunity> data = userEntities.Opportunities.AsQueryable();
            TotalValue = data.Sum(r => r.VALUE.Value);
            Session["UserOpps"] = data;
            return (companyId == 0) ? data : data.Where(record => record.COMPANYID == companyId);
        }
        else
        {
            IQueryable<Opportunity> data = (IQueryable<Opportunity>)Session["UserOpps"];
            TotalValue = data.Sum(r => r.VALUE.Value);
            return (companyId == 0) ? data : data.Where(record => record.COMPANYID == companyId);
        }
        
    }

    protected virtual IQueryable<Opportunity> GetArchivedOpportunties(int companyId)
    {
        IQueryable<Opportunity> data = userEntities.ArchivedOpportunities.AsQueryable();
        return (companyId == 0) ? data : data.Where(record => record.COMPANYID == companyId);
    }

    protected virtual IQueryable<Opportunity> GetOpportunities(int? companyId, string opportunityId, string name, string description, string notes,string repFirstName, string repLastName, string repPhone, int? productId, int? statusId, int? contactId, int?sourceId, int? typeId, int? whyLostId, decimal? weightedValue, decimal? actualValue, string pain, string lengthOfProblmem, string alternatives, string costTofix, bool isBudgetidentified, bool isMoveForward)
    {
        IQueryable<Opportunity> data = userEntities.Opportunities.AsQueryable();
        IQueryable<SandlerModels.Contact> contacts = userEntities.Contacts.AsQueryable();

        
        data = SandlerData.IQueryableExtensions.OptionalWhere(data, companyId, x => (opp => opp.COMPANYID == companyId)); 
        data = SandlerData.IQueryableExtensions.OptionalWhere(data, productId, x => (opp => opp.ProductID == productId));
        data = SandlerData.IQueryableExtensions.OptionalWhere(data, statusId, x => (opp => opp.STATUSID == statusId));
        data = SandlerData.IQueryableExtensions.OptionalWhere(data, contactId, x => (opp => opp.CONTACTID == contactId));
        data = SandlerData.IQueryableExtensions.OptionalWhere(data, contactId, x => (opp => opp.SeconadryContactId1 == contactId));
        data = SandlerData.IQueryableExtensions.OptionalWhere(data, contactId, x => (opp => opp.SeconadryContactId2 == contactId));
        data = SandlerData.IQueryableExtensions.OptionalWhere(data, contactId, x => (opp => opp.CONTACTID == contactId));
        data = SandlerData.IQueryableExtensions.OptionalWhere(data, sourceId, x => (opp => opp.SourceID == sourceId));
        data = SandlerData.IQueryableExtensions.OptionalWhere(data, typeId, x => (opp => opp.TypeID == typeId));
        data = SandlerData.IQueryableExtensions.OptionalWhere(data, whyLostId, x => (opp => opp.WhyLostID == whyLostId));
        data = SandlerData.IQueryableExtensions.OptionalWhere(data, weightedValue, x => (opp => opp.WEIGHTEDVALUE == weightedValue));
        data = SandlerData.IQueryableExtensions.OptionalWhere(data, actualValue, x => (opp => opp.ActualValue == actualValue));
        
        if (!string.IsNullOrEmpty(opportunityId))
            data = data.Where(opp => opp.OpportunityID == int.Parse(opportunityId));
        if (!string.IsNullOrEmpty(name))
            data = data.Where(opp => opp.NAME.ToUpper().Contains(name.ToUpper()));
        if (!string.IsNullOrEmpty(description))
            data = data.Where(opp => opp.Description.ToUpper().Contains(description.ToUpper()));
        if (!string.IsNullOrEmpty(notes))
            data = data.Where(opp => opp.Notes.ToUpper().Contains(notes.ToUpper()));
        if (!string.IsNullOrEmpty(repFirstName))
            data = data.Where(opp => opp.SALESREPFIRSTNAME.ToUpper().Contains(repFirstName.ToUpper()));
        if (!string.IsNullOrEmpty(repLastName))
            data = data.Where(opp => opp.SALESREPLASTNAME.ToUpper().Contains(repLastName.ToUpper()));
        if (!string.IsNullOrEmpty(repPhone))
            data = data.Where(opp => opp.SALESREPPHONE.Contains(repPhone));
        if (!string.IsNullOrEmpty(pain))
            data = data.Where(opp => opp.Pain == pain);
        if (!string.IsNullOrEmpty(lengthOfProblmem))
            data = data.Where(opp => opp.LengthofProblem == lengthOfProblmem);
        if (!string.IsNullOrEmpty(alternatives))
            data = data.Where(opp => opp.Alternatives == alternatives);
        if (isBudgetidentified)
            data = data.Where(opp => opp.IsBudgeIdentified == isBudgetidentified); 
        if (isMoveForward)
            data = data.Where(opp => opp.IsMoveForward == isMoveForward);

        

        return data;
    }

    protected virtual TBL_COMPANIES GetCompany(int companyId)
    {
        return new CompaniesRepository().GetById(long.Parse(companyId.ToString()));
    }

    protected virtual IEnumerable<SandlerModels.Contact> GetContactsByCompany(int companyId)
    {
        return userEntities.GetContactsByCompany(CurrentUser, companyId);
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

    protected virtual Opportunity FillOpportunity(int id)
    {
        return userEntities.Opportunities.Find(delegate(Opportunity o) { return o.ID == id; });
    }

    protected virtual TBL_OPPORTUNITIES Save(TBL_OPPORTUNITIES opportunity)
    {
        OpportunitiesRepository opportunitySource = new OpportunitiesRepository(); ;
        opportunitySource.Add(opportunity);
        UserEntitiesFactory.ReLoad();
        return opportunity;
    }
    protected virtual TBL_OPPORTUNITIES Update(TBL_OPPORTUNITIES opportunity)
    {
        OpportunitiesRepository opportunitySource = new OpportunitiesRepository();
        opportunitySource.Update(opportunity);
        RefreshEntities();
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

    protected virtual object GetOpportunitiesHistory(int companyId, int opportunityId)
    {
        OppHistoryRepository repository;

        try
        {
            repository = new OppHistoryRepository();
            var data = from history in repository.GetAll().Where(record => record.CompanyID == companyId && record.OpportunityID == opportunityId)
                       from users in new UsersRepository().GetAll().Where(user => user.UserId == history.CreatedBy)
                       select new { ID=history.ID, Notes = history.Notes, CreatedBy = users.UserName, CreatedDate = history.CreatedDate };

            return data;
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }

    protected virtual TBL_OpportunitiesHistory GetOpportunityHistory(int id)
    {
        OppHistoryRepository repository;

        try
        {
            repository = new OppHistoryRepository();
            return repository.GetById(id);
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected virtual TBL_OpportunitiesHistory UpdateOpportunityHistory(TBL_OpportunitiesHistory history)
    {
        OppHistoryRepository repository;

        try
        {
            repository = new OppHistoryRepository();
            repository.Update(history);
            RefreshEntities();
            return history;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected virtual void DeleteOpportunityHistory(int id)
    {
        OppHistoryRepository repository;

        try
        {
            repository = new OppHistoryRepository();
            repository.Delete(repository.GetById(id));
            RefreshEntities();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}