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


        public void LoadChart(UserModel currentUser)
        {
            try
            {
                this.DrillChartIds = (this.DrillOverride) ? this.Id.ToString() : this.DrillChartIds;
                List<ChartParameter> chartParams = null;
                ChartDataSet lastDs = null;
                UserEntities userEntities;
                IEnumerable<TBL_CONTACTS> contacts;
                IEnumerable<TBL_OPPORTUNITIES> opportunties;
                switch ((ChartID)Enum.Parse(typeof(ChartID), this.Id.ToString(), true))
                {
                    case ChartID.NewAppointmentsBySourceMonth:
                        AppointmentSourceRepository appointmentSource = new AppointmentSourceRepository();
                        foreach (var record in appointmentSource.GetAll().Where(r => r.IsActive == true).AsEnumerable())
                        {
                            this.Categories.Add(new Category { Label = record.ApptSourceName });
                        }

                        userEntities = new UserEntities();
                        contacts = userEntities.GetNewAppointments(currentUser);

                        chartParams = new List<ChartParameter>();
                        chartParams.Add(new ChartParameter { Value = "-2", Color = "3300ff" });
                        chartParams.Add(new ChartParameter { Value = "-1", Color = "ff6600" });
                        chartParams.Add(new ChartParameter { Value = "0", Color = "32df00" });


                        foreach (ChartParameter parameter in chartParams)
                        {
                            if (contacts.Count() > 0)
                            {
                                var data = from record in contacts
                                           where (record.CreatedDate.Value.Year == DateTime.Now.Year && record.CreatedDate.Value.Month == DateTime.Now.AddMonths(int.Parse(parameter.Value)).Month)
                                           group record by new { record.Tbl_AppointmentsSource.ApptSourceName }
                                               into grp
                                               select new { Category = grp.Key.ApptSourceName, Count = grp.Count() };

                                this.DataSetCollection.Add(new ChartDataSet { Color = parameter.Color, SeriesName = DateTime.Now.AddMonths(int.Parse(parameter.Value)).ToString("MMM") });

                                foreach (Category category in this.Categories)
                                {
                                    lastDs = this.DataSetCollection.Last();
                                    lastDs.SetsCollection.Add(new SetValue { Label = category.Label, Link = ChartHelper.GeneratePageLink(lastDs.SeriesName, this.DrillChartIds) });
                                }

                                foreach (var record in data)
                                {
                                    foreach (SetValue set in lastDs.SetsCollection)
                                    {
                                        if (set.Label == record.Category)
                                            set.Value = record.Count.ToString();
                                    }
                                }
                            }
                        }
                        break;

                    case ChartID.NewClientsByProductTypeMonth:

                        ProductTypesRepository productTypesSource = new ProductTypesRepository();
                        foreach (var record in productTypesSource.GetAll().Where(r => r.IsActive == true).AsEnumerable())
                        {
                            this.Categories.Add(new Category { Label = record.ProductTypeName });
                        }

                        userEntities = new UserEntities();
                        opportunties = userEntities.Getopportunities(currentUser);

                        chartParams = new List<ChartParameter>();
                        chartParams.Add(new ChartParameter { Value = "-2", Color = "8A4B08" });
                        chartParams.Add(new ChartParameter { Value = "-1", Color = "0000FF" });
                        chartParams.Add(new ChartParameter { Value = "0", Color = "ff9966" });

                        foreach (ChartParameter parameter in chartParams)
                        {
                            if (opportunties.Count() > 0)
                            {
                                var data = from record in opportunties
                                           where (record.TBL_COMPANIES.IsNewCompany == true && record.CreatedDate.Value.Year == DateTime.Now.Year && record.CreatedDate.Value.Month == DateTime.Now.AddMonths(int.Parse(parameter.Value)).Month)
                                           group record by new { record.Tbl_ProductType.ProductTypeName }
                                               into grp
                                               select new { Category = grp.Key.ProductTypeName, Count = grp.Count() };

                                this.DataSetCollection.Add(new ChartDataSet { Color = parameter.Color, SeriesName = DateTime.Now.AddMonths(int.Parse(parameter.Value)).ToString("MMM") });

                                foreach (Category category in this.Categories)
                                {
                                    lastDs = this.DataSetCollection.Last();
                                    lastDs.SetsCollection.Add(new SetValue { Label = category.Label, Link = ChartHelper.GeneratePageLink(lastDs.SeriesName, this.DrillChartIds) });
                                }

                                foreach (var record in data)
                                {
                                    foreach (SetValue set in lastDs.SetsCollection)
                                    {
                                        if (set.Label == record.Category)
                                            set.Value = record.Count.ToString();
                                    }
                                }
                            }
                        }

                        break;
                    case ChartID.NewClientQuantityAverageContractPriceByMonth:
                        this.Categories.Add(new Category { Label = DateTime.Now.AddMonths(-2).ToString("MMM") });
                        this.Categories.Add(new Category { Label = DateTime.Now.AddMonths(-1).ToString("MMM") });
                        this.Categories.Add(new Category { Label = DateTime.Now.AddMonths(0).ToString("MMM") });

                        this.DataSetCollection.Add(new ChartDataSet { Color = "0000FF", SeriesName = "New Clients" });
                        this.DataSetCollection.Add(new ChartDataSet { Color = "ff6600", SeriesName = "Ave Contract Price" });

                        userEntities = new UserEntities();
                        opportunties = userEntities.Getopportunities(currentUser);

                        if (opportunties.Count() > 0)
                        {
                            string[] colors = new string[] { "CC6600", "9900CC", "FF3300", "0099FF", "00CC66", "FFFF00" };

                            foreach (Category catagory in this.Categories)
                            {
                                try
                                {
                                    System.Nullable<int> newClients = (from record in opportunties
                                                                       where (record.Tbl_ProductType.Id == record.ProductID && record.Tbl_ProductType.ProductTypeName != "Assessment" && record.TBL_COMPANIES.IsNewCompany == true && record.CreatedDate.Value.Year == DateTime.Now.Year && record.CreatedDate.Value.Month == DateTime.ParseExact(catagory.Label, "MMM", null).Month)
                                                                       select record.COMPANYID).Count();

                                    System.Nullable<long> aveContractPrice = (from record in opportunties
                                                                              where (record.Tbl_ProductType.Id == record.ProductID && record.Tbl_ProductType.ProductTypeName != "Assessment" && record.TBL_COMPANIES.IsNewCompany == true && record.CreatedDate.Value.Year == DateTime.Now.Year && record.CreatedDate.Value.Month == DateTime.ParseExact(catagory.Label, "MMM", null).Month)
                                                                              select record.WEIGHTEDVALUE).Sum();


                                    if (aveContractPrice != null && aveContractPrice != null)
                                    {
                                        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = newClients.ToString(), Link = ChartHelper.GeneratePageLink(catagory.Label, this.DrillChartIds) });
                                        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = (aveContractPrice / 5).ToString(), Link = ChartHelper.GeneratePageLink(catagory.Label, this.DrillChartIds) });
                                    }
                                }
                                catch (System.InvalidOperationException)
                                {

                                }

                            }
                        }
                        break;
                    case ChartID.ClassHeadcountByCourseIndustryMonth:
                        this.Categories.Add(new Category { Label = DateTime.Now.AddMonths(-2).ToString("MMM") });
                        this.Categories.Add(new Category { Label = DateTime.Now.AddMonths(-1).ToString("MMM") });
                        this.Categories.Add(new Category { Label = DateTime.Now.AddMonths(0).ToString("MMM") });


                        this.DataSetCollection.Add(new ChartDataSet { Color = "ff6600", SeriesName = "Course" });
                        this.DataSetCollection.Add(new ChartDataSet { Color = "32df00", SeriesName = "Industry" });

                        userEntities = new UserEntities();
                        contacts = userEntities.GetContacts(currentUser);

                        if (contacts.Count() > 0)
                        {

                            foreach (Category catagory in this.Categories)
                            {
                                try
                                {
                                    System.Nullable<int> classHeadCountsCourse = (from record in contacts
                                                                                  where (record.IsRegisteredForTraining == true && record.Tbl_Course.CourseId == record.CourseId && record.Tbl_Course.IsActive == true && record.CourseTrainingDate.Value.Year == DateTime.Now.Year && record.CourseTrainingDate.Value.Month == DateTime.ParseExact(catagory.Label, "MMM", null).Month)
                                                                                  select record.CONTACTSID).Count();

                                    System.Nullable<long> classHeadCountsIndustry = (from record in contacts
                                                                                     where (record.IsRegisteredForTraining == true && record.TBL_COMPANIES.IndustryId == record.TBL_COMPANIES.Tbl_IndustryType.IndId && record.TBL_COMPANIES.IsActive == true && record.TBL_COMPANIES.Tbl_IndustryType.IsActive == true && record.CourseTrainingDate.Value.Year == DateTime.Now.Year && record.CourseTrainingDate.Value.Month == DateTime.ParseExact(catagory.Label, "MMM", null).Month)
                                                                                     select record.COMPANYID).Count();


                                    if (classHeadCountsCourse != null && classHeadCountsIndustry != null)
                                    {
                                        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = classHeadCountsCourse.ToString(), Link = ChartHelper.GeneratePageLink(catagory.Label, this.DrillChartIds) });
                                        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = classHeadCountsIndustry.ToString(), Link = ChartHelper.GeneratePageLink(catagory.Label, this.DrillChartIds) });
                                    }
                                }
                                catch (System.InvalidOperationException)
                                {

                                }

                            }
                        }
                        break;

                    //this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = "24", Link = ChartHelper.GeneratePageLink(this.Categories[0].Label, this.DrillChartIds) });
                    //this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = "30", Link = ChartHelper.GeneratePageLink(this.Categories[1].Label, this.DrillChartIds) });
                    //this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = "31", Link = ChartHelper.GeneratePageLink(this.Categories[2].Label, this.DrillChartIds) });

                    //this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = "22", Link = ChartHelper.GeneratePageLink(this.Categories[0].Label, this.DrillChartIds) });
                    //this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = "24", Link = ChartHelper.GeneratePageLink(this.Categories[1].Label, this.DrillChartIds) });
                    //this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = "20", Link = ChartHelper.GeneratePageLink(this.Categories[2].Label, this.DrillChartIds) });
                    //break;
                    case ChartID.ActualDollarsBookedComparisonGoal:
                        this.Categories.Add(new Category { Label = DateTime.Now.AddMonths(-1).ToString("MMM") });
                        this.Categories.Add(new Category { Label = DateTime.Now.AddMonths(0).ToString("MMM") });
                        this.Categories.Add(new Category { Label = DateTime.Now.AddMonths(1).ToString("MMM") });

                        this.DataSetCollection.Add(new ChartDataSet { Color = "0066ff", SeriesName = "$$Booked" });
                        this.DataSetCollection.Add(new ChartDataSet { Color = "ffff99", SeriesName = "% of Goal" });

                        userEntities = new UserEntities();
                        opportunties = userEntities.Getopportunities(currentUser);

                        if (opportunties.Count() > 0)
                        {
                            string[] colors = new string[] { "CC6600", "9900CC", "FF3300", "0099FF", "00CC66", "FFFF00" };

                            foreach (Category catagory in this.Categories)
                            {
                                try
                                {
                                    System.Nullable<long> actualDollarsBooked = (from record in opportunties
                                                                                 where (record.CLOSEDATE.Value.Year == DateTime.Now.Year && record.CLOSEDATE.Value.Month == DateTime.ParseExact(catagory.Label, "MMM", null).Month)
                                                                                 select record.WEIGHTEDVALUE).Sum();

                                    System.Nullable<long> goalOfDollarsBooked = (from record in opportunties
                                                                                 where (record.CLOSEDATE.Value.Year == DateTime.Now.Year && record.CLOSEDATE.Value.Month == DateTime.ParseExact(catagory.Label, "MMM", null).Month)
                                                                                 select record.VALUE).Sum();


                                    if (actualDollarsBooked != null && goalOfDollarsBooked != null)
                                    {
                                        this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = actualDollarsBooked.ToString(), Link = ChartHelper.GeneratePageLink(catagory.Label, this.DrillChartIds) });
                                        this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = ((Convert.ToDouble(actualDollarsBooked) / Convert.ToDouble(goalOfDollarsBooked)) * 100).ToString("#.##"), Link = ChartHelper.GeneratePageLink(catagory.Label, this.DrillChartIds) });
                                    }
                                }
                                catch (System.InvalidOperationException)
                                {

                                }

                            }
                        }
                        break;

                    //this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = "2200", Link = ChartHelper.GeneratePageLink("", this.DrillChartIds) });
                    //this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = "4500", Link = ChartHelper.GeneratePageLink("", this.DrillChartIds) });
                    //this.DataSetCollection[0].SetsCollection.Add(new SetValue { Value = "5500", Link = ChartHelper.GeneratePageLink("", this.DrillChartIds) });

                    //this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = "40", Link = ChartHelper.GeneratePageLink("", this.DrillChartIds) });
                    //this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = "66", Link = ChartHelper.GeneratePageLink("", this.DrillChartIds) });
                    //this.DataSetCollection[1].SetsCollection.Add(new SetValue { Value = "90", Link = ChartHelper.GeneratePageLink("", this.DrillChartIds) });
                    //break;
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
                UserEntities userEntities;
                switch (this.Id)
                {
                    case ChartID.AverageLengthTimeActiveClientsByIndustry:
                        userEntities = new UserEntities();
                        IEnumerable<TBL_COMPANIES> companies = userEntities.GetCompanies(currentUser);

                        string[] colors = new string[] { "009999", "CC99FF", "FFFF99", "009900", "0066FF" };

                        //SqlMethods.DateDiffMinute(EventTime.TimeStart, EventTime.TimeEnd)).Average()
                        var data = from record in companies
                                   group record by new { Industry = record.Tbl_IndustryType.IndustryTypeName, Months = SqlMethods.DateDiffMonth(record.CreationDate, DateTime.Now) }
                                       into grp
                                       select new { Industry = grp.Key.Industry, Months = grp.Key.Months };


                        IndustryTypeRepository industrySource = new IndustryTypeRepository();
                        int totalMonths = 0;
                        int frequency = 0;
                        double totalAvgMonths;
                        foreach (var record in industrySource.GetAll().Where(r => r.IsActive == true).AsEnumerable())
                        {
                            try
                            {
                                //var companyFiltered = data.Select(r => r.Industry == record.IndustryTypeName).AsEnumerable();
                                //if (companyFiltered.Count() > 0)
                                //{
                                foreach (var d in data)
                                {
                                    if (record.IndustryTypeName == d.Industry)
                                    {
                                        totalMonths += d.Months.Value;
                                        frequency++;
                                    }
                                }
                                if (frequency > 0)
                                {
                                    totalAvgMonths = totalMonths / frequency;
                                    //this.SetsCollection.Add(new SetValue {, , Value = data.Single(r => r.Category == record.ApptSourceName).Count.ToString() });
                                    this.SetsCollection.Add(new SetValue { Color = colors.GetValue(colorIndex).ToString(), Label = record.IndustryTypeName, Value = totalAvgMonths.ToString("#"), Link = ChartHelper.GeneratePageLink("", this.DrillChartIds) });
                                    frequency = 0;
                                    totalMonths = 0;
                                }
                            }
                            catch (System.InvalidOperationException)
                            {

                            }
                            colorIndex++;
                        }
                        //this.SetsCollection.Add(new SetValue { Value = "11", Color = "009999", Label = "Proffesional Svcs", Link = ChartHelper.GeneratePageLink("", this.DrillChartIds) });
                        //this.SetsCollection.Add(new SetValue { Value = "50", Color = "CC99FF", Label = "Service Industry", Link = ChartHelper.GeneratePageLink("", this.DrillChartIds) });
                        //this.SetsCollection.Add(new SetValue { Value = "32", Color = "FFFF99", Label = "Manufacturing", Link = ChartHelper.GeneratePageLink("", this.DrillChartIds) });
                        //this.SetsCollection.Add(new SetValue { Value = "22", Color = "009900", Label = "Software", Link = ChartHelper.GeneratePageLink("", this.DrillChartIds) });
                        //this.SetsCollection.Add(new SetValue { Value = "10", Color = "0066FF", Label = "Consulting", Link = ChartHelper.GeneratePageLink("", this.DrillChartIds) });
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
                UserEntities userEntities;
                switch (this.Id)
                {
                    case ChartID.NewAppointmentsBySource:
                        userEntities = new UserEntities();
                        IEnumerable<TBL_CONTACTS> contacts = userEntities.GetNewAppointments(currentUser);

                        if (contacts.Count() > 0)
                        {
                            var data = from record in contacts
                                       where (record.CreatedDate.Value.Year == DateTime.Now.Year && record.CreatedDate.Value.Month == DateTime.ParseExact(this.DrillBy, "MMM", null).Month)
                                       group record by new { record.Tbl_AppointmentsSource.ApptSourceName }
                                           into grp
                                           select new { Category = grp.Key.ApptSourceName, Count = grp.Count() };

                            string[] colors = new string[] { "00CC66", "0099FF", "FF3300", "9900CC", "CC6600" };

                            AppointmentSourceRepository appointmentSource = new AppointmentSourceRepository();
                            foreach (var record in appointmentSource.GetAll().Where(r => r.IsActive == true).AsEnumerable())
                            {
                                try
                                {
                                    if (data.Single(r => r.Category == record.ApptSourceName) != null)
                                        this.SetsCollection.Add(new SetValue { Color = colors.GetValue(colorIndex).ToString(), Label = record.ApptSourceName, Value = data.Single(r => r.Category == record.ApptSourceName).Count.ToString() });
                                }
                                catch (System.InvalidOperationException)
                                {

                                }
                                colorIndex++;
                            }
                        }
                        break;

                    case ChartID.NewClientByProductType:
                        userEntities = new UserEntities();
                        IEnumerable<TBL_OPPORTUNITIES> opportunties = userEntities.Getopportunities(currentUser);


                        if (opportunties.Count() > 0)
                        {
                            var data = from record in opportunties
                                       where (record.TBL_COMPANIES.IsNewCompany == true && record.CreatedDate.Value.Year == DateTime.Now.Year && record.CreatedDate.Value.Month == DateTime.ParseExact(this.DrillBy, "MMM", null).Month)
                                       group record by new { record.Tbl_ProductType.ProductTypeName }
                                           into grp
                                           select new { Category = grp.Key.ProductTypeName, Count = grp.Count() };

                            string[] colors = new string[] { "CC6600", "9900CC", "FF3300", "0099FF", "00CC66", "FFFF00" };

                            ProductTypesRepository productTypesSource = new ProductTypesRepository();
                            foreach (var record in productTypesSource.GetAll().Where(r => r.IsActive == true).AsEnumerable())
                            {
                                try
                                {
                                    if (data.Single(r => r.Category == record.ProductTypeName) != null)
                                        this.SetsCollection.Add(new SetValue { Color = colors.GetValue(colorIndex).ToString(), Label = record.ProductTypeName, Value = data.Single(r => r.Category == record.ProductTypeName).Count.ToString() });
                                }
                                catch (System.InvalidOperationException)
                                {

                                }
                                colorIndex++;
                            }
                        }

                        break;

                    case ChartID.NewClientQuantity:
                        userEntities = new UserEntities();
                        opportunties = userEntities.Getopportunities(currentUser);


                        if (opportunties.Count() > 0)
                        {
                            var data = from record in opportunties
                                       where (record.Tbl_ProductType.Id == record.ProductID && record.Tbl_ProductType.ProductTypeName != "Assessment" && record.TBL_COMPANIES.IsNewCompany == true && record.CreatedDate.Value.Year == DateTime.Now.Year && record.CreatedDate.Value.Month == DateTime.ParseExact(this.DrillBy, "MMM", null).Month)
                                       group record by new { record.Tbl_ProductType.ProductTypeName }
                                           into grp
                                           select new { Category = grp.Key.ProductTypeName, Count = grp.Count() };

                            string[] colors = new string[] { "CC6600", "9900CC", "FF3300", "0099FF", "00CC66", "FFFF00" };

                            ProductTypesRepository productTypesSource = new ProductTypesRepository();
                            foreach (var record in productTypesSource.GetAll().Where(r => r.IsActive == true).AsEnumerable())
                            {
                                try
                                {
                                    if (data.Single(r => r.Category == record.ProductTypeName) != null)
                                        this.SetsCollection.Add(new SetValue { Color = colors.GetValue(colorIndex).ToString(), Label = record.ProductTypeName, Value = data.Single(r => r.Category == record.ProductTypeName).Count.ToString() });
                                }
                                catch (System.InvalidOperationException)
                                {

                                }
                                colorIndex++;
                            }
                        }

                        break;

                    //this.SetsCollection.Add(new SetValue { Color = "CC6600", Label = "Assessment", Link = "", Value = "15" });
                    //this.SetsCollection.Add(new SetValue { Color = "9900CC", Label = "PC", Link = "", Value = "14" });
                    //this.SetsCollection.Add(new SetValue { Color = "FF3300", Label = "Consulting", Link = "", Value = "17" });
                    //this.SetsCollection.Add(new SetValue { Color = "0099FF", Label = "Training", Link = "", Value = "19" });
                    //this.SetsCollection.Add(new SetValue { Color = "00CC66", Label = "Leadership", Link = "", Value = "18" });
                    //this.SetsCollection.Add(new SetValue { Color = "FFFF00", Label = "Coaching", Link = "", Value = "17" });
                    //break;

                    case ChartID.ContractPrice:
                        userEntities = new UserEntities();
                        opportunties = userEntities.Getopportunities(currentUser);


                        if (opportunties.Count() > 0)
                        {
                            var data = from record in opportunties
                                       where (record.Tbl_ProductType.Id == record.ProductID && record.Tbl_ProductType.ProductTypeName != "Assessment" && record.TBL_COMPANIES.IsNewCompany == true && record.CreatedDate.Value.Year == DateTime.Now.Year && record.CreatedDate.Value.Month == DateTime.ParseExact(this.DrillBy, "MMM", null).Month)
                                       group record by new { record.Tbl_ProductType.ProductTypeName }
                                           into grp
                                           select new { Category = grp.Key.ProductTypeName, AvgPrice = grp.Sum(record => record.WEIGHTEDVALUE) };

                            string[] colors = new string[] { "CC6600", "9900CC", "FF3300", "0099FF", "00CC66", "FFFF00" };

                            ProductTypesRepository productTypesSource = new ProductTypesRepository();
                            foreach (var record in productTypesSource.GetAll().Where(r => r.IsActive == true).AsEnumerable())
                            {
                                try
                                {
                                    if (data.Single(r => r.Category == record.ProductTypeName) != null)
                                        this.SetsCollection.Add(new SetValue { Color = colors.GetValue(colorIndex).ToString(), Label = record.ProductTypeName, Value = ((data.Single(r => r.Category == record.ProductTypeName).AvgPrice) / 5).ToString() });
                                }
                                catch (System.InvalidOperationException)
                                {

                                }
                                colorIndex++;
                            }
                        }

                        break;
                        //this.SetsCollection.Add(new SetValue { Color = "CC6600", Label = "Assessment", Link = "", Value = "15" });
                        //this.SetsCollection.Add(new SetValue { Color = "9900CC", Label = "PC", Link = "", Value = "14" });
                        //this.SetsCollection.Add(new SetValue { Color = "FF3300", Label = "Consulting", Link = "", Value = "17" });
                        //this.SetsCollection.Add(new SetValue { Color = "0099FF", Label = "Training", Link = "", Value = "19" });
                        //this.SetsCollection.Add(new SetValue { Color = "00CC66", Label = "Leadership", Link = "", Value = "18" });
                        //this.SetsCollection.Add(new SetValue { Color = "FFFF00", Label = "Coaching", Link = "", Value = "17" });
                        break;

                    case ChartID.HeadcountByCourse:
                        userEntities = new UserEntities();
                        contacts = userEntities.GetContacts(currentUser);


                        if (contacts.Count() > 0)
                        {
                            var data = from record in contacts
                                       where (record.IsRegisteredForTraining == true && record.Tbl_Course.CourseId == record.CourseId && record.Tbl_Course.IsActive == true && record.CourseTrainingDate.Value.Year == DateTime.Now.Year && record.CourseTrainingDate.Value.Month == DateTime.ParseExact(this.DrillBy, "MMM", null).Month)
                                       group record by new { record.Tbl_Course.CourseName }
                                           into grp
                                           select new { Course = grp.Key.CourseName, Count = grp.Count() };

                            string[] colors = new string[] { "CC6600", "9900CC", "FF3300", "0099FF", "00CC66", "FFFF00" };

                            CourseRepository courseSource = new CourseRepository();
                            foreach (var record in courseSource.GetAll().Where(r => r.IsActive == true).AsEnumerable())
                            {
                                try
                                {
                                    if (data.Single(r => r.Course == record.CourseName) != null)
                                        this.SetsCollection.Add(new SetValue { Color = colors.GetValue(colorIndex).ToString(), Label = record.CourseName, Value = data.Single(r => r.Course == record.CourseName).Count.ToString() });
                                }
                                catch (System.InvalidOperationException)
                                {

                                }
                                colorIndex++;
                            }
                        }

                        break;
                    //this.SetsCollection.Add(new SetValue { Color = "CC6600", Label = "PC", Link = "", Value = "15" });
                    //this.SetsCollection.Add(new SetValue { Color = "9900CC", Label = "Foundation", Link = "", Value = "14" });
                    //this.SetsCollection.Add(new SetValue { Color = "FF3300", Label = "Management", Link = "", Value = "17" });
                    //this.SetsCollection.Add(new SetValue { Color = "0099FF", Label = "Bootcamp", Link = "", Value = "19" });
                    //break;

                    case ChartID.HeadcountByIndustry:
                        userEntities = new UserEntities();
                        contacts = userEntities.GetContacts(currentUser);


                        if (contacts.Count() > 0)
                        {
                            var data = from record in contacts
                                       where (record.IsRegisteredForTraining == true && record.TBL_COMPANIES.IndustryId == record.TBL_COMPANIES.Tbl_IndustryType.IndId && record.TBL_COMPANIES.IsActive == true && record.TBL_COMPANIES.Tbl_IndustryType.IsActive == true && record.CourseTrainingDate.Value.Year == DateTime.Now.Year && record.CourseTrainingDate.Value.Month == DateTime.ParseExact(this.DrillBy, "MMM", null).Month)
                                       group record by new { record.TBL_COMPANIES.Tbl_IndustryType.IndustryTypeName }
                                           into grp
                                           select new { Industry = grp.Key.IndustryTypeName, Count = grp.Count() };

                            string[] colors = new string[] { "9900CC", "FF3300", "0099FF", "00CC66", "FFFF00" };

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
                        }

                        //this.SetsCollection.Add(new SetValue { Color = "9900CC", Label = "Professional Svcs", Link = "", Value = "14" });
                        //this.SetsCollection.Add(new SetValue { Color = "FF3300", Label = "Service Industry", Link = "", Value = "17" });
                        //this.SetsCollection.Add(new SetValue { Color = "0099FF", Label = "Manufacturing", Link = "", Value = "19" });
                        //this.SetsCollection.Add(new SetValue { Color = "00CC66", Label = "Software", Link = "", Value = "18" });
                        //this.SetsCollection.Add(new SetValue { Color = "FFFF00", Label = "Consulting", Link = "", Value = "17" });
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