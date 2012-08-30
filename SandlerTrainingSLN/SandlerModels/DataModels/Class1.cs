using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SandlerRepositories;
using System.Data.Linq.SqlClient;
namespace SandlerModels.DataModels
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

        private readonly IEnumerable<TBL_OPPORTUNITIES> opportunities;
        public IEnumerable<TBL_OPPORTUNITIES> Opportunities
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
            opportunities = Getopportunities(user);
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
                                from franchisee in franchisees.Where(record => record.ID == user.CoachID)
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
                //           where company.FranchiseeId == user.FranchiseeID
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
                    companyContacts = from contact in Contacts.Where(c => c.COMPANYID == companyId)
                                      select contact;
            }
            catch (Exception ex)
            {
                throw new Exception("exception in UserEntities.GetContactsByCompany: " + ex.Message);
            }
            return companyContacts;
        }

        #endregion
    }
    public class AppointmentSourceVM
    {
        public int ApptSourceId { get; set; }
        public string SourceName { get; set; }
        public bool IsActive { get; set; }
        public int Count { get; set; }
    }

    public class ProductTypeVM
    {
        public int Id { get; set; }
        public string ProductTypeName { get; set; }
        public bool IsActive { get; set; }
        public int FranchiseeId { get; set; }
        public int Count { get; set; }
        public double AvgPrice { get; set; }
    }

    public partial class CourseVM
    {
        public int CourseId { get; set; }
        public string CourseName { get; set; }
        public bool IsActive { get; set; }
        public int Count { get; set; }
    }

    public partial class IndustryVM
    {
        public int IndId { get; set; }
        public string IndustryTypeName { get; set; }
        public bool IsActive { get; set; }
        public int Count { get; set; }
        public int Months { get; set; }
    }

    public class CompiledQueries
    {
        public IEnumerable<AppointmentSourceVM> GetNewAppointmentSource(UserModel currentUser, int month)
        {
            UserEntities userEntities = null;
            IEnumerable<TBL_CONTACTS> contacts = null;
            IEnumerable<AppointmentSourceVM> data = null;
            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);
                contacts = userEntities.GetNewAppointments(currentUser);

                if (userEntities.ContactsCount > 0)
                {
                    data = from contact in contacts
                           from company in userEntities.Companies.Where(record => record.COMPANIESID == contact.COMPANYID && record.CreationDate.Value.Year == DateTime.Now.Year && record.CreationDate.Value.Month == month)
                           from appSource in new AppointmentSourceRepository().GetAll().Where(record => record.IsActive == true && record.ApptSourceId == contact.ApptSourceId)
                           group contact by new { appSource.ApptSourceName }
                               into grp
                               select new AppointmentSourceVM { SourceName = grp.Key.ApptSourceName, Count = grp.Count() };
                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in CompiledQueries.GetNewAppointmentSource: " + ex.Message);
            }

            return data;
        }

        public IEnumerable<ProductTypeVM> GetNewClientsByProductType(UserModel currentUser, int month)
        {
            UserEntities userEntities = null;
            IEnumerable<TBL_OPPORTUNITIES> opportunties = null;
            IEnumerable<ProductTypeVM> data = null;
            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);
                opportunties = userEntities.Opportunities;

                if (userEntities.OpportunitiesCount > 0)
                {
                    //data = from record in opportunties
                    //       where (record.TBL_COMPANIES != null && record.TBL_COMPANIES.IsNewCompany == true &&
                    //       record.TBL_COMPANIES.CreationDate.Value.Year == DateTime.Now.Year &&
                    //       record.TBL_COMPANIES.CreationDate.Value.Month == month)
                    //       group record by new { record.Tbl_ProductType.ProductTypeName }
                    //           into grp
                    //           select new ProductTypeVM { ProductTypeName = grp.Key.ProductTypeName, Count = grp.Count() };

                    data = from oppotunity in opportunties
                           from company in userEntities.Companies.Where(record => record.COMPANIESID == oppotunity.COMPANYID && record.IsNewCompany == true && record.CreationDate.Value.Year == DateTime.Now.Year && record.CreationDate.Value.Month == month)
                           from product in new ProductTypesRepository().GetAll().Where(record => record.Id == oppotunity.ProductID && record.IsActive == true)
                           group oppotunity by new { product.ProductTypeName }
                               into grp
                               select new ProductTypeVM { ProductTypeName = grp.Key.ProductTypeName, Count = grp.Count() };
                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in CompiledQueries.GetNewClientsByProductType: " + ex.Message);
            }
            return data;
        }

        public int GetNewClientCount(UserModel currentUser, int month)
        {
            UserEntities userEntities = null;
            IEnumerable<TBL_OPPORTUNITIES> opportunties = null;
            int newClients = 0;
            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);
                opportunties = userEntities.Opportunities;

                if (userEntities.OpportunitiesCount > 0)
                {
                    newClients = (from opportunity in opportunties.Where(record => record.Tbl_ProductType.Id != 0 &&
                                  record.Tbl_ProductType.ProductTypeName != "Assessment" &&
                                  record.TBL_COMPANIES.IsNewCompany == true &&
                                  record.TBL_COMPANIES.CreationDate.Value.Year == DateTime.Now.Year &&
                                  record.TBL_COMPANIES.CreationDate.Value.Month == month)
                                  select opportunity).Count();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in CompiledQueries.GetNewClientCount: " + ex.Message);
            }
            return newClients;
        }

        public long GetAveContractPrice(UserModel currentUser, int month)
        {
            UserEntities userEntities = null;
            IEnumerable<TBL_OPPORTUNITIES> opportunties = null;
            long aveContractPrice = 0;
            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);
                opportunties = userEntities.Opportunities;

                if (userEntities.OpportunitiesCount > 0)
                {
                    aveContractPrice = long.Parse((from opportunity in opportunties.Where(record => record.Tbl_ProductType.Id != 0 &&
                                        record.Tbl_ProductType.ProductTypeName != "Assessment" &&
                                        record.TBL_COMPANIES.IsNewCompany == true &&
                                        record.TBL_COMPANIES.CreationDate.Value.Year == DateTime.Now.Year &&
                                        record.TBL_COMPANIES.CreationDate.Value.Month == month)
                                                   select opportunity.WEIGHTEDVALUE).Sum().Value.ToString());
                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in CompiledQueries.GetAveContractPrice: " + ex.Message);
            }
            return aveContractPrice;
        }

        public IEnumerable<ProductTypeVM> NewClientsWithProductTypes(UserModel currentUser, int month)
        {
            UserEntities userEntities = null;
            IEnumerable<TBL_OPPORTUNITIES> opportunties = null;
            IEnumerable<ProductTypeVM> data = null;

            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);
                opportunties = userEntities.Opportunities;

                if (userEntities.OpportunitiesCount > 0)
                {
                    data = from opportunity in opportunties.Where(record => record.TBL_COMPANIES.IsNewCompany == true &&
                               record.TBL_COMPANIES.CreationDate.Value.Year == DateTime.Now.Year && record.TBL_COMPANIES.CreationDate.Value.Month == month &&
                               record.Tbl_ProductType.Id != null && record.Tbl_ProductType.ProductTypeName != "Assessment")
                           group opportunity by new { opportunity.Tbl_ProductType.ProductTypeName }
                               into grp
                               select new ProductTypeVM { ProductTypeName = grp.Key.ProductTypeName, Count = grp.Count() };
                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in CompiledQueries.NewClientsWithProductTypes: " + ex.Message);
            }
            return data;
        }

        public IEnumerable<ProductTypeVM> ContractPriceWithProductTypes(UserModel currentUser, int month)
        {
            UserEntities userEntities = null;
            IEnumerable<TBL_OPPORTUNITIES> opportunties = null;
            IEnumerable<ProductTypeVM> data = null;

            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);
                opportunties = userEntities.Opportunities;

                if (userEntities.OpportunitiesCount > 0)
                {
                    data = from opportunity in opportunties
                           from company in new CompaniesRepository().GetAll().Where(c => c.IsActive == true &&
                               c.IsNewCompany == true &&
                               c.COMPANIESID == opportunity.COMPANYID &&
                               c.CreationDate.Value.Year == DateTime.Now.Year && c.CreationDate.Value.Month == month)
                           from product in new ProductTypesRepository().GetAll().Where(p => p.IsActive == true && opportunity.ProductID == p.Id && p.ProductTypeName != "Assessment")
                           group opportunity by new { product.ProductTypeName }
                               into grp
                               select new ProductTypeVM { ProductTypeName = grp.Key.ProductTypeName, AvgPrice = double.Parse(grp.Sum(record => record.WEIGHTEDVALUE).ToString()) };

                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in CompiledQueries.ContractPriceWithProductTypes: " + ex.Message);
            }
            return data;
        }

        public int GetClassHeadCountsCourse(UserModel currentUser, int month)
        {
            UserEntities userEntities = null;
            IEnumerable<TBL_CONTACTS> contacts = null;
            int classHeadCountsCourse = 0;
            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);
                contacts = userEntities.Contacts;

                if (userEntities.ContactsCount > 0)
                {
                    //classHeadCountsCourse = (from record in contacts
                    //                         where (record.IsRegisteredForTraining == true &&
                    //                         record.Tbl_Course != null &&
                    //                         record.Tbl_Course.CourseId == record.CourseId &&
                    //                         record.Tbl_Course.IsActive == true &&
                    //                         record.CourseTrainingDate.Value.Year == DateTime.Now.Year &&
                    //                         record.CourseTrainingDate.Value.Month == month)
                    //                         select record.CONTACTSID).Count();
                    classHeadCountsCourse = (from contact in contacts.Where(record => record.IsRegisteredForTraining == true &&
                                            record.CourseId != null &&
                                            record.CourseTrainingDate.Value.Year == DateTime.Now.Year &&
                                            record.CourseTrainingDate.Value.Month == month)
                                             select contact).Count();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in CompiledQueries.GetClassHeadCountsCourse: " + ex.Message);
            }
            return classHeadCountsCourse;
        }

        public int GetClassHeadCountsIndustry(UserModel currentUser, int month)
        {
            UserEntities userEntities = null;
            IEnumerable<TBL_CONTACTS> contacts = null;
            int classHeadCountsIndustry = 0;
            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);
                contacts = userEntities.Contacts;

                if (userEntities.ContactsCount > 0)
                {
                    //classHeadCountsIndustry = (from record in contacts
                    //                           where (record.IsRegisteredForTraining == true &&
                    //                           record.TBL_COMPANIES.IndustryId == record.TBL_COMPANIES.Tbl_IndustryType.IndId &&
                    //                           record.TBL_COMPANIES.IsActive == true &&
                    //                           record.TBL_COMPANIES.Tbl_IndustryType.IsActive == true &&
                    //                           record.CourseTrainingDate.Value.Year == DateTime.Now.Year &&
                    //                           record.CourseTrainingDate.Value.Month == month)
                    //                           select record.COMPANYID).Count();
                    classHeadCountsIndustry = (from contact in contacts.Where(record => record.IsRegisteredForTraining == true &&
                                               record.TBL_COMPANIES.IndustryId != null &&
                                               record.CourseTrainingDate.Value.Year == DateTime.Now.Year &&
                                               record.CourseTrainingDate.Value.Month == month)
                                               select contact).Count();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in CompiledQueries.GetClassHeadCountsIndustry: " + ex.Message);
            }
            return classHeadCountsIndustry;
        }

        public long GetActualDollarsBooked(UserModel currentUser, int month)
        {
            UserEntities userEntities = null;
            IEnumerable<TBL_OPPORTUNITIES> opportunties = null;
            long actualDollarsBooked = 0;
            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);
                opportunties = userEntities.Opportunities;

                if (userEntities.OpportunitiesCount > 0)
                {
                    actualDollarsBooked = long.Parse((from record in opportunties
                                                      where (record.CLOSEDATE.Value.Year == DateTime.Now.Year &&
                                                      record.CLOSEDATE.Value.Month == month)
                                                      select record.WEIGHTEDVALUE).Sum().Value.ToString());

                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in CompiledQueries.GetActualDollarsBooked: " + ex.Message);
            }
            return actualDollarsBooked;
        }

        public long GetGoalOfDollarsBooked(UserModel currentUser, int month)
        {
            UserEntities userEntities = null;
            IEnumerable<TBL_OPPORTUNITIES> opportunties = null;
            long goalOfDollarsBooked = 0;
            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);
                opportunties = userEntities.Opportunities;

                if (userEntities.OpportunitiesCount > 0)
                {
                    goalOfDollarsBooked = long.Parse((from record in opportunties
                                                      where (record.CLOSEDATE.Value.Year == DateTime.Now.Year && record.CLOSEDATE.Value.Month == month)
                                                      select record.VALUE).Sum().Value.ToString());
                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in CompiledQueries.GetGoalOfDollarsBooked: " + ex.Message);
            }
            return goalOfDollarsBooked;
        }

        public IEnumerable<CourseVM> GetHeadcountByCourse(UserModel currentUser, int month)
        {
            UserEntities userEntities = null;
            IEnumerable<TBL_CONTACTS> contacts = null;
            IEnumerable<CourseVM> data = null;
            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);
                contacts = userEntities.Contacts;

                if (userEntities.ContactsCount > 0)
                {

                    data = from record in contacts.Where(record => record.IsRegisteredForTraining == true &&
                           record.CourseTrainingDate.Value.Year == DateTime.Now.Year &&
                           record.CourseTrainingDate.Value.Month == month)
                           from course in new CourseRepository().GetAll().Where(c => c.IsActive == true && c.CourseId == record.CourseId)
                           group record by new { course.CourseName }
                               into grp
                               select new CourseVM { CourseName = grp.Key.CourseName, Count = grp.Count() };
                    //data = from contact in contacts.Where(record => record.IsRegisteredForTraining == true &&
                    //        record.CourseId != null &&
                    //       record.CourseTrainingDate.Value.Year == DateTime.Now.Year &&
                    //       record.CourseTrainingDate.Value.Month == month)
                    //       group contact by new { contact.Tbl_Course.CourseName }
                    //           into grp
                    //           select new CourseVM { CourseName = grp.Key.CourseName, Count = grp.Count() };
                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in CompiledQueries.GetHeadcountByCourse: " + ex.Message);
            }
            return data;
        }

        public IEnumerable<IndustryVM> GetHeadcountByIndustry(UserModel currentUser, int month)
        {
            UserEntities userEntities = null;
            IEnumerable<TBL_CONTACTS> contacts = null;
            IEnumerable<IndustryVM> data = null;
            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);
                contacts = userEntities.Contacts;
                if (userEntities.ContactsCount > 0)
                {
                    //data = from contact in contacts
                    //       from company in new CompaniesRepository().GetAll().Where(c => c.IsActive == true && c.COMPANIESID == contact.COMPANYID)
                    //       from industry in new IndustryTypeRepository().GetAll().Where(i => i.IsActive == true && i.IndId == company.IndustryId)
                    //       where (contact.IsRegisteredForTraining == true &&
                    //       contact.CourseTrainingDate.Value.Year == DateTime.Now.Year &&
                    //       contact.CourseTrainingDate.Value.Month == month)
                    //       group contact by new { industry.IndustryTypeName }
                    //           into grp
                    //           select new IndustryVM { IndustryTypeName = grp.Key.IndustryTypeName, Count = grp.Count() };
                    data = from contact in contacts.Where(record => record.IsRegisteredForTraining == true &&
                        record.CourseTrainingDate.Value.Year == DateTime.Now.Year &&
                        record.CourseTrainingDate.Value.Month == month)
                           from industry in new IndustryTypeRepository().GetAll().Where(i => i.IsActive == true && i.IndId == contact.TBL_COMPANIES.IndustryId)
                           group contact by new { industry.IndustryTypeName }
                               into grp
                               select new IndustryVM { IndustryTypeName = grp.Key.IndustryTypeName, Count = grp.Count() };
                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in CompiledQueries.GetHeadcountByIndustry: " + ex.Message);
            }
            return data;
        }

        public IEnumerable<IndustryVM> AverageLengthTimeActiveClientsByIndustry(UserModel currentUser)
        {
            UserEntities userEntities = null;
            IEnumerable<TBL_COMPANIES> companies = null;
            IndustryTypeRepository industrySource = null;
            IEnumerable<IndustryVM> data = null;
            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);
                companies = userEntities.Companies;

                industrySource = new IndustryTypeRepository();
                data = from record in companies
                       group record by new { Industry = record.Tbl_IndustryType.IndustryTypeName, Months = SqlMethods.DateDiffMonth(record.CreationDate, DateTime.Now) }
                           into grp
                           select new IndustryVM { IndustryTypeName = grp.Key.Industry, Months = grp.Key.Months.Value };

            }
            catch (Exception ex)
            {
                throw new Exception("exception in CompiledQueries.AverageLengthTimeActiveClientsByIndustry: " + ex.Message);
            }
            return data;
        }
    }
}
