using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InfoSoftGlobal;
using Sandler.UI.ChartStructure;

public partial class SCTDrill03 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CreateChart();
        }
    }
    protected void CreateChart()
    {
        PieChart pieChart = new PieChart();
        pieChart.Id = ChartID.SalesCycleTimeDrill3;
        pieChart.SWF = @"FusionChartLib/Pie3D.swf";
        pieChart.Caption = "Sales Cycle Time by Product - 6 Months to 12 Months";
        pieChart.CanvasBGColor = "FFFFFF";
        pieChart.CanvasBGAlpha = "100";
        pieChart.Width = "70%";
        pieChart.Hight = "450";
        pieChart.showLabels = "0";
        pieChart.showLegend = "1";
        pieChart.NumberSuffix = "%";
        pieChart.PieRadius = "400";
        pieChart.enableRotation = "1";

        pieChart.LoadChart();
        pieChart.CreateChart();

        chartContainer.Text = FusionCharts.RenderChart(pieChart.SWF, "", pieChart.ChartXML, "prosChartlots", pieChart.Width, pieChart.Hight, false, false);
    }
}