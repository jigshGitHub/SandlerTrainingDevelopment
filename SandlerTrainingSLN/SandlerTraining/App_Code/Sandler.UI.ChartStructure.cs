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
namespace Sandler.UI.ChartStructure
{
    public static class ChartHelper
    {
        const string CHARTPAGE = "ChartPage.aspx";

        public static string GeneratePageLink(string drillBy, string drillChartIds)
        {
            return (string.IsNullOrEmpty(drillBy) && string.IsNullOrEmpty(drillChartIds)) ? "" : string.Format("{0}?{1}={2}&{3}={4}", CHARTPAGE, ConfigurationManager.AppSettings["QueryStringParamDrillChartIDs"], drillChartIds, ConfigurationManager.AppSettings["QueryStringParamDrillBy"], drillBy);
        }
        public static string GeneratePageLink(string drillBy, string drillChartIds, string chartSubtype)
        {
            return (string.IsNullOrEmpty(drillBy) && string.IsNullOrEmpty(drillChartIds)) ? "" : string.Format("{0}?{1}={2}&{3}={4}&SubType={5}", CHARTPAGE, ConfigurationManager.AppSettings["QueryStringParamDrillChartIDs"], drillChartIds, ConfigurationManager.AppSettings["QueryStringParamDrillBy"], drillBy, chartSubtype);
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
        ProductMarginContributionValue,
        ProductMarginContributionQty,
        RevenueBySourceValue,
        RevenueBySourceQty,
        ProdSoldByRepValue,
        ProdSoldByRepQty,
        ProductSoldAsSaleValue,
        ProductSoldAsSaleQty,
        ProductSoldByCompValue,
        ProductSoldByCompQty,
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
        ClosedSalesAnalysisBySource
    }

    public enum ChartTypes
    {
        Chart,
        PieChart,
        BarChart
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

        public int GAId { get; set; }
        public string SubType { get; set; }
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
                switch ((ChartID)Enum.Parse(typeof(ChartID), this.Id.ToString(), true))
                {
                    case ChartID.ClosedSalesAnalysis:
                        productTypesSource = new ProductTypesRepository();
                        if (currentUser.Role == SandlerRoles.FranchiseeOwner || currentUser.Role == SandlerRoles.FranchiseeUser)
                            products = productTypesSource.GetWithFranchiseeId(currentUser.FranchiseeID);
                        else
                            products = productTypesSource.GetAll();

                        if (this.SubType == "SalesValueOppSource" || this.SubType == "SalesQuantityOppSource")
                        {
                            foreach (var record in new OppSourceeRepository().GetAll())
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

                        foreach (ChartParameter parameter in chartParams)
                        {
                            try
                            {
                                if (this.SubType == "ProductsSoldBySalesValue")
                                    this.Caption = "Sales Value By Product (By Month)";
                                if (this.SubType == "ProductsSoldBySalesQuantity")
                                    this.Caption = "Sales Quantity By Product (By Month)";

                                if (this.SubType == "SalesValueOppSource")
                                    this.Caption = "Sales Value By Opportunity Source (By Month)";
                                if (this.SubType == "SalesQuantityOppSource")
                                    this.Caption = "Sales Quantity By Opportunity Source (By Month)";

                                IEnumerable<SandlerModels.DataIntegration.ProductTypeVM> productTypeVMCollection = queries.GetClosedSalesAnalysis(currentUser, DateTime.Now.AddMonths(int.Parse(parameter.Value)).Month, this.SubType);
                                if (productTypeVMCollection != null)
                                {
                                    var clientsWithProducts = from record in productTypeVMCollection
                                                              select new { Category = record.ProductTypeName, SalesValue = record.AvgPrice, SalesQuantity = record.Count };

                                    this.DataSetCollection.Add(new ChartDataSet { Color = parameter.Color, SeriesName = DateTime.Now.AddMonths(int.Parse(parameter.Value)).ToString("MMM") });

                                    foreach (Category category in this.Categories)
                                    {
                                        lastDs = this.DataSetCollection.Last();
                                        lastDs.SetsCollection.Add(new SetValue { Label = category.Label, Link = ChartHelper.GeneratePageLink(lastDs.SeriesName, this.DrillChartIds, this.SubType) });
                                    }

                                    foreach (var record in clientsWithProducts)
                                    {
                                        foreach (SetValue set in lastDs.SetsCollection)
                                        {
                                            if (set.Label == record.Category)
                                            {
                                                if (this.SubType.Contains("Value"))
                                                {
                                                    set.Value = record.SalesValue.ToString();
                                                }
                                                if (this.SubType.Contains("Quantity"))
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
                        break;
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
                                        lastDs.SetsCollection.Add(new SetValue { Label = category.Label, Link = ChartHelper.GeneratePageLink(lastDs.SeriesName, this.DrillChartIds) });
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
                                        lastDs.SetsCollection.Add(new SetValue { Label = category.Label, Link = ChartHelper.GeneratePageLink(lastDs.SeriesName, this.DrillChartIds) });
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
                                    this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = newClients.ToString(), Link = ChartHelper.GeneratePageLink(catagory.Label, this.DrillChartIds) });
                                    this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = (aveContractPrice / 5).ToString(), Link = ChartHelper.GeneratePageLink(catagory.Label, this.DrillChartIds) });
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
                                    this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = classHeadCountsCourse.ToString(), Link = ChartHelper.GeneratePageLink(catagory.Label, this.DrillChartIds) });
                                    this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = classHeadCountsIndustry.ToString(), Link = ChartHelper.GeneratePageLink(catagory.Label, this.DrillChartIds) });
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
                                this.DataSetCollection[0].SetsCollection.Add(new SetValue { Label = catagory.Label, Value = actualDollarsBooked.ToString(), Link = ChartHelper.GeneratePageLink("", this.DrillChartIds) });
                                this.DataSetCollection[1].SetsCollection.Add(new SetValue { Label = catagory.Label, Value = ((Convert.ToDouble(actualDollarsBooked) / Convert.ToDouble(goalOfDollarsBooked)) * 100).ToString("#.##"), Link = ChartHelper.GeneratePageLink("", this.DrillChartIds) });
                                //}
                            }
                            catch (System.InvalidOperationException)
                            {

                            }

                        }
                        break;
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

