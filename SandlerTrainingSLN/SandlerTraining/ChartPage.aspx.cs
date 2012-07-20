using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerRepositories;
using Sandler.UI.ChartStructure;
using InfoSoftGlobal;
using SandlerControls;
using System.Web.UI.HtmlControls;
public partial class ChartPage : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string[] chartIds = Request.QueryString[QUERYSTRINGPARAMDRILLCHARTIDS].Split(new char[] { '_' });
        ChartLiteral genericChartLiteral;
        ChartID idSelected;
        ChartRepository cR;
        SandlerModels.TBL_CHART dbChart;
        IChart chartToLoad;

        foreach (string chartId in chartIds)
        {            
            genericChartLiteral = new ChartLiteral();
            genericChartLiteral.ID = chartId;
            genericChartLiteral.Text = "";
            genericChartLiteral.Width = GENERICCHARTLITERALWIDTH;
            genericChartLiteral.Height = GENERICCHARTLITERALHEIGHT;

            idSelected = (ChartID)Enum.Parse(typeof(ChartID), chartId, true);

            cR = new ChartRepository();
            dbChart = cR.GetAll().Where(c => c.ChartID == chartId && c.IsActive == true).SingleOrDefault();
            

            if (dbChart.TypeOfChart == "Chart")
            {
                chartToLoad = new Chart() { BGAlpha = dbChart.BgAlpha, BGColor = dbChart.BgColor, CanvasBGAlpha = dbChart.CanvasBgAlpha, CanvasBGColor = dbChart.CanvasBgColor, Caption = dbChart.Caption, SWF = dbChart.SWFile, NumberSuffix = dbChart.NumberSuffix, PieRadius = dbChart.PieRadius, showLabels = dbChart.ShowLabels, showLegend = dbChart.ShowLegend, XaxisName = dbChart.XaxisName, YaxisName = dbChart.YaxisName, Id = idSelected, enableRotation = dbChart.EnableRotation, DrillBy = Request.QueryString[QUERYSTRINGPARAMDRILLBY], DrillChartIds = (string.IsNullOrEmpty(dbChart.DrillLevelChartIDs)) ? "" : dbChart.DrillLevelChartIDs, DrillOverride = false };
                chartToLoad.LoadChart();
                chartToLoad.CreateChart();

                genericChartLiteral.Text = FusionCharts.RenderChart(@"FusionChartLib/" + ((Chart)chartToLoad).SWF, "", ((Chart)chartToLoad).ChartXML, genericChartLiteral.ID, genericChartLiteral.Width, genericChartLiteral.Height, false, true);
            }
            else if (dbChart.TypeOfChart == "PieChart")
            {
                chartToLoad = new PieChart() { BGAlpha = dbChart.BgAlpha, BGColor = dbChart.BgColor, CanvasBGAlpha = dbChart.CanvasBgAlpha, CanvasBGColor = dbChart.CanvasBgColor, Caption = dbChart.Caption, SWF = dbChart.SWFile, NumberSuffix = dbChart.NumberSuffix, PieRadius = dbChart.PieRadius, showLabels = dbChart.ShowLabels, showLegend = dbChart.ShowLegend, XaxisName = dbChart.XaxisName, YaxisName = dbChart.YaxisName, Id = idSelected, enableRotation = dbChart.EnableRotation, DrillBy = Request.QueryString[QUERYSTRINGPARAMDRILLBY], DrillChartIds = (string.IsNullOrEmpty(dbChart.DrillLevelChartIDs)) ? "" : dbChart.DrillLevelChartIDs, DrillOverride = false };
                ((PieChart)chartToLoad).LoadChart();
                ((PieChart)chartToLoad).CreateChart();

                genericChartLiteral.Text = FusionCharts.RenderChart(@"FusionChartLib/" + ((PieChart)chartToLoad).SWF, "", ((PieChart)chartToLoad).ChartXML, genericChartLiteral.ID, genericChartLiteral.Width, genericChartLiteral.Height, false, true);
            }
            else if (dbChart.TypeOfChart == "BarChart")
            {
                chartToLoad = new BarChart() { BGAlpha = dbChart.BgAlpha, BGColor = dbChart.BgColor, CanvasBGAlpha = dbChart.CanvasBgAlpha, CanvasBGColor = dbChart.CanvasBgColor, Caption = dbChart.Caption, SWF = dbChart.SWFile, NumberSuffix = dbChart.NumberSuffix, PieRadius = dbChart.PieRadius, showLabels = dbChart.ShowLabels, showLegend = dbChart.ShowLegend, XaxisName = dbChart.XaxisName, YaxisName = dbChart.YaxisName, Id = idSelected, enableRotation = dbChart.EnableRotation, DrillBy = Request.QueryString[QUERYSTRINGPARAMDRILLBY], DrillChartIds = (string.IsNullOrEmpty(dbChart.DrillLevelChartIDs)) ? "" : dbChart.DrillLevelChartIDs, DrillOverride = false };
                ((BarChart)chartToLoad).LoadChart();
                ((BarChart)chartToLoad).CreateChart();
                genericChartLiteral.Text = FusionCharts.RenderChart(@"FusionChartLib/" + ((BarChart)chartToLoad).SWF, "", ((BarChart)chartToLoad).ChartXML, genericChartLiteral.ID, genericChartLiteral.Width, genericChartLiteral.Height, false, true); ;
            }
            chartPanel.Controls.Add(genericChartLiteral);           
        }
    }
}