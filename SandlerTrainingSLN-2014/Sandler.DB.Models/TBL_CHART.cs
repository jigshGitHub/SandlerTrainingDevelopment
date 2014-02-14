//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Sandler.DB.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class TBL_CHART
    {
        public int Id { get; set; }
        public string TypeOfChart { get; set; }
        public string Caption { get; set; }
        public string SWFile { get; set; }
        public string ChartID { get; set; }
        public string NumberSuffix { get; set; }
        public string SNumberSuffix { get; set; }
        public string XaxisName { get; set; }
        public string YaxisName { get; set; }
        public string CanvasBgColor { get; set; }
        public string BgColor { get; set; }
        public string CanvasBgAlpha { get; set; }
        public string BgAlpha { get; set; }
        public string PieRadius { get; set; }
        public string EnableRotation { get; set; }
        public string ShowLegend { get; set; }
        public string ShowLabels { get; set; }
        public string PlotGradientColor { get; set; }
        public string DrillLevelChartIDs { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<System.DateTime> LastUpdatedDate { get; set; }
        public Nullable<System.DateTime> LastCreatedDate { get; set; }
        public Nullable<System.Guid> LastUpdatedBy { get; set; }
        public Nullable<System.Guid> LastCreatedBy { get; set; }
    }
}
