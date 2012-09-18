using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SandlerRepositories;
using System.Data.Linq.SqlClient;
using System.Data.SqlClient;

namespace SandlerModels.DataIntegration
{
    public class DataQueries
    {
        public IEnumerable<AppointmentSourceVM> GetNewAppointmentSource(UserModel currentUser, int month)
        {
            UserEntities userEntities = null;
            IEnumerable<TBL_CONTACTS> contacts = null;
            IEnumerable<AppointmentSourceVM> data = null;
            ContactsRepository contactSource;
            SqlDataReader newAppointments;
            List<AppointmentSourceVM> newAppsSource;
            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);
                //contacts = userEntities.GetNewAppointments(currentUser);

                if (userEntities.ContactsCount > 0)
                {
                    //data = from contact in contacts
                    //       from company in userEntities.Companies.Where(record => record.COMPANIESID == contact.COMPANYID && record.CreationDate.Value.Year == DateTime.Now.Year && record.CreationDate.Value.Month == month)
                    //       from appSource in new AppointmentSourceRepository().GetAll().Where(record => record.IsActive == true && record.ApptSourceId == contact.ApptSourceId)
                    //       group contact by new { appSource.ApptSourceName }
                    //           into grp
                    //           select new AppointmentSourceVM { SourceName = grp.Key.ApptSourceName, Count = grp.Count() };
                    contactSource = new ContactsRepository();
                    newAppointments = contactSource.GetNewAppointments(month, DateTime.Now.Year, currentUser.UserId.ToString());
                    newAppsSource = new List<AppointmentSourceVM>();
                    while (newAppointments.Read())
                    {
                        newAppsSource.Add(new AppointmentSourceVM { Count = newAppointments.GetInt32(0), SourceName = newAppointments.GetString(1) });
                    }
                    data = newAppsSource.AsEnumerable<AppointmentSourceVM>();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in DataQueries.GetNewAppointmentSource: " + ex.Message);
            }

            return data;
        }

        public IEnumerable<ProductTypeVM> GetNewClientsByProductType(UserModel currentUser, int month)
        {
            UserEntities userEntities = null;
            //IEnumerable<TBL_OPPORTUNITIES> opportunties = null;
            IEnumerable<ProductTypeVM> data = null;
            CompaniesRepository companyRepository = null;
            SqlDataReader newClients;
            List<ProductTypeVM> newAppsProducts;
            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);
                //opportunties = userEntities.Opportunities;

