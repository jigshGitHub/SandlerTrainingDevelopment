    using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SandlerTrainingMVC.Models
{   
    public class Chart
    {
        public string Caption { get; set; }
        public string NumberSuffix { get; set; }
        public string BGColor { get; set; }
        public string BGAlpha { get; set; }
        public string CanvasBGColor { get; set; }
        public string CanvasBGAlpha { get; set; }
        public string XaxisName { get; set; }
        public string YaxisName { get; set; }
        public int Id { get; set; }
        public string PieRadius { get; set; }
        public string showLabels { get; set; }
        public string enableRotation { get; set; }
        public string showLegend { get; set; }
        public List<Category> Categories { get; set; }
        public List<DataSet> DataSetCollection { get; set; }

        public Chart()
        {
            this.Categories = new List<Category>();
            this.DataSetCollection = new List<DataSet>();
        }
    }
    public class Category
    {
        public string Label { get; set; }
        public Category()
        {
        }
    }

    public class DataSet
    {
        public string SeriesName { get; set; }
        public string Color { get; set; }
        public List<SetValue> SetsCollection { get; set; }

        public DataSet()
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