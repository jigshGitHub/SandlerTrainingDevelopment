using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerRepositories;
using Sandler.UI.ChartStructure;
using InfoSoftGlobal;
public partial class ChartPage : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        genericChartLiteral.Text = "";
        ChartID idSelected = (ChartID)Enum.Parse(typeof(ChartID), Request.QueryString["chartId"], true);

        ChartRepository cR = new ChartRepository();
        SandlerModels.TBL_CHART dbChart = cR.GetAll().Where(c => c.ChartID == Request.QueryString["chartId"] && c.IsActive == true).SingleOrDefault();
        IChart chartToLoad;

        if (dbChart.TypeOfChart == "Chart")
        {
            chartToLoad = new Chart() { BGAlpha = dbChart.BgAlpha, BGColor = dbChart.BgColor, CanvasBGAlpha = dbChart.CanvasBgAlpha, CanvasBGColor = dbChart.CanvasBgColor, Caption = dbChart.Caption, SWF = dbChart.SWFile, NumberSuffix = dbChart.NumberSuffix, PieRadius = dbChart.PieRadius, showLabels = dbChart.ShowLabels, showLegend = dbChart.ShowLegend, XaxisName = dbChart.XaxisName, YaxisName = dbChart.YaxisName, Id = idSelected, enableRotation = dbChart.EnableRotation, DrillBy = dbChart.DrillBy, DrillLevel = (dbChart.DrillLevel.HasValue) ? (int)dbChart.DrillLevel : 0 };
            chartToLoad.LoadChart();
            chartToLoad.CreateChart();

            genericChartLiteral.Text = FusionCharts.RenderChart(@"FusionChartLib/" + ((Chart)chartToLoad).SWF, "", ((Chart)chartToLoad).ChartXML, genericChartLiteral.ID, genericChartLiteral.Width, genericChartLiteral.Height, false, true);
        }
        else if (dbChart.TypeOfChart == "PieChart")
        {
            chartToLoad = new PieChart() { BGAlpha = dbChart.BgAlpha, BGColor = dbChart.BgColor, CanvasBGAlpha = dbChart.CanvasBgAlpha, CanvasBGColor = dbChart.CanvasBgColor, Caption = dbChart.Caption, SWF = dbChart.SWFile, NumberSuffix = dbChart.NumberSuffix, PieRadius = dbChart.PieRadius, showLabels = dbChart.ShowLabels, showLegend = dbChart.ShowLegend, XaxisName = dbChart.XaxisName, YaxisName = dbChart.YaxisName, Id = idSelected, enableRotation = dbChart.EnableRotation, DrillBy = dbChart.DrillBy, DrillLevel = (dbChart.DrillLevel.HasValue) ? (int)dbChart.DrillLevel : 0 };
            ((PieChart)chartToLoad).LoadChart();
            ((PieChart)chartToLoad).CreateChart();

            genericChartLiteral.Text = FusionCharts.RenderChart(@"FusionChartLib/" + ((PieChart)chartToLoad).SWF, "", ((PieChart)chartToLoad).ChartXML, genericChartLiteral.ID, genericChartLiteral.Width, genericChartLiteral.Height, false, true);
        }
        else if (dbChart.TypeOfChart == "BarChart")
        {
            chartToLoad = new BarChart() { BGAlpha = dbChart.BgAlpha, BGColor = dbChart.BgColor, CanvasBGAlpha = dbChart.CanvasBgAlpha, CanvasBGColor = dbChart.CanvasBgColor, Caption = dbChart.Caption, SWF = dbChart.SWFile, NumberSuffix = dbChart.NumberSuffix, PieRadius = dbChart.PieRadius, showLabels = dbChart.ShowLabels, showLegend = dbChart.ShowLegend, XaxisName = dbChart.XaxisName, YaxisName = dbChart.YaxisName, Id = idSelected, enableRotation = dbChart.EnableRotation, DrillBy = dbChart.DrillBy, DrillLevel = (dbChart.DrillLevel.HasValue) ? (int)dbChart.DrillLevel : 0 };
            ((BarChart)chartToLoad).LoadChart();
            ((BarChart)chartToLoad).CreateChart();
            genericChartLiteral.Text = FusionCharts.RenderChart(@"FusionChartLib/" + ((BarChart)chartToLoad).SWF, "", ((BarChart)chartToLoad).ChartXML, genericChartLiteral.ID, genericChartLiteral.Width, genericChartLiteral.Height, false, true); ;
        }
    }
}