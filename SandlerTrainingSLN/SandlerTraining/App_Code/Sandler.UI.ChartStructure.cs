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

namespace Sandler.UI.ChartStructure
{
    public static class ChartHelper
    {
        const string CHARTPAGE = "ChartPage.aspx";

        public static string GeneratePageLink(string drillBy, string drillChartIds)
        {
            return (string.IsNullOrEmpty(drillBy) && string.IsNullOrEmpty(drillChartIds)) ? "" : string.Format("{0}?{1}={2}&{3}={4}", CHARTPAGE, ConfigurationManager.AppSettings["QueryStringParamDrillChartIDs"], drillChartIds, ConfigurationManager.AppSettings["QueryStringParamDrillBy"], drillBy);
        }
    }
    public interface IChart
    {
        void LoadChart();
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
        IndustryAve
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



        public Chart()
        {
            this.Categories = new List<Category>();
            this.DataSetCollection = new List<ChartDataSet>();
            this.DrillOverride = true;
        }

        public void LoadChart()
        {
            COSTimeRepository cosRepository;
            IEnumerable<TBL_COSTOFSALE_MAIN> cosData;
            COSTimeRepositoryDrill cosDrillRepository;
            IEnumerable<TBL_COSTOFSALE_DRILL> cosDrillData;
            IndustryAveRepository iAveRepository;
            IEnumerable<TBL_IND_AVERAGES> iAveData;
            PipeLinePostTrainingRepository ppTRepository;
            IEnumerable<TBL_PIPELINE_POST> ppTData;
            ProductMarginContributionRepository pmcRepository;
            IEnumerable<TBL_PRODUCT_MARGIN> pmcData;
            ProductSalesActivityRepository psaRepository;
            IEnumerable<TBL_PRDSALES_BYACT> psaData;
            SandlerRepositories.ROIRepository roiRepository;
            IEnumerable<Return_on_Trng_Investment> roiData;
            string value;
            //int nextDrillLevel = this.DrillLevel + 1;

            //Revenue By Source
            RevenueBySourceRepository rbsRepository;
            IEnumerable<TBL_REVBYSOURCE> rbsData;
            //Prod Sold By Rep
            ProdSoldByRepRepository psbrRepository;
            IEnumerable<TBL_PRODSOLD_BYREP> psbrData;
            //Prod sold as 1st Sale
            ProdSoldAsSaleRepository psasRepository;
            IEnumerable<TBL_PRODSOLD_AS_SALE> psasData;
            //Product sold By Company
            ProdSoldByCompRepository psbcRepository;
            IEnumerable<TBL_PRODSOLD_BYCOMP> psbcData;
            //Retention Rate
            RetentionRateRepository retrateRepository;
            IEnumerable<TBL_RETENTION_RATE> retrateData;
            //Sales Totals By Month
            SalesTotalsByMonthRepository salesTotRepository;
            IEnumerable<TBL_SALESTOTALBYMONTH> salesTotData;

            try
            {
                this.DrillChartIds = (this.DrillOverride) ? this.Id.ToString() : this.DrillChartIds;
                switch ((ChartID)Enum.Parse(typeof(ChartID), this.Id.ToString(), true))
                {
                    case ChartID.NewAppointmentsBySourceMonth:                        
                        this.Categories.Add(new Category { Label = "Referral" });
                        this.Categories.Add(new Category { Label = "Network" });
                        this.Categories.Add(new Category { Label = "Talk" });
                        this.Categories.Add(new Category { Label = "Cold Call" });
                        this.Categories.Add(new Category { Label = "Follow On" });

                        this.DataSetCollection.Add(new ChartDataSet { Color = "3300ff", SeriesName = "Mar" });

                        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = "3", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[0].SeriesName, this.DrillChartIds) });
                        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = "4", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[0].SeriesName, this.DrillChartIds) });
                        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = "7", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[0].SeriesName, this.DrillChartIds) });
                        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = "6", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[0].SeriesName, this.DrillChartIds) });
                        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = "4", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[0].SeriesName, this.DrillChartIds) });

                        this.DataSetCollection.Add(new ChartDataSet { Color = "ff6600", SeriesName = "Apr" });
                        
                        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = "4", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[1].SeriesName, this.DrillChartIds) });
                        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = "6", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[1].SeriesName, this.DrillChartIds) });
                        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = "5", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[1].SeriesName, this.DrillChartIds) });
                        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = "8", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[1].SeriesName, this.DrillChartIds) });
                        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = "5", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[1].SeriesName, this.DrillChartIds) });

                        this.DataSetCollection.Add(new ChartDataSet { Color = "32df00", SeriesName = "May" });                      


                        this.DataSetCollection[2].SetsCollection.Add(new SetValue { Value = "6", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[2].SeriesName, this.DrillChartIds) });
                        this.DataSetCollection[2].SetsCollection.Add(new SetValue { Value = "8", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[2].SeriesName, this.DrillChartIds) });
                        this.DataSetCollection[2].SetsCollection.Add(new SetValue { Value = "7", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[2].SeriesName, this.DrillChartIds) });
                        this.DataSetCollection[2].SetsCollection.Add(new SetValue { Value = "9", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[2].SeriesName, this.DrillChartIds) });
                        this.DataSetCollection[2].SetsCollection.Add(new SetValue { Value = "10", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[2].SeriesName, this.DrillChartIds) });
                        break;

                    case ChartID.NewClientsByProductTypeMonth:

                        this.Categories.Add(new Category { Label = "Assessment" });
                        this.Categories.Add(new Category { Label = "PC" });
                        this.Categories.Add(new Category { Label = "Consulting" });
                        this.Categories.Add(new Category { Label = "Training" });
                        this.Categories.Add(new Category { Label = "Leadership" });
                        this.Categories.Add(new Category { Label = "Coaching" });

                        this.DataSetCollection.Add(new ChartDataSet { Color = "8A4B08", SeriesName = "Mar" });
                        this.DataSetCollection.Add(new ChartDataSet { Color = "0000FF", SeriesName = "Apr" });
                        this.DataSetCollection.Add(new ChartDataSet { Color = "ff9966", SeriesName = "May" });

                        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = "25", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[0].SeriesName, this.DrillChartIds) });
                        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = "35", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[0].SeriesName, this.DrillChartIds) });
                        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = "37", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[0].SeriesName, this.DrillChartIds) });
                        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = "38", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[0].SeriesName, this.DrillChartIds) });
                        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = "37", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[0].SeriesName, this.DrillChartIds) });
                        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = "38", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[0].SeriesName, this.DrillChartIds) });

                        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = "23", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[1].SeriesName, this.DrillChartIds) });
                        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = "26", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[1].SeriesName, this.DrillChartIds) });
                        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = "28", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[1].SeriesName, this.DrillChartIds) });
                        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = "29", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[1].SeriesName, this.DrillChartIds) });
                        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = "28", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[1].SeriesName, this.DrillChartIds) });
                        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = "29", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[1].SeriesName, this.DrillChartIds) });

                        this.DataSetCollection[2].SetsCollection.Add(new SetValue { Value = "10", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[2].SeriesName, this.DrillChartIds) });
                        this.DataSetCollection[2].SetsCollection.Add(new SetValue { Value = "15", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[2].SeriesName, this.DrillChartIds) });
                        this.DataSetCollection[2].SetsCollection.Add(new SetValue { Value = "20", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[2].SeriesName, this.DrillChartIds) });
                        this.DataSetCollection[2].SetsCollection.Add(new SetValue { Value = "15", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[2].SeriesName, this.DrillChartIds) });
                        this.DataSetCollection[2].SetsCollection.Add(new SetValue { Value = "20", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[2].SeriesName, this.DrillChartIds) });
                        this.DataSetCollection[2].SetsCollection.Add(new SetValue { Value = "15", Link = ChartHelper.GeneratePageLink(this.DataSetCollection[2].SeriesName, this.DrillChartIds) });
                        break;
                    case ChartID.NewClientQuantityAverageContractPriceByMonth:
                        this.Categories.Add(new Category { Label = "Mar" });
                        this.Categories.Add(new Category { Label = "Apr" });
                        this.Categories.Add(new Category { Label = "May" });

                        this.DataSetCollection.Add(new ChartDataSet { Color = "0000FF", SeriesName = "New Clients" });
                        this.DataSetCollection.Add(new ChartDataSet { Color = "ff6600", SeriesName = "Ave Contract Price" });

                        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = "18", Link = ChartHelper.GeneratePageLink(this.Categories[0].Label, this.DrillChartIds) });
                        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = "25", Link = ChartHelper.GeneratePageLink(this.Categories[1].Label, this.DrillChartIds) });
                        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = "31", Link = ChartHelper.GeneratePageLink(this.Categories[2].Label, this.DrillChartIds) });

                        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = "13", Link = ChartHelper.GeneratePageLink(this.Categories[0].Label, this.DrillChartIds) });
                        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = "19", Link = ChartHelper.GeneratePageLink(this.Categories[1].Label, this.DrillChartIds) });
                        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = "23", Link = ChartHelper.GeneratePageLink(this.Categories[2].Label, this.DrillChartIds) });
                        break;
                    case ChartID.ClassHeadcountByCourseIndustryMonth:
                        this.Categories.Add(new Category { Label = "Mar" });
                        this.Categories.Add(new Category { Label = "Apr" });
                        this.Categories.Add(new Category { Label = "May" });

                        this.DataSetCollection.Add(new ChartDataSet { Color = "ff6600", SeriesName = "Course" });
                        this.DataSetCollection.Add(new ChartDataSet { Color = "32df00", SeriesName = "Industry" });

                        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = "24", Link = ChartHelper.GeneratePageLink(this.Categories[0].Label, this.DrillChartIds) });
                        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = "30", Link = ChartHelper.GeneratePageLink(this.Categories[1].Label, this.DrillChartIds) });
                        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = "31", Link = ChartHelper.GeneratePageLink(this.Categories[2].Label, this.DrillChartIds) });

                        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = "22", Link = ChartHelper.GeneratePageLink(this.Categories[0].Label, this.DrillChartIds) });
                        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = "24", Link = ChartHelper.GeneratePageLink(this.Categories[1].Label, this.DrillChartIds) });
                        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = "20", Link = ChartHelper.GeneratePageLink(this.Categories[2].Label, this.DrillChartIds) });
                        break;
                    case ChartID.ActualDollarsBookedComparisonGoal:
                        this.Categories.Add(new Category { Label = "Mar" });
                        this.Categories.Add(new Category { Label = "Apr" });
                        this.Categories.Add(new Category { Label = "May" });

                        this.DataSetCollection.Add(new ChartDataSet { Color = "0066ff", SeriesName = "$$Booked" });
                        this.DataSetCollection.Add(new ChartDataSet { Color = "ffff99", SeriesName = "% of Goal" });

                        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = "2200", Link = ChartHelper.GeneratePageLink("", this.DrillChartIds) });
                        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = "4500", Link = ChartHelper.GeneratePageLink("", this.DrillChartIds) });
                        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = "5500", Link = ChartHelper.GeneratePageLink("", this.DrillChartIds) });

                        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = "40", Link = ChartHelper.GeneratePageLink("", this.DrillChartIds) });
                        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = "66", Link = ChartHelper.GeneratePageLink("", this.DrillChartIds) });
                        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = "90", Link = ChartHelper.GeneratePageLink("", this.DrillChartIds) });
                        break;
                    //case ChartID.CostOfSale:
                    //    if (this.DrillLevel == 0)
                    //    {
                    //        cosRepository = new COSTimeRepository();
                    //        cosData = cosRepository.GetAll();

                    //        this.DataSetCollection.Add(new ChartDataSet { Color = "8A4B08", SeriesName = "Cost" });
                    //        this.DataSetCollection.Add(new ChartDataSet { Color = "0000FF", SeriesName = "Profit" });

                    //        foreach (TBL_COSTOFSALE_MAIN row in cosData)
                    //        {
                    //            this.Categories.Add(new Category { Label = row.Category_Name });
                    //            this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = row.Cost.ToString(), Link = "Cost_Of_Sale.aspx?drillLevel=" + nextDrillLevel.ToString() + "&drillBy=" + row.Category_Name });
                    //            this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = row.Profit.ToString(), Link = "Cost_Of_Sale.aspx?drillLevel=" + nextDrillLevel.ToString() + "&drillBy=" + row.Category_Name });
                    //        }
                    //    }
                    //    else
                    //    {
                    //        cosDrillRepository = new COSTimeRepositoryDrill();
                    //        if (this.DrillLevel == 1)
                    //        {
                    //            cosDrillData = from record in cosDrillRepository.GetAll()
                    //                           where (record.Id < 6)
                    //                           select record;
                    //        }
                    //        else
                    //        {
                    //            cosDrillData = from record in cosDrillRepository.GetAll()
                    //                           where (record.Id > 5)
                    //                           select record;
                    //        }

                    //        this.DataSetCollection.Add(new ChartDataSet { Color = "8A4B08", SeriesName = "Cost" });
                    //        this.DataSetCollection.Add(new ChartDataSet { Color = "0000FF", SeriesName = "Profit" });

                    //        foreach (TBL_COSTOFSALE_DRILL row in cosDrillData)
                    //        {
                    //            this.Categories.Add(new Category { Label = row.Category_Name });
                    //            this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = row.Cost.ToString(), Link = "Cost_Of_Sale.aspx?drillLevel=" + nextDrillLevel.ToString() + "&drillBy=" + row.Category_Name });
                    //            this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = row.Profit.ToString(), Link = "Cost_Of_Sale.aspx?drillLevel=" + nextDrillLevel.ToString() + "&drillBy=" + row.Category_Name });
                    //        }
                    //    }

                    //    break;
                    //case ChartID.IndustryAve:
                    //    iAveRepository = new IndustryAveRepository();
                    //    iAveData = iAveRepository.GetAll();

                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "8A4B08", SeriesName = "Best In Class" });
                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "0000FF", SeriesName = "Mass Mutual" });
                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "ff9966", SeriesName = "Industry Average" });

                    //    foreach (TBL_IND_AVERAGES row in iAveData)
                    //    {
                    //        this.Categories.Add(new Category { Label = row.Category_Name });
                    //        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = row.Best_In_Class_Value.ToString(), Link = "IndustryAve.aspx" });
                    //        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = row.Mass_Mutual_Value.ToString(), Link = "IndustryAve.aspx" });
                    //        this.DataSetCollection[2].SetsCollection.Add(new SetValue { Value = row.Ind_Avg_Value.ToString(), Link = "IndustryAve.aspx" });
                    //    }
                    //    break;
                    //case ChartID.IndustryAveBenchmarks:
                    //    iAveRepository = new IndustryAveRepository();
                    //    iAveData = iAveRepository.GetAll();

                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "8A4B08", SeriesName = "Best In Class" });
                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "0000FF", SeriesName = "Mortgage Corporation" });
                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "ff9966", SeriesName = "Industry Average" });

                    //    foreach (TBL_IND_AVERAGES row in iAveData)
                    //    {
                    //        this.Categories.Add(new Category { Label = row.Category_Name });
                    //        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = row.Best_In_Class_Value.ToString(), Link = "IndAverageBenchmarks.aspx" });
                    //        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = row.Mass_Mutual_Value.ToString(), Link = "IndAverageBenchmarks.aspx" });
                    //        this.DataSetCollection[2].SetsCollection.Add(new SetValue { Value = row.Ind_Avg_Value.ToString(), Link = "IndAverageBenchmarks.aspx" });
                    //    }
                    //    break;
                    //case ChartID.PipelinePostTraining:
                    //    ppTRepository = new PipeLinePostTrainingRepository();
                    //    ppTData = ppTRepository.GetAll();

                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "0000FF", SeriesName = "Before Training" });
                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "8A4B08", SeriesName = "After Training" });

                    //    foreach (TBL_PIPELINE_POST row in ppTData)
                    //    {
                    //        this.Categories.Add(new Category { Label = row.Category_Name });
                    //        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = row.Before_Value.ToString(), Link = "Pipeline_Post_Training.aspx" });
                    //        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = row.After_Value.ToString(), Link = "Pipeline_Post_Training.aspx" });
                    //    }
                    //    break;
                    //case ChartID.ProductMarginContributionValue:
                    //case ChartID.ProductMarginContributionQty:
                    //    pmcRepository = new ProductMarginContributionRepository();
                    //    pmcData = pmcRepository.GetAll();

                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "3300ff", SeriesName = "2010" });
                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "ff6600", SeriesName = "2011" });
                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "32df00", SeriesName = "2012" });

                    //    foreach (TBL_PRODUCT_MARGIN row in pmcData)
                    //    {
                    //        value = "";
                    //        this.Categories.Add(new Category { Label = row.Category_Name });
                    //        value = (this.Id == ChartID.ProductMarginContributionValue) ? row.Value_2010.ToString() : row.Qty_2010.ToString();
                    //        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = value, Link = "Product_Margin_Contribution.aspx" });
                    //        value = (this.Id == ChartID.ProductMarginContributionValue) ? row.Value_2011.ToString() : row.Qty_2011.ToString();
                    //        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = value, Link = "Product_Margin_Contribution.aspx" });
                    //        value = (this.Id == ChartID.ProductMarginContributionValue) ? row.Value_2012.ToString() : row.Qty_2012.ToString();
                    //        this.DataSetCollection[2].SetsCollection.Add(new SetValue { Value = value, Link = "Product_Margin_Contribution.aspx" });
                    //    }
                    //    break;
                    //case ChartID.RevenueBySourceValue:
                    //case ChartID.RevenueBySourceQty:
                    //    rbsRepository = new RevenueBySourceRepository();
                    //    rbsData = rbsRepository.GetAll();

                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "3300ff", SeriesName = "2010" });
                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "ff6600", SeriesName = "2011" });
                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "32df00", SeriesName = "2012" });

                    //    string rbsValue;
                    //    foreach (TBL_REVBYSOURCE row in rbsData)
                    //    {
                    //        rbsValue = "";
                    //        this.Categories.Add(new Category { Label = row.Category_Name });
                    //        rbsValue = (this.Id == ChartID.RevenueBySourceValue) ? row.Value_2010.ToString() : row.Qty_2010.ToString();
                    //        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = rbsValue, Link = "Revenue_By_Source.aspx" });
                    //        rbsValue = (this.Id == ChartID.RevenueBySourceValue) ? row.Value_2011.ToString() : row.Qty_2011.ToString();
                    //        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = rbsValue, Link = "Revenue_By_Source.aspx" });
                    //        rbsValue = (this.Id == ChartID.RevenueBySourceValue) ? row.Value_2012.ToString() : row.Qty_2012.ToString();
                    //        this.DataSetCollection[2].SetsCollection.Add(new SetValue { Value = rbsValue, Link = "Revenue_By_Source.aspx" });
                    //    }
                    //    break;
                    //case ChartID.ProdSoldByRepValue:
                    //case ChartID.ProdSoldByRepQty:
                    //    psbrRepository = new ProdSoldByRepRepository();
                    //    psbrData = psbrRepository.GetAll();

                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "3300ff", SeriesName = "2010" });
                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "ff6600", SeriesName = "2011" });
                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "32df00", SeriesName = "2012" });

                    //    string psbrValue;
                    //    foreach (TBL_PRODSOLD_BYREP row in psbrData)
                    //    {
                    //        psbrValue = "";
                    //        this.Categories.Add(new Category { Label = row.Rep_Name });
                    //        psbrValue = (this.Id == ChartID.ProdSoldByRepValue) ? row.Value_2010.ToString() : row.Qty_2010.ToString();
                    //        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = psbrValue, Link = "Prod_Sold_By_Rep.aspx" });
                    //        psbrValue = (this.Id == ChartID.ProdSoldByRepValue) ? row.Value_2011.ToString() : row.Qty_2011.ToString();
                    //        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = psbrValue, Link = "Prod_Sold_By_Rep.aspx" });
                    //        psbrValue = (this.Id == ChartID.ProdSoldByRepValue) ? row.Value_2012.ToString() : row.Qty_2012.ToString();
                    //        this.DataSetCollection[2].SetsCollection.Add(new SetValue { Value = psbrValue, Link = "Prod_Sold_By_Rep.aspx" });
                    //    }
                    //    break;
                    //case ChartID.ProductSoldAsSaleValue:
                    //case ChartID.ProductSoldAsSaleQty:
                    //    psasRepository = new ProdSoldAsSaleRepository();
                    //    psasData = psasRepository.GetAll();

                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "3300ff", SeriesName = "2010" });
                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "ff6600", SeriesName = "2011" });
                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "32df00", SeriesName = "2012" });

                    //    string psasValue;
                    //    foreach (TBL_PRODSOLD_AS_SALE row in psasData)
                    //    {
                    //        psasValue = "";
                    //        this.Categories.Add(new Category { Label = row.Category_Name });
                    //        psasValue = (this.Id == ChartID.ProductSoldAsSaleValue) ? row.Value_2010.ToString() : row.Qty_2010.ToString();
                    //        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = psasValue, Link = "Prod_Sold_As_Sale.aspx" });
                    //        psasValue = (this.Id == ChartID.ProductSoldAsSaleValue) ? row.Value_2011.ToString() : row.Qty_2011.ToString();
                    //        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = psasValue, Link = "Prod_Sold_As_Sale.aspx" });
                    //        psasValue = (this.Id == ChartID.ProductSoldAsSaleValue) ? row.Value_2012.ToString() : row.Qty_2012.ToString();
                    //        this.DataSetCollection[2].SetsCollection.Add(new SetValue { Value = psasValue, Link = "Prod_Sold_As_Sale.aspx" });
                    //    }
                    //    break;
                    //case ChartID.ProductSoldByCompValue:
                    //case ChartID.ProductSoldByCompQty:
                    //    psbcRepository = new ProdSoldByCompRepository();
                    //    psbcData = psbcRepository.GetAll();

                    //    this.DataSetCollection.Add(new ChartDataSet { });

                    //    string psbcValue;
                    //    string psbcColor;
                    //    foreach (TBL_PRODSOLD_BYCOMP row in psbcData)
                    //    {
                    //        psbcValue = "";
                    //        psbcColor = "";
                    //        this.Categories.Add(new Category { Label = row.Category_Name });
                    //        psbcValue = (this.Id == ChartID.ProductSoldByCompValue) ? row.Value.ToString() : row.Quantity.ToString();
                    //        psbcColor = row.Color.ToString();
                    //        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = psbcValue, Color = psbcColor, Link = "Prod_Sold_By_Company.aspx" });

                    //    }
                    //    break;
                    //case ChartID.ProductSalesActivityValue:
                    //case ChartID.ProductSalesActivityQty:
                    //    psaRepository = new ProductSalesActivityRepository();
                    //    psaData = psaRepository.GetAll();

                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "3300ff", SeriesName = "2010" });
                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "ff6600", SeriesName = "2011" });
                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "32df00", SeriesName = "2012" });

                    //    foreach (TBL_PRDSALES_BYACT row in psaData)
                    //    {
                    //        value = "";
                    //        this.Categories.Add(new Category { Label = row.Category_Name });
                    //        value = (this.Id == ChartID.ProductSalesActivityValue) ? row.Value_2010.ToString() : row.Qty_2010.ToString();
                    //        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = value, Link = "Product_Sales_By_Activity.aspx" });
                    //        value = (this.Id == ChartID.ProductSalesActivityValue) ? row.Value_2011.ToString() : row.Qty_2011.ToString();
                    //        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = value, Link = "Product_Sales_By_Activity.aspx" });
                    //        value = (this.Id == ChartID.ProductSalesActivityValue) ? row.Value_2012.ToString() : row.Qty_2012.ToString();
                    //        this.DataSetCollection[2].SetsCollection.Add(new SetValue { Value = value, Link = "Product_Sales_By_Activity.aspx" });
                    //    }
                    //    break;
                    //case ChartID.RetentionRateByExp:
                    //case ChartID.RetentionRateByEff:
                    //    retrateRepository = new RetentionRateRepository();
                    //    retrateData = retrateRepository.GetAll();

                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "3300ff", SeriesName = "Growth Company" });
                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "ff6600", SeriesName = "Mass Mutual" });
                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "32df00", SeriesName = "Marginal Company" });

                    //    string retrateValue;
                    //    foreach (TBL_RETENTION_RATE row in retrateData)
                    //    {
                    //        retrateValue = "";
                    //        this.Categories.Add(new Category { Label = row.Year.ToString() });
                    //        retrateValue = (this.Id == ChartID.RetentionRateByExp) ? row.Growth_Comp_Exp.ToString() : row.Growth_Comp_Effect.ToString();
                    //        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = retrateValue, Link = "Retention_Rate.aspx" });
                    //        retrateValue = (this.Id == ChartID.RetentionRateByExp) ? row.Mass_Mutual_Exp.ToString() : row.Mass_Mutual_Effect.ToString();
                    //        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = retrateValue, Link = "Retention_Rate.aspx" });
                    //        retrateValue = (this.Id == ChartID.RetentionRateByExp) ? row.Marginal_Comp_Exp.ToString() : row.Marginal_Comp_Effect.ToString();
                    //        this.DataSetCollection[2].SetsCollection.Add(new SetValue { Value = retrateValue, Link = "Retention_Rate.aspx" });
                    //    }
                    //    break;
                    //case ChartID.SalesTotalsByMonthValue:
                    //case ChartID.SalesTotalsByMonthQty:
                    //    salesTotRepository = new SalesTotalsByMonthRepository();
                    //    salesTotData = salesTotRepository.GetAll();

                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "3300ff", SeriesName = "2010" });
                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "ff6600", SeriesName = "2011" });
                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "32df00", SeriesName = "2012" });

                    //    string salesTotValue;
                    //    foreach (TBL_SALESTOTALBYMONTH row in salesTotData)
                    //    {
                    //        psbrValue = "";
                    //        this.Categories.Add(new Category { Label = row.Month_Name });
                    //        salesTotValue = (this.Id == ChartID.SalesTotalsByMonthValue) ? row.Value_2010.ToString() : row.Qty_2010.ToString();
                    //        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = salesTotValue, Link = "Sales_Total_By_Month.aspx" });
                    //        salesTotValue = (this.Id == ChartID.SalesTotalsByMonthValue) ? row.Value_2011.ToString() : row.Qty_2011.ToString();
                    //        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = salesTotValue, Link = "Sales_Total_By_Month.aspx" });
                    //        salesTotValue = (this.Id == ChartID.SalesTotalsByMonthValue) ? row.Value_2012.ToString() : row.Qty_2012.ToString();
                    //        this.DataSetCollection[2].SetsCollection.Add(new SetValue { Value = salesTotValue, Link = "Sales_Total_By_Month.aspx" });
                    //    }
                    //    break;
                    //case ChartID.ReturnOnTrainingInvestment:
                    //    roiRepository = new SandlerRepositories.ROIRepository();
                    //    roiData = roiRepository.GetAll();

                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "0000FF", SeriesName = "Original ROI" });
                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "F7D358", SeriesName = "Modified ROI" });

                    //    List<int> roiYears = new List<int>();
                    //    roiYears.Add(2013);
                    //    roiYears.Add(2014);
                    //    roiYears.Add(2015);

                    //    foreach (int periodYear in roiYears)
                    //    {
                    //        IEnumerable<Return_on_Trng_Investment> values = roiData.Where(r => r.PeriodYear == periodYear);
                    //        this.Categories.Add(new Category { Label = periodYear.ToString() });
                    //        int index = 0;
                    //        foreach (Return_on_Trng_Investment dr in values)
                    //        {
                    //            if (dr.Yr1ROI.HasValue)
                    //                this.DataSetCollection[index++].SetsCollection.Add(new SetValue { Value = dr.Yr1ROI.ToString(), Link = "ROI.aspx" });
                    //        }
                    //    }
                    //    break;

                    //case ChartID.GapAnalysis:
                    //    this.Categories.Add(new Category { Label = "Sales Cycle Time" });
                    //    this.Categories.Add(new Category { Label = "Sales Efficiency" });
                    //    this.Categories.Add(new Category { Label = "Sales Qualification" });
                    //    this.Categories.Add(new Category { Label = "Trng Cost Savings" });
                    //    this.Categories.Add(new Category { Label = "Quota Achievement" });
                    //    this.Categories.Add(new Category { Label = "Estimated Benifits Gained" });

                    //    SqlDataReader reader = null;
                    //    IGapAnalysis gaData = new GapAnalysis();

                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "0000FF", SeriesName = "As-Is" });
                    //    this.DataSetCollection.Add(new ChartDataSet { Color = "8A4B08", SeriesName = "To-Be" });

                    //    reader = gaData.GetByRepId("1");
                    //    while (reader.Read())
                    //    {
                    //        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = reader.GetValue(5).ToString(), Link = "GapAnalysisCreate.aspx" });
                    //        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = reader.GetValue(6).ToString(), Link = "GapAnalysisCreate.aspx" });
                    //        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = reader.GetValue(7).ToString(), Link = "GapAnalysisCreate.aspx" });
                    //        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = reader.GetValue(8).ToString(), Link = "GapAnalysisCreate.aspx" });
                    //        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = reader.GetValue(9).ToString(), Link = "GapAnalysisCreate.aspx" });
                    //        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = reader.GetValue(10).ToString(), Link = "GapAnalysisCreate.aspx" });

                    //        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = reader.GetValue(11).ToString(), Link = "GapAnalysisCreate.aspx" });
                    //        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = reader.GetValue(12).ToString(), Link = "GapAnalysisCreate.aspx" });
                    //        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = reader.GetValue(13).ToString(), Link = "GapAnalysisCreate.aspx" });
                    //        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = reader.GetValue(14).ToString(), Link = "GapAnalysisCreate.aspx" });
                    //        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = reader.GetValue(15).ToString(), Link = "GapAnalysisCreate.aspx" });
                    //        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = reader.GetValue(16).ToString(), Link = "GapAnalysisCreate.aspx" });
                    //    }
                    //    break;
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

        public new void LoadChart()
        {
            ProspectingRepository prosRepository;
            IEnumerable<TBL_PROSPECTING> prosData;
            ProdcutsSalesRepository prosalesRepository;
            IEnumerable<TBL_SALES> prosalesData;
            try
            {
                this.DrillChartIds = (this.DrillOverride) ? this.Id.ToString() : this.DrillChartIds;
                switch (this.Id)
                {
                    case ChartID.AverageLengthTimeActiveClientsByIndustry:
                        this.SetsCollection.Add(new SetValue { Value = "11", Color = "009999", Label = "Proffesional Svcs", Link = ChartHelper.GeneratePageLink("", this.DrillChartIds) });
                        this.SetsCollection.Add(new SetValue { Value = "50", Color = "CC99FF", Label = "Service Industry", Link = ChartHelper.GeneratePageLink("", this.DrillChartIds) });
                        this.SetsCollection.Add(new SetValue { Value = "32", Color = "FFFF99", Label = "Manufacturing", Link = ChartHelper.GeneratePageLink("", this.DrillChartIds) });
                        this.SetsCollection.Add(new SetValue { Value = "22", Color = "009900", Label = "Software", Link = ChartHelper.GeneratePageLink("", this.DrillChartIds) });
                        this.SetsCollection.Add(new SetValue { Value = "10", Color = "0066FF", Label = "Consulting", Link = ChartHelper.GeneratePageLink("", this.DrillChartIds) });
                        break;
                    //case ChartID.ProspectingResults:
                    //    prosRepository = new ProspectingRepository();
                    //    prosData = prosRepository.GetAll();

                    //    foreach (TBL_PROSPECTING row in prosData)
                    //    {
                    //        this.SetsCollection.Add(new SetValue { Value = row.FirstLevel_Qty.ToString(), Color = row.Color, Label = row.FirstLevel_Name, Link = "Prospecting.aspx" });
                    //    }
                    //    break;
                    //case ChartID.SalesValuePeriod1:
                    //    prosalesRepository = new ProdcutsSalesRepository();
                    //    prosalesData = prosalesRepository.GetAll();

                    //    foreach (TBL_SALES row in prosalesData)
                    //    {
                    //        this.SetsCollection.Add(new SetValue { Value = row.P1_Value.ToString(), Color = row.Color, Label = row.Label_Name });
                    //    }
                    //    break;
                    //case ChartID.SalesValuePeriod2:
                    //    prosalesRepository = new ProdcutsSalesRepository();
                    //    prosalesData = prosalesRepository.GetAll();

                    //    foreach (TBL_SALES row in prosalesData)
                    //    {
                    //        this.SetsCollection.Add(new SetValue { Value = row.P2_Value.ToString(), Color = row.Color, Label = row.Label_Name });
                    //    }
                    //    break;
                    //case ChartID.SalesValuePeriod3:
                    //    prosalesRepository = new ProdcutsSalesRepository();
                    //    prosalesData = prosalesRepository.GetAll();

                    //    foreach (TBL_SALES row in prosalesData)
                    //    {
                    //        this.SetsCollection.Add(new SetValue { Value = row.P3_Value.ToString(), Color = row.Color, Label = row.Label_Name });
                    //    }
                    //    break;
                    //case ChartID.SalesQtyPeriod1:
                    //    prosalesRepository = new ProdcutsSalesRepository();
                    //    prosalesData = prosalesRepository.GetAll();

                    //    foreach (TBL_SALES row in prosalesData)
                    //    {
                    //        this.SetsCollection.Add(new SetValue { Value = row.P1_Qty.ToString(), Color = row.Color, Label = row.Label_Name });
                    //    }
                    //    break;
                    //case ChartID.SalesQtyPeriod2:
                    //    prosalesRepository = new ProdcutsSalesRepository();
                    //    prosalesData = prosalesRepository.GetAll();

                    //    foreach (TBL_SALES row in prosalesData)
                    //    {
                    //        this.SetsCollection.Add(new SetValue { Value = row.P2_Qty.ToString(), Color = row.Color, Label = row.Label_Name });
                    //    }
                    //    break;
                    //case ChartID.SalesQtyPeriod3:
                    //    prosalesRepository = new ProdcutsSalesRepository();
                    //    prosalesData = prosalesRepository.GetAll();

                    //    foreach (TBL_SALES row in prosalesData)
                    //    {
                    //        this.SetsCollection.Add(new SetValue { Value = row.P3_Qty.ToString(), Color = row.Color, Label = row.Label_Name });
                    //    }
                    //    break;
                    default:
                        break;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
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
        public new void LoadChart()
        {
            SalesCycleTimeRepository salescycleTimeRepository;
            IEnumerable<TBL_SALESCYCLETIME_MAIN> sctimeData;

            SalesCycleTimeDrillRepository sctdrillRepository;
            IEnumerable<TBL_SALESCYCLETIME_DRILL> sctdrillData;

            try
            {
                this.DrillChartIds = (this.DrillOverride) ? this.Id.ToString() : this.DrillChartIds;
                switch (this.Id)
                {
                    case ChartID.NewAppointmentsBySource:
                        this.SetsCollection.Add(new SetValue { Color = "00CC66", Label = "Referral", Link = "", Value = "13" });
                        this.SetsCollection.Add(new SetValue { Color = "0099FF", Label = "Network", Link = "", Value = "17" });
                        this.SetsCollection.Add(new SetValue { Color = "FF3300", Label = "Talk", Link = "", Value = "29" });
                        this.SetsCollection.Add(new SetValue { Color = "9900CC", Label = "Cold Call", Link = "", Value = "25" });
                        this.SetsCollection.Add(new SetValue { Color = "CC6600", Label = "Followw On", Link = "", Value = "16" });
                        break;

                    case ChartID.NewClientByProductType:
                        this.SetsCollection.Add(new SetValue { Color = "CC6600", Label = "Assessment", Link = "", Value = "15" });
                        this.SetsCollection.Add(new SetValue { Color = "9900CC", Label = "PC", Link = "", Value = "14" });
                        this.SetsCollection.Add(new SetValue { Color = "FF3300", Label = "Consulting", Link = "", Value = "17" });
                        this.SetsCollection.Add(new SetValue { Color = "0099FF", Label = "Training", Link = "", Value = "19" });
                        this.SetsCollection.Add(new SetValue { Color = "00CC66", Label = "Leadership", Link = "", Value = "18" });
                        this.SetsCollection.Add(new SetValue { Color = "FFFF00", Label = "Coaching", Link = "", Value = "17" });
                        break;

                    case ChartID.NewClientQuantity:
                        this.SetsCollection.Add(new SetValue { Color = "CC6600", Label = "Assessment", Link = "", Value = "15" });
                        this.SetsCollection.Add(new SetValue { Color = "9900CC", Label = "PC", Link = "", Value = "14" });
                        this.SetsCollection.Add(new SetValue { Color = "FF3300", Label = "Consulting", Link = "", Value = "17" });
                        this.SetsCollection.Add(new SetValue { Color = "0099FF", Label = "Training", Link = "", Value = "19" });
                        this.SetsCollection.Add(new SetValue { Color = "00CC66", Label = "Leadership", Link = "", Value = "18" });
                        this.SetsCollection.Add(new SetValue { Color = "FFFF00", Label = "Coaching", Link = "", Value = "17" });
                        break;

                    case ChartID.ContractPrice:
                        this.SetsCollection.Add(new SetValue { Color = "CC6600", Label = "Assessment", Link = "", Value = "15" });
                        this.SetsCollection.Add(new SetValue { Color = "9900CC", Label = "PC", Link = "", Value = "14" });
                        this.SetsCollection.Add(new SetValue { Color = "FF3300", Label = "Consulting", Link = "", Value = "17" });
                        this.SetsCollection.Add(new SetValue { Color = "0099FF", Label = "Training", Link = "", Value = "19" });
                        this.SetsCollection.Add(new SetValue { Color = "00CC66", Label = "Leadership", Link = "", Value = "18" });
                        this.SetsCollection.Add(new SetValue { Color = "FFFF00", Label = "Coaching", Link = "", Value = "17" });
                        break;

                    case ChartID.HeadcountByCourse:
                        this.SetsCollection.Add(new SetValue { Color = "CC6600", Label = "PC", Link = "", Value = "15" });
                        this.SetsCollection.Add(new SetValue { Color = "9900CC", Label = "Foundation", Link = "", Value = "14" });
                        this.SetsCollection.Add(new SetValue { Color = "FF3300", Label = "Management", Link = "", Value = "17" });
                        this.SetsCollection.Add(new SetValue { Color = "0099FF", Label = "Bootcamp", Link = "", Value = "19" });
                        break;

                    case ChartID.HeadcountByIndustry:
                        this.SetsCollection.Add(new SetValue { Color = "9900CC", Label = "Professional Svcs", Link = "", Value = "14" });
                        this.SetsCollection.Add(new SetValue { Color = "FF3300", Label = "Service Industry", Link = "", Value = "17" });
                        this.SetsCollection.Add(new SetValue { Color = "0099FF", Label = "Manufacturing", Link = "", Value = "19" });
                        this.SetsCollection.Add(new SetValue { Color = "00CC66", Label = "Software", Link = "", Value = "18" });
                        this.SetsCollection.Add(new SetValue { Color = "FFFF00", Label = "Consulting", Link = "", Value = "17" });
                        break;

                    //case ChartID.SalesCycleTimeMain:
                    //    salescycleTimeRepository = new SalesCycleTimeRepository();
                    //    sctimeData = salescycleTimeRepository.GetAll();
                    //    SetValue set;
                    //    foreach (TBL_SALESCYCLETIME_MAIN row in sctimeData)
                    //    {
                    //        set = new SetValue();
                    //        set.Value = row.Value.ToString();
                    //        set.Color = row.Color;
                    //        set.Label = row.Category_Name;
                    //        if (!string.IsNullOrEmpty(row.Link))
                    //            set.Link = row.Link;
                    //        this.SetsCollection.Add(set);

                    //    }
                    //    break;

                    //case ChartID.SalesCycleTimeDrill:
                    //    sctdrillRepository = new SalesCycleTimeDrillRepository();
                    //    string nextDrillBy = "";
                    //    string productName = "";
                    //    string companyName = "";
                    //    if (DrillBy == "Product")
                    //    {
                    //        sctdrillData = from record in sctdrillRepository.GetAll()
                    //                       where (record.Id < 12)
                    //                       select record;
                    //        nextDrillBy = "Company";
                    //    }
                    //    else if (DrillBy == "Company")
                    //    {
                    //        sctdrillData = from record in sctdrillRepository.GetAll()
                    //                       where (record.Id > 11 && record.Id < 22)
                    //                       select record;
                    //        nextDrillBy = "SalesRep";
                    //    }
                    //    else
                    //    {
                    //        sctdrillData = from record in sctdrillRepository.GetAll()
                    //                       where (record.Id > 21)
                    //                       select record;
                    //    }
                    //    string drillValue = "";
                    //    SetValue localset;
                    //    foreach (TBL_SALESCYCLETIME_DRILL row in sctdrillData)
                    //    {
                    //        localset = new SetValue();
                    //        switch (DrillLevel)
                    //        {
                    //            case 2:
                    //                drillValue = row.Value_DL2.ToString();
                    //                if (row.Category_Name == "Sandler Online" || row.Category_Name == "Castle Metals")
                    //                {
                    //                    localset.Link = "SCTDrill.aspx?drillCategory=" + this.DrillCategory + "&drillLevel=" + DrillLevel.ToString() + "&drillBy=" + nextDrillBy;
                    //                    HttpContext.Current.Session[DrillBy] = row.Category_Name;
                    //                }
                    //                break;
                    //            case 3:
                    //                drillValue = row.Value_DL3.ToString();
                    //                if (row.Category_Name == "Consulting" || row.Category_Name == "GE Capital Corp")
                    //                {
                    //                    localset.Link = "SCTDrill.aspx?drillCategory=" + this.DrillCategory + "&drillLevel=" + DrillLevel.ToString() + "&drillBy=" + nextDrillBy;
                    //                    HttpContext.Current.Session[DrillBy] = row.Category_Name;
                    //                }
                    //                break;
                    //        }
                    //        localset.Value = drillValue;
                    //        localset.Color = row.Color;
                    //        localset.Label = row.Category_Name;
                    //        this.SetsCollection.Add(localset);
                    //    }
                    //    break;
                    //case ChartID.SalesCycleTimeDrill1:
                    //    sctdrillRepository = new SalesCycleTimeDrillRepository();
                    //    sctdrillData = sctdrillRepository.GetAll();

                    //    foreach (TBL_SALESCYCLETIME_DRILL row in sctdrillData)
                    //    {
                    //        this.SetsCollection.Add(new SetValue { Value = row.Value_DL1.ToString(), Color = row.Color, Label = row.Category_Name });
                    //    }
                    //    break;
                    //case ChartID.SalesCycleTimeDrill2:
                    //    sctdrillRepository = new SalesCycleTimeDrillRepository();
                    //    sctdrillData = sctdrillRepository.GetAll();

                    //    foreach (TBL_SALESCYCLETIME_DRILL row in sctdrillData)
                    //    {
                    //        this.SetsCollection.Add(new SetValue { Value = row.Value_DL2.ToString(), Color = row.Color, Label = row.Category_Name });
                    //    }
                    //    break;
                    //case ChartID.SalesCycleTimeDrill3:
                    //    sctdrillRepository = new SalesCycleTimeDrillRepository();
                    //    sctdrillData = sctdrillRepository.GetAll();

                    //    foreach (TBL_SALESCYCLETIME_DRILL row in sctdrillData)
                    //    {
                    //        this.SetsCollection.Add(new SetValue { Value = row.Value_DL3.ToString(), Color = row.Color, Label = row.Category_Name });
                    //    }
                    //    break;
                    //case ChartID.SalesCycleTimeDrill4:
                    //    sctdrillRepository = new SalesCycleTimeDrillRepository();
                    //    sctdrillData = sctdrillRepository.GetAll();

                    //    foreach (TBL_SALESCYCLETIME_DRILL row in sctdrillData)
                    //    {
                    //        this.SetsCollection.Add(new SetValue { Value = row.Value_DL4.ToString(), Color = row.Color, Label = row.Category_Name });
                    //    }
                    //    break;
                    //case ChartID.SalesCycleTimeDrill5:
                    //    sctdrillRepository = new SalesCycleTimeDrillRepository();
                    //    sctdrillData = sctdrillRepository.GetAll();

                    //    foreach (TBL_SALESCYCLETIME_DRILL row in sctdrillData)
                    //    {
                    //        this.SetsCollection.Add(new SetValue { Value = row.Value_DL5.ToString(), Color = row.Color, Label = row.Category_Name });
                    //    }
                    //    break;
                    //case ChartID.SalesCycleTimeDrill6:
                    //    sctdrillRepository = new SalesCycleTimeDrillRepository();
                    //    sctdrillData = sctdrillRepository.GetAll();

                    //    foreach (TBL_SALESCYCLETIME_DRILL row in sctdrillData)
                    //    {
                    //        this.SetsCollection.Add(new SetValue { Value = row.Value_DL6.ToString(), Color = row.Color, Label = row.Category_Name });
                    //    }
                    //    break;

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


}