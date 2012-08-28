using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using SandlerModels;
using SandlerRepositories;

namespace SandlerData.Models
{
    public interface IUserDataModel
    {
        void Load(UserModel user);
    }
    
    public class UserDataModel : IUserDataModel
    {
        private FranchiseeUsersRepository franchiseeUsersRepository;
        private FranchiseeRepository franchiseeRepository;
        private CoachRepository coachRepository;
        private RegionRepository regionRepository;
        
        public UserDataModel()
        {
            franchiseeUsersRepository = new FranchiseeUsersRepository();
            franchiseeRepository = new FranchiseeRepository();
            coachRepository = new CoachRepository();
            regionRepository = new RegionRepository();
        }
        #region IUserDataModel Members

        public void Load(UserModel user)
        {
            switch (user.Role)
            {
                case SandlerRoles.Coach:
                    user.CoachID = coachRepository.GetAll().Where(r => r.UserID == user.UserId).SingleOrDefault().ID;
                    user.RegionID = coachRepository.GetRegion(user.CoachID).ID;
                    break;
                case SandlerRoles.FranchiseeOwner:
                case SandlerRoles.FranchiseeUser:
                    
                    user.FranchiseeID = franchiseeUsersRepository.GetAll().Where(r => r.UserID == user.UserId).SingleOrDefault().FranchiseeID;
                    user.CoachID = franchiseeRepository.GetCoach(user.FranchiseeID).ID;
                    user.RegionID = coachRepository.GetRegion(user.CoachID).ID;
                    break;
                case SandlerRoles.SiteAdmin:
                    break;
                default:
                    break;
            }
        }
        ~ UserDataModel()
        {
            franchiseeUsersRepository = null;
            franchiseeRepository = null;
            coachRepository = null;
            regionRepository = null;
        }
        #endregion
    }

    //public interface IUserEntities
    //{
    //    IEnumerable<TBL_CONTACTS> GetNewAppointments(UserModel user);
    //    IEnumerable<TBL_OPPORTUNITIES> Getopportunities(UserModel user);
    //    IEnumerable<TBL_CONTACTS> GetContactsByCompany(UserModel user, int companyId);
    //    IEnumerable<TBL_CONTACTS> GetContacts(UserModel user);
    //    IEnumerable<TBL_COMPANIES> GetCompanies(UserModel user);
    //}

    //public class UserEntities : IUserEntities
    //{
    //    #region IChartDataModel Members

    //    public IEnumerable<TBL_COMPANIES> GetCompanies(UserModel user)
    //    {
    //        CompaniesRepository companiesSource = new CompaniesRepository();
    //        IEnumerable<TBL_COMPANIES> companies = null;

    //        if (user.Role == SandlerRoles.FranchiseeUser)
    //            companies = companiesSource.GetAll().Where(r => r.IsActive == true && r.FranchiseeId == user.FranchiseeID).AsEnumerable();
    //        else if (user.Role == SandlerRoles.FranchiseeOwner)
    //            companies = companiesSource.GetAll().Where(r => r.IsActive == true && r.FranchiseeId == user.FranchiseeID).AsEnumerable();
    //        else if (user.Role == SandlerRoles.Coach)
    //        {
    //            FranchiseeRepository franchiseeSource = new FranchiseeRepository();
    //            CoachRepository coachSource = new CoachRepository();
    //            companies = from c in companiesSource.GetAll().Where(r => r.IsActive == true)
    //                       from f in franchiseeSource.GetAll().Where(r => r.IsActive == true)
    //                       from ch in coachSource.GetAll().Where(r => r.IsActive == true)
    //                       where c.FranchiseeId == f.ID && f.CoachID == ch.ID && ch.ID == user.CoachID
    //                       select c;

    //        }
    //        else if (user.Role == SandlerRoles.Corporate)
    //        {
    //            companies = companiesSource.GetAll().Where(r => r.IsActive == true).AsEnumerable();
    //        }
    //        return companies;
    //    }
    //    public IEnumerable<TBL_CONTACTS> GetNewAppointments(UserModel user)
    //    {
    //        ContactsRepository contactsSource = new ContactsRepository();
    //        IEnumerable<TBL_CONTACTS> contacts = null;

    //        if (user.Role == SandlerRoles.FranchiseeUser)
    //            contacts = contactsSource.GetAll().Where(r => r.IsNewAppointment == true && r.IsActive == true && r.CreatedBy.ToLower() == user.UserId.ToString().ToLower()).AsEnumerable();
    //        else if (user.Role == SandlerRoles.FranchiseeOwner)
    //        {
    //            //contacts = contactsSource.GetAll().Where(r => r.IsNewAppointment == true && r.IsActive == true && r.TBL_COMPANIES.FranchiseeId == user.FranchiseeID).AsEnumerable();
    //            contacts = from contact in contactsSource.GetAll().Where(r => r.IsNewAppointment == true && r.IsActive == true)
    //                       from company in new CompaniesRepository().GetAll().Where(c => c.IsActive == true && c.FranchiseeId == user.FranchiseeID && c.COMPANIESID == contact.COMPANYID)
    //                       select contact;
    //        }
    //        else if (user.Role == SandlerRoles.Coach)
    //        {
    //            FranchiseeRepository franchiseeSource = new FranchiseeRepository();
    //            CoachRepository coachSource = new CoachRepository();
    //            contacts = from contact in contactsSource.GetAll().Where(r => r.IsNewAppointment == true && r.IsActive == true)
    //                       from co in new CompaniesRepository().GetAll().Where(c => c.IsActive == true)
    //                       from f in franchiseeSource.GetAll().Where(r => r.IsActive == true)
    //                       from ch in coachSource.GetAll().Where(r => r.IsActive == true)
    //                       where co.FranchiseeId == f.ID && f.CoachID == ch.ID && ch.ID == user.CoachID
    //                       select contact;

    //        }
    //        else if (user.Role == SandlerRoles.Corporate)
    //        {
    //            contacts = contactsSource.GetAll().Where(r => r.IsActive == true).AsEnumerable();
    //        }
    //        return contacts;
    //    }

        

    //    public IEnumerable<TBL_OPPORTUNITIES> Getopportunities(UserModel user)
    //    {
    //        OpportunitiesRepository opportunitiesSource = new OpportunitiesRepository();
    //        IEnumerable<TBL_OPPORTUNITIES> opportunties = null;

    //        if (user.Role == SandlerRoles.FranchiseeUser)
    //            opportunties = opportunitiesSource.GetAll().Where(r => r.IsActive == true && r.CreatedBy.ToLower() == user.UserId.ToString().ToLower()).AsEnumerable();
    //        else if (user.Role == SandlerRoles.FranchiseeOwner)
    //        {
    //            //opportunties = opportunitiesSource.GetAll().Where(r => r.IsActive == true && r.TBL_COMPANIES.FranchiseeId == user.FranchiseeID).AsEnumerable();
    //            opportunties = from opportunity in opportunitiesSource.GetAll().Where(r => r.IsActive == true)
    //                           from contct in new ContactsRepository().GetAll().Where(c => c.IsActive == true &&  c.CONTACTSID == opportunity.CONTACTID)
    //                           from company in new CompaniesRepository().GetAll().Where(co => co.IsActive == true &&  co.COMPANIESID == opportunity.COMPANYID && co.FranchiseeId == user.FranchiseeID)
    //                           select opportunity;
    //        }
    //        else if (user.Role == SandlerRoles.Coach)
    //        {
    //            FranchiseeRepository franchiseeSource = new FranchiseeRepository();
    //            CoachRepository coachSource = new CoachRepository();
    //            opportunties = from c in opportunitiesSource.GetAll().Where(r => r.IsActive == true)
    //                           from compamy in new CompaniesRepository().GetAll().Where(co => co.IsActive == true && co.COMPANIESID == c.COMPANYID)
    //                           from f in franchiseeSource.GetAll().Where(r => r.IsActive == true && r.ID == compamy.FranchiseeId)
    //                           from ch in coachSource.GetAll().Where(r => r.IsActive == true && r.ID == f.CoachID & r.ID == user.CoachID)                               
    //                           select c;

    //        }
    //        else if (user.Role == SandlerRoles.Corporate)
    //        {
    //            opportunties = opportunitiesSource.GetAll().Where(r => r.IsActive == true).AsEnumerable();
    //        }
    //        return opportunties;
    //    }

