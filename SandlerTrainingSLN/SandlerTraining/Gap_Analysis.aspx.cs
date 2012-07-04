using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InfoSoftGlobal;
using Sandler.UI.ChartStructure;

public partial class Gap_Analysis : System.Web.UI.Page
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
        Chart gaChart = new Chart();
        gaChart.Id = ChartID.GapAnalysis;
        gaChart.SWF = @"FusionChartLib/MSBar3D.swf";
        gaChart.Caption = "Gap Analysis";
        gaChart.CanvasBGColor = "FFFFFF";
        gaChart.CanvasBGAlpha = "100";
        gaChart.NumberSuffix = "%";
        gaChart.Width = "70%";
        gaChart.Hight = "450";
        gaChart.LoadChart();
        gaChart.CreateChart();

        chartContainer.Text = FusionCharts.RenderChart(gaChart.SWF, "", gaChart.ChartXML, "gaChartlots", gaChart.Width, gaChart.Hight, false, false);
    }
}