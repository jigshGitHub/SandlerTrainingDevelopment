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
        public IEnumerable<AppointmentSourceVM> GetNewAppointmentSource(UserModel currentUser, int month, int year)
        {
            IEnumerable<AppointmentSourceVM> data = null;
            ContactsRepository contactSource;
            SqlDataReader newAppointments;
            List<AppointmentSourceVM> newAppsSource;
            try
            {
                contactSource = new ContactsRepository();
                newAppointments = contactSource.GetNewAppointments(month, year, currentUser.UserId.ToString());
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
            catch (Exception ex)
            {
                throw new Exception("exception in DataQueries.GetNewAppointmentSource: " + ex.Message);
            }

            return data;
        }

        public IEnumerable<ProductTypeVM> GetNewClientsByProductType(UserModel currentUser, int month, int year)
        {
            IEnumerable<ProductTypeVM> data = null;
            CompaniesRepository companyRepository = null;
            SqlDataReader newClients;
            List<ProductTypeVM> newAppsProducts;
            try
            {               
                companyRepository = new CompaniesRepository();
                newClients = companyRepository.GetNewClientsProducts(month,year, currentUser.UserId.ToString());
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
            IEnumerable<ClosedSalesVM> data = null;
            CompaniesRepository companyRepository = null;
            SqlDataReader records;
            List<ClosedSalesVM> closedSales = null;
            try
            {
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
            IEnumerable<PipelineOppAnalysisVM> data = null;
            CompaniesRepository companyRepository = null;
            SqlDataReader records;
            List<PipelineOppAnalysisVM> closedSales = null;
            try
            {
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


        public int GetNewClientCount(UserModel currentUser, int month, int year)
        {
            int newClientsCount = 0;
            CompaniesRepository companyRepository = null;
            SqlDataReader newClients;
            try
            {
                companyRepository = new CompaniesRepository();
                newClients = companyRepository.GetNewClientsProducts(month, year, currentUser.UserId.ToString());
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

        public long GetAveContractPrice(UserModel currentUser, int month, int year)
        {
            OpportunitiesRepository opportunitiesSource = new OpportunitiesRepository();
            List<Opportunity> opportunties = null;
            long aveContractPrice = 0;
            try
            {
                opportunties = opportunitiesSource.GetOpportunitiesByUser(currentUser.UserId).ToList<Opportunity>();

                if (opportunties.Count > 0)
                {
                    aveContractPrice = long.Parse((from opportunity in opportunties.Where(record => record.ProductID != 1 && record.IsNewCompany == true && record.CreationDate.Value.Year == year && record.CreationDate.Value.Month == month)
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
            IEnumerable<ProductTypeVM> data = null;
            CompaniesRepository companyRepository = null;
            SqlDataReader newClients;
            List<ProductTypeVM> newAppsProducts;
            try
            {
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
            IEnumerable<ProductTypeVM> data = null;
            CompaniesRepository companyRepository = null;
            SqlDataReader newClients;
            List<ProductTypeVM> newAppsProducts;
            try
            {
                companyRepository = new CompaniesRepository();
                newClients = companyRepository.GetNewClientsProducts(month, DateTime.Now.Year, currentUser.UserId.ToString());
                newAppsProducts = new List<ProductTypeVM>();
                if (newClients != null)
                {
                    while (newClients.Read())
                    {
                        if (newClients.GetString(1) != "Assessment")
                        {
                            newAppsProducts.Add(new ProductTypeVM { AvgPrice = double.Parse (newClients[2].ToString()), ProductTypeName = newClients.GetString(1) });
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

        public int GetClassHeadCountsCourse(UserModel currentUser, int month)
        {
            int classHeadCountsCourse = 0;
            ContactsRepository contactsSource = new ContactsRepository();
            List<SandlerModels.Contact> contactsList = null;
            
            try
            {
                contactsList = contactsSource.GetContactsByUser(currentUser.UserId).ToList<SandlerModels.Contact>();

                if (contactsList.Count > 0)
                {

                    classHeadCountsCourse = (from contact in contactsList.Where(record => record.IsRegisteredForTraining == true &&
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
            ContactsRepository contactsSource = new ContactsRepository();
            List<SandlerModels.Contact> contactsList = null;
            int classHeadCountsIndustry = 0;
            try
            {
                contactsList = contactsSource.GetContactsByUser(currentUser.UserId).ToList<SandlerModels.Contact>();

                if (contactsList.Count > 0)
                {
                    classHeadCountsIndustry = (from contact in contactsList.Where(record => record.IsRegisteredForTraining == true &&
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
            long actualDollarsBooked = 0;
            OpportunitiesRepository opportunitiesSource = new OpportunitiesRepository();
            List<Opportunity> opportunties = null;
            
            try
            {
                opportunties = opportunitiesSource.GetOpportunitiesByUser(currentUser.UserId).ToList<Opportunity>();

                if (opportunties.Count > 0)
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
            long goalOfDollarsBooked = 0;
            OpportunitiesRepository opportunitiesSource = new OpportunitiesRepository();
            List<Opportunity> opportunties = null;

            try
            {
                opportunties = opportunitiesSource.GetOpportunitiesByUser(currentUser.UserId).ToList<Opportunity>();
                if (opportunties .Count> 0)
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
            IEnumerable<CourseVM> data = null;
            ContactsRepository contactsSource = new ContactsRepository();
            List<SandlerModels.Contact> contactsList = null;
                
            try
            {
                contactsList = contactsSource.GetContactsByUser(currentUser.UserId).ToList<SandlerModels.Contact>();
                if (contactsList.Count > 0)
                {

                    data = from record in contactsList.Where(record => record.IsRegisteredForTraining == true &&
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
            IEnumerable<IndustryVM> data = null;
            ContactsRepository contactsSource = new ContactsRepository();
            List<SandlerModels.Contact> contactsList = null;

            try
            {
                contactsList = contactsSource.GetContactsByUser(currentUser.UserId).ToList<SandlerModels.Contact>();
                if (contactsList.Count > 0)
                {
                    data = from contact in contactsList.Where(record => record.IsRegisteredForTraining == true &&
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
            IndustryTypeRepository industrySource = null;
            IEnumerable<IndustryVM> data = null;
            CompaniesRepository companySource = null;
            List<IndustryVM> clientsIndustry;
            SqlDataReader clientsIndustrySource;
            try
            {

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
            IEnumerable<CostOfSaleVM> data = null;
             OpportunitiesRepository opportunitiesSource = new OpportunitiesRepository();
            List<Opportunity> opportunties = null;
                
            try
            {
                opportunties = opportunitiesSource.GetOpportunitiesByUser(currentUser.UserId).ToList<Opportunity>();
                if (opportunties.Count > 0)
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
            IEnumerable<SalesCycleTimePortfolioVM> data = null;
            OpportunityRepository oppRpository = null;
            SqlDataReader opportunities;
            List<SalesCycleTimePortfolioVM> sctPoftfolio;
            try
            {
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
            IEnumerable<SalesTotalByMonthVM> data = null;
             OpportunitiesRepository opportunitiesSource = new OpportunitiesRepository();
            List<Opportunity> opportunties = null;
               
            try
            {
                 opportunties = opportunitiesSource.GetOpportunitiesByUser(currentUser.UserId).ToList<Opportunity>();
                 if (opportunties.Count > 0)
                {
                    if (processingYear == DateTime.Now.Year)
                    {
                        data = from opportunity in opportunties
                               where opportunity.STATUSID.HasValue == true && opportunity.Status.ToLower() != "closed lost" && opportunity.CLOSEDATE.Value.Year == processingYear && opportunity.CLOSEDATE.Value < DateTime.Now
                               select new SalesTotalByMonthVM { CloseDate = opportunity.CLOSEDATE.Value, Id = opportunity.ID, Value = opportunity.VALUE.Value };
                    }
                    else
                    {
                        data = from opportunity in opportunties
                               where opportunity.STATUSID.HasValue == true && opportunity.Status.ToLower() == "closed won" && opportunity.CLOSEDATE.Value.Year == processingYear && opportunity.CLOSEDATE.Value < DateTime.Now
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

        #region ProductReports Data
        public IEnumerable<ProductTypeVM> GetProductSalesByMonth(UserModel currentUser, int processingMonth)
        {
            IEnumerable<ProductTypeVM> data = null;
             OpportunitiesRepository opportunitiesSource = new OpportunitiesRepository();
            List<Opportunity> opportunties = null;
            
            try
            {
                 opportunties = opportunitiesSource.GetOpportunitiesByUser(currentUser.UserId).ToList<Opportunity>();
                 if (opportunties.Count > 0)
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
            IEnumerable<ProductTypeVM> data = null;

            OpportunitiesRepository opportunitiesSource = new OpportunitiesRepository();
            List<Opportunity> opportunties = null;
            try
            {
                opportunties = opportunitiesSource.GetOpportunitiesByUser(currentUser.UserId).ToList<Opportunity>();

                if (opportunties.Count > 0)
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
            IEnumerable<ProductTypeVM> data = null;
            OpportunitiesRepository opportunitiesSource = new OpportunitiesRepository();
            List<Opportunity> opportunties = null;
            try
            {
                opportunties = opportunitiesSource.GetOpportunitiesByUser(currentUser.UserId).ToList<Opportunity>();

                if (opportunties.Count > 0)
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
            IEnumerable<ProductTypeVM> data = null;
            OpportunitiesRepository opportunitiesSource = new OpportunitiesRepository();
            List<Opportunity> opportunties = null;
            try
            {
                opportunties = opportunitiesSource.GetOpportunitiesByUser(currentUser.UserId).ToList<Opportunity>();

                if (opportunties.Count > 0)
                {
                    data = from opportunity in opportunties
                           where (opportunity.SALESREPFIRSTNAME + " " + opportunity.SALESREPLASTNAME == salesRep) && opportunity.CLOSEDATE.Value.Year == DateTime.Now.Year && opportunity.CLOSEDATE.Value.Month == processingMonth && opportunity.CLOSEDATE.Value < DateTime.Now
                           group opportunity by new { opportunity.ProductTypeName }
                               into grp
                               select new ProductTypeVM { ProductTypeName = grp.Key.ProductTypeName, AvgPrice = double.Parse(grp.Sum(record => record.VALUE.Value).ToString()), Count = grp.Count() };
                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in DataQueries.GetProductSoldBySalesRepByMonth: " + ex.Message);
            }
            return data;
        }
        #endregion

        #region BenchMarkReports Data
        public IEnumerable<BenchMarkVM> GetBenchMarkSalesRepToFranchiseeByMonth(UserModel currentUser, int processingMonth)
        {
            SqlDataReader dataReader = null;
            IEnumerable<BenchMarkVM> data = null;
            List<BenchMarkVM> lstData;
            OpportunityRepository oppRepository;
            try
            {
                oppRepository = new OpportunityRepository();

                dataReader = oppRepository.GetBenchMarkSalesFranchiseeData(processingMonth, DateTime.Now.Year, currentUser.FranchiseeID);

                if (dataReader != null)
                {
                    lstData = new List<BenchMarkVM>();
                    while (dataReader.Read())
                    {
                        lstData.Add(new BenchMarkVM { KeyGroupId = dataReader["SalesRep"].ToString(), Value = double.Parse(dataReader["TotalValue"].ToString()), Count = int.Parse(dataReader["TotalQty"].ToString()) });
                    }
                    dataReader.Close();
                    data = lstData.AsEnumerable<BenchMarkVM>();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in DataQueries.GetBenchMarkSalesRepToFranchiseeByMonth: " + ex.Message);
            }
            return data;
        }

        public IEnumerable<BenchMarkVM> GetBenchMarkFranchiseeToRegionsByMonth(UserModel currentUser, int processingMonth)
        {
            SqlDataReader dataReader = null;
            IEnumerable<BenchMarkVM> data = null;
            List<BenchMarkVM> lstData;
            OpportunityRepository oppRepository;
            try
            {
                oppRepository = new OpportunityRepository();

                dataReader = oppRepository.GetBenchMarkFranchiseeRegionsData(processingMonth, DateTime.Now.Year, currentUser.FranchiseeID);

                if (dataReader != null)
                {
                    lstData = new List<BenchMarkVM>();
                    while (dataReader.Read())
                    {
                        lstData.Add(new BenchMarkVM { KeyGroupId = dataReader["FranchiseeId"].ToString(), Value = double.Parse(dataReader["TotalValue"].ToString()), Count = int.Parse(dataReader["TotalQty"].ToString()) });
                    }
                    dataReader.Close();
                    data = lstData.AsEnumerable<BenchMarkVM>();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in DataQueries.GetBenchMarkFranchiseeToRegionsByMonth: " + ex.Message);
            }
            return data;
        }

        public IEnumerable<BenchMarkVM> GetBenchMarkRegionToCountryByMonth(UserModel currentUser, int processingMonth)
        {
            SqlDataReader dataReader = null;
            IEnumerable<BenchMarkVM> data = null;
            List<BenchMarkVM> lstData;
            OpportunityRepository oppRepository;
            try
            {
                oppRepository = new OpportunityRepository();

                dataReader = oppRepository.GetBenchMarkRegionCountryData(processingMonth, DateTime.Now.Year, currentUser.RegionID);

                if (dataReader != null)
                {
                    lstData = new List<BenchMarkVM>();
                    while (dataReader.Read())
                    {
                        lstData.Add(new BenchMarkVM { KeyGroupId = dataReader["RegionID"].ToString(), Value = double.Parse(dataReader["TotalValue"].ToString()), Count = int.Parse(dataReader["TotalQty"].ToString()) });
                    }
                    dataReader.Close();
                    data = lstData.AsEnumerable<BenchMarkVM>();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in DataQueries.GetBenchMarkRegionToCountryByMonth: " + ex.Message);
            }
            return data;
        }
        public IEnumerable<BenchMarkVM> GetBenchMarkCountryAllByMonth(int processingMonth)
        {
            SqlDataReader dataReader = null;
            IEnumerable<BenchMarkVM> data = null;
            List<BenchMarkVM> lstData;
            OpportunityRepository oppRepository;
            try
            {
                oppRepository = new OpportunityRepository();

                dataReader = oppRepository.GetBenchMarkCountryAllData(processingMonth, DateTime.Now.Year);

                if (dataReader != null)
                {
                    lstData = new List<BenchMarkVM>();
                    while (dataReader.Read())
                    {
                        lstData.Add(new BenchMarkVM { KeyGroupId = dataReader["CountryID"].ToString(), Value = double.Parse(dataReader["TotalValue"].ToString()), Count = int.Parse(dataReader["TotalQty"].ToString()) });
                    }
                    dataReader.Close();
                    data = lstData.AsEnumerable<BenchMarkVM>();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("exception in DataQueries.GetBenchMarkCountryAllByMonth: " + ex.Message);
            }
            return data;
        }
        #endregion
    }
}