                //if (userEntities.OpportunitiesCount > 0)
                //{
                //data = from oppotunity in opportunties
                //        from company in userEntities.Companies.Where(record => record.COMPANIESID == oppotunity.COMPANYID && record.IsNewCompany == true && record.CreationDate.Value.Year == DateTime.Now.Year && record.CreationDate.Value.Month == month)
                //        from product in new ProductTypesRepository().GetAll().Where(record => record.Id == oppotunity.ProductID && record.IsActive == true)
                //        group oppotunity by new { product.ProductTypeName }
                //            into grp
                //            select new ProductTypeVM { ProductTypeName = grp.Key.ProductTypeName, Count = grp.Count() };
                companyRepository = new CompaniesRepository();
                newClients = companyRepository.GetNewClientsProducts(month, DateTime.Now.Year, currentUser.UserId.ToString());
                newAppsProducts = new List<ProductTypeVM>();
                while (newClients.Read())
                {
                    newAppsProducts.Add(new ProductTypeVM { Count = newClients.GetInt32(0), ProductTypeName = newClients.GetString(1) });
                }
                data = newAppsProducts.AsEnumerable<ProductTypeVM>();
                //}
            }
            catch (Exception ex)
            {
                throw new Exception("exception in DataQueries.GetNewClientsByProductType: " + ex.Message);
            }
            return data;
        }

        public int GetNewClientCount(UserModel currentUser, int month)
        {
            UserEntities userEntities = null;
            int newClientsCount = 0;
            CompaniesRepository companyRepository = null;
            SqlDataReader newClients;
            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);
                companyRepository = new CompaniesRepository();
                newClients = companyRepository.GetNewClientsProducts(month, DateTime.Now.Year, currentUser.UserId.ToString());
                while (newClients.Read())
                {
                    if (newClients.GetString(1) != "Assessment")
                    {
                        newClientsCount += newClients.GetInt32(0);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in DataQueries.GetNewClientCount: " + ex.Message);
            }
            return newClientsCount;
        }

        public long GetAveContractPrice(UserModel currentUser, int month)
        {
            UserEntities userEntities = null;
            //IEnumerable<TBL_OPPORTUNITIES> opportunties = null;
            List<Opportunity> opportunties = null;
            long aveContractPrice = 0;
            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);
                opportunties = userEntities.Opportunities;

                if (userEntities.OpportunitiesCount > 0)
                {
                    aveContractPrice = long.Parse((from opportunity in opportunties.Where(record => record.ProductID != 1 && record.IsNewCompany == true && record.CreationDate.Value.Year == DateTime.Now.Year && record.CreationDate.Value.Month == month)                                                  
                                                   select opportunity.WEIGHTEDVALUE).Sum().Value.ToString());

                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in DataQueries.GetAveContractPrice: " + ex.Message);
            }
            return aveContractPrice;
        }

        public IEnumerable<ProductTypeVM> NewClientsWithProductTypes(UserModel currentUser, int month)
        {
            UserEntities userEntities = null;
            //IEnumerable<TBL_OPPORTUNITIES> opportunties = null;
            IEnumerable<ProductTypeVM> data = null;
            CompaniesRepository companyRepository = null;
            SqlDataReader newClients;
            List<ProductTypeVM> newAppsProducts;
            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);
                // opportunties = userEntities.Opportunities;

                //if (userEntities.OpportunitiesCount > 0)
                //{
                //data = from opportunity in opportunties.Where(record => record.TBL_COMPANIES.IsNewCompany == true &&
                //           record.TBL_COMPANIES.CreationDate.Value.Year == DateTime.Now.Year && record.TBL_COMPANIES.CreationDate.Value.Month == month &&
                //           record.Tbl_ProductType.Id != null && record.Tbl_ProductType.ProductTypeName != "Assessment")
                //       group opportunity by new { opportunity.Tbl_ProductType.ProductTypeName }
                //           into grp
                //           select new ProductTypeVM { ProductTypeName = grp.Key.ProductTypeName, Count = grp.Count() };
                companyRepository = new CompaniesRepository();
                newClients = companyRepository.GetNewClientsProducts(month, DateTime.Now.Year, currentUser.UserId.ToString());
                newAppsProducts = new List<ProductTypeVM>();
                while (newClients.Read())
                {
                    if (newClients.GetString(1) != "Assessment")
                    {
                        newAppsProducts.Add(new ProductTypeVM { Count = newClients.GetInt32(0), ProductTypeName = newClients.GetString(1) });
                    }
                }
                data = newAppsProducts.AsEnumerable<ProductTypeVM>();
                //}
            }
            catch (Exception ex)
            {
                throw new Exception("exception in DataQueries.NewClientsWithProductTypes: " + ex.Message);
            }
            return data;
        }

        public IEnumerable<ProductTypeVM> ContractPriceWithProductTypes(UserModel currentUser, int month)
        {
            UserEntities userEntities = null;
            //IEnumerable<TBL_OPPORTUNITIES> opportunties = null;
            IEnumerable<Opportunity> opportunties = null;
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
                throw new Exception("exception in DataQueries.ContractPriceWithProductTypes: " + ex.Message);
            }
            return data;
        }

        public int GetClassHeadCountsCourse(UserModel currentUser, int month)
        {
            UserEntities userEntities = null;
            //IEnumerable<TBL_CONTACTS> contacts = null;
            IEnumerable<SandlerModels.Contact> contacts = null;
            int classHeadCountsCourse = 0;
            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);
                //contacts = userEntities.Contacts;
                contacts = userEntities.Contacts;

                if (userEntities.ContactsCount > 0)
                {
                    
                    classHeadCountsCourse = (from contact in contacts.Where(record => record.IsRegisteredForTraining == true &&
                                            record.CourseId != null &&
                                            record.CourseTrainingDate.Value.Year == DateTime.Now.Year &&
                                            record.CourseTrainingDate.Value.Month == month)
                                             select contact).Count();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in DataQueries.GetClassHeadCountsCourse: " + ex.Message);
            }
            return classHeadCountsCourse;
        }

        public int GetClassHeadCountsIndustry(UserModel currentUser, int month)
        {
            UserEntities userEntities = null;
            //IEnumerable<TBL_CONTACTS> contacts = null;
            IEnumerable<SandlerModels.Contact> contacts = null;
            int classHeadCountsIndustry = 0;
            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);
                contacts = userEntities.Contacts;

                if (userEntities.ContactsCount > 0)
                {
                    //classHeadCountsIndustry = (from contact in contacts.Where(record => record.IsRegisteredForTraining == true &&
                    //                           record.TBL_COMPANIES.IndustryId != null &&
                    //                           record.CourseTrainingDate.Value.Year == DateTime.Now.Year &&
                    //                           record.CourseTrainingDate.Value.Month == month)
                    //                           select contact).Count();
                    classHeadCountsIndustry = (from contact in contacts.Where(record => record.IsRegisteredForTraining == true &&
                                               record.IndustryId.HasValue &&
                                               record.CourseTrainingDate.Value.Year == DateTime.Now.Year &&
                                               record.CourseTrainingDate.Value.Month == month)
                                               select contact).Count();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in DataQueries.GetClassHeadCountsIndustry: " + ex.Message);
            }
            return classHeadCountsIndustry;
        }

        public long GetActualDollarsBooked(UserModel currentUser, int month)
        {
            UserEntities userEntities = null;
            //IEnumerable<TBL_OPPORTUNITIES> opportunties = null;
            IEnumerable<Opportunity> opportunties = null;
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
                throw new Exception("exception in DataQueries.GetActualDollarsBooked: " + ex.Message);
            }
            return actualDollarsBooked;
        }

        public long GetGoalOfDollarsBooked(UserModel currentUser, int month)
        {
            UserEntities userEntities = null;
            //IEnumerable<TBL_OPPORTUNITIES> opportunties = null;
            IEnumerable<Opportunity> opportunties = null;
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
                throw new Exception("exception in DataQueries.GetGoalOfDollarsBooked: " + ex.Message);
            }
            return goalOfDollarsBooked;
        }

        public IEnumerable<CourseVM> GetHeadcountByCourse(UserModel currentUser, int month)
        {
            UserEntities userEntities = null;
            //IEnumerable<TBL_CONTACTS> contacts = null;
            IEnumerable<SandlerModels.Contact> contacts = null;
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
                throw new Exception("exception in DataQueries.GetHeadcountByCourse: " + ex.Message);
            }
            return data;
        }

        public IEnumerable<IndustryVM> GetHeadcountByIndustry(UserModel currentUser, int month)
        {
            UserEntities userEntities = null;
            //IEnumerable<TBL_CONTACTS> contacts = null;
            IEnumerable<SandlerModels.Contact> contacts = null;
            IEnumerable<IndustryVM> data = null;
            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);
                contacts = userEntities.Contacts;
                if (userEntities.ContactsCount > 0)
                {
                    //data = from contact in contacts.Where(record => record.IsRegisteredForTraining == true &&
                    //    record.CourseTrainingDate.Value.Year == DateTime.Now.Year &&
                    //    record.CourseTrainingDate.Value.Month == month)
                    //       from industry in new IndustryTypeRepository().GetAll().Where(i => i.IsActive == true && i.IndId == contact.TBL_COMPANIES.IndustryId)
                    //       group contact by new { industry.IndustryTypeName }
                    //           into grp
                    //           select new IndustryVM { IndustryTypeName = grp.Key.IndustryTypeName, Count = grp.Count() };
                    data = from contact in contacts.Where(record => record.IsRegisteredForTraining == true &&
                        record.CourseTrainingDate.Value.Year == DateTime.Now.Year &&
                        record.CourseTrainingDate.Value.Month == month)
                           from industry in new IndustryTypeRepository().GetAll().Where(i => i.IsActive == true && i.IndId == contact.IndustryId)
                           group contact by new { industry.IndustryTypeName }
                               into grp
                               select new IndustryVM { IndustryTypeName = grp.Key.IndustryTypeName, Count = grp.Count() };
                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in DataQueries.GetHeadcountByIndustry: " + ex.Message);
            }
            return data;
        }

        public IEnumerable<IndustryVM> AverageLengthTimeActiveClientsByIndustry(UserModel currentUser)
        {
            UserEntities userEntities = null;
            IEnumerable<TBL_COMPANIES> companies = null;
            IndustryTypeRepository industrySource = null;
            IEnumerable<IndustryVM> data = null;
            CompaniesRepository companySource = null;
            List<IndustryVM> clientsIndustry;
            SqlDataReader clientsIndustrySource;
            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);
                companies = userEntities.Companies;

                industrySource = new IndustryTypeRepository();
                //data = from record in companies
                //       from industry in industrySource.GetAll().Where(i => i.IsActive == true && i.IndId == record.IndustryId)
                //       group record by new { Industry = industry.IndustryTypeName, Months = SqlMethods.DateDiffMonth(record.CreationDate, DateTime.Now) }
                //           into grp
                //           select new IndustryVM { IndustryTypeName = grp.Key.Industry, Months = grp.Key.Months.Value };

                companySource = new CompaniesRepository();
                clientsIndustrySource = companySource.GetClientsAvgLengthWithIndustries(currentUser.UserId.ToString());
                clientsIndustry = new List<IndustryVM>();
                while (clientsIndustrySource.Read())
                {
                    clientsIndustry.Add(new IndustryVM { Count = clientsIndustrySource.GetInt32(1), IndustryTypeName = clientsIndustrySource.GetString(0) });
                }
                data = clientsIndustry.AsEnumerable<IndustryVM>();

            }
            catch (Exception ex)
            {
                throw new Exception("exception in DataQueries.AverageLengthTimeActiveClientsByIndustry: " + ex.Message);
            }
            return data;
        }
    }
}
