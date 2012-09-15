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
        IEnumerable<TBL_CONTACTS> GetNewAppointments(UserModel user);
        //IEnumerable<TBL_OPPORTUNITIES> Getopportunities(UserModel user);
        IEnumerable<TBL_CONTACTS> GetContactsByCompany(UserModel user, int companyId);
        //IEnumerable<TBL_CONTACTS> GetContacts(UserModel user);
        //IEnumerable<TBL_COMPANIES> GetCompanies(UserModel user);
    }

    public class UserEntitiesFactory
    {
        private static UserEntities userEntities;

        private static object syncLock = new object();
        public static UserEntities Get(UserModel user)
        {
            if (userEntities == null)
            {
                lock (syncLock)
                {
                    if (userEntities == null)
                    {
                        userEntities = new UserEntities(user);
                    }
                }
            }

            return userEntities;
        }

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

        public static int UsersCount(string userName)
        {
            return Membership.FindUsersByName(userName).Count;
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


        private readonly IEnumerable<TBL_COMPANIES> companies;
        public IEnumerable<TBL_COMPANIES> Companies
        { get { return companies; } }

        private readonly IEnumerable<TBL_CONTACTS> contacts;
        public IEnumerable<TBL_CONTACTS> Contacts
        {
            get
            {
                return contacts;
            }
        }

        //private readonly IEnumerable<TBL_OPPORTUNITIES> opportunities;
        //public IEnumerable<TBL_OPPORTUNITIES> Opportunities
        //{ get { return opportunities; } }

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
            companies = GetCompanies(user);
            contacts = GetContacts(user);
            //opportunities = Getopportunities(user);
            opportunities = GetopportunitiesByUser(user);
            companiesCount = companies.Count();
            contactsCount = contacts.Count();
            opportunitiesCount = opportunities.Count();
        }


        private IEnumerable<TBL_FRANCHISEE> GetFranchisees(UserModel user)
        {
            FranchiseeRepository franchiseeSource = new FranchiseeRepository();
            IEnumerable<TBL_FRANCHISEE> franchisees = null;
            if (user.Role == SandlerRoles.Coach)
            {
                franchisees = from franchisee in franchiseeSource.GetAll().Where(record => record.IsActive == true && record.CoachID == user.CoachID)
                              select franchisee;
            }
            return franchisees;
        }
        private IEnumerable<TBL_COMPANIES> GetCompanies(UserModel user)
        {
            CompaniesRepository companiesSource = new CompaniesRepository();
            IEnumerable<TBL_COMPANIES> companies = null;

            try
            {
                if (user.Role == SandlerRoles.FranchiseeUser)
                    companies = companiesSource.GetAll().Where(record => record.IsActive == true && record.FranchiseeId == user.FranchiseeID).AsEnumerable();
                else if (user.Role == SandlerRoles.FranchiseeOwner)
                    companies = companiesSource.GetAll().Where(record => record.IsActive == true && record.FranchiseeId == user.FranchiseeID).AsEnumerable();
                else if (user.Role == SandlerRoles.Coach)
                {
                    companies = from company in companiesSource.GetAll().Where(record => record.IsActive == true)
                                from franchisee in franchisees.Where(f => f.CoachID == user.CoachID && f.ID == company.FranchiseeId)
                                select company;

                }
                else if (user.Role == SandlerRoles.Corporate)
                {
                    companies = companiesSource.GetAll().Where(record => record.IsActive == true).AsEnumerable();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in UserEntities.GetCompanies: " + ex.Message);
            }
            return companies;
        }
        private IEnumerable<TBL_CONTACTS> GetContacts(UserModel user)
        {
            ContactsRepository contactsSource = new ContactsRepository();
            IEnumerable<TBL_CONTACTS> contacts = null;
            if (user.Role == SandlerRoles.FranchiseeUser)
                contacts = contactsSource.GetAll().Where(record => record.IsActive == true && record.CreatedBy.ToLower() == user.UserId.ToString().ToLower()).AsEnumerable();
            else if (user.Role == SandlerRoles.FranchiseeOwner)
            {
                //contacts = from contact in contactsSource.GetAll().Where(record => record.IsActive == true)
                //           from company in this.companies.Where(record => record.COMPANIESID == contact.COMPANYID)
                //           select contact;
                contacts = from contact in contactsSource.GetAll().Where(record => record.IsActive == true && record.TBL_COMPANIES.FranchiseeId == user.FranchiseeID)
                           //from company in this.companies.Where(record => record.COMPANIESID == contact.COMPANYID)
                           //where company.FranchiseeId == user.FranchiseeID
                           select contact;
            }
            else if (user.Role == SandlerRoles.Coach)
            {
                //contacts = from contact in contactsSource.GetAll().Where(record => record.IsActive == true)
                //           from company in companies.Where(record => record.COMPANIESID == contact.COMPANYID)
                //           from franchisee in franchisees.Where(record => record.ID == company.FranchiseeId)
                //           select contact;
                contacts = from contact in contactsSource.GetAll().Where(record => record.IsActive == true && record.TBL_COMPANIES.TBL_FRANCHISEE.CoachID == user.CoachID)
                           select contact;
            }
            else if (user.Role == SandlerRoles.Corporate)
            {
                contacts = contactsSource.GetAll().Where(record => record.IsActive == true).AsEnumerable();
            }
            return contacts;
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
               opportunties = opportunitiesSource.GetByUserId(user.UserId).ToList<Opportunity>();
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

        public IEnumerable<TBL_CONTACTS> GetNewAppointments(UserModel user)
        {
            IEnumerable<TBL_CONTACTS> newContacts = null;
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
        public IEnumerable<TBL_CONTACTS> GetContactsByCompany(UserModel user, int companyId)
        {
            IEnumerable<TBL_CONTACTS> companyContacts = null;
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
