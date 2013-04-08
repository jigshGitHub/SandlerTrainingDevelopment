using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SandlerRepositories;
using System.Data.Linq.SqlClient;
using System.Data.SqlClient;
using System.Web.Security;
namespace SandlerModels.DataIntegration
{
    public interface IUserEntities
    {
        //IEnumerable<TBL_CONTACTS> GetNewAppointments(UserModel user);
        IEnumerable<SandlerModels.Contact> GetNewAppointments(UserModel user);
        //IEnumerable<TBL_OPPORTUNITIES> Getopportunities(UserModel user);
        //IEnumerable<TBL_CONTACTS> GetContactsByCompany(UserModel user, int companyId);
        IEnumerable<SandlerModels.Contact> GetContactsByCompany(UserModel user, int companyId);
        //IEnumerable<TBL_CONTACTS> GetContacts(UserModel user);
        //IEnumerable<TBL_COMPANIES> GetCompanies(UserModel user);
    }

    public class UserEntitiesFactory
    {
        private static UserEntities userEntities;

        private static object syncLock = new object();
        //public static UserEntities Get(UserModel user)
        //{
        //    if (userEntities == null)
        //    {
        //        lock (syncLock)
        //        {
        //            if (userEntities == null)
        //            {
        //                userEntities = new UserEntities(user);
        //            }
        //        }
        //    }

        //    return userEntities;
        //}

        public static void ReLoad()
        {
            if (userEntities != null)
                userEntities = null;
        }

        public static void DeleteUserWithRoles(string userName, string role)
        {
            Roles.RemoveUserFromRole(userName, role);
            Membership.DeleteUser(userName);
        }

        public static Guid CreateUserWithRoles(string userName, string email, string role)
        {
            MembershipUser user = Membership.CreateUser(userName, "pa$$word", email);
            Roles.AddUserToRole(user.UserName, role);
            return (Guid)user.ProviderUserKey;
        }

        public static void UpdateUser(string userId, string email)
        {
            MembershipUser user = Membership.GetUser(new Guid(userId));
            user.Email = email;
            Membership.UpdateUser(user);
        }

        public static bool IsUserExits(string userName)
        {
            return (Membership.GetUser(userName) != null);
        }

        public static string GetUsername(string userName)
        {

            string checkUserName = userName;
            for (int count = 0; count < Membership.GetAllUsers().Count; )
            {
                if (Membership.FindUsersByName(checkUserName).Count == 0)
                {
                    return checkUserName;
                }
                else
                {
                    count++;
                    checkUserName = userName + count.ToString();
                }
            }
            return userName;
        }
    }

    public class UserEntities : IUserEntities
    {
        private readonly IEnumerable<TBL_FRANCHISEE> franchisees;
        public IEnumerable<TBL_FRANCHISEE> Franchisees
        {
            get
            {
                return franchisees;
            }
        }


        private readonly IEnumerable<SandlerModels.Company> companies;
        public IEnumerable<SandlerModels.Company> Companies
        { get { return companies; } }

        private readonly List<SandlerModels.Contact> contacts;
        public List<SandlerModels.Contact> Contacts
        {
            get
            {
                return contacts;
            }
        }

        private readonly List<Opportunity> opportunities;
        public List<Opportunity> Opportunities
        { get { return opportunities; } }

        private readonly int companiesCount;
        public int CompaniesCount { get { return companiesCount; } }

        private readonly int contactsCount;
        public int ContactsCount { get { return contactsCount; } }

        private readonly int opportunitiesCount;
        public int OpportunitiesCount { get { return opportunitiesCount; } }

        public UserEntities(UserModel user)
        {
            franchisees = GetFranchisees(user);
            companies = GetCompaniesByUser(user);
            contacts = GetContactsByUser(user);
            opportunities = GetopportunitiesByUser(user);
            companiesCount = companies.Count();
            contactsCount = contacts.Count();
            opportunitiesCount = opportunities.Count();
        }


        private IEnumerable<TBL_FRANCHISEE> GetFranchisees(UserModel user)
        {
            FranchiseeRepository franchiseeSource = new FranchiseeRepository();
            IEnumerable<TBL_FRANCHISEE> franchisees = null;
            if (user.Role == SandlerRoles.Coach || user.Role == SandlerRoles.FranchiseeOwner || user.Role == SandlerRoles.FranchiseeUser)
            {
                //franchisees = from franchisee in franchiseeSource.GetAll().Where(record => record.IsActive == true && record.CoachID == user.CoachID)
                //              select franchisee;
                franchisees = from franchisee in new FranchiseeRepository().GetAll()
                              from coach in new CoachRepository().GetAll().Where(r => r.ID == franchisee.CoachID)
                              from region in new RegionRepository().GetAll().Where(r => r.ID == coach.RegionID && r.ID == user.RegionID)
                              select franchisee;
            }
            else if(user.Role == SandlerRoles.Corporate)
            {
                franchisees = from franchisee in new FranchiseeRepository().GetAll()
                              select franchisee;
            }
            return franchisees;
        }
        private List<SandlerModels.Company> GetCompaniesByUser(UserModel user)
        {
            CompaniesRepository companiesSource = new CompaniesRepository();
            List<SandlerModels.Company> companies = null;

            try
            {
                companies = companiesSource.GetCompaniesByUser(user.UserId).ToList<SandlerModels.Company>();
            }
            catch (Exception ex)
            {
                throw new Exception("exception in UserEntities.GetCompanies: " + ex.Message);
            }
            return companies;
        }
        private List<SandlerModels.Contact> GetContactsByUser(UserModel user)
        {
            ContactsRepository contactsSource = new ContactsRepository();
            List<SandlerModels.Contact> contactsList = null;
            try
            {
                contactsList = contactsSource.GetContactsByUser(user.UserId).ToList<SandlerModels.Contact>();
            }
            catch (Exception ex)
            {
                throw new Exception("exception in UserEntities.Getopportunities: " + ex.Message);
            }
            return contactsList;
        }
        private IEnumerable<TBL_OPPORTUNITIES> Getopportunities(UserModel user)
        {
            OpportunitiesRepository opportunitiesSource = new OpportunitiesRepository();
            IEnumerable<TBL_OPPORTUNITIES> opportunties = null;
            try
            {
                if (user.Role == SandlerRoles.FranchiseeUser)
                    opportunties = opportunitiesSource.GetAll().Where(record => record.IsActive == true && record.CreatedBy.ToLower() == user.UserId.ToString().ToLower()).AsEnumerable();
                else if (user.Role == SandlerRoles.FranchiseeOwner)
                {
                    //opportunties = from opportunity in opportunitiesSource.GetAll().Where(record => record.IsActive == true)
                    //               from company in companies.Where(record => record.COMPANIESID == opportunity.COMPANYID)
                    //               select opportunity;
                    opportunties = from opportunity in opportunitiesSource.GetAll().Where(record => record.IsActive == true && record.TBL_COMPANIES.FranchiseeId == user.FranchiseeID)
                                   select opportunity;
                }
                else if (user.Role == SandlerRoles.Coach)
                {
                    FranchiseeRepository franchiseeSource = new FranchiseeRepository();
                    CoachRepository coachSource = new CoachRepository();
                    //opportunties = from opportunity in opportunitiesSource.GetAll().Where(record => record.IsActive == true)
                    //               from company in companies.Where(record => record.COMPANIESID == opportunity.COMPANYID)
                    //               from franchisee in franchisees.Where(record => record.ID == company.FranchiseeId)
                    //               select opportunity;
                    opportunties = from opportunity in opportunitiesSource.GetAll().Where(record => record.IsActive == true && record.TBL_COMPANIES.TBL_FRANCHISEE.CoachID == user.CoachID)
                                   select opportunity;

                }
                else if (user.Role == SandlerRoles.Corporate)
                {
                    opportunties = opportunitiesSource.GetAll().Where(record => record.IsActive == true).AsEnumerable();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in UserEntities.Getopportunities: " + ex.Message);
            }
            return opportunties;
        }

        private List<Opportunity> GetopportunitiesByUser(UserModel user)
        {
            OpportunitiesRepository opportunitiesSource = new OpportunitiesRepository();
            List<Opportunity> opportunties = null;
            try
            {
                opportunties = opportunitiesSource.GetOpportunitiesByUser(user.UserId).ToList<Opportunity>();
            }
            catch (Exception ex)
            {
                throw new Exception("exception in UserEntities.Getopportunities: " + ex.Message);
            }
            return opportunties;
        }

        private IEnumerable<TBL_DOCS> GetDocuments(UserModel user)
        {
            IEnumerable<TBL_DOCS> documents = null;
            DocumentsRepository documentsSource = new DocumentsRepository();
            try
            {
                if (user.Role == SandlerRoles.FranchiseeUser)
                    documents = documentsSource.GetAll().Where(record => record.IsActive == true && record.CreatedBy.ToLower() == user.UserId.ToString().ToLower()).AsEnumerable();
                else if (user.Role == SandlerRoles.FranchiseeOwner)
                {
                    documents = from document in documentsSource.GetAll().Where(record => record.IsActive == true && record.TBL_COMPANIES.FranchiseeId == user.FranchiseeID)
                                select document;
                }
                else if (user.Role == SandlerRoles.Coach)
                {
                    FranchiseeRepository franchiseeSource = new FranchiseeRepository();
                    CoachRepository coachSource = new CoachRepository();
                    //documents = from opportunity in opportunitiesSource.GetAll().Where(record => record.IsActive == true)
                    //               from company in companies.Where(record => record.COMPANIESID == opportunity.COMPANYID)
                    //               from franchisee in franchisees.Where(record => record.ID == company.FranchiseeId)
                    //               select opportunity;
                    documents = from document in documentsSource.GetAll().Where(record => record.IsActive == true && record.TBL_COMPANIES.TBL_FRANCHISEE.CoachID == user.CoachID)
                                select document;

                }
                else if (user.Role == SandlerRoles.Corporate)
                {
                    documents = documentsSource.GetAll().Where(record => record.IsActive == true).AsEnumerable();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in UserEntities.Getopportunities: " + ex.Message);
            }
            return documents;
        }
        #region IUserEntities Members

        public IEnumerable<SandlerModels.Contact> GetNewAppointments(UserModel user)
        {
            IEnumerable<SandlerModels.Contact> newContacts = null;
            try
            {
                newContacts = from contact in contacts.Where(record => record.IsNewAppointment == true)
                              select contact;
            }
            catch (Exception ex)
            {
                throw new Exception("exception in UserEntities.GetNewAppointments: " + ex.Message);
            }
            return newContacts;
        }

        public IEnumerable<SandlerModels.Contact> GetContactsByCompany(UserModel user, int companyId)
        {
            IEnumerable<SandlerModels.Contact> companyContacts = null;
            try
            {
                if (ContactsCount > 0)
                    if (companyId == 0) companyContacts = Contacts;
                    else
                    {
                        companyContacts = from contact in Contacts.Where(c => c.COMPANYID == companyId)
                                          select contact;
                    }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in UserEntities.GetContactsByCompany: " + ex.Message);
            }
            return companyContacts;
        }
        #endregion
    }

}
