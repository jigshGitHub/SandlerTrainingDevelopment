using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using SandlerModels;
using SandlerRepositories;
namespace SandlerTrainingMVC.Controllers
{
    public class ChartController : ApiController
    {
        public ChartModel Get(string id)
        {
            ChartRepository cR = new ChartRepository();
            SandlerModels.TBL_CHART dbChart = cR.GetAll().Where(c => c.ChartID == "CostOfSale" && c.IsActive == true).SingleOrDefault();
            return new ChartModel();
            //Chart chart = new Chart();
            //chart.bgAlpha = dbChart.BgAlpha;
            //chart.bgColor = dbChart.BgColor;
            //chart.canvasBgAlpha = dbChart.CanvasBgAlpha;
            //chart.canvasBgColor = dbChart.CanvasBgColor;
            //chart.caption = dbChart.Caption;
            //chart.enableRotation = dbChart.EnableRotation;
            //chart.numberPrefix = dbChart.NumberSuffix;
            //chart.numberSuffix = dbChart.NumberSuffix;
            //chart.pieRadius = dbChart.PieRadius;
            //chart.showLabels = dbChart.ShowLabels;
            //chart.showLegend = dbChart.ShowLegend;
            //chart.plotGradientColor = dbChart.PlotGradientColor;
            //chart.sNumberSuffix = dbChart.SNumberSuffix;

            //chart.categories = new List<Category>();
            //chart.categories.Add(new Category("2010"));
            //chart.categories.Add(new Category("2011"));


            //List<Set> sets = new List<Set>();
            //sets.Add(new Set("","10","",".html"));
            //sets.Add(new Set("", "20", "", ".html"));

            //chart.datasets = new List<Dataset>();
            //chart.datasets.Add(new Dataset("Growth Company","9933CC",sets));
            //sets.Clear();
            //sets.Add(new Set("","30","",".html"));
            //sets.Add(new Set("","40","",".html"));
            //chart.datasets.Add(new Dataset("Marginal Company", "009966", sets));
            //return chart;
        }
    }

    public class Chart
    {
        public string Caption;
        public string XAxisName;
        public string YAxisName;
        public string ShaowValues;
        public string FormatNumberScale;
        public string ShowBorder;
        public string CanvasBGColor;
        public string CanvasBGAlpha;
        public string BGColor;
        public string BGAlpha;
        public string PieRadius;
        public string ShowLegend;
        public string EnableRotation;
        public string ShowLabels;
        public string NumberSuffix;
        public string SNumberSuffix;
        public string PlotGradientColor;
        
    }
    public class Set
    {
        public string label;
        public string value;
        public string color;
        public string link;

        public Set(string _label, string _value, string _color, string _link)
        {
            label = _label;
            value = _value;
            color = _color;
            link = _link;
        }
    }

    public class DataSet
    {
        public string seriesName;
        public string color;
        public List<Set> set;
        public DataSet(string _seriesName, string _color)
        {
            seriesName = _seriesName;
            color = _color;
            set = new List<Set>();
        }
    }

    public class Category
    {
        public string label;
        public Category(string _label)
        {
            label = _label;
        }
    }
    public class ChartModel
    {
        public Chart chart;
        public List<Category> categories;
        public List<DataSet> dataset;
        public List<Set> set;
        
        public ChartModel()
        {
            /*
            chart = new Chart();
            chart.Caption = "Monthly Unit Sales";
            chart.FormatNumberScale = "0";
            chart.ShowBorder = "0";
            chart.ShaowValues = "0";
            chart.XAxisName = "Month";
            chart.YAxisName = "Units";
            set = new List<Set>();
            set.Add(new Set("Jan", "462", "", ""));
            set.Add(new Set("Feb", "857", "", ""));
            set.Add(new Set("Mar", "671", "", ""));
            set.Add(new Set("Apr", "494", "", ""));
            set.Add(new Set("May", "761", "", ""));
            set.Add(new Set("Jun", "960", "", ""));
            set.Add(new Set("Jul", "629", "", ""));
            set.Add(new Set("Aug", "622", "", ""));
            set.Add(new Set("Sep", "376", "", ""));
            set.Add(new Set("Oct", "494", "", ""));
            set.Add(new Set("Nov", "761", "", ""));
            set.Add(new Set("Dec", "960", "", ""));
            */
            
            chart = new Chart();
            chart.Caption = "Return On Training Investment";
            chart.NumberSuffix = "%";
            chart.CanvasBGColor = "FFFFFF";
            chart.CanvasBGAlpha = "100";

            categories = new List<Category>();
            categories.Add(new Category("Year 1"));
            categories.Add(new Category("Year 2"));
            categories.Add(new Category("Year 3"));

            List<Set> set;
            set = new List<Set>();
            set.Add(new Set("", "85", "", ""));
            set.Add(new Set("", "95", "", ""));
            set.Add(new Set("", "75", "", ""));

            DataSet ds = new DataSet("Original ROI", "0000FF");
            ds.set = set;

            dataset = new List<DataSet>();
            dataset.Add(ds);

            set = new List<Set>();
            set.Add(new Set("", "55", "", ""));
            set.Add(new Set("", "65", "", ""));
            set.Add(new Set("", "45", "", ""));

            ds = new DataSet("Modified ROI", "F7D358");
            ds.set = set;
            dataset.Add(ds);
        }

    }
    /*
    public class Chart
    {
        public string caption { get; set; }
        public string numberSuffix { get; set; }
        public string canvasBgColor { get; set; }
        public string canvasBgAlpha { get; set; }
        public string bgColor { get; set; }
        public string bgAlpha { get; set; }
        public string numberPrefix { get; set; }
        public string sNumberSuffix { get; set; }
        public string plotGradientColor { get; set; }
        public string enableRotation { get; set; }
        public string pieRadius { get; set; }
        public string showLabels { get; set; }
        public string showLegend { get; set; }
        public List<Category> categories;
        public List<Dataset> datasets;
        public List<Set> sets;
    }

    public class Category
    {
        public string label { get; set; }
        public Category(string _label)
        {
            label = _label;
        }

    }

    public class Dataset
    {
        public string seriesName { get; set; }
        public string color { get; set; }
        public List<Set> sets;
        public Dataset(string _seriesName, string _color, List<Set> _sets)
        {
            seriesName = _seriesName;
            color = _color;
            sets = _sets;
        }
    }

    public class Set
    {
        public string label { get; set; }
        public string value { get; set; }
        public string color { get; set; }
        public string link { get; set; }
        public Set(string _label, string _value, string _color, string _link)
        {
            label = _label;
            value = _value;
            color = _color;
            link = _link;
        }
    }
    */

}