                        gaRecord = gaData.GetGATrackerById(GAId);
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
                        GATracker gaTracker = reposiroty.GetGATrackerById(GAId);

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
                                            this.SetsCollection.Add(new SetValue { Color = record.ColorCode, Label = record.IndustryTypeName, Value = d.Count.ToString("#"), Link = ChartHelper.GeneratePageLink("", this.DrillChartIds) });
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
        public List<SetValue> SetsCollection;

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

                IEnumerable<Tbl_ProductType> products;
                switch (this.Id)
                {
                    case ChartID.ClosedSalesAnalysisBySource:
                        if (this.SubType == "ProductsSoldBySalesValue")
                            this.Caption = "Sales Value Percentage By Product";
                        if (this.SubType == "ProductsSoldBySalesQuantity")
                            this.Caption = "Sales Quantity Percentage By Product";

                        if (this.SubType == "SalesValueOppSource")
                            this.Caption = "Sales Value Percentage By Opportunity Source";
                        if (this.SubType == "SalesQuantityOppSource")
                            this.Caption = "Sales Quantity Percentage By Opportunity Source";

                        IEnumerable<SandlerModels.DataIntegration.ProductTypeVM> productTypeVMCollection = queries.GetClosedSalesAnalysis(currentUser, DateTime.ParseExact(this.DrillBy, "MMM", null).Month, this.SubType);
                        colors = new string[] { "CC6600", "9900CC", "FF3300", "0099FF", "00CC66", "FFFF00", "CC6600", "9900CC" };
                        var totalPrice = productTypeVMCollection.Sum(r => r.AvgPrice);
                        var totalCounts = productTypeVMCollection.Sum(r => r.Count);
                        productTypesSource = new ProductTypesRepository();

                        if (currentUser.Role == SandlerRoles.FranchiseeOwner || currentUser.Role == SandlerRoles.FranchiseeUser)
                            products = productTypesSource.GetWithFranchiseeId(currentUser.FranchiseeID);
                        else
                            products = productTypesSource.GetAll().Where(r => r.IsActive == true);

                        if (this.SubType == "SalesValueOppSource" || this.SubType == "SalesQuantityOppSource")
                        {
                            foreach (var record in new OpprtunitySourceRepository().GetAll())
                            {
                                try
                                {
                                    if (productTypeVMCollection.Single(r => r.ProductTypeName == record.Name) != null)
                                    {
                                        if (this.SubType.Contains("Value"))
                                            this.SetsCollection.Add(new SetValue { Color = colors.GetValue(colorIndex).ToString(), Label = record.Name, Value = (((productTypeVMCollection.Single(r => r.ProductTypeName == record.Name).AvgPrice) / totalPrice) * 100).ToString() });
                                        else
                                        {
                                            this.SetsCollection.Add(new SetValue { Color = colors.GetValue(colorIndex).ToString(), Label = record.Name, Value = ((productTypeVMCollection.Single(r => r.ProductTypeName == record.Name).Count * 100) / totalCounts).ToString() });
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
                                    if (productTypeVMCollection.Single(r => r.ProductTypeName == record.ProductTypeName) != null)
                                    {
                                        if (this.SubType.Contains("Value"))
                                            this.SetsCollection.Add(new SetValue { Color = record.ColorCode, Label = record.ProductTypeName, Value = (((productTypeVMCollection.Single(r => r.ProductTypeName == record.ProductTypeName).AvgPrice) / totalPrice) * 100).ToString() });
                                        else
                                        {
                                            tmpCount = productTypeVMCollection.Single(r => r.ProductTypeName == record.ProductTypeName).Count;
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
                        break;
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
                chartXML = new StringBuilder("<chart" + (!(string.IsNullOrEmpty(this.Caption)) ? " caption='" + this.Caption + " (" + this.DrillBy + ")'" : ""));
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