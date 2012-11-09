using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Text;
using InfoSoftGlobal;
using SandlerRepositories;
using SandlerModels;
using System.Data.SqlClient;
using System.Configuration;
using SandlerData.Models;
using System.Data.Linq.SqlClient;
//http://cloford.com/resources/colours/500col.htm for color code
namespace Sandler.UI.ChartStructure
{
    public static class ChartHelper
    {
        const string CHARTPAGE = "ChartPage.aspx";

        public static string GeneratePageLink(string drillBy, string drillChartIds)
        {
            return (string.IsNullOrEmpty(drillBy) && string.IsNullOrEmpty(drillChartIds)) ? "" : string.Format("{0}?{1}={2}&{3}={4}", CHARTPAGE, ConfigurationManager.AppSettings["QueryStringParamDrillChartIDs"], drillChartIds, ConfigurationManager.AppSettings["QueryStringParamDrillBy"], drillBy);
        }

        public static string GeneratePageLink(string drillBy, string drillChartIds, string chartPage)
        {
            return (string.IsNullOrEmpty(drillBy) && string.IsNullOrEmpty(drillChartIds)) ? "" : string.Format("{0}{1}={2}&{3}={4}", chartPage, ConfigurationManager.AppSettings["QueryStringParamDrillChartIDs"], drillChartIds, ConfigurationManager.AppSettings["QueryStringParamDrillBy"], drillBy);
        }

        public static string GetSCTimeLegend(int value)
        {
            switch (value)
            {
                case 0:
                    return "Up to 6 months";
                case 1:
                    return "6 to 12 months";
                case 2:
                    return "12 to 18 months";
                case 3:
                    return "18 to 24 motnsh";
                default:
                    return "24+ months";
            }
        }

        public static string GetMonthName(int number)
        {
            switch (number)
            {
                case 1:
                    return "Jan";
                case 2:
                    return "Feb";
                case 3:
                    return "Mar";
                case 4:
                    return "Apr";
                case 5:
                    return "May";
                case 6:
                    return "Jun";
                case 7:
                    return "Jul";
                case 8:
                    return "Aug";
                case 9:
                    return "Sep";
                case 10:
                    return "Oct";
                case 11:
                    return "Nov";
                case 12:
                    return "Dec";
                default:
                    return "";
            }
        }

    }
    public interface IChart
    {
        void LoadChart(UserModel user);
        string CreateCategories();
        string CreateDataSets();
        void CreateChart();
    }

    public enum ChartID
    {
        NewAppointmentsBySourceMonth,
        NewAppointmentsBySource,
        NewClientsByProductTypeMonth,
        NewClientByProductType,
        NewClientQuantityAverageContractPriceByMonth,
        NewClientQuantity,
        ContractPrice,
        ClassHeadcountByCourseIndustryMonth,
        HeadcountByCourse,
        HeadcountByIndustry,
        ActualDollarsBookedComparisonGoal,
        AverageLengthTimeActiveClientsByIndustry,
        CostOfSale,
        IndustryAveBenchmarks,
        PipelinePostTraining,
        SalesCycleTimeMain,
        ProspectingResults,
        SalesTotalsByMonthValue,
        RevenueBySourceValue,
        RevenueBySourceQty,
        ProdSoldByRepValue,
        ProdSoldByRepQty,
        ProductMarginContributionByProductByMonth,
        ProductSalesQty,
        ProductMarginValue,
        FirstSaleProductValueByProductByMonth,
        ProductFirstSalesQty,
        ProductFirstSalesValue,
        ProductSoldToCompanyByProductByMonth,
        ProductSalesByCompanyQuantity,
        ProductSalesByCompanyValue,
        ProductSoldBySalesRepByProductByMonth,
        ProductSalesBySalesRepQuantity,
        ProductSalesBySalesRepValue,
        ProductSalesActivityValue,
        ProductSalesActivityQty,
        RetentionRateByExp,
        RetentionRateByEff,
        SalesTotalsByMonthQty,
        ReturnOnTrainingInvestment,
        GapAnalysis,
        SalesValuePeriod1,
        SalesValuePeriod2,
        SalesValuePeriod3,
        SalesQtyPeriod1,
        SalesQtyPeriod2,
        SalesQtyPeriod3,
        SalesCycleTimeDrill,
        SalesCycleTimeDrill1,
        SalesCycleTimeDrill2,
        SalesCycleTimeDrill3,
        SalesCycleTimeDrill4,
        SalesCycleTimeDrill5,
        SalesCycleTimeDrill6,
        IndustryAve,
        ClosedSalesAnalysis,
        ClosedSalesAnalysisBySource,
        PipelineOpportunityAnalysis,
        PipelineOpportunityAnalysisBySource,
        BenchmarkSalesRepFranchisee,
        BenchmarkSalesRepFranchiseeQty,
        BenchmarkSalesRepFranchiseeValue,
        BenchmarkFranchiseeRegion,
        BenchmarkFranchiseeRegionQty,
        BenchmarkFranchiseeRegionValue,
        BenchmarkRegionCountry,
        BenchmarkRegionCountryQty,
        BenchmarkRegionCountryValue,
        BenchmarkCountryAll,
        BenchmarkCountryAllQty,
        BenchmarkCountryAllValue
    }

    public enum ChartTypes
    {
        Chart,
        PieChart,
        BarChart
    }

    public enum ChartSubType
    {
        NoSubType,
        ProductsSoldBySalesQuantity,
        ProductsSoldBySalesValue,
        SalesValueOppSource,
        SalesQuantityOppSource,
        SalesValueOpportunityType,
        SalesQuantityOpportunityType,
        SalesValueSalesRep,
        SalesQuantitySalesRep
    }

    public class Chart : IChart
    {
        public string Caption { get; set; }
        public string NumberSuffix { get; set; }
        public string BGColor { get; set; }
        public string BGAlpha { get; set; }
        public string CanvasBGColor { get; set; }
        public string CanvasBGAlpha { get; set; }
        public string XaxisName { get; set; }
        public string YaxisName { get; set; }
        public string DrillChartIds { get; set; }
        public string DrillBy { get; set; }
        public List<Category> Categories { get; set; }
        public List<ChartDataSet> DataSetCollection { get; set; }
        public bool DrillOverride { get; set; }

        public string SWF { get; set; }
        public string ChartXML { get; set; }
        public ChartID Id { get; set; }
        public string Hight { get; set; }
        public string Width { get; set; }
        public string PieRadius { get; set; }
        public string showLabels { get; set; }
        public string enableRotation { get; set; }
        public string showLegend { get; set; }
        public string SearchParameter { get; set; }
        public ChartSubType SubType { get; set; }
        public Chart()
        {
            this.Categories = new List<Category>();
            this.DataSetCollection = new List<ChartDataSet>();
            this.DrillOverride = true;
        }


        public void LoadChart(UserModel currentUser)
        {
            try
            {
                this.DrillChartIds = (this.DrillOverride) ? this.Id.ToString() : this.DrillChartIds;
                List<ChartParameter> chartParams = null;
                ChartDataSet lastDs = null;
                SandlerModels.DataIntegration.DataQueries queries = new SandlerModels.DataIntegration.DataQueries();

                AppointmentSourceRepository appointmentSource;
                ProductTypesRepository productTypesSource;
                IEnumerable<Tbl_ProductType> products;
                string searchForNewCompany,searchCompanies,franchiseeName, regionName, countryName;
                switch ((ChartID)Enum.Parse(typeof(ChartID), this.Id.ToString(), true))
                {
                    #region ProductsReports Logic
                    case ChartID.ProductMarginContributionByProductByMonth:
                        productTypesSource = new ProductTypesRepository();

                        if (currentUser.Role == SandlerRoles.FranchiseeOwner || currentUser.Role == SandlerRoles.FranchiseeUser)
                            products = productTypesSource.GetWithFranchiseeId(currentUser.FranchiseeID);
                        else
                            products = productTypesSource.GetAll();

                        foreach (var record in products.Where(r => r.IsActive == true).AsEnumerable())
                        {
                            this.Categories.Add(new Category { Label = record.ProductTypeName });
                        }
                        chartParams = new List<ChartParameter>();
                        chartParams.Add(new ChartParameter { Value = "-2", Color = "3300ff" });
                        chartParams.Add(new ChartParameter { Value = "-1", Color = "ff6600" });
                        chartParams.Add(new ChartParameter { Value = "0", Color = "32df00" });


                        foreach (ChartParameter parameter in chartParams)
                        {
                            try
                            {
                                IEnumerable<SandlerModels.DataIntegration.ProductTypeVM> productSalesCollection = queries.GetProductSalesByMonth(currentUser, DateTime.Now.AddMonths(int.Parse(parameter.Value)).Month);
                                if (productSalesCollection != null)
                                {
                                    var productSales = from record in productSalesCollection
                                                       select new { Category = record.ProductTypeName, Value = record.AvgPrice };

                                    this.DataSetCollection.Add(new ChartDataSet { Color = parameter.Color, SeriesName = DateTime.Now.AddMonths(int.Parse(parameter.Value)).ToString("MMM") });

                                    foreach (Category category in this.Categories)
                                    {
                                        lastDs = this.DataSetCollection.Last();
                                        lastDs.SetsCollection.Add(new SetValue { Label = category.Label, Link = ChartHelper.GeneratePageLink(lastDs.SeriesName, this.DrillChartIds) });
                                    }

                                    foreach (var record in productSales)
                                    {
                                        foreach (SetValue set in lastDs.SetsCollection)
                                        {
                                            if (set.Label == record.Category)
                                                set.Value = record.Value.ToString();
                                        }
                                    }
                                }
                            }
                            catch (Exception ex)
                            {
                                throw new Exception("Error in ChartID.ProductMarginContributionByProductByMonth:" + ex.Message);
                            }
                            //}
                        }
                        break;
                    case ChartID.FirstSaleProductValueByProductByMonth:
                        productTypesSource = new ProductTypesRepository();

                        if (currentUser.Role == SandlerRoles.FranchiseeOwner || currentUser.Role == SandlerRoles.FranchiseeUser)
                            products = productTypesSource.GetWithFranchiseeId(currentUser.FranchiseeID);
                        else
                            products = productTypesSource.GetAll();

                        foreach (var record in products.Where(r => r.IsActive == true).AsEnumerable())
                        {
                            this.Categories.Add(new Category { Label = record.ProductTypeName });
                        }
                        chartParams = new List<ChartParameter>();
                        chartParams.Add(new ChartParameter { Value = "-2", Color = "3300ff" });
                        chartParams.Add(new ChartParameter { Value = "-1", Color = "ff6600" });
                        chartParams.Add(new ChartParameter { Value = "0", Color = "32df00" });


                        foreach (ChartParameter parameter in chartParams)
                        {
                            try
                            {
                                IEnumerable<SandlerModels.DataIntegration.ProductTypeVM> productSalesCollection = queries.GetProductFirstSalesByMonth(currentUser, DateTime.Now.AddMonths(int.Parse(parameter.Value)).Month);
                                if (productSalesCollection != null)
                                {
                                    var productSales = from record in productSalesCollection
                                                       select new { Category = record.ProductTypeName, Value = record.AvgPrice };

                                    this.DataSetCollection.Add(new ChartDataSet { Color = parameter.Color, SeriesName = DateTime.Now.AddMonths(int.Parse(parameter.Value)).ToString("MMM") });

                                    foreach (Category category in this.Categories)
                                    {
                                        lastDs = this.DataSetCollection.Last();
                                        lastDs.SetsCollection.Add(new SetValue { Label = category.Label, Link = ChartHelper.GeneratePageLink(lastDs.SeriesName, this.DrillChartIds) });
                                    }

                                    foreach (var record in productSales)
                                    {
                                        foreach (SetValue set in lastDs.SetsCollection)
                                        {
                                            if (set.Label == record.Category)
                                                set.Value = record.Value.ToString();
                                        }
                                    }
                                }
                            }
                            catch (Exception ex)
                            {
                                throw new Exception("Error in ChartID.FirstSaleProductValueByProductByMonth:" + ex.Message);
                            }
                            //}
                        }
                        break;
                    case ChartID.ProductSoldToCompanyByProductByMonth:
                        string companyName;
                        try
                        {
                            companyName = new CompaniesRepository().GetById(long.Parse(SearchParameter)).COMPANYNAME;
                            this.Caption = this.Caption.Replace("Company Name", companyName);
                            productTypesSource = new ProductTypesRepository();

                            if (currentUser.Role == SandlerRoles.FranchiseeOwner || currentUser.Role == SandlerRoles.FranchiseeUser)
                                products = productTypesSource.GetWithFranchiseeId(currentUser.FranchiseeID);
                            else
                                products = productTypesSource.GetAll();

                            foreach (var record in products.Where(r => r.IsActive == true).AsEnumerable())
                            {
                                this.Categories.Add(new Category { Label = record.ProductTypeName });
                            }
                            chartParams = new List<ChartParameter>();
                            chartParams.Add(new ChartParameter { Value = "-2", Color = "3300ff" });
                            chartParams.Add(new ChartParameter { Value = "-1", Color = "ff6600" });
                            chartParams.Add(new ChartParameter { Value = "0", Color = "32df00" });


                            foreach (ChartParameter parameter in chartParams)
                            {
                                IEnumerable<SandlerModels.DataIntegration.ProductTypeVM> productSalesCollection = queries.GetProductSoldByCompanyByMonth(currentUser, DateTime.Now.AddMonths(int.Parse(parameter.Value)).Month, int.Parse(this.SearchParameter));
                                if (productSalesCollection != null)
                                {
                                    var productSales = from record in productSalesCollection
                                                       select new { Category = record.ProductTypeName, Qty = record.Count };

                                    this.DataSetCollection.Add(new ChartDataSet { Color = parameter.Color, SeriesName = DateTime.Now.AddMonths(int.Parse(parameter.Value)).ToString("MMM") });

                                    foreach (Category category in this.Categories)
                                    {
                                        lastDs = this.DataSetCollection.Last();
                                        lastDs.SetsCollection.Add(new SetValue { Label = category.Label, Link = ChartHelper.GeneratePageLink(lastDs.SeriesName, this.DrillChartIds, "SoldByCompany.aspx?searchParameter=" + this.SearchParameter + "&") });
                                    }

                                    foreach (var record in productSales)
                                    {
                                        foreach (SetValue set in lastDs.SetsCollection)
                                        {
                                            if (set.Label == record.Category)
                                                set.Value = record.Qty.ToString();
                                        }
                                    }
                                }

                            }
                        }
                        catch (Exception ex)
                        {
                            throw new Exception("Error in ChartID.ProductSoldToCompanyByProductByMonth:" + ex.Message);
                        }
                        break;
                    case ChartID.ProductSoldBySalesRepByProductByMonth:
                        this.Caption = this.Caption.Replace("Sales Rep", this.SearchParameter);
                        productTypesSource = new ProductTypesRepository();

                        if (currentUser.Role == SandlerRoles.FranchiseeOwner || currentUser.Role == SandlerRoles.FranchiseeUser)
                            products = productTypesSource.GetWithFranchiseeId(currentUser.FranchiseeID);
                        else
                            products = productTypesSource.GetAll();

                        foreach (var record in products.Where(r => r.IsActive == true).AsEnumerable())
                        {
                            this.Categories.Add(new Category { Label = record.ProductTypeName });
                        }
                        chartParams = new List<ChartParameter>();
                        chartParams.Add(new ChartParameter { Value = "-2", Color = "3300ff" });
                        chartParams.Add(new ChartParameter { Value = "-1", Color = "ff6600" });
                        chartParams.Add(new ChartParameter { Value = "0", Color = "32df00" });


                        foreach (ChartParameter parameter in chartParams)
                        {
                            try
                            {
                                IEnumerable<SandlerModels.DataIntegration.ProductTypeVM> productSalesCollection = queries.GetProductSoldBySalesRepByMonth(currentUser, DateTime.Now.AddMonths(int.Parse(parameter.Value)).Month, this.SearchParameter);
                                if (productSalesCollection != null)
                                {
                                    var productSales = from record in productSalesCollection
                                                       select new { Category = record.ProductTypeName, Qty = record.Count };

                                    this.DataSetCollection.Add(new ChartDataSet { Color = parameter.Color, SeriesName = DateTime.Now.AddMonths(int.Parse(parameter.Value)).ToString("MMM") });

                                    foreach (Category category in this.Categories)
                                    {
                                        lastDs = this.DataSetCollection.Last();
                                        lastDs.SetsCollection.Add(new SetValue { Label = category.Label, Link = ChartHelper.GeneratePageLink(lastDs.SeriesName, this.DrillChartIds, "SoldByCompanySalesRep.aspx?searchParameter=" + this.SearchParameter + "&") });
                                    }

                                    foreach (var record in productSales)
                                    {
                                        foreach (SetValue set in lastDs.SetsCollection)
                                        {
                                            if (set.Label == record.Category)
                                                set.Value = record.Qty.ToString();
                                        }
                                    }
                                }
                            }
                            catch (Exception ex)
                            {
                                throw new Exception("Error in ChartID.ProductSoldToCompanyByProductByMonth:" + ex.Message);
                            }
                            //}
                        }
                        break;
                    #endregion

                    #region ClientReports Logic
                    case ChartID.SalesTotalsByMonthQty:
                        string[] monthNames = System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat.MonthNames;

                        foreach (string monthName in monthNames) // writing out
                        {
                            if (!string.IsNullOrEmpty(monthName))
                                this.Categories.Add(new Category { Label = monthName.Substring(0, 3) });
                        }

                        chartParams = new List<ChartParameter>();
                        chartParams.Add(new ChartParameter { Value = (DateTime.Now.Year - 2).ToString(), Color = "3300ff" });
                        chartParams.Add(new ChartParameter { Value = (DateTime.Now.Year - 1).ToString(), Color = "ff6600" });
                        chartParams.Add(new ChartParameter { Value = DateTime.Now.Year.ToString(), Color = "32df00" });
                        IEnumerable<SandlerModels.DataIntegration.SalesTotalByMonthVM> salesTotalData;
                        foreach (ChartParameter parameter in chartParams)
                        {
                            try
                            {
                                salesTotalData = queries.GetSalesTotalByYear(currentUser, int.Parse(parameter.Value));
                                if (salesTotalData != null)
                                {
                                    var salesDataForAYear = from opportunity in salesTotalData
                                                            group opportunity by new { opportunity.CloseDate.Month }
                                                                into grp
                                                                select new { Count = grp.Count(), MonthName = ChartHelper.GetMonthName(grp.Key.Month) };


                                    this.DataSetCollection.Add(new ChartDataSet { Color = parameter.Color, SeriesName = parameter.Value });

                                    foreach (Category category in this.Categories)
                                    {
                                        lastDs = this.DataSetCollection.Last();
                                        lastDs.SetsCollection.Add(new SetValue { Label = category.Label });
                                    }

                                    foreach (var record in salesDataForAYear)
                                    {
                                        foreach (SetValue set in lastDs.SetsCollection)
                                        {
                                            if (set.Label == record.MonthName)
                                                set.Value = record.Count.ToString();
                                        }
                                    }
                                }
                                salesTotalData = null;
                            }
                            catch (Exception ex)
                            {
                            }
                        }
                        break;
                    case ChartID.CostOfSale:
                        IEnumerable<SandlerModels.DataIntegration.CostOfSaleVM> costofsaleData = queries.GetCostOfSale(currentUser);

                        this.DataSetCollection.Add(new ChartDataSet { Color = "0000FF", SeriesName = "Profit" });//0000FF blue
                        this.DataSetCollection.Add(new ChartDataSet { Color = "FF8C00", SeriesName = "Cost" });//FF8C00 darkorange
                        this.DataSetCollection.Add(new ChartDataSet { Color = "32CD32", SeriesName = "Revenue" });//32CD32 Lime green

                        foreach (SandlerModels.DataIntegration.CostOfSaleVM cosRecord in costofsaleData)
                        {
                            this.Categories.Add(new Category { Label = cosRecord.ProductName });
                            this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = cosRecord.Profit.ToString() });
                            this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = cosRecord.Cost.ToString() });
                            this.DataSetCollection[2].SetsCollection.Add(new SetValue { Value = cosRecord.Revenue.ToString() });

                        }

                        break;

                    #endregion

                    #region BenchmarkReports Logic
                    case ChartID.BenchmarkSalesRepFranchisee:
                        try
                        {
                            chartParams = new List<ChartParameter>();
                            chartParams.Add(new ChartParameter { Value = "-2" });
                            chartParams.Add(new ChartParameter { Value = "-1" });
                            chartParams.Add(new ChartParameter { Value = "0" });

                            franchiseeName = new FranchiseeRepository().GetById(currentUser.FranchiseeID).Name;
                            Caption = Caption.Replace("Sales Rep", SearchParameter).Replace("Name", franchiseeName);
                            IEnumerable<SandlerModels.DataIntegration.BenchMarkVM> salesRepToFranchiseeData;

                            this.DataSetCollection.Add(new ChartDataSet { Color = "4F94CD", SeriesName = "Franchisee" });//4F94CD steelblue3
                            this.DataSetCollection.Add(new ChartDataSet { Color = "FF8C00", SeriesName = "Rep" });//FF8C00 darkorange
                            Double totalValue = 0.0;
                            Double otherSalesRepsTotals = 0.0;
                            Double salesRepValue = 0.0;
                            foreach (ChartParameter parameter in chartParams)
                            {
                                salesRepToFranchiseeData = queries.GetBenchMarkSalesRepToFranchiseeByMonth(currentUser, DateTime.Now.AddMonths(int.Parse(parameter.Value)).Month);
                                totalValue = salesRepToFranchiseeData.Sum(r => r.Value);

                                this.Categories.Add(new Category { Label = DateTime.Now.AddMonths(int.Parse(parameter.Value)).ToString("MMM") });
                                otherSalesRepsTotals = (from record in salesRepToFranchiseeData.Where(r => r.KeyGroupId != SearchParameter)
                                              select record).Sum(r => r.Value);
                                this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = ((otherSalesRepsTotals / totalValue) * 100).ToString("f2"), Link = ChartHelper.GeneratePageLink(DateTime.Now.AddMonths(int.Parse(parameter.Value)).ToString("MMM"), this.DrillChartIds, "SalesRepToFranchisee.aspx?searchParameter=" + this.SearchParameter + "&") });

                                SandlerModels.DataIntegration.BenchMarkVM repRecord = salesRepToFranchiseeData.Where(r => r.KeyGroupId == SearchParameter).SingleOrDefault();
                                salesRepValue = (repRecord == null) ? 0.0 : repRecord.Value;
                                this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = ((salesRepValue / totalValue) * 100).ToString("f2"), Link = ChartHelper.GeneratePageLink(DateTime.Now.AddMonths(int.Parse(parameter.Value)).ToString("MMM"), this.DrillChartIds, "SalesRepToFranchisee.aspx?searchParameter=" + this.SearchParameter + "&") });
                            }
                        }
                        catch (Exception ex)
                        {
                            throw new Exception("Exception in ChartID.BenchmarkSalesRepFranchisee:" + ex.Message);
                        }
                        break;
                    case ChartID.BenchmarkFranchiseeRegion:
                        try
                        {
                            chartParams = new List<ChartParameter>();
                            chartParams.Add(new ChartParameter { Value = "-2" });
                            chartParams.Add(new ChartParameter { Value = "-1" });
                            chartParams.Add(new ChartParameter { Value = "0" });

                            franchiseeName = new FranchiseeRepository().GetById(int.Parse(SearchParameter)).Name;
                            regionName = new RegionRepository().GetById(currentUser.RegionID).Name;
                            Caption = Caption.Replace("Region Name", regionName).Replace("Franchisee Name", franchiseeName);
                            IEnumerable<SandlerModels.DataIntegration.BenchMarkVM> salesFranchiseeToRegionsData;

                            this.DataSetCollection.Add(new ChartDataSet { Color = "32df00", SeriesName = "Region" });
                            this.DataSetCollection.Add(new ChartDataSet { Color = "4F94CD", SeriesName = "Franchisee" });
                            
                            Double totalValue = 0.0;
                            Double otherFranchiseesTotals = 0.0;
                            Double franchiseeValue = 0.0;
                            foreach (ChartParameter parameter in chartParams)
                            {
                                salesFranchiseeToRegionsData = queries.GetBenchMarkFranchiseeToRegionsByMonth(currentUser, DateTime.Now.AddMonths(int.Parse(parameter.Value)).Month);
                                totalValue = salesFranchiseeToRegionsData.Sum(r => r.Value);

                                this.Categories.Add(new Category { Label = DateTime.Now.AddMonths(int.Parse(parameter.Value)).ToString("MMM") });
                                otherFranchiseesTotals = (from record in salesFranchiseeToRegionsData.Where(r => r.KeyGroupId != SearchParameter)
                                              select record).Sum(r => r.Value);
                                this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = ((otherFranchiseesTotals / totalValue) * 100).ToString("f2"), Link = ChartHelper.GeneratePageLink(DateTime.Now.AddMonths(int.Parse(parameter.Value)).ToString("MMM"), this.DrillChartIds, "FranchiseeToRegion.aspx?searchParameter=" + this.SearchParameter + "&") });

                                SandlerModels.DataIntegration.BenchMarkVM franchiseeRecord = salesFranchiseeToRegionsData.Where(r => r.KeyGroupId == SearchParameter).SingleOrDefault();
                                franchiseeValue = (franchiseeRecord == null) ? 0.0 : franchiseeRecord.Value;
                                this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = ((franchiseeValue / totalValue) * 100).ToString("f2"), Link = ChartHelper.GeneratePageLink(DateTime.Now.AddMonths(int.Parse(parameter.Value)).ToString("MMM"), this.DrillChartIds, "FranchiseeToRegion.aspx?searchParameter=" + this.SearchParameter + "&") });
                            }
                        }
                        catch (Exception ex)
                        {
                            throw new Exception("Exception in ChartID.BenchmarkFranchiseeRegion:" + ex.Message);
                        }
                        break;
                    case ChartID.BenchmarkRegionCountry:
                        try
                        {
                            chartParams = new List<ChartParameter>();
                            chartParams.Add(new ChartParameter { Value = "-2" });
                            chartParams.Add(new ChartParameter { Value = "-1" });
                            chartParams.Add(new ChartParameter { Value = "0" });
                                                        
                            regionName = new RegionRepository().GetById(int.Parse(SearchParameter)).Name;
                            countryName = new CountryRepository().GetById(currentUser.CountryID).Name;
                            Caption = Caption.Replace("Region Name", regionName).Replace("Country Name", countryName);
                            IEnumerable<SandlerModels.DataIntegration.BenchMarkVM> salesRegionToCountryData;

                            this.DataSetCollection.Add(new ChartDataSet { Color = "800080", SeriesName = "Country" });//800080 -- Purple
                            this.DataSetCollection.Add(new ChartDataSet { Color = "32df00", SeriesName = "Region" });

                            Double totalValue = 0.0;
                            Double otherRegionsTotal = 0.0;
                            Double regionValue = 0.0;
                            foreach (ChartParameter parameter in chartParams)
                            {
                                salesRegionToCountryData = queries.GetBenchMarkRegionToCountryByMonth(currentUser, DateTime.Now.AddMonths(int.Parse(parameter.Value)).Month);
                                totalValue = salesRegionToCountryData.Sum(r => r.Value);

                                this.Categories.Add(new Category { Label = DateTime.Now.AddMonths(int.Parse(parameter.Value)).ToString("MMM") });
                                otherRegionsTotal = (from record in salesRegionToCountryData.Where(r => r.KeyGroupId != SearchParameter)
                                                          select record).Sum(r => r.Value);
                                this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = ((otherRegionsTotal / totalValue) * 100).ToString("f2"), Link = ChartHelper.GeneratePageLink(DateTime.Now.AddMonths(int.Parse(parameter.Value)).ToString("MMM"), this.DrillChartIds, "RegionToCountry.aspx?searchParameter=" + this.SearchParameter + "&") });

                                SandlerModels.DataIntegration.BenchMarkVM regionRecord = salesRegionToCountryData.Where(r => r.KeyGroupId == SearchParameter).SingleOrDefault();
                                regionValue = (regionRecord == null) ? 0.0 : regionRecord.Value;
                                this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = ((regionValue / totalValue) * 100).ToString("f2"), Link = ChartHelper.GeneratePageLink(DateTime.Now.AddMonths(int.Parse(parameter.Value)).ToString("MMM"), this.DrillChartIds, "RegionToCountry.aspx?searchParameter=" + this.SearchParameter + "&") });
                            }
                        }
                        catch (Exception ex)
                        {
                            throw new Exception("Exception in ChartID.BenchmarkRegionCountry:" + ex.Message);
                        }
                        break;
                    case ChartID.BenchmarkCountryAll:
                        try
                        {
                            chartParams = new List<ChartParameter>();
                            chartParams.Add(new ChartParameter { Value = "-2" });
                            chartParams.Add(new ChartParameter { Value = "-1" });
                            chartParams.Add(new ChartParameter { Value = "0" });

                            countryName = new CountryRepository().GetById(int.Parse(SearchParameter)).Name;
                            Caption = Caption.Replace("Country Name", countryName);
                            IEnumerable<SandlerModels.DataIntegration.BenchMarkVM> salesCountryAllData;

                            this.DataSetCollection.Add(new ChartDataSet { Color = "800080", SeriesName = "All" });//800080 -- Purple
                            this.DataSetCollection.Add(new ChartDataSet { Color = "00CED1", SeriesName = "Country" });//00CED1 -- darkturquoise

                            Double totalValue = 0.0;
                            Double otherCountriesTotal = 0.0;
                            Double countryValue = 0.0;
                            foreach (ChartParameter parameter in chartParams)
                            {
                                salesCountryAllData = queries.GetBenchMarkCountryAllByMonth(DateTime.Now.AddMonths(int.Parse(parameter.Value)).Month);
                                totalValue = salesCountryAllData.Sum(r => r.Value);

                                this.Categories.Add(new Category { Label = DateTime.Now.AddMonths(int.Parse(parameter.Value)).ToString("MMM") });
                                otherCountriesTotal = (from record in salesCountryAllData.Where(r => r.KeyGroupId != SearchParameter)
                                                          select record).Sum(r => r.Value);
                                this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = ((otherCountriesTotal / totalValue) * 100).ToString("f2"), Link = ChartHelper.GeneratePageLink(DateTime.Now.AddMonths(int.Parse(parameter.Value)).ToString("MMM"), this.DrillChartIds, "CountryToAll.aspx?searchParameter=" + this.SearchParameter + "&") });

                                SandlerModels.DataIntegration.BenchMarkVM franchiseeRecord = salesCountryAllData.Where(r => r.KeyGroupId == SearchParameter).SingleOrDefault();
                                countryValue = (franchiseeRecord == null) ? 0.0 : franchiseeRecord.Value;
                                this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = ((countryValue / totalValue) * 100).ToString("f2"), Link = ChartHelper.GeneratePageLink(DateTime.Now.AddMonths(int.Parse(parameter.Value)).ToString("MMM"), this.DrillChartIds, "CountryToAll.aspx?searchParameter=" + this.SearchParameter + "&") });
                            }
                        }
                        catch (Exception ex)
                        {
                            throw new Exception("Exception in ChartID.BenchmarkCountryAll:" + ex.Message);
                        }
                        break;
                    #endregion

                    #region AdHocReports logic
                    case ChartID.ClosedSalesAnalysis:
                        productTypesSource = new ProductTypesRepository();
                        if (currentUser.Role == SandlerRoles.FranchiseeOwner || currentUser.Role == SandlerRoles.FranchiseeUser)
                            products = productTypesSource.GetWithFranchiseeId(currentUser.FranchiseeID);
                        else
                            products = productTypesSource.GetAll();

                        if (this.SubType == ChartSubType.SalesValueOppSource || this.SubType == ChartSubType.SalesQuantityOppSource)
                        {
                            foreach (var record in new OppSourceeRepository().GetAll())
                            {
                                this.Categories.Add(new Category { Label = record.Name });
                            }
                        }
                        else if (this.SubType == ChartSubType.SalesValueOpportunityType || this.SubType == ChartSubType.SalesQuantityOpportunityType)
                        {
                            foreach (var record in new OpprtunityTypesRepository().GetAll())
                            {
                                this.Categories.Add(new Category { Label = record.Name });
                            }
                        }
                        else
                        {
                            foreach (var record in products.Where(r => r.IsActive == true).AsEnumerable())
                            {
                                this.Categories.Add(new Category { Label = record.ProductTypeName });
                            }
                        }
                        chartParams = new List<ChartParameter>();
                        chartParams.Add(new ChartParameter { Value = "-2", Color = "8A4B08" });
                        chartParams.Add(new ChartParameter { Value = "-1", Color = "0000FF" });
                        chartParams.Add(new ChartParameter { Value = "0", Color = "ff9966" });
                        searchForNewCompany = (HttpContext.Current.Session["searchForNewCompany"] == null) ? "" : HttpContext.Current.Session["searchForNewCompany"].ToString();
                        searchCompanies = (HttpContext.Current.Session["searchCompanies"] == null) ? "" : HttpContext.Current.Session["searchCompanies"].ToString();

                        foreach (ChartParameter parameter in chartParams)
                        {
                            try
                            {
                                if (this.SubType == ChartSubType.ProductsSoldBySalesValue)
                                    this.Caption = "Sales Value By Product (By Month)";
                                if (this.SubType == ChartSubType.ProductsSoldBySalesQuantity)
                                    this.Caption = "Sales Quantity By Product (By Month)";

                                if (this.SubType == ChartSubType.SalesValueOppSource)
                                    this.Caption = "Sales Value By Opportunity Source (By Month)";
                                if (this.SubType == ChartSubType.SalesQuantityOppSource)
                                    this.Caption = "Sales Quantity By Opportunity Source (By Month)";

                                if (this.SubType == ChartSubType.SalesValueOpportunityType)
                                    this.Caption = "Sales Value By Opportunity Type (By Month)";
                                if (this.SubType == ChartSubType.SalesQuantityOpportunityType)
                                    this.Caption = "Sales Quantity By Opportunity Type (By Month)";

                                IEnumerable<SandlerModels.DataIntegration.ClosedSalesVM> productTypeVMCollection = queries.GetClosedSalesAnalysis(currentUser, DateTime.Now.AddMonths(int.Parse(parameter.Value)).Month, this.SubType.ToString(), searchForNewCompany, searchCompanies);
                                if (productTypeVMCollection != null)
                                {
                                    var clientsWithProducts = from record in productTypeVMCollection
                                                              select new { Category = record.Name, SalesValue = record.AvgPrice, SalesQuantity = record.Count };

                                    this.DataSetCollection.Add(new ChartDataSet { Color = parameter.Color, SeriesName = DateTime.Now.AddMonths(int.Parse(parameter.Value)).ToString("MMM") });

                                    string link = "";
                                    foreach (Category category in this.Categories)
                                    {
                                        lastDs = this.DataSetCollection.Last();
                                        link = string.Format("{0}?{1}={2}&{3}={4}&SubType={5}", "ClosedSalesAnalysis.aspx", ConfigurationManager.AppSettings["QueryStringParamDrillChartIDs"], this.DrillChartIds, ConfigurationManager.AppSettings["QueryStringParamDrillBy"], lastDs.SeriesName, this.SubType.ToString());
                                        //lastDs.SetsCollection.Add(new SetValue { Label = category.Label, Link = ChartHelper.GeneratePageLink(lastDs.SeriesName, this.DrillChartIds, this.SubType.ToString()) });
                                        lastDs.SetsCollection.Add(new SetValue { Label = category.Label, Link = link });
                                    }

                                    foreach (var record in clientsWithProducts)
                                    {
                                        foreach (SetValue set in lastDs.SetsCollection)
                                        {
                                            if (set.Label == record.Category)
                                            {
                                                if (this.SubType.ToString().Contains("Value"))
                                                {
                                                    set.Value = record.SalesValue.ToString();
                                                }
                                                if (this.SubType.ToString().Contains("Quantity"))
                                                {
                                                    set.Value = record.SalesQuantity.ToString();
                                                }

                                            }
                                        }
                                    }
                                }
                            }
                            catch (Exception ex)
                            {
                                throw new Exception("Error in ChartID.NewClientsByProductTypeMonth:" + ex.Message);
                            }
                        }
                        //}

                        break;
                    case ChartID.PipelineOpportunityAnalysis:
                        productTypesSource = new ProductTypesRepository();
                        if (currentUser.Role == SandlerRoles.FranchiseeOwner || currentUser.Role == SandlerRoles.FranchiseeUser)
                            products = productTypesSource.GetWithFranchiseeId(currentUser.FranchiseeID);
                        else
                            products = productTypesSource.GetAll();

                        if (this.SubType == ChartSubType.SalesValueOppSource || this.SubType == ChartSubType.SalesQuantityOppSource)
                        {
                            foreach (var record in new OppSourceeRepository().GetAll())
                            {
                                this.Categories.Add(new Category { Label = record.Name });
                            }
                        }
                        else if (this.SubType == ChartSubType.SalesValueOpportunityType || this.SubType == ChartSubType.SalesQuantityOpportunityType)
                        {
                            foreach (var record in new OpprtunityTypesRepository().GetAll())
                            {
                                this.Categories.Add(new Category { Label = record.Name });
                            }
                        }
                        else
                        {
                            foreach (var record in products.Where(r => r.IsActive == true).AsEnumerable())
                            {
                                this.Categories.Add(new Category { Label = record.ProductTypeName });
                            }
                        }
                        chartParams = new List<ChartParameter>();
                        chartParams.Add(new ChartParameter { Value = "0", Color = "8A4B08" });
                        chartParams.Add(new ChartParameter { Value = "1", Color = "0000FF" });
                        chartParams.Add(new ChartParameter { Value = "2", Color = "ff9966" });
                        searchForNewCompany = (HttpContext.Current.Session["searchForNewCompany"] == null) ? "" : HttpContext.Current.Session["searchForNewCompany"].ToString();
                        searchCompanies = (HttpContext.Current.Session["searchCompanies"] == null) ? "" : HttpContext.Current.Session["searchCompanies"].ToString();

                        foreach (ChartParameter parameter in chartParams)
                        {
                            try
                            {
                                if (this.SubType == ChartSubType.ProductsSoldBySalesValue)
                                    this.Caption = "Sales Value By Product (By Month)";
                                if (this.SubType == ChartSubType.ProductsSoldBySalesQuantity)
                                    this.Caption = "Sales Quantity By Product (By Month)";

                                if (this.SubType == ChartSubType.SalesValueOppSource)
                                    this.Caption = "Sales Value By Opportunity Source (By Month)";
                                if (this.SubType == ChartSubType.SalesQuantityOppSource)
                                    this.Caption = "Sales Quantity By Opportunity Source (By Month)";

                                if (this.SubType == ChartSubType.SalesValueOpportunityType)
                                    this.Caption = "Sales Value By Opportunity Type (By Month)";
                                if (this.SubType == ChartSubType.SalesQuantityOpportunityType)
                                    this.Caption = "Sales Quantity By Opportunity Type (By Month)";

                                IEnumerable<SandlerModels.DataIntegration.PipelineOppAnalysisVM> productTypeVMCollection = queries.GetPipelineOpportunityAnalysis(currentUser, DateTime.Now.AddMonths(int.Parse(parameter.Value)).Month, this.SubType.ToString(), searchForNewCompany, searchCompanies);
                                if (productTypeVMCollection != null)
                                {
                                    var clientsWithProducts = from record in productTypeVMCollection
                                                              select new { Category = record.Name, SalesValue = record.AvgPrice, SalesQuantity = record.Count };

                                    this.DataSetCollection.Add(new ChartDataSet { Color = parameter.Color, SeriesName = DateTime.Now.AddMonths(int.Parse(parameter.Value)).ToString("MMM") });

                                    string link = "";
                                    foreach (Category category in this.Categories)
                                    {
                                        lastDs = this.DataSetCollection.Last();
                                        link = string.Format("{0}?{1}={2}&{3}={4}&SubType={5}", "PipelineOppAnalysis.aspx", ConfigurationManager.AppSettings["QueryStringParamDrillChartIDs"], this.DrillChartIds, ConfigurationManager.AppSettings["QueryStringParamDrillBy"], lastDs.SeriesName, this.SubType.ToString());
                                        lastDs.SetsCollection.Add(new SetValue { Label = category.Label, Link = link });
                                    }

                                    foreach (var record in clientsWithProducts)
                                    {
                                        foreach (SetValue set in lastDs.SetsCollection)
                                        {
                                            if (set.Label == record.Category)
                                            {
                                                if (this.SubType.ToString().Contains("Value"))
                                                {
                                                    set.Value = record.SalesValue.ToString();
                                                }
                                                if (this.SubType.ToString().Contains("Quantity"))
                                                {
                                                    set.Value = record.SalesQuantity.ToString();
                                                }

                                            }
                                        }
                                    }
                                }
                            }
                            catch (Exception ex)
                            {
                                throw new Exception("Error in ChartID.PipelineOpportunityAnalysis:" + ex.Message);
                            }
                        }
                        //}

                        break;
                    #endregion

                    #region FranchiseeReports Logic

                    case ChartID.NewAppointmentsBySourceMonth:
                        appointmentSource = new AppointmentSourceRepository();
                        foreach (var record in appointmentSource.GetAll().Where(r => r.IsActive == true).AsEnumerable())
                        {
                            this.Categories.Add(new Category { Label = record.ApptSourceName });
                        }

                        chartParams = new List<ChartParameter>();
                        chartParams.Add(new ChartParameter { Value = "-2", Color = "3300ff" });
                        chartParams.Add(new ChartParameter { Value = "-1", Color = "ff6600" });
                        chartParams.Add(new ChartParameter { Value = "0", Color = "32df00" });


                        foreach (ChartParameter parameter in chartParams)
                        {
                            try
                            {
                                IEnumerable<SandlerModels.DataIntegration.AppointmentSourceVM> appointmentSourceVMcollection = queries.GetNewAppointmentSource(currentUser, DateTime.Now.AddMonths(int.Parse(parameter.Value)).Month);
                                if (appointmentSourceVMcollection != null)
                                {
                                    var newAppointments = from record in appointmentSourceVMcollection
                                                          select new { Category = record.SourceName, Count = record.Count };

                                    this.DataSetCollection.Add(new ChartDataSet { Color = parameter.Color, SeriesName = DateTime.Now.AddMonths(int.Parse(parameter.Value)).ToString("MMM") });

                                    foreach (Category category in this.Categories)
                                    {
                                        lastDs = this.DataSetCollection.Last();
                                        lastDs.SetsCollection.Add(new SetValue { Label = category.Label, Link = (currentUser.Role == SandlerRoles.Client) ? "" : ChartHelper.GeneratePageLink(lastDs.SeriesName, this.DrillChartIds) });
                                    }

                                    foreach (var record in newAppointments)
                                    {
                                        foreach (SetValue set in lastDs.SetsCollection)
                                        {
                                            if (set.Label == record.Category)
                                                set.Value = record.Count.ToString();
                                        }
                                    }
                                }
                            }
                            catch (Exception ex)
                            {
                                throw new Exception("Error in ChartID.NewAppointmentsBySourceMonth:" + ex.Message);
                            }
                            //}
                        }
                        break;

                    case ChartID.NewClientsByProductTypeMonth:

                        productTypesSource = new ProductTypesRepository();

                        if (currentUser.Role == SandlerRoles.FranchiseeOwner || currentUser.Role == SandlerRoles.FranchiseeUser)
                            products = productTypesSource.GetWithFranchiseeId(currentUser.FranchiseeID);
                        else
                            products = productTypesSource.GetAll();
                        foreach (var record in products.Where(r => r.IsActive == true).AsEnumerable())
                        {
                            this.Categories.Add(new Category { Label = record.ProductTypeName });
                        }

                        chartParams = new List<ChartParameter>();
                        chartParams.Add(new ChartParameter { Value = "-2", Color = "8A4B08" });
                        chartParams.Add(new ChartParameter { Value = "-1", Color = "0000FF" });
                        chartParams.Add(new ChartParameter { Value = "0", Color = "ff9966" });

                        foreach (ChartParameter parameter in chartParams)
                        {
                            try
                            {
                                IEnumerable<SandlerModels.DataIntegration.ProductTypeVM> productTypeVMCollection = queries.GetNewClientsByProductType(currentUser, DateTime.Now.AddMonths(int.Parse(parameter.Value)).Month);
                                if (productTypeVMCollection != null)
                                {
                                    var newClientsByProducts = from record in productTypeVMCollection
                                                               select new { Category = record.ProductTypeName, Count = record.Count };

                                    this.DataSetCollection.Add(new ChartDataSet { Color = parameter.Color, SeriesName = DateTime.Now.AddMonths(int.Parse(parameter.Value)).ToString("MMM") });

                                    foreach (Category category in this.Categories)
                                    {
                                        lastDs = this.DataSetCollection.Last();
                                        lastDs.SetsCollection.Add(new SetValue { Label = category.Label, Link = (currentUser.Role == SandlerRoles.Client) ? "" : ChartHelper.GeneratePageLink(lastDs.SeriesName, this.DrillChartIds) });
                                    }

                                    foreach (var record in newClientsByProducts)
                                    {
                                        foreach (SetValue set in lastDs.SetsCollection)
                                        {
                                            if (set.Label == record.Category)
                                                set.Value = record.Count.ToString();
                                        }
                                    }
                                }
                            }
                            catch (Exception ex)
                            {
                                throw new Exception("Error in ChartID.NewClientsByProductTypeMonth:" + ex.Message);
                            }
                        }
                        //}

                        break;
                    case ChartID.NewClientQuantityAverageContractPriceByMonth:
                        this.Categories.Add(new Category { Label = DateTime.Now.AddMonths(-2).ToString("MMM") });
                        this.Categories.Add(new Category { Label = DateTime.Now.AddMonths(-1).ToString("MMM") });
                        this.Categories.Add(new Category { Label = DateTime.Now.AddMonths(0).ToString("MMM") });

                        this.DataSetCollection.Add(new ChartDataSet { Color = "0000FF", SeriesName = "New Clients" });
                        this.DataSetCollection.Add(new ChartDataSet { Color = "ff6600", SeriesName = "Ave Contract Price" });


                        foreach (Category catagory in this.Categories)
                        {
                            try
                            {
                                int newClients = queries.GetNewClientCount(currentUser, DateTime.ParseExact(catagory.Label, "MMM", null).Month);
                                long aveContractPrice = queries.GetAveContractPrice(currentUser, DateTime.ParseExact(catagory.Label, "MMM", null).Month);

                                if (newClients > 0 && aveContractPrice > 0)
                                {
                                    this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = newClients.ToString(), Link = (currentUser.Role == SandlerRoles.Client) ? "" : ChartHelper.GeneratePageLink(catagory.Label, this.DrillChartIds) });
                                    this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = (aveContractPrice / 5).ToString(), Link = (currentUser.Role == SandlerRoles.Client) ? "" : ChartHelper.GeneratePageLink(catagory.Label, this.DrillChartIds) });
                                }
                            }
                            catch (System.InvalidOperationException)
                            {

                            }

                        }
                        break;
                    case ChartID.ClassHeadcountByCourseIndustryMonth:
                        this.Categories.Add(new Category { Label = DateTime.Now.AddMonths(-2).ToString("MMM") });
                        this.Categories.Add(new Category { Label = DateTime.Now.AddMonths(-1).ToString("MMM") });
                        this.Categories.Add(new Category { Label = DateTime.Now.AddMonths(0).ToString("MMM") });


                        this.DataSetCollection.Add(new ChartDataSet { Color = "ff6600", SeriesName = "Course" });
                        this.DataSetCollection.Add(new ChartDataSet { Color = "32df00", SeriesName = "Industry" });

                        foreach (Category catagory in this.Categories)
                        {
                            try
                            {
                                int classHeadCountsCourse = queries.GetClassHeadCountsCourse(currentUser, DateTime.ParseExact(catagory.Label, "MMM", null).Month);

                                int classHeadCountsIndustry = queries.GetClassHeadCountsIndustry(currentUser, DateTime.ParseExact(catagory.Label, "MMM", null).Month);

                                if (classHeadCountsCourse > 0 && classHeadCountsIndustry > 0)
                                {
                                    this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = classHeadCountsCourse.ToString(), Link = (currentUser.Role == SandlerRoles.Client) ? "" : ChartHelper.GeneratePageLink(catagory.Label, this.DrillChartIds) });
                                    this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = classHeadCountsIndustry.ToString(), Link = (currentUser.Role == SandlerRoles.Client) ? "" : ChartHelper.GeneratePageLink(catagory.Label, this.DrillChartIds) });
                                }
                            }
                            catch (System.InvalidOperationException)
                            {

                            }

                        }
                        //}
                        break;

                    case ChartID.ActualDollarsBookedComparisonGoal:
                        this.Categories.Add(new Category { Label = DateTime.Now.AddMonths(-1).ToString("MMM") });
                        this.Categories.Add(new Category { Label = DateTime.Now.AddMonths(0).ToString("MMM") });
                        this.Categories.Add(new Category { Label = DateTime.Now.AddMonths(1).ToString("MMM") });

                        this.DataSetCollection.Add(new ChartDataSet { Color = "0066ff", SeriesName = "$$Booked" });
                        this.DataSetCollection.Add(new ChartDataSet { Color = "ffff99", SeriesName = "% of Goal" });



                        foreach (Category catagory in this.Categories)
                        {
                            try
                            {
                                long actualDollarsBooked = queries.GetActualDollarsBooked(currentUser, DateTime.ParseExact(catagory.Label, "MMM", null).Month);

                                long goalOfDollarsBooked = queries.GetGoalOfDollarsBooked(currentUser, DateTime.ParseExact(catagory.Label, "MMM", null).Month);

                                //if (actualDollarsBooked > 0 && goalOfDollarsBooked > 0)
                                //{
                                this.DataSetCollection[0].SetsCollection.Add(new SetValue { Label = catagory.Label, Value = actualDollarsBooked.ToString(), Link = (currentUser.Role == SandlerRoles.Client) ? "" : ChartHelper.GeneratePageLink("", this.DrillChartIds) });
                                this.DataSetCollection[1].SetsCollection.Add(new SetValue { Label = catagory.Label, Value = ((Convert.ToDouble(actualDollarsBooked) / Convert.ToDouble(goalOfDollarsBooked)) * 100).ToString("#.##"), Link = (currentUser.Role == SandlerRoles.Client) ? "" : ChartHelper.GeneratePageLink("", this.DrillChartIds) });
                                //}
                            }
                            catch (System.InvalidOperationException)
                            {

                            }

                        }
                        break;
                    #endregion

                    case ChartID.GapAnalysis:
                        this.Categories.Add(new Category { Label = "Sales Cycle Time" });
                        this.Categories.Add(new Category { Label = "Sales Efficiency" });
                        this.Categories.Add(new Category { Label = "Sales Qualification" });
                        this.Categories.Add(new Category { Label = "Sales Rep Retention" });
                        this.Categories.Add(new Category { Label = "Quota Achievement" });
                        this.Categories.Add(new Category { Label = "Sandler Trng Benefits" });

                        GATracker gaRecord = null;
                        GapAnalysisRepository gaData = new GapAnalysisRepository();

                        this.DataSetCollection.Add(new ChartDataSet { Color = "0000FF", SeriesName = "As-Is" });
                        this.DataSetCollection.Add(new ChartDataSet { Color = "8A4B08", SeriesName = "To-Be" });

                        gaRecord = gaData.GetGATrackerById(int.Parse(SearchParameter));
                        if (gaRecord != null)
                        {
                            this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = gaRecord.AsIsSalesCycleTimePercentVal.Value.ToString(), Link = "GapAnalysisCreate.aspx" });
                            this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = gaRecord.AsIsSalesEfficiencyPercentVal.Value.ToString(), Link = "GapAnalysisCreate.aspx" });
                            this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = gaRecord.AsIsSalesQualificationPercentVal.ToString(), Link = "GapAnalysisCreate.aspx" });
                            this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = gaRecord.AsIsSalesRepRetentionPercentVal.ToString(), Link = "GapAnalysisCreate.aspx" });
                            this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = gaRecord.AsIsQuotaAchievementPercentVal.ToString(), Link = "GapAnalysisCreate.aspx" });
                            this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = gaRecord.AsIsTrngBenefitsPercentVal.ToString(), Link = "GapAnalysisCreate.aspx" });

                            this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = gaRecord.ToBeSalesCycleTimePercentVal.ToString(), Link = "GapAnalysisCreate.aspx" });
                            this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = gaRecord.ToBeSalesEfficiencyPercentVal.ToString(), Link = "GapAnalysisCreate.aspx" });
                            this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = gaRecord.ToBeSalesQualificationPercentVal.ToString(), Link = "GapAnalysisCreate.aspx" });
                            this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = gaRecord.ToBeSalesRepRetentionPercentVal.ToString(), Link = "GapAnalysisCreate.aspx" });
                            this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = gaRecord.ToBeQuotaAchievementPercentVal.ToString(), Link = "GapAnalysisCreate.aspx" });
                            this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = gaRecord.ToBeTrngBenefitsPercentVal.ToString(), Link = "GapAnalysisCreate.aspx" });
                        }
                        break;
                    default:
                        break;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public string CreateCategories()
        {
            StringBuilder categoriesXML = null;
            try
            {
                categoriesXML = new StringBuilder("<categories>");
                foreach (Category category in this.Categories)
                {
                    categoriesXML.Append("<category");
                    categoriesXML.Append((!(string.IsNullOrEmpty(category.Label)) ? " label='" + category.Label + "'" : ""));
                    categoriesXML.Append("/>");
                }
                categoriesXML.Append("</categories>");
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return categoriesXML.ToString();
        }

        public string CreateDataSets()
        {
            StringBuilder datasetXML = null;
            try
            {
                datasetXML = new StringBuilder();

                foreach (ChartDataSet ds in this.DataSetCollection)
                {
                    datasetXML.Append("<dataset" + (!(string.IsNullOrEmpty(ds.SeriesName)) ? " seriesName='" + ds.SeriesName + "'" : ""));
                    datasetXML.Append((!(string.IsNullOrEmpty(ds.Color)) ? " color='" + ds.Color + "'" : ""));
                    datasetXML.Append(">");

                    foreach (SetValue set in ds.SetsCollection)
                    {
                        datasetXML.Append("<set");
                        datasetXML.Append((!(string.IsNullOrEmpty(set.Value)) ? " value='" + set.Value + "'" : ""));
                        datasetXML.Append((!(string.IsNullOrEmpty(set.Color)) ? " color='" + set.Color + "'" : ""));
                        datasetXML.Append((!(string.IsNullOrEmpty(set.Link)) ? " link='" + set.Link + "'" : ""));
                        datasetXML.Append("/>");
                    }
                    datasetXML.Append("</dataset>");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return datasetXML.ToString();
        }

        public void CreateChart()
        {
            StringBuilder chartXML = null;
            try
            {
                chartXML = new StringBuilder("<chart" + (!(string.IsNullOrEmpty(this.Caption)) ? " caption='" + this.Caption + "'" : ""));
                chartXML.Append((!(string.IsNullOrEmpty(this.BGColor)) ? " bgColor='" + this.BGColor + "'" : ""));
                chartXML.Append((!(string.IsNullOrEmpty(this.BGAlpha)) ? " bgAlpha='" + this.BGAlpha + "'" : ""));
                chartXML.Append((!(string.IsNullOrEmpty(this.CanvasBGColor)) ? " canvasBgColor='" + this.CanvasBGColor + "'" : ""));
                chartXML.Append((!(string.IsNullOrEmpty(this.CanvasBGAlpha)) ? " canvasBgAlpha='" + this.CanvasBGAlpha + "'" : ""));
                chartXML.Append((!(string.IsNullOrEmpty(this.XaxisName)) ? " xAxisName='" + this.XaxisName + "'" : ""));
                chartXML.Append((!(string.IsNullOrEmpty(this.YaxisName)) ? " yAxisName='" + this.YaxisName + "'" : ""));
                chartXML.Append((!(string.IsNullOrEmpty(this.NumberSuffix)) ? " numberSuffix='" + this.NumberSuffix + "'" : ""));
                chartXML.Append(">");

                chartXML.Append(CreateCategories());

                chartXML.Append(CreateDataSets());

                chartXML.Append("</chart>");
            }
            catch (Exception ex)
            {
                throw ex;
            }
            ChartXML = chartXML.ToString();
        }

    }

    public class BarChart : Chart
    {
        public List<SetValue> SetsCollection;

        public BarChart()
            : base()
        {
            SetsCollection = new List<SetValue>();
        }

        public new void LoadChart(UserModel currentUser)
        {
            try
            {
                this.DrillChartIds = (this.DrillOverride) ? this.Id.ToString() : this.DrillChartIds;
                int colorIndex = 0;
                //UserEntities userEntities;
                SandlerModels.DataIntegration.DataQueries queries = new SandlerModels.DataIntegration.DataQueries();
                switch (this.Id)
                {
                    case ChartID.ReturnOnTrainingInvestment:
                        int ROIAdjustmentFactor = int.Parse(ConfigurationManager.AppSettings["ROIAdjustmentFactor"]);

                        GapAnalysisRepository reposiroty = new GapAnalysisRepository();
                        GATracker gaTracker = reposiroty.GetGATrackerById(int.Parse(SearchParameter));

                        double year1ExpVal, year2ExpVal, year3ExpVal, year1AF, year2AF, year3AF;

                        year1ExpVal = Convert.ToDouble(gaTracker.Year1.Value);
                        year2ExpVal = Convert.ToDouble(gaTracker.Year2.Value);
                        year3ExpVal = Convert.ToDouble(gaTracker.Year3.Value);

                        year1AF = GetFactorValue(year1ExpVal);
                        year2AF = GetFactorValue(year2ExpVal);
                        year3AF = GetFactorValue(year3ExpVal);

                        double scVal, seVal, sqVal, tcsVal, qaVal, ebgVal;
                        double year1Savings, year1ROIBalance, year2Savings, year2ROIBalance, year3Savings, year3ROIBalance;
                        string year1ROIPercent, year2ROIPercent, year3ROIPercent;

                        //Year1 Calculations
                        scVal = (year1ExpVal * (gaTracker.ToBeSalesCycleTimePercentVal.Value - gaTracker.AsIsSalesCycleTimePercentVal.Value) * ROIAdjustmentFactor * year1AF) / 10000;
                        seVal = (year1ExpVal * (gaTracker.ToBeSalesEfficiencyPercentVal.Value - gaTracker.AsIsSalesEfficiencyPercentVal.Value) * ROIAdjustmentFactor * year1AF) / 10000;
                        sqVal = (year1ExpVal * (gaTracker.ToBeSalesQualificationPercentVal.Value - gaTracker.AsIsSalesQualificationPercentVal.Value) * ROIAdjustmentFactor * year1AF) / 10000;
                        tcsVal = (year1ExpVal * (gaTracker.ToBeSalesRepRetentionPercentVal.Value - gaTracker.AsIsSalesRepRetentionPercentVal.Value) * ROIAdjustmentFactor * year1AF) / 10000;
                        qaVal = (year1ExpVal * (gaTracker.ToBeQuotaAchievementPercentVal.Value - gaTracker.AsIsQuotaAchievementPercentVal.Value) * ROIAdjustmentFactor * year1AF) / 10000;
                        ebgVal = (year1ExpVal * (gaTracker.ToBeTrngBenefitsPercentVal.Value - gaTracker.AsIsTrngBenefitsPercentVal.Value) * ROIAdjustmentFactor * year1AF) / 10000;
                        year1Savings = scVal + seVal + sqVal + tcsVal + qaVal + ebgVal;
                        year1ROIBalance = year1Savings - year1ExpVal;
                        year1ROIPercent = ((year1Savings / year1ExpVal * 100)).ToString();

                        //Year2 Calculations
                        scVal = ((year2ExpVal * scVal * (1 + Convert.ToDouble(gaTracker.DesiredAnnualImptSalesCycleTime) / 100)) / year1ExpVal) * year2AF;
                        seVal = ((year2ExpVal * seVal * (1 + Convert.ToDouble(gaTracker.DesiredAnnualImptSalesEfficiency) / 100)) / year1ExpVal) * year2AF;
                        sqVal = ((year2ExpVal * sqVal * (1 + Convert.ToDouble(gaTracker.DesiredAnnualImptSalesQualfn) / 100)) / year1ExpVal) * year2AF;
                        tcsVal = ((year2ExpVal * tcsVal * (1 + Convert.ToDouble(gaTracker.DesiredAnnualImptSalesRepRetention) / 100)) / year1ExpVal) * year2AF;
                        qaVal = ((year2ExpVal * qaVal * (1 + Convert.ToDouble(gaTracker.DesiredAnnualImptQuotaAcht) / 100)) / year1ExpVal) * year2AF;
                        ebgVal = ((year2ExpVal * ebgVal * (1 + Convert.ToDouble(gaTracker.DesiredAnnualImptTrngBenefits) / 100)) / year1ExpVal) * year2AF;
                        year2Savings = scVal + seVal + sqVal + tcsVal + qaVal + ebgVal;
                        year2ROIBalance = year2Savings - year2ExpVal;
                        year2ROIPercent = ((year2Savings / year2ExpVal * 100)).ToString();

                        //Year3 Calculations
                        scVal = ((year3ExpVal * scVal * (1 + Convert.ToDouble(gaTracker.DesiredAnnualImptSalesCycleTime) / 100)) / year2ExpVal) * year3AF;
                        seVal = ((year3ExpVal * seVal * (1 + Convert.ToDouble(gaTracker.DesiredAnnualImptSalesEfficiency) / 100)) / year2ExpVal) * year3AF;
                        sqVal = ((year3ExpVal * sqVal * (1 + Convert.ToDouble(gaTracker.DesiredAnnualImptSalesQualfn) / 100)) / year2ExpVal) * year3AF;
                        tcsVal = ((year3ExpVal * tcsVal * (1 + Convert.ToDouble(gaTracker.DesiredAnnualImptSalesRepRetention) / 100)) / year2ExpVal) * year3AF;
                        qaVal = ((year3ExpVal * qaVal * (1 + Convert.ToDouble(gaTracker.DesiredAnnualImptQuotaAcht) / 100)) / year2ExpVal) * year3AF;
                        ebgVal = ((year3ExpVal * ebgVal * (1 + Convert.ToDouble(gaTracker.DesiredAnnualImptTrngBenefits) / 100)) / year2ExpVal) * year3AF;
                        year3Savings = scVal + seVal + sqVal + tcsVal + qaVal + ebgVal;
                        year3ROIBalance = year3Savings - year3ExpVal;
                        year3ROIPercent = ((year3Savings / year3ExpVal * 100)).ToString();

                        this.SetsCollection.Add(new SetValue { Color = "#008000", Label = "Year1", Value = year1ROIPercent });
                        this.SetsCollection.Add(new SetValue { Color = "#008000", Label = "Year2", Value = year2ROIPercent });
                        this.SetsCollection.Add(new SetValue { Color = "#008000", Label = "Year3", Value = year3ROIPercent });


                        break;

                    #region FranchiseeReports Logic
                    case ChartID.AverageLengthTimeActiveClientsByIndustry:
                        try
                        {

                            var AverageLengthTimeActiveClientsByIndustry = queries.AverageLengthTimeActiveClientsByIndustry(currentUser);

                            IndustryTypeRepository industrySource = new IndustryTypeRepository();

                            foreach (var record in industrySource.GetAll().Where(r => r.IsActive == true).AsEnumerable())
                            {
                                try
                                {
                                    foreach (var d in AverageLengthTimeActiveClientsByIndustry)
                                    {
                                        if (record.IndustryTypeName == d.IndustryTypeName)
                                        {
                                            this.SetsCollection.Add(new SetValue { Color = record.ColorCode, Label = record.IndustryTypeName, Value = d.Count.ToString("#"), Link = (currentUser.Role == SandlerRoles.Client) ? "" : ChartHelper.GeneratePageLink("", this.DrillChartIds) });
                                            break;
                                        }
                                    }
                                }
                                catch (System.InvalidOperationException)
                                {

                                }
                                colorIndex++;
                            }
                        }

                        catch (Exception ex)
                        {
                            throw new Exception("Error in ChartID.AverageLengthTimeActiveClientsByIndustry:" + ex.Message);
                        }
                        break;
                    #endregion

                    default:
                        break;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public double GetFactorValue(double valueToCompare)
        {
            string[] valComparaor = null;
            double lowerBoundVal, upperBoundVal, factor;
            factor = 0;
            TrngExpenditureRepository trgExpRepository = new TrngExpenditureRepository();
            IEnumerable<TBL_Trng_Expenditure> expFactors = trgExpRepository.GetAll();


            foreach (TBL_Trng_Expenditure expFactor in expFactors)
            {
                valComparaor = expFactor.Range.Split(new char[] { '-' });

                if (valComparaor.Length > 1)
                {
                    lowerBoundVal = Convert.ToDouble(valComparaor.GetValue(0));
                    upperBoundVal = Convert.ToDouble(valComparaor.GetValue(1));
                    if (valueToCompare >= lowerBoundVal && valueToCompare <= upperBoundVal)
                    {
                        factor = Convert.ToDouble(expFactor.Factor);
                        break;
                    }
                }
                else
                {
                    lowerBoundVal = Convert.ToDouble(valComparaor.GetValue(0));
                    if (valueToCompare >= lowerBoundVal)
                    {
                        factor = Convert.ToDouble(expFactor.Factor);
                        break;
                    }
                }
            }
            return factor;
        }

        public new string CreateDataSets()
        {
            StringBuilder datasetXML = null;
            try
            {
                datasetXML = new StringBuilder();

                foreach (SetValue set in SetsCollection)
                {
                    datasetXML.Append("<set");
                    datasetXML.Append((!(string.IsNullOrEmpty(set.Label)) ? " label='" + set.Label + "'" : ""));
                    datasetXML.Append((!(string.IsNullOrEmpty(set.Value)) ? " value='" + set.Value + "'" : ""));
                    datasetXML.Append((!(string.IsNullOrEmpty(set.Color)) ? " color='" + set.Color + "'" : ""));
                    datasetXML.Append((!(string.IsNullOrEmpty(set.Link)) ? " link='" + set.Link + "'" : ""));
                    datasetXML.Append("/>");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return datasetXML.ToString();
        }

        public new void CreateChart()
        {
            StringBuilder chartXML = null;
            try
            {
                chartXML = new StringBuilder("<chart" + (!(string.IsNullOrEmpty(this.Caption)) ? " caption='" + this.Caption + "'" : ""));
                chartXML.Append((!(string.IsNullOrEmpty(this.BGColor)) ? " bgColor='" + this.BGColor + "'" : ""));
                chartXML.Append((!(string.IsNullOrEmpty(this.BGAlpha)) ? " bgAlpha='" + this.BGAlpha + "'" : ""));
                chartXML.Append((!(string.IsNullOrEmpty(this.CanvasBGColor)) ? " canvasBgColor='" + this.CanvasBGColor + "'" : ""));
                chartXML.Append((!(string.IsNullOrEmpty(this.CanvasBGAlpha)) ? " canvasBgAlpha='" + this.CanvasBGAlpha + "'" : ""));
                chartXML.Append((!(string.IsNullOrEmpty(this.XaxisName)) ? " xAxisName='" + this.XaxisName + "'" : ""));
                chartXML.Append((!(string.IsNullOrEmpty(this.YaxisName)) ? " yAxisName='" + this.YaxisName + "'" : ""));
                chartXML.Append(">");

                chartXML.Append(CreateDataSets());

                chartXML.Append("</chart>");
            }
            catch (Exception ex)
            {
                throw ex;
            }
            ChartXML = chartXML.ToString();
        }
    }

    public class PieChart : BarChart
    {
        public PieChart()
            : base()
        {
            SetsCollection = new List<SetValue>();
        }
        public new string CreateDataSets()
        {
            StringBuilder datasetXML = null;
            try
            {
                datasetXML = new StringBuilder();

                foreach (SetValue set in SetsCollection)
                {
                    datasetXML.Append("<set");
                    datasetXML.Append((!(string.IsNullOrEmpty(set.Label)) ? " label='" + set.Label + "'" : ""));
                    datasetXML.Append((!(string.IsNullOrEmpty(set.Value)) ? " value='" + set.Value + "'" : ""));
                    datasetXML.Append((!(string.IsNullOrEmpty(set.Color)) ? " color='" + set.Color + "'" : ""));
                    datasetXML.Append((!(string.IsNullOrEmpty(set.Link)) ? " link='" + set.Link + "'" : ""));
                    datasetXML.Append("/>");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return datasetXML.ToString();
        }
        public new void LoadChart(UserModel currentUser)
        {
            try
            {
                this.DrillChartIds = (this.DrillOverride) ? this.Id.ToString() : this.DrillChartIds;
                int colorIndex = 0;
                SandlerModels.DataIntegration.DataQueries queries = new SandlerModels.DataIntegration.DataQueries();
                AppointmentSourceRepository appointmentSource = null;
                ProductTypesRepository productTypesSource = null;
                string[] colors = null;
                string searchForNewCompany, searchCompanies;
                var totalPrice = 0.0;
                var totalCounts = 0.0;
                IEnumerable<Tbl_ProductType> products;
                string companyName = "";
                string franchiseeName = "";
                string regionName = "";
                string countryName = "";
                switch (this.Id)
                {
                    case ChartID.SalesCycleTimeMain:
                        IEnumerable<SandlerModels.DataIntegration.SalesCycleTimePortfolioVM> salesCyclePortfolio = queries.GetSalesCycleTimePortfolio(currentUser);
                        int totalCount = salesCyclePortfolio.Count();
                        if (salesCyclePortfolio != null)
                        {
                            var salesCycleData = from opportunity in salesCyclePortfolio
                                                 group opportunity by new { opportunity.MultipleOfSixVal }
                                                     into grp
                                                     select new { Legend = ChartHelper.GetSCTimeLegend(grp.Key.MultipleOfSixVal), Count = grp.Count() * 100 / totalCount };

                            colors = new string[] { "CC6600", "9900CC", "FF3300", "0099FF", "00CC66", "FFFF00", "CC6600", "9900CC" };

                            foreach (var record in salesCycleData)
                            {
                                this.SetsCollection.Add(new SetValue { Color = colors.GetValue(colorIndex).ToString(), Label = record.Legend, Value = record.Count.ToString() });
                                colorIndex++;
                            }

                        }
                        break;

                    #region AdHocReports logic
                    case ChartID.PipelineOpportunityAnalysisBySource:
                        if (this.SubType == ChartSubType.ProductsSoldBySalesValue)
                            this.Caption = "Sales Value Percentage By Product";
                        if (this.SubType == ChartSubType.ProductsSoldBySalesQuantity)
                            this.Caption = "Sales Quantity Percentage By Product";

                        if (this.SubType == ChartSubType.SalesValueOppSource)
                            this.Caption = "Sales Value Percentage By Opportunity Source";
                        if (this.SubType == ChartSubType.SalesQuantityOppSource)
                            this.Caption = "Sales Quantity Percentage By Opportunity Source";


                        if (this.SubType == ChartSubType.SalesValueOpportunityType)
                            this.Caption = "Sales Value Percentage By Opportunity Source";
                        if (this.SubType == ChartSubType.SalesQuantityOpportunityType)
                            this.Caption = "Sales Quantity Percentage By Opportunity Source";

                        searchForNewCompany = (HttpContext.Current.Session["searchForNewCompany"] == null) ? "" : HttpContext.Current.Session["searchForNewCompany"].ToString();
                        searchCompanies = (HttpContext.Current.Session["searchCompanies"] == null) ? "" : HttpContext.Current.Session["searchCompanies"].ToString();

                        IEnumerable<SandlerModels.DataIntegration.PipelineOppAnalysisVM> pipelineSalesVMCollection = queries.GetPipelineOpportunityAnalysis(currentUser, DateTime.ParseExact(this.DrillBy, "MMM", null).Month, this.SubType.ToString(), searchForNewCompany, searchCompanies);
                        colors = new string[] { "CC6600", "9900CC", "FF3300", "0099FF", "00CC66", "FFFF00", "CC6600", "9900CC" };
                        totalPrice = pipelineSalesVMCollection.Sum(r => r.AvgPrice);
                        totalCounts = pipelineSalesVMCollection.Sum(r => r.Count);
                        productTypesSource = new ProductTypesRepository();

                        if (currentUser.Role == SandlerRoles.FranchiseeOwner || currentUser.Role == SandlerRoles.FranchiseeUser)
                            products = productTypesSource.GetWithFranchiseeId(currentUser.FranchiseeID);
                        else
                            products = productTypesSource.GetAll().Where(r => r.IsActive == true);

                        if (this.SubType == ChartSubType.SalesValueOppSource || this.SubType == ChartSubType.SalesQuantityOppSource)
                        {
                            foreach (var record in new OpprtunitySourceRepository().GetAll())
                            {
                                try
                                {
                                    if (pipelineSalesVMCollection.Single(r => r.Name == record.Name) != null)
                                    {
                                        if (this.SubType.ToString().Contains("Value"))
                                            this.SetsCollection.Add(new SetValue { Color = colors.GetValue(colorIndex).ToString(), Label = record.Name, Value = (((pipelineSalesVMCollection.Single(r => r.Name == record.Name).AvgPrice) / totalPrice) * 100).ToString() });
                                        else
                                        {
                                            this.SetsCollection.Add(new SetValue { Color = colors.GetValue(colorIndex).ToString(), Label = record.Name, Value = ((pipelineSalesVMCollection.Single(r => r.Name == record.Name).Count * 100) / totalCounts).ToString() });
                                        }
                                    }
                                }
                                catch (System.InvalidOperationException)
                                {

                                }
                                colorIndex++;
                            }
                        }
                        else if (this.SubType == ChartSubType.SalesValueOpportunityType || this.SubType == ChartSubType.SalesQuantityOpportunityType)
                        {
                            foreach (var record in new OpprtunityTypesRepository().GetAll())
                            {
                                try
                                {
                                    if (pipelineSalesVMCollection.Single(r => r.Name == record.Name) != null)
                                    {
                                        if (this.SubType.ToString().Contains("Value"))
                                            this.SetsCollection.Add(new SetValue { Color = colors.GetValue(colorIndex).ToString(), Label = record.Name, Value = (((pipelineSalesVMCollection.Single(r => r.Name == record.Name).AvgPrice) / totalPrice) * 100).ToString() });
                                        else
                                        {
                                            this.SetsCollection.Add(new SetValue { Color = colors.GetValue(colorIndex).ToString(), Label = record.Name, Value = ((pipelineSalesVMCollection.Single(r => r.Name == record.Name).Count * 100) / totalCounts).ToString() });
                                        }
                                    }
                                }
                                catch (System.InvalidOperationException)
                                {

                                }
                                colorIndex++;
                            }
                        }
                        else
                        {
                            int tmpCount = 0;
                            foreach (var record in products.AsEnumerable())
                            {
                                try
                                {
                                    if (pipelineSalesVMCollection.Single(r => r.Name == record.ProductTypeName) != null)
                                    {
                                        if (this.SubType.ToString().Contains("Value"))
                                            this.SetsCollection.Add(new SetValue { Color = record.ColorCode, Label = record.ProductTypeName, Value = (((pipelineSalesVMCollection.Single(r => r.Name == record.ProductTypeName).AvgPrice) / totalPrice) * 100).ToString() });
                                        else
                                        {
                                            tmpCount = pipelineSalesVMCollection.Single(r => r.Name == record.ProductTypeName).Count;
                                            this.SetsCollection.Add(new SetValue { Color = record.ColorCode, Label = record.ProductTypeName, Value = ((tmpCount * 100) / totalCounts).ToString() });
                                        }
                                    }
                                }
                                catch (System.InvalidOperationException)
                                {

                                }
                            }
                        }
                        //}
                        break;
                    case ChartID.ClosedSalesAnalysisBySource:
                        if (this.SubType == ChartSubType.ProductsSoldBySalesValue)
                            this.Caption = "Sales Value Percentage By Product";
                        if (this.SubType == ChartSubType.ProductsSoldBySalesQuantity)
                            this.Caption = "Sales Quantity Percentage By Product";

                        if (this.SubType == ChartSubType.SalesValueOppSource)
                            this.Caption = "Sales Value Percentage By Opportunity Source";
                        if (this.SubType == ChartSubType.SalesQuantityOppSource)
                            this.Caption = "Sales Quantity Percentage By Opportunity Source";


                        if (this.SubType == ChartSubType.SalesValueOpportunityType)
                            this.Caption = "Sales Value Percentage By Opportunity Source";
                        if (this.SubType == ChartSubType.SalesQuantityOpportunityType)
                            this.Caption = "Sales Quantity Percentage By Opportunity Source";

                        searchForNewCompany = (HttpContext.Current.Session["searchForNewCompany"] == null) ? "" : HttpContext.Current.Session["searchForNewCompany"].ToString();
                        searchCompanies = (HttpContext.Current.Session["searchCompanies"] == null) ? "" : HttpContext.Current.Session["searchCompanies"].ToString();

                        IEnumerable<SandlerModels.DataIntegration.ClosedSalesVM> productTypeVMCollection = queries.GetClosedSalesAnalysis(currentUser, DateTime.ParseExact(this.DrillBy, "MMM", null).Month, this.SubType.ToString(), searchForNewCompany, searchCompanies);
                        colors = new string[] { "CC6600", "9900CC", "FF3300", "0099FF", "00CC66", "FFFF00", "CC6600", "9900CC" };
                        totalPrice = productTypeVMCollection.Sum(r => r.AvgPrice);
                        totalCounts = productTypeVMCollection.Sum(r => r.Count);
                        productTypesSource = new ProductTypesRepository();

                        if (currentUser.Role == SandlerRoles.FranchiseeOwner || currentUser.Role == SandlerRoles.FranchiseeUser)
                            products = productTypesSource.GetWithFranchiseeId(currentUser.FranchiseeID);
                        else
                            products = productTypesSource.GetAll().Where(r => r.IsActive == true);

                        if (this.SubType == ChartSubType.SalesValueOppSource || this.SubType == ChartSubType.SalesQuantityOppSource)
                        {
                            foreach (var record in new OpprtunitySourceRepository().GetAll())
                            {
                                try
                                {
                                    if (productTypeVMCollection.Single(r => r.Name == record.Name) != null)
                                    {
                                        if (this.SubType.ToString().Contains("Value"))
                                            this.SetsCollection.Add(new SetValue { Color = colors.GetValue(colorIndex).ToString(), Label = record.Name, Value = (((productTypeVMCollection.Single(r => r.Name == record.Name).AvgPrice) / totalPrice) * 100).ToString() });
                                        else
                                        {
                                            this.SetsCollection.Add(new SetValue { Color = colors.GetValue(colorIndex).ToString(), Label = record.Name, Value = ((productTypeVMCollection.Single(r => r.Name == record.Name).Count * 100) / totalCounts).ToString() });
                                        }
                                    }
                                }
                                catch (System.InvalidOperationException)
                                {

                                }
                                colorIndex++;
                            }
                        }
                        else if (this.SubType == ChartSubType.SalesValueOpportunityType || this.SubType == ChartSubType.SalesQuantityOpportunityType)
                        {
                            foreach (var record in new OpprtunityTypesRepository().GetAll())
                            {
                                try
                                {
                                    if (productTypeVMCollection.Single(r => r.Name == record.Name) != null)
                                    {
                                        if (this.SubType.ToString().Contains("Value"))
                                            this.SetsCollection.Add(new SetValue { Color = colors.GetValue(colorIndex).ToString(), Label = record.Name, Value = (((productTypeVMCollection.Single(r => r.Name == record.Name).AvgPrice) / totalPrice) * 100).ToString() });
                                        else
                                        {
                                            this.SetsCollection.Add(new SetValue { Color = colors.GetValue(colorIndex).ToString(), Label = record.Name, Value = ((productTypeVMCollection.Single(r => r.Name == record.Name).Count * 100) / totalCounts).ToString() });
                                        }
                                    }
                                }
                                catch (System.InvalidOperationException)
                                {

                                }
                                colorIndex++;
                            }
                        }
                        else
                        {
                            int tmpCount = 0;
                            foreach (var record in products.AsEnumerable())
                            {
                                try
                                {
                                    if (productTypeVMCollection.Single(r => r.Name == record.ProductTypeName) != null)
                                    {
                                        if (this.SubType.ToString().Contains("Value"))
                                            this.SetsCollection.Add(new SetValue { Color = record.ColorCode, Label = record.ProductTypeName, Value = (((productTypeVMCollection.Single(r => r.Name == record.ProductTypeName).AvgPrice) / totalPrice) * 100).ToString() });
                                        else
                                        {
                                            tmpCount = productTypeVMCollection.Single(r => r.Name == record.ProductTypeName).Count;
                                            this.SetsCollection.Add(new SetValue { Color = record.ColorCode, Label = record.ProductTypeName, Value = ((tmpCount * 100) / totalCounts).ToString() });
                                        }
                                    }
                                }
                                catch (System.InvalidOperationException)
                                {

                                }
                            }
                        }
                        //}
                        break;
                    #endregion

                    #region FranchiseeReports logic
                    case ChartID.NewAppointmentsBySource:
                        //if (queries.GetNewAppointmentSource(currentUser, DateTime.ParseExact(this.DrillBy, "MMM", null).Month) != null)
                        //{
                        var NewAppointmentSource = from record in queries.GetNewAppointmentSource(currentUser, DateTime.ParseExact(this.DrillBy, "MMM", null).Month)
                                                   select new { Category = record.SourceName, Count = record.Count };



                        appointmentSource = new AppointmentSourceRepository();
                        foreach (var record in appointmentSource.GetAll().Where(r => r.IsActive == true).AsEnumerable())
                        {
                            try
                            {
                                if (NewAppointmentSource.Single(r => r.Category == record.ApptSourceName) != null)
                                    this.SetsCollection.Add(new SetValue { Color = record.ColorCode, Label = record.ApptSourceName, Value = NewAppointmentSource.Single(r => r.Category == record.ApptSourceName).Count.ToString() });
                            }
                            catch (System.InvalidOperationException)
                            {

                            }
                            colorIndex++;
                        }
                        //}
                        break;

                    case ChartID.NewClientByProductType:
                        //if (queries.GetNewClientsByProductType(currentUser, DateTime.ParseExact(this.DrillBy, "MMM", null).Month) != null)
                        //{
                        var NewClientsByProductType = from record in queries.GetNewClientsByProductType(currentUser, DateTime.ParseExact(this.DrillBy, "MMM", null).Month)
                                                      select new { Category = record.ProductTypeName, Count = record.Count };
                        productTypesSource = new ProductTypesRepository();

                        if (currentUser.Role == SandlerRoles.FranchiseeOwner || currentUser.Role == SandlerRoles.FranchiseeUser)
                            products = productTypesSource.GetWithFranchiseeId(currentUser.FranchiseeID);
                        else
                            products = productTypesSource.GetAll().Where(r => r.IsActive == true);


                        foreach (var record in products.AsEnumerable())
                        {
                            try
                            {
                                if (NewClientsByProductType.Single(r => r.Category == record.ProductTypeName) != null)
                                    this.SetsCollection.Add(new SetValue { Color = record.ColorCode, Label = record.ProductTypeName, Value = NewClientsByProductType.Single(r => r.Category == record.ProductTypeName).Count.ToString() });
                            }
                            catch (System.InvalidOperationException)
                            {

                            }
                        }
                        //}
                        break;
                    case ChartID.NewClientQuantity:
                        //if (queries.NewClientsWithProductTypes(currentUser, DateTime.ParseExact(this.DrillBy, "MMM", null).Month) != null)
                        //{
                        var NewClientsWithProductTypes = from record in queries.NewClientsWithProductTypes(currentUser, DateTime.ParseExact(this.DrillBy, "MMM", null).Month)
                                                         select new { Category = record.ProductTypeName, Count = record.Count };

                        productTypesSource = new ProductTypesRepository();

                        if (currentUser.Role == SandlerRoles.FranchiseeOwner || currentUser.Role == SandlerRoles.FranchiseeUser)
                            products = productTypesSource.GetWithFranchiseeId(currentUser.FranchiseeID);
                        else
                            products = productTypesSource.GetAll().Where(r => r.IsActive == true);

                        foreach (var record in products.AsEnumerable())
                        {
                            try
                            {
                                if (NewClientsWithProductTypes.Single(r => r.Category == record.ProductTypeName) != null)
                                    this.SetsCollection.Add(new SetValue { Color = record.ColorCode, Label = record.ProductTypeName, Value = NewClientsWithProductTypes.Single(r => r.Category == record.ProductTypeName).Count.ToString() });
                            }
                            catch (System.InvalidOperationException)
                            {

                            }
                        }
                        //}
                        break;

                    case ChartID.ContractPrice:

                        //if (queries.ContractPriceWithProductTypes(currentUser, DateTime.ParseExact(this.DrillBy, "MMM", null).Month) != null)
                        //{
                        var ContractPriceWithProductTypes = from record in queries.ContractPriceWithProductTypes(currentUser, DateTime.ParseExact(this.DrillBy, "MMM", null).Month)
                                                            select new { Category = record.ProductTypeName, AvgPrice = record.AvgPrice };

                        productTypesSource = new ProductTypesRepository();

                        if (currentUser.Role == SandlerRoles.FranchiseeOwner || currentUser.Role == SandlerRoles.FranchiseeUser)
                            products = productTypesSource.GetWithFranchiseeId(currentUser.FranchiseeID);
                        else
                            products = productTypesSource.GetAll().Where(r => r.IsActive == true);

                        foreach (var record in products.AsEnumerable())
                        {
                            try
                            {
                                if (ContractPriceWithProductTypes.Single(r => r.Category == record.ProductTypeName) != null)
                                    this.SetsCollection.Add(new SetValue { Color = record.ColorCode, Label = record.ProductTypeName, Value = ((ContractPriceWithProductTypes.Single(r => r.Category == record.ProductTypeName).AvgPrice) / 5).ToString() });
                            }
                            catch (System.InvalidOperationException)
                            {

                            }
                        }
                        //}
                        break;
                    case ChartID.HeadcountByCourse:
                        //if (queries.GetHeadcountByCourse(currentUser, DateTime.ParseExact(this.DrillBy, "MMM", null).Month) != null)
                        //{
                        var headCountsByCourse = from record in queries.GetHeadcountByCourse(currentUser, DateTime.ParseExact(this.DrillBy, "MMM", null).Month)
                                                 select new { Course = record.CourseName, Count = record.Count };

                        colors = new string[] { "CC6600", "9900CC", "FF3300", "0099FF", "00CC66", "FFFF00" };

                        CourseRepository courseSource = new CourseRepository();
                        foreach (var record in courseSource.GetAll().Where(r => r.IsActive == true).AsEnumerable())
                        {
                            try
                            {
                                if (headCountsByCourse.Single(r => r.Course == record.CourseName) != null)
                                    this.SetsCollection.Add(new SetValue { Color = colors.GetValue(colorIndex).ToString(), Label = record.CourseName, Value = headCountsByCourse.Single(r => r.Course == record.CourseName).Count.ToString() });
                            }
                            catch (System.InvalidOperationException)
                            {

                            }
                            colorIndex++;
                        }
                        //}
                        break;
                    case ChartID.HeadcountByIndustry:
                        //userEntities = new UserEntities();
                        //contacts = userEntities.GetContacts(currentUser);

                        //if (queries.GetHeadcountByIndustry(currentUser, DateTime.ParseExact(this.DrillBy, "MMM", null).Month) != null)
                        //{
                        var data = from record in queries.GetHeadcountByIndustry(currentUser, DateTime.ParseExact(this.DrillBy, "MMM", null).Month)
                                   select new { Industry = record.IndustryTypeName, Count = record.Count };
                        colors = new string[] { "9900CC", "FF3300", "0099FF", "00CC66", "FFFF00" };

                        IndustryTypeRepository industrySource = new IndustryTypeRepository();
                        foreach (var record in industrySource.GetAll().Where(r => r.IsActive == true).AsEnumerable())
                        {
                            try
                            {
                                if (data.Single(r => r.Industry == record.IndustryTypeName) != null)
                                    this.SetsCollection.Add(new SetValue { Color = colors.GetValue(colorIndex).ToString(), Label = record.IndustryTypeName, Value = data.Single(r => r.Industry == record.IndustryTypeName).Count.ToString() });
                            }
                            catch (System.InvalidOperationException)
                            {

                            }
                            colorIndex++;
                        }
                        //}
                        break;
                    #endregion

                    #region ProductsReports Logic
                    case ChartID.ProductMarginValue:
                        var productSalesValue = from record in queries.GetProductSalesByMonth(currentUser, DateTime.ParseExact(this.DrillBy, "MMM", null).Month)
                                                select new { Name = record.ProductTypeName, Value = record.AvgPrice };

                        totalPrice = productSalesValue.Sum(r => r.Value);

                        productTypesSource = new ProductTypesRepository();

                        if (currentUser.Role == SandlerRoles.FranchiseeOwner || currentUser.Role == SandlerRoles.FranchiseeUser)
                            products = productTypesSource.GetWithFranchiseeId(currentUser.FranchiseeID);
                        else
                            products = productTypesSource.GetAll().Where(r => r.IsActive == true);


                        foreach (var record in products.AsEnumerable())
                        {
                            try
                            {
                                if (productSalesValue.Single(r => r.Name == record.ProductTypeName) != null)
                                    this.SetsCollection.Add(new SetValue { Color = record.ColorCode, Label = record.ProductTypeName, Value = (((productSalesValue.Single(r => r.Name == record.ProductTypeName).Value) / totalPrice) * 100).ToString() });
                            }
                            catch (System.InvalidOperationException)
                            {

                            }
                        }
                        break;
                    case ChartID.ProductSalesQty:
                        var productSalesQty = from record in queries.GetProductSalesByMonth(currentUser, DateTime.ParseExact(this.DrillBy, "MMM", null).Month)
                                              select new { Name = record.ProductTypeName, Count = record.Count };

                        totalPrice = productSalesQty.Sum(r => r.Count);

                        productTypesSource = new ProductTypesRepository();

                        if (currentUser.Role == SandlerRoles.FranchiseeOwner || currentUser.Role == SandlerRoles.FranchiseeUser)
                            products = productTypesSource.GetWithFranchiseeId(currentUser.FranchiseeID);
                        else
                            products = productTypesSource.GetAll().Where(r => r.IsActive == true);


                        foreach (var record in products.AsEnumerable())
                        {
                            try
                            {
                                if (productSalesQty.Single(r => r.Name == record.ProductTypeName) != null)
                                    this.SetsCollection.Add(new SetValue { Color = record.ColorCode, Label = record.ProductTypeName, Value = (((productSalesQty.Single(r => r.Name == record.ProductTypeName).Count) / totalPrice) * 100).ToString() });
                            }
                            catch (System.InvalidOperationException)
                            {

                            }
                        }
                        break;
                    case ChartID.ProductFirstSalesValue:
                        var productFirstSalesValue = from record in queries.GetProductFirstSalesByMonth(currentUser, DateTime.ParseExact(this.DrillBy, "MMM", null).Month)
                                                     select new { Name = record.ProductTypeName, Value = record.AvgPrice };

                        totalPrice = productFirstSalesValue.Sum(r => r.Value);

                        productTypesSource = new ProductTypesRepository();

                        if (currentUser.Role == SandlerRoles.FranchiseeOwner || currentUser.Role == SandlerRoles.FranchiseeUser)
                            products = productTypesSource.GetWithFranchiseeId(currentUser.FranchiseeID);
                        else
                            products = productTypesSource.GetAll().Where(r => r.IsActive == true);


                        foreach (var record in products.AsEnumerable())
                        {
                            try
                            {
                                if (productFirstSalesValue.Single(r => r.Name == record.ProductTypeName) != null)
                                    this.SetsCollection.Add(new SetValue { Color = record.ColorCode, Label = record.ProductTypeName, Value = (((productFirstSalesValue.Single(r => r.Name == record.ProductTypeName).Value) / totalPrice) * 100).ToString() });
                            }
                            catch (System.InvalidOperationException)
                            {

                            }
                        }
                        break;
                    case ChartID.ProductFirstSalesQty:
                        var productFirstSalesQty = from record in queries.GetProductFirstSalesByMonth(currentUser, DateTime.ParseExact(this.DrillBy, "MMM", null).Month)
                                                   select new { Name = record.ProductTypeName, Count = record.Count };

                        totalPrice = productFirstSalesQty.Sum(r => r.Count);

                        productTypesSource = new ProductTypesRepository();

                        if (currentUser.Role == SandlerRoles.FranchiseeOwner || currentUser.Role == SandlerRoles.FranchiseeUser)
                            products = productTypesSource.GetWithFranchiseeId(currentUser.FranchiseeID);
                        else
                            products = productTypesSource.GetAll().Where(r => r.IsActive == true);


                        foreach (var record in products.AsEnumerable())
                        {
                            try
                            {
                                if (productFirstSalesQty.Single(r => r.Name == record.ProductTypeName) != null)
                                    this.SetsCollection.Add(new SetValue { Color = record.ColorCode, Label = record.ProductTypeName, Value = (((productFirstSalesQty.Single(r => r.Name == record.ProductTypeName).Count) / totalPrice) * 100).ToString() });
                            }
                            catch (System.InvalidOperationException)
                            {

                            }
                        }
                        break;
                    case ChartID.ProductSalesByCompanyQuantity:
                        try
                        {
                            companyName = new CompaniesRepository().GetById(long.Parse(SearchParameter)).COMPANYNAME;
                            this.Caption = this.Caption.Replace("Company Name", companyName);
                            var productSalestoCompanyQty = from record in queries.GetProductSoldByCompanyByMonth(currentUser, DateTime.ParseExact(this.DrillBy, "MMM", null).Month, int.Parse(this.SearchParameter))
                                                           select new { Name = record.ProductTypeName, Count = record.Count };

                            totalCounts = productSalestoCompanyQty.Sum(r => r.Count);

                            productTypesSource = new ProductTypesRepository();

                            if (currentUser.Role == SandlerRoles.FranchiseeOwner || currentUser.Role == SandlerRoles.FranchiseeUser)
                                products = productTypesSource.GetWithFranchiseeId(currentUser.FranchiseeID);
                            else
                                products = productTypesSource.GetAll().Where(r => r.IsActive == true);

                            //double percentCount = 0.0;
                            foreach (var record in products.AsEnumerable())
                            {
                                try
                                {
                                    if (productSalestoCompanyQty.Single(r => r.Name == record.ProductTypeName) != null)
                                    {
                                        this.SetsCollection.Add(new SetValue { Color = record.ColorCode, Label = record.ProductTypeName, Value = (((productSalestoCompanyQty.Single(r => r.Name == record.ProductTypeName).Count) / totalCounts) * 100).ToString() });
                                    }
                                }
                                catch (System.InvalidOperationException)
                                {

                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            throw new Exception("Exception in ChartID.ProductSalesByCompanyQuantity:" + ex.Message);
                        }
                        break;
                    case ChartID.ProductSalesByCompanyValue:
                        try
                        {
                            companyName = new CompaniesRepository().GetById(long.Parse(SearchParameter)).COMPANYNAME;
                            this.Caption = this.Caption.Replace("Company Name", companyName);
                            var productSalestoCompanyValue = from record in queries.GetProductSoldByCompanyByMonth(currentUser, DateTime.ParseExact(this.DrillBy, "MMM", null).Month, int.Parse(SearchParameter))
                                                             select new { Name = record.ProductTypeName, Value = record.AvgPrice };

                            totalPrice = productSalestoCompanyValue.Sum(r => r.Value);

                            productTypesSource = new ProductTypesRepository();

                            if (currentUser.Role == SandlerRoles.FranchiseeOwner || currentUser.Role == SandlerRoles.FranchiseeUser)
                                products = productTypesSource.GetWithFranchiseeId(currentUser.FranchiseeID);
                            else
                                products = productTypesSource.GetAll().Where(r => r.IsActive == true);


                            foreach (var record in products.AsEnumerable())
                            {
                                try
                                {
                                    if (productSalestoCompanyValue.Single(r => r.Name == record.ProductTypeName) != null)
                                        this.SetsCollection.Add(new SetValue { Color = record.ColorCode, Label = record.ProductTypeName, Value = (((productSalestoCompanyValue.Single(r => r.Name == record.ProductTypeName).Value) / totalPrice) * 100).ToString() });
                                }
                                catch (System.InvalidOperationException)
                                {

                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            throw new Exception("Exception in ChartID.ProductSalesByCompanyValue:" + ex.Message);
                        }
                        break;
                    case ChartID.ProductSalesBySalesRepQuantity:
                        try
                        {
                            this.Caption = this.Caption.Replace("Sales Rep", SearchParameter);
                            var productSalesBySalesRepQty = from record in queries.GetProductSoldBySalesRepByMonth(currentUser, DateTime.ParseExact(this.DrillBy, "MMM", null).Month, this.SearchParameter)
                                                            select new { Name = record.ProductTypeName, Count = record.Count };

                            totalCounts = productSalesBySalesRepQty.Sum(r => r.Count);

                            productTypesSource = new ProductTypesRepository();

                            if (currentUser.Role == SandlerRoles.FranchiseeOwner || currentUser.Role == SandlerRoles.FranchiseeUser)
                                products = productTypesSource.GetWithFranchiseeId(currentUser.FranchiseeID);
                            else
                                products = productTypesSource.GetAll().Where(r => r.IsActive == true);

                            //double percentCount = 0.0;
                            foreach (var record in products.AsEnumerable())
                            {
                                try
                                {
                                    if (productSalesBySalesRepQty.Single(r => r.Name == record.ProductTypeName) != null)
                                    {
                                        this.SetsCollection.Add(new SetValue { Color = record.ColorCode, Label = record.ProductTypeName, Value = (((productSalesBySalesRepQty.Single(r => r.Name == record.ProductTypeName).Count) / totalCounts) * 100).ToString() });
                                    }
                                }
                                catch (System.InvalidOperationException)
                                {

                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            throw new Exception("Exception in ChartID.ProductSalesBySalesRepQuantity:" + ex.Message);
                        }
                        break;
                    case ChartID.ProductSalesBySalesRepValue:
                        try
                        {
                            this.Caption = this.Caption.Replace("Sales Rep", SearchParameter);
                            var productSalesBtSalesRepValue = from record in queries.GetProductSoldBySalesRepByMonth(currentUser, DateTime.ParseExact(this.DrillBy, "MMM", null).Month, SearchParameter)
                                                              select new { Name = record.ProductTypeName, Value = record.AvgPrice };

                            totalPrice = productSalesBtSalesRepValue.Sum(r => r.Value);

                            productTypesSource = new ProductTypesRepository();

                            if (currentUser.Role == SandlerRoles.FranchiseeOwner || currentUser.Role == SandlerRoles.FranchiseeUser)
                                products = productTypesSource.GetWithFranchiseeId(currentUser.FranchiseeID);
                            else
                                products = productTypesSource.GetAll().Where(r => r.IsActive == true);


                            foreach (var record in products.AsEnumerable())
                            {
                                try
                                {
                                    if (productSalesBtSalesRepValue.Single(r => r.Name == record.ProductTypeName) != null)
                                        this.SetsCollection.Add(new SetValue { Color = record.ColorCode, Label = record.ProductTypeName, Value = (((productSalesBtSalesRepValue.Single(r => r.Name == record.ProductTypeName).Value) / totalPrice) * 100).ToString() });
                                }
                                catch (System.InvalidOperationException)
                                {

                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            throw new Exception("Exception in ChartID.ProductSalesBySalesRepValue:" + ex.Message);
                        }
                        break;
                    #endregion

                    #region BenchMarkReports Logic

                    case ChartID.BenchmarkSalesRepFranchiseeQty:
                        double salesRepQty;
                        try
                        {
                            franchiseeName = new FranchiseeRepository().GetById(currentUser.FranchiseeID).Name;
                            Caption = Caption.Replace("Sales Rep", SearchParameter).Replace("Name", franchiseeName);
                            IEnumerable<SandlerModels.DataIntegration.BenchMarkVM> salesRepToFranchiseeData = queries.GetBenchMarkSalesRepToFranchiseeByMonth(currentUser, DateTime.ParseExact(this.DrillBy, "MMM", null).Month); ;

                            totalCounts = salesRepToFranchiseeData.Sum(r => r.Count);

                            this.SetsCollection.Add(new SetValue
                            {
                                Color = "4F94CD",
                                Label = "Franchisee",
                                Value = ((((from record in salesRepToFranchiseeData.Where(r => r.KeyGroupId != SearchParameter)
                                            select record).Sum(r => r.Count)) / totalCounts) * 100).ToString()
                            });

                            SandlerModels.DataIntegration.BenchMarkVM repRecord = salesRepToFranchiseeData.Where(r => r.KeyGroupId == SearchParameter).SingleOrDefault();
                            salesRepQty = (repRecord == null) ? 0.0 : repRecord.Count;

                            this.SetsCollection.Add(new SetValue
                            {
                                Color = "FF8C00",
                                Label = "Rep",
                                Value = (( salesRepQty/ totalCounts) * 100).ToString()
                                
                            });

                        }
                        catch (Exception ex)
                        {
                            throw new Exception("Exception in ChartID.BenchmarkSalesRepFranchiseeQty:" + ex.Message);
                        }
                        break;

                    case ChartID.BenchmarkSalesRepFranchiseeValue:
                        double salesRepValue;
                        try
                        {
                            franchiseeName = new FranchiseeRepository().GetById(currentUser.FranchiseeID).Name;
                            Caption = Caption.Replace("Sales Rep", SearchParameter).Replace("Name", franchiseeName);
                            IEnumerable<SandlerModels.DataIntegration.BenchMarkVM> salesRepToFranchiseeData = queries.GetBenchMarkSalesRepToFranchiseeByMonth(currentUser, DateTime.ParseExact(this.DrillBy, "MMM", null).Month); ;

                            totalPrice = salesRepToFranchiseeData.Sum(r => r.Value);

                            this.SetsCollection.Add(new SetValue
                            {
                                Color = "4F94CD",
                                Label = "Franchisee",
                                Value = ((((from record in salesRepToFranchiseeData.Where(r => r.KeyGroupId != SearchParameter)
                                            select record).Sum(r => r.Value)) / totalPrice) * 100).ToString()
                            });

                            SandlerModels.DataIntegration.BenchMarkVM repRecord = salesRepToFranchiseeData.Where(r => r.KeyGroupId == SearchParameter).SingleOrDefault();
                            salesRepValue = (repRecord == null) ? 0.0 : repRecord.Value;

                            this.SetsCollection.Add(new SetValue
                            {
                                Color = "FF8C00",
                                Label = "Rep",
                                Value = ((salesRepValue / totalPrice) * 100).ToString()
                                
                            });

                        }
                        catch (Exception ex)
                        {
                            throw new Exception("Exception in ChartID.BenchmarkSalesRepFranchiseeValue:" + ex.Message);
                        }
                        break;

                    case ChartID.BenchmarkFranchiseeRegionQty:
                        double franchiseeQty;
                        try
                        {
                            franchiseeName = new FranchiseeRepository().GetById(int.Parse(SearchParameter)).Name;
                            regionName = new RegionRepository().GetById(currentUser.RegionID).Name;
                            Caption = Caption.Replace("Region Name", regionName).Replace("Franchisee Name", franchiseeName);
                            IEnumerable<SandlerModels.DataIntegration.BenchMarkVM> salesFranchiseeToRegionsData = queries.GetBenchMarkFranchiseeToRegionsByMonth(currentUser, DateTime.ParseExact(this.DrillBy, "MMM", null).Month); ;

                            totalCounts = salesFranchiseeToRegionsData.Sum(r => r.Count);

                            this.SetsCollection.Add(new SetValue
                            {
                                Color = "32df00",
                                Label = "Region",
                                Value = ((((from record in salesFranchiseeToRegionsData.Where(r => r.KeyGroupId != SearchParameter)
                                            select record).Sum(r => r.Count)) / totalCounts) * 100).ToString()
                            });

                            SandlerModels.DataIntegration.BenchMarkVM franchiseeRecord = salesFranchiseeToRegionsData.Where(r => r.KeyGroupId == SearchParameter).SingleOrDefault();
                            franchiseeQty = (franchiseeRecord == null) ? 0.0 : franchiseeRecord.Count;

                            this.SetsCollection.Add(new SetValue
                            {
                                Color = "4F94CD",
                                Label = "Franchisee",
                                Value = ((franchiseeQty / totalCounts) * 100).ToString()

                            });

                        }
                        catch (Exception ex)
                        {
                            throw new Exception("Exception in ChartID.BenchmarkFranchiseeRegionQty:" + ex.Message);
                        }
                        break;

                    case ChartID.BenchmarkFranchiseeRegionValue:
                        double franchiseeValue;
                        try
                        {
                            franchiseeName = new FranchiseeRepository().GetById(int.Parse(SearchParameter)).Name;
                            regionName = new RegionRepository().GetById(currentUser.RegionID).Name;
                            Caption = Caption.Replace("Region Name", regionName).Replace("Franchisee Name", franchiseeName);
                            IEnumerable<SandlerModels.DataIntegration.BenchMarkVM> salesFranchiseeToRegionsData = queries.GetBenchMarkFranchiseeToRegionsByMonth(currentUser, DateTime.ParseExact(this.DrillBy, "MMM", null).Month); ;

                            totalPrice = salesFranchiseeToRegionsData.Sum(r => r.Value);

                            this.SetsCollection.Add(new SetValue
                            {
                                Color = "32df00",
                                Label = "Region",
                                Value = ((((from record in salesFranchiseeToRegionsData.Where(r => r.KeyGroupId != SearchParameter)
                                            select record).Sum(r => r.Value)) / totalPrice) * 100).ToString()
                            });

                            SandlerModels.DataIntegration.BenchMarkVM franchiseeRecord = salesFranchiseeToRegionsData.Where(r => r.KeyGroupId == SearchParameter).SingleOrDefault();
                            franchiseeValue = (franchiseeRecord == null) ? 0.0 : franchiseeRecord.Value;

                            this.SetsCollection.Add(new SetValue
                            {
                                Color = "4F94CD",
                                Label = "Franchisee",
                                Value = ((franchiseeValue / totalPrice) * 100).ToString()

                            });

                        }
                        catch (Exception ex)
                        {
                            throw new Exception("Exception in ChartID.BenchmarkFranchiseeRegionValue:" + ex.Message);
                        }
                        break;
                    case ChartID.BenchmarkRegionCountryQty:
                        double regionQty;
                        try
                        {
                            regionName = new RegionRepository().GetById(int.Parse(SearchParameter)).Name;
                            countryName = new CountryRepository().GetById(currentUser.CountryID).Name;
                            Caption = Caption.Replace("Region Name", regionName).Replace("Country Name", countryName);
                            IEnumerable<SandlerModels.DataIntegration.BenchMarkVM> salesRegionToCountryData = queries.GetBenchMarkRegionToCountryByMonth(currentUser, DateTime.ParseExact(this.DrillBy, "MMM", null).Month); ;

                            totalCounts = salesRegionToCountryData.Sum(r => r.Count);

                            this.SetsCollection.Add(new SetValue
                            {
                                Color = "800080",
                                Label = "Country",
                                Value = ((((from record in salesRegionToCountryData.Where(r => r.KeyGroupId != SearchParameter)
                                            select record).Sum(r => r.Count)) / totalCounts) * 100).ToString()
                            });

                            SandlerModels.DataIntegration.BenchMarkVM regionRecord = salesRegionToCountryData.Where(r => r.KeyGroupId == SearchParameter).SingleOrDefault();
                            regionQty = (regionRecord == null) ? 0.0 : regionRecord.Count;

                            this.SetsCollection.Add(new SetValue
                            {
                                Color = "32df00",
                                Label = "Region",
                                Value = ((regionQty / totalCounts) * 100).ToString()

                            });

                        }
                        catch (Exception ex)
                        {
                            throw new Exception("Exception in ChartID.BenchmarkRegionCountryQty:" + ex.Message);
                        }
                        break;
                    case ChartID.BenchmarkRegionCountryValue:
                        double regionValue;
                        try
                        {
                            regionName = new RegionRepository().GetById(int.Parse(SearchParameter)).Name;
                            countryName = new CountryRepository().GetById(currentUser.CountryID).Name;
                            Caption = Caption.Replace("Region Name", regionName).Replace("Country Name", countryName);

                            IEnumerable<SandlerModels.DataIntegration.BenchMarkVM> salesRegionToCountryData = queries.GetBenchMarkRegionToCountryByMonth(currentUser, DateTime.ParseExact(this.DrillBy, "MMM", null).Month);

                            totalPrice = salesRegionToCountryData.Sum(r => r.Value);

                            this.SetsCollection.Add(new SetValue
                            {
                                Color = "800080",
                                Label = "Country",
                                Value = ((((from record in salesRegionToCountryData.Where(r => r.KeyGroupId != SearchParameter)
                                            select record).Sum(r => r.Value)) / totalPrice) * 100).ToString()
                            });

                            SandlerModels.DataIntegration.BenchMarkVM regionRecord = salesRegionToCountryData.Where(r => r.KeyGroupId == SearchParameter).SingleOrDefault();
                            regionValue = (regionRecord == null) ? 0.0 : regionRecord.Value;

                            this.SetsCollection.Add(new SetValue
                            {
                                Color = "32df00",
                                Label = "Region",
                                Value = ((regionValue / totalPrice) * 100).ToString()

                            });

                        }
                        catch (Exception ex)
                        {
                            throw new Exception("Exception in ChartID.BenchmarkFranchiseeRegionValue:" + ex.Message);
                        }
                        break;
                    case ChartID.BenchmarkCountryAllQty:
                        double countryQty;
                        try
                        {                            
                            countryName = new CountryRepository().GetById(int.Parse(SearchParameter)).Name;
                            Caption = Caption.Replace("Country Name", countryName);
                            IEnumerable<SandlerModels.DataIntegration.BenchMarkVM> salesCountryAllData = queries.GetBenchMarkCountryAllByMonth( DateTime.ParseExact(this.DrillBy, "MMM", null).Month); ;

                            totalCounts = salesCountryAllData.Sum(r => r.Count);

                            this.SetsCollection.Add(new SetValue
                            {
                                Color = "800080",
                                Label = "All",
                                Value = ((((from record in salesCountryAllData.Where(r => r.KeyGroupId != SearchParameter)
                                            select record).Sum(r => r.Count)) / totalCounts) * 100).ToString()
                            });

                            SandlerModels.DataIntegration.BenchMarkVM countryRecord = salesCountryAllData.Where(r => r.KeyGroupId == SearchParameter).SingleOrDefault();
                            countryQty = (countryRecord == null) ? 0.0 : countryRecord.Count;

                            this.SetsCollection.Add(new SetValue
                            {
                                Color = "00CED1",
                                Label = "Country",
                                Value = ((countryQty / totalCounts) * 100).ToString()

                            });

                        }
                        catch (Exception ex)
                        {
                            throw new Exception("Exception in ChartID.BenchmarkRegionCountryQty:" + ex.Message);
                        }
                        break;
                    case ChartID.BenchmarkCountryAllValue:
                        double countryValue;
                        try
                        {
                            countryName = new CountryRepository().GetById(int.Parse(SearchParameter)).Name;
                            Caption = Caption.Replace("Country Name", countryName);

                            IEnumerable<SandlerModels.DataIntegration.BenchMarkVM> salesCountryAllData = queries.GetBenchMarkCountryAllByMonth( DateTime.ParseExact(this.DrillBy, "MMM", null).Month);

                            totalPrice = salesCountryAllData.Sum(r => r.Value);

                            this.SetsCollection.Add(new SetValue
                            {
                                Color = "800080",
                                Label = "All",
                                Value = ((((from record in salesCountryAllData.Where(r => r.KeyGroupId != SearchParameter)
                                            select record).Sum(r => r.Value)) / totalPrice) * 100).ToString()
                            });

                            SandlerModels.DataIntegration.BenchMarkVM countryRecord = salesCountryAllData.Where(r => r.KeyGroupId == SearchParameter).SingleOrDefault();
                            countryValue = (countryRecord == null) ? 0.0 : countryRecord.Value;

                            this.SetsCollection.Add(new SetValue
                            {
                                Color = "00CED1",
                                Label = "Country",
                                Value = ((countryValue / totalPrice) * 100).ToString()

                            });

                        }
                        catch (Exception ex)
                        {
                            throw new Exception("Exception in ChartID.BenchmarkCountryAllValue:" + ex.Message);
                        }
                        break;
                    #endregion

                    default:
                        break;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public new void CreateChart()
        {
            StringBuilder chartXML = null;
            try
            {
                string caption = (string.IsNullOrEmpty(this.DrillBy)) ? this.Caption + "'" : this.Caption + " (" + this.DrillBy + ")'";
                chartXML = new StringBuilder("<chart" + (!(string.IsNullOrEmpty(this.Caption)) ? " caption='" + caption : ""));
                chartXML.Append((!(string.IsNullOrEmpty(this.BGColor)) ? " bgColor='" + this.BGColor + "'" : ""));
                chartXML.Append((!(string.IsNullOrEmpty(this.BGAlpha)) ? " bgAlpha='" + this.BGAlpha + "'" : ""));
                chartXML.Append((!(string.IsNullOrEmpty(this.CanvasBGColor)) ? " canvasBgColor='" + this.CanvasBGColor + "'" : ""));
                chartXML.Append((!(string.IsNullOrEmpty(this.CanvasBGAlpha)) ? " canvasBgAlpha='" + this.CanvasBGAlpha + "'" : ""));
                chartXML.Append((!(string.IsNullOrEmpty(this.XaxisName)) ? " xAxisName='" + this.XaxisName + "'" : ""));
                chartXML.Append((!(string.IsNullOrEmpty(this.YaxisName)) ? " yAxisName='" + this.YaxisName + "'" : ""));
                chartXML.Append((!(string.IsNullOrEmpty(this.PieRadius)) ? " pieRadius='" + this.PieRadius + "'" : ""));
                chartXML.Append((!(string.IsNullOrEmpty(this.showLegend)) ? " showLegend='" + this.showLegend + "'" : ""));
                chartXML.Append((!(string.IsNullOrEmpty(this.enableRotation)) ? " enableRotation='" + this.enableRotation + "'" : ""));
                chartXML.Append((!(string.IsNullOrEmpty(this.showLabels)) ? " showLabels='" + this.showLabels + "'" : ""));
                chartXML.Append((!(string.IsNullOrEmpty(this.NumberSuffix)) ? " numberSuffix='" + this.NumberSuffix + "'" : ""));


                chartXML.Append(">");

                chartXML.Append(CreateDataSets());

                chartXML.Append("</chart>");
            }
            catch (Exception ex)
            {
                throw ex;
            }
            ChartXML = chartXML.ToString();
        }
    }

    public class Category
    {
        public string Label { get; set; }
        public Category()
        {
        }
    }

    public class ChartDataSet
    {
        public string SeriesName { get; set; }
        public string Color { get; set; }
        public List<SetValue> SetsCollection { get; set; }

        public ChartDataSet()
        {
            this.SetsCollection = new List<SetValue>();
        }

    }

    public class SetValue
    {
        public string Value { get; set; }
        public string Link { get; set; }
        public string Color { get; set; }
        public string Label { get; set; }
    }

    public class ChartParameter
    {
        public string Color { get; set; }
        public string Value { get; set; }
    }



}