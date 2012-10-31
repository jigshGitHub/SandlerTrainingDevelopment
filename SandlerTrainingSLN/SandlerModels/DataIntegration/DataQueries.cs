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

                if (userEntities.ContactsCount > 0)
                {
                    contactSource = new ContactsRepository();
                    newAppointments = contactSource.GetNewAppointments(month, DateTime.Now.Year, currentUser.UserId.ToString());
                    newAppsSource = new List<AppointmentSourceVM>();
                    if (newAppointments != null)
                    {
                        while (newAppointments.Read())
                        {
                            newAppsSource.Add(new AppointmentSourceVM { Count = newAppointments.GetInt32(0), SourceName = newAppointments.GetString(1) });
                        }
                        newAppointments.Close();
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
            IEnumerable<ProductTypeVM> data = null;
            CompaniesRepository companyRepository = null;
            SqlDataReader newClients;
            List<ProductTypeVM> newAppsProducts;
            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);

                companyRepository = new CompaniesRepository();
                newClients = companyRepository.GetNewClientsProducts(month, DateTime.Now.Year, currentUser.UserId.ToString());
                newAppsProducts = new List<ProductTypeVM>();
                if (newClients != null)
                {
                    while (newClients.Read())
                    {
                        newAppsProducts.Add(new ProductTypeVM { Count = newClients.GetInt32(0), ProductTypeName = newClients.GetString(1) });
                    }
                    newClients.Close();
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

        public IEnumerable<ClosedSalesVM> GetClosedSalesAnalysis(UserModel currentUser, int month, string analysisType, string searchNewCompanyOnly, string searchCompanyIds)
        {
            UserEntities userEntities = null;
            IEnumerable<ClosedSalesVM> data = null;
            CompaniesRepository companyRepository = null;
            SqlDataReader records;
            List<ClosedSalesVM> closedSales = null;
            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);

                companyRepository = new CompaniesRepository();
                records = companyRepository.GetClosedSalesAnalysis(month, DateTime.Now.Year, currentUser.UserId.ToString(), analysisType, searchNewCompanyOnly, searchCompanyIds);
                closedSales = new List<ClosedSalesVM>();
                if (records != null)
                {
                    while (records.Read())
                    {
                        if (!string.IsNullOrEmpty(records.GetValue(0).ToString()) && !string.IsNullOrEmpty(records.GetValue(1).ToString()))
                        {
                            if (analysisType == "ProductsSoldBySalesQuantity" || analysisType == "SalesQuantityOppSource" || analysisType == "SalesQuantityOpportunityType")
                                closedSales.Add(new ClosedSalesVM { Count = records.GetInt32(0), Name = records.GetString(1) });
                            if (analysisType == "ProductsSoldBySalesValue" || analysisType == "SalesValueOppSource" || analysisType == "SalesValueOpportunityType")
                                closedSales.Add(new ClosedSalesVM { AvgPrice = Convert.ToDouble(records.GetDecimal(0)), Name = records.GetString(1) });
                        }
                    }
                    records.Close();
                }
                data = closedSales.AsEnumerable<ClosedSalesVM>();
                //}
            }
            catch (Exception ex)
            {
                throw new Exception("exception in DataQueries.GetNewClientsByProductType: " + ex.Message);
            }
            return data;
        }

        public IEnumerable<PipelineOppAnalysisVM> GetPipelineOpportunityAnalysis(UserModel currentUser, int month, string analysisType, string searchNewCompanyOnly, string searchCompanyIds)
        {
            UserEntities userEntities = null;
            IEnumerable<PipelineOppAnalysisVM> data = null;
            CompaniesRepository companyRepository = null;
            SqlDataReader records;
            List<PipelineOppAnalysisVM> closedSales = null;
            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);

                companyRepository = new CompaniesRepository();
                records = companyRepository.GetPipelineOpportunityAnalysis(month, DateTime.Now.Year, currentUser.UserId.ToString(), analysisType, searchNewCompanyOnly, searchCompanyIds);
                closedSales = new List<PipelineOppAnalysisVM>();
                if (records != null)
                {
                    while (records.Read())
                    {
                        if (!string.IsNullOrEmpty(records.GetValue(0).ToString()) && !string.IsNullOrEmpty(records.GetValue(1).ToString()))
                        {
                            if (analysisType == "ProductsSoldBySalesQuantity" || analysisType == "SalesQuantityOppSource" || analysisType == "SalesQuantityOpportunityType")
                                closedSales.Add(new PipelineOppAnalysisVM { Count = records.GetInt32(0), Name = records.GetString(1) });
                            if (analysisType == "ProductsSoldBySalesValue" || analysisType == "SalesValueOppSource" || analysisType == "SalesValueOpportunityType")
                                closedSales.Add(new PipelineOppAnalysisVM { AvgPrice = Convert.ToDouble(records.GetDecimal(0)), Name = records.GetString(1) });
                        }
                    }
                    records.Close();
                }
                data = closedSales.AsEnumerable<PipelineOppAnalysisVM>();
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
                if (newClients != null)
                {
                    while (newClients.Read())
                    {
                        if (newClients.GetString(1) != "Assessment")
                        {
                            newClientsCount += newClients.GetInt32(0);
                        }
                    }
                    newClients.Close();
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

                companyRepository = new CompaniesRepository();
                newClients = companyRepository.GetNewClientsProducts(month, DateTime.Now.Year, currentUser.UserId.ToString());
                newAppsProducts = new List<ProductTypeVM>();
                if (newClients != null)
                {
                    while (newClients.Read())
                    {
                        if (newClients.GetString(1) != "Assessment")
                        {
                            newAppsProducts.Add(new ProductTypeVM { Count = newClients.GetInt32(0), ProductTypeName = newClients.GetString(1) });
                        }
                    }
                    newClients.Close();
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
            IEnumerable<SandlerModels.Company> companies = null;
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

                companySource = new CompaniesRepository();
                clientsIndustrySource = companySource.GetClientsAvgLengthWithIndustries(currentUser.UserId.ToString());
                clientsIndustry = new List<IndustryVM>();
                if (clientsIndustrySource != null)
                {
                    while (clientsIndustrySource.Read())
                    {
                        clientsIndustry.Add(new IndustryVM { Count = clientsIndustrySource.GetInt32(1), IndustryTypeName = clientsIndustrySource.GetString(0) });
                    }
                    clientsIndustrySource.Close();
                }
                data = clientsIndustry.AsEnumerable<IndustryVM>();

            }
            catch (Exception ex)
            {
                throw new Exception("exception in DataQueries.AverageLengthTimeActiveClientsByIndustry: " + ex.Message);
            }
            return data;
        }

        public IEnumerable<CostOfSaleVM> GetCostOfSale(UserModel currentUser)
        {
            UserEntities userEntities = null;
            IEnumerable<Opportunity> opportunties = null;
            IEnumerable<CostOfSaleVM> data = null;

            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);
                opportunties = userEntities.Opportunities;

                if (userEntities.OpportunitiesCount > 0)
                {
                    data = from opportunity in opportunties
                           group opportunity by new { opportunity.ProductTypeName }
                               into grp
                               select new CostOfSaleVM { ProductName = grp.Key.ProductTypeName, Cost = grp.Sum(record => (decimal?)record.ProductCost ?? 0), Revenue = grp.Sum(record => (decimal?)record.VALUE ?? 0) };

                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in DataQueries.GetCostOfSale: " + ex.Message);
            }
            return data;
        }

        public IEnumerable<SalesCycleTimePortfolioVM> GetSalesCycleTimePortfolio(UserModel currentUser)
        {
            UserEntities userEntities = null;
            IEnumerable<SalesCycleTimePortfolioVM> data = null;
            OpportunityRepository oppRpository = null;
            SqlDataReader opportunities;
            List<SalesCycleTimePortfolioVM> sctPoftfolio;
            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);

                oppRpository = new OpportunityRepository();
                opportunities = oppRpository.GetSalesCyclePortfolioData(currentUser.UserId.ToString());
                sctPoftfolio = new List<SalesCycleTimePortfolioVM>();
                if (opportunities != null)
                {
                    while (opportunities.Read())
                    {
                        sctPoftfolio.Add(new SalesCycleTimePortfolioVM { Id = opportunities.GetInt32(0), OppCreationDate = opportunities.GetDateTime(1), CloseDate = opportunities.GetDateTime(2), DateDiffInMonths = opportunities.GetInt32(3), MultipleOfSixVal = opportunities.GetInt32(4) });
                    }
                    opportunities.Close();
                }
                data = sctPoftfolio.AsEnumerable<SalesCycleTimePortfolioVM>();
            }
            catch (Exception ex)
            {
                throw new Exception("exception in DataQueries.GetNewClientsByProductType: " + ex.Message);
            }
            return data;
        }

        public IEnumerable<SalesTotalByMonthVM> GetSalesTotalByYear(UserModel currentUser, int processingYear)
        {
            UserEntities userEntities = null;
            IEnumerable<Opportunity> opportunties = null;
            IEnumerable<SalesTotalByMonthVM> data = null;

            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);
                opportunties = userEntities.Opportunities;

                if (userEntities.OpportunitiesCount > 0)
                {
                    //data = from opportunity in opportunties
                    //       group opportunity by new { opportunity.ProductTypeName }
                    //           into grp
                    //           select new CostOfSaleVM { ProductName = grp.Key.ProductTypeName, Cost = grp.Sum(record => (decimal?)record.ProductCost ?? 0), Revenue = grp.Sum(record => (decimal?)record.VALUE ?? 0) };

                    if (processingYear == DateTime.Now.Year)
                    {
                        data = from opportunity in opportunties
                               where opportunity.Status.ToLower() != "closed lost" && opportunity.CLOSEDATE.Value.Year == processingYear && opportunity.CLOSEDATE.Value < DateTime.Now
                               select new SalesTotalByMonthVM { CloseDate = opportunity.CLOSEDATE.Value, Id = opportunity.ID, Value = opportunity.VALUE.Value };
                    }
                    else
                    {
                        data = from opportunity in opportunties
                               where opportunity.Status.ToLower() == "closed won" && opportunity.CLOSEDATE.Value.Year == processingYear && opportunity.CLOSEDATE.Value < DateTime.Now
                               select new SalesTotalByMonthVM { CloseDate = opportunity.CLOSEDATE.Value, Id = opportunity.ID, Value = opportunity.VALUE.Value };
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in DataQueries.GetCostOfSale: " + ex.Message);
            }
            return data;
        }

        public IEnumerable<ProductTypeVM> GetProductSalesByMonth(UserModel currentUser, int processingMonth)
        {
            UserEntities userEntities = null;
            IEnumerable<Opportunity> opportunties = null;
            IEnumerable<ProductTypeVM> data = null;

            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);
                opportunties = userEntities.Opportunities;

                if (userEntities.OpportunitiesCount > 0)
                {
                    data = from opportunity in opportunties
                           where opportunity.CLOSEDATE.Value.Year == DateTime.Now.Year && opportunity.CLOSEDATE.Value.Month == processingMonth && opportunity.CLOSEDATE.Value < DateTime.Now
                           group opportunity by new { opportunity.ProductTypeName }
                               into grp
                               select new ProductTypeVM { ProductTypeName = grp.Key.ProductTypeName, AvgPrice = double.Parse(grp.Sum(record => record.VALUE.Value).ToString()), Count = grp.Count() };
                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in DataQueries.GetCostOfSale: " + ex.Message);
            }
            return data;
        }

        public IEnumerable<ProductTypeVM> GetProductFirstSalesByMonth(UserModel currentUser, int processingMonth)
        {
            UserEntities userEntities = null;
            IEnumerable<Opportunity> opportunties = null;
            IEnumerable<ProductTypeVM> data = null;

            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);
                opportunties = userEntities.Opportunities;

                if (userEntities.OpportunitiesCount > 0)
                {
                    data = from opportunity in opportunties
                           where opportunity.IsNewCompany == true && opportunity.CLOSEDATE.Value.Year == DateTime.Now.Year && opportunity.CLOSEDATE.Value.Month == processingMonth && opportunity.CLOSEDATE.Value < DateTime.Now
                           group opportunity by new { opportunity.ProductTypeName }
                               into grp
                               select new ProductTypeVM { ProductTypeName = grp.Key.ProductTypeName, AvgPrice = double.Parse(grp.Sum(record => record.VALUE.Value).ToString()), Count = grp.Count() };
                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in DataQueries.GetCostOfSale: " + ex.Message);
            }
            return data;
        }
        public IEnumerable<ProductTypeVM> GetProductSoldByCompanyByMonth(UserModel currentUser, int processingMonth, int companyId)
        {
            UserEntities userEntities = null;
            IEnumerable<Opportunity> opportunties = null;
            IEnumerable<ProductTypeVM> data = null;

            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);
                opportunties = userEntities.Opportunities;

                if (userEntities.OpportunitiesCount > 0)
                {
                    data = from opportunity in opportunties
                           where opportunity.COMPANYID == companyId && opportunity.CLOSEDATE.Value.Year == DateTime.Now.Year && opportunity.CLOSEDATE.Value.Month == processingMonth && opportunity.CLOSEDATE.Value < DateTime.Now
                           group opportunity by new { opportunity.ProductTypeName }
                               into grp
                               select new ProductTypeVM { ProductTypeName = grp.Key.ProductTypeName, AvgPrice = double.Parse(grp.Sum(record => record.VALUE.Value).ToString()), Count = grp.Count() };
                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in DataQueries.GetCostOfSale: " + ex.Message);
            }
            return data;
        }
        public IEnumerable<ProductTypeVM> GetProductSoldBySalesRepByMonth(UserModel currentUser, int processingMonth, string salesRep)
        {
            UserEntities userEntities = null;
            IEnumerable<Opportunity> opportunties = null;
            IEnumerable<ProductTypeVM> data = null;

            try
            {
                userEntities = UserEntitiesFactory.Get(currentUser);
                opportunties = userEntities.Opportunities;

                if (userEntities.OpportunitiesCount > 0)
                {
                    data = from opportunity in opportunties
                           where opportunity.CLOSEDATE.Value.Year == DateTime.Now.Year && opportunity.CLOSEDATE.Value.Month == processingMonth && opportunity.CLOSEDATE.Value < DateTime.Now
                           group opportunity by new { salesRep = opportunity.SALESREPFIRSTNAME + " " + opportunity.SALESREPLASTNAME }
                               into grp
                               select new ProductTypeVM { ProductTypeName = grp.Key.salesRep, AvgPrice = double.Parse(grp.Sum(record => record.VALUE.Value).ToString()), Count = grp.Count() };
                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in DataQueries.GetProductSoldBySalesRepByMonth: " + ex.Message);
            }
            return data;
        }
    }
}