    //    public IEnumerable<TBL_CONTACTS> GetContactsByCompany(UserModel user, int companyId)
    //    {
    //        ContactsRepository contactsSource = new ContactsRepository();
    //        IEnumerable<TBL_CONTACTS> contacts = null;
    //        if (user.Role == SandlerRoles.FranchiseeUser)
    //            contacts = contactsSource.GetByCompanyId(companyId).Where(record => record.IsActive == true && record.CreatedBy.ToLower() == user.UserId.ToString().ToLower()).AsEnumerable();
    //        else if (user.Role == SandlerRoles.FranchiseeOwner)
    //        {
    //            //contacts = contactsSource.GetByCompanyId(companyId).Where(record => record.IsActive == true && record.TBL_COMPANIES.FranchiseeId == user.FranchiseeID).AsEnumerable();
    //            contacts = from contact in contactsSource.GetAll().Where(r => r.IsNewAppointment == true && r.IsActive == true)
    //                       from company in new CompaniesRepository().GetAll().Where(c => c.IsActive == true && c.FranchiseeId == user.FranchiseeID)
    //                       select contact;
    //        }
    //        else if (user.Role == SandlerRoles.Coach)
    //        {
    //            FranchiseeRepository franchiseeSource = new FranchiseeRepository();
    //            CoachRepository coachSource = new CoachRepository();
    //            //contacts = from c in contactsSource.GetByCompanyId(companyId).Where(r => r.IsActive == true)
    //            //           from f in franchiseeSource.GetAll().Where(r => r.IsActive == true)
    //            //           from ch in coachSource.GetAll().Where(r => r.IsActive == true)
    //            //           where c.TBL_COMPANIES.FranchiseeId == f.ID && f.CoachID == ch.ID && ch.ID == user.CoachID
    //            //           select c;

    //            contacts = from contact in contactsSource.GetByCompanyId(companyId).Where(r => r.IsActive == true)
    //                       from co in new CompaniesRepository().GetAll().Where(c => c.IsActive == true)
    //                       from f in franchiseeSource.GetAll().Where(r => r.IsActive == true)
    //                       from ch in coachSource.GetAll().Where(r => r.IsActive == true)
    //                       where co.FranchiseeId == f.ID && f.CoachID == ch.ID && ch.ID == user.CoachID
    //                       select contact;

    //        }
    //        else if (user.Role == SandlerRoles.Corporate)
    //        {
    //            contacts = contactsSource.GetByCompanyId(companyId).Where(record => record.IsActive == true).AsEnumerable();
    //        }
    //        return contacts;
    //    }

    //    public IEnumerable<TBL_CONTACTS> GetContacts(UserModel user)
    //    {
    //        ContactsRepository contactsSource = new ContactsRepository();
    //        IEnumerable<TBL_CONTACTS> contacts = null;
    //        if (user.Role == SandlerRoles.FranchiseeUser)
    //            contacts = contactsSource.GetAll().Where(record => record.IsActive == true && record.CreatedBy.ToLower() == user.UserId.ToString().ToLower()).AsEnumerable();
    //        else if (user.Role == SandlerRoles.FranchiseeOwner)
    //        {
    //            //contacts = contactsSource.GetAll().Where(record => record.IsActive == true && record.TBL_COMPANIES.FranchiseeId == user.FranchiseeID).AsEnumerable();
    //            contacts = from contact in contactsSource.GetAll().Where(r => r.IsNewAppointment == true && r.IsActive == true)
    //                       from company in new CompaniesRepository().GetAll().Where(c => c.IsActive == true && c.COMPANIESID == contact.COMPANYID && c.FranchiseeId == user.FranchiseeID)
    //                       select contact;
    //        }
    //        else if (user.Role == SandlerRoles.Coach)
    //        {
    //            FranchiseeRepository franchiseeSource = new FranchiseeRepository();
    //            CoachRepository coachSource = new CoachRepository();
    //            contacts = from contact in contactsSource.GetAll().Where(r => r.IsActive == true)
    //                       from co in new CompaniesRepository().GetAll().Where(c => c.IsActive == true)
    //                       from f in franchiseeSource.GetAll().Where(r => r.IsActive == true)
    //                       from ch in coachSource.GetAll().Where(r => r.IsActive == true)
    //                       where co.FranchiseeId == f.ID && f.CoachID == ch.ID && ch.ID == user.CoachID
    //                       select contact;

    //        }
    //        else if (user.Role == SandlerRoles.Corporate)
    //        {
    //            contacts = contactsSource.GetAll().Where(record => record.IsActive == true).AsEnumerable();
    //        }
    //        return contacts;
    //    }
    //    #endregion
    //}
}
