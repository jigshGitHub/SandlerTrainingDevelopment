using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

using System.Text;
using InfoSoftGlobal;
using Sandler.UI.ChartStructure;
using System.Web.UI.HtmlControls;
using SandlerRepositories;

public partial class _Default : BasePage
{
    public _Default()
    {
        try
        {

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!Page.IsPostBack)
        {
            PlotGraphs();
        }
    }

    private void PlotGraphs()
    {
        try
        {
            ChartID idSelected;
            IChart chartToLoad;

            foreach (Control control in Page.Master.FindControl("MainContent").Controls)
            {
                if (control.GetType().Name == "ChartLiteral")
                {
                    SandlerControls.ChartLiteral literalControl = control as SandlerControls.ChartLiteral;
                    literalControl.Text = "";

                    idSelected = (ChartID)Enum.Parse(typeof(ChartID), literalControl.ID, true);

                    ChartRepository cR = new ChartRepository();
                    SandlerModels.TBL_CHART dbChart = cR.GetAll().Where(c => c.ChartID == literalControl.ID && c.IsActive == true).SingleOrDefault();


                    if (dbChart.TypeOfChart == "Chart")
                    {
                        chartToLoad = new Chart() { BGAlpha = dbChart.BgAlpha, BGColor = dbChart.BgColor, CanvasBGAlpha = dbChart.CanvasBgAlpha, CanvasBGColor = dbChart.CanvasBgColor, Caption = dbChart.Caption, SWF = dbChart.SWFile, NumberSuffix = dbChart.NumberSuffix, PieRadius = dbChart.PieRadius, showLabels = dbChart.ShowLabels, showLegend = dbChart.ShowLegend, XaxisName = dbChart.XaxisName, YaxisName = dbChart.YaxisName, Id = idSelected, enableRotation = dbChart.EnableRotation,  DrillChartIds = (string.IsNullOrEmpty(dbChart.DrillLevelChartIDs)) ? "" : dbChart.DrillLevelChartIDs };
                        chartToLoad.LoadChart();
                        chartToLoad.CreateChart();

                        literalControl.Text = FusionCharts.RenderChart(@"FusionChartLib/" + ((Chart)chartToLoad).SWF, "", ((Chart)chartToLoad).ChartXML, literalControl.ID, literalControl.Width, literalControl.Height, false, true);
                    }
                    else if (dbChart.TypeOfChart == "PieChart")
                    {
                        chartToLoad = new PieChart() { BGAlpha = dbChart.BgAlpha, BGColor = dbChart.BgColor, CanvasBGAlpha = dbChart.CanvasBgAlpha, CanvasBGColor = dbChart.CanvasBgColor, Caption = dbChart.Caption, SWF = dbChart.SWFile, NumberSuffix = dbChart.NumberSuffix, PieRadius = dbChart.PieRadius, showLabels = dbChart.ShowLabels, showLegend = dbChart.ShowLegend, XaxisName = dbChart.XaxisName, YaxisName = dbChart.YaxisName, Id = idSelected, enableRotation = dbChart.EnableRotation,  DrillChartIds = (string.IsNullOrEmpty(dbChart.DrillLevelChartIDs)) ? "" : dbChart.DrillLevelChartIDs };
                        ((PieChart)chartToLoad).LoadChart();
                        ((PieChart)chartToLoad).CreateChart();

                        literalControl.Text = FusionCharts.RenderChart(@"FusionChartLib/" + ((PieChart)chartToLoad).SWF, "", ((PieChart)chartToLoad).ChartXML, literalControl.ID, literalControl.Width, literalControl.Height, false, true);
                    }
                    else if (dbChart.TypeOfChart == "BarChart")
                    {
                        chartToLoad = new BarChart() { BGAlpha = dbChart.BgAlpha, BGColor = dbChart.BgColor, CanvasBGAlpha = dbChart.CanvasBgAlpha, CanvasBGColor = dbChart.CanvasBgColor, Caption = dbChart.Caption, SWF = dbChart.SWFile, NumberSuffix = dbChart.NumberSuffix, PieRadius = dbChart.PieRadius, showLabels = dbChart.ShowLabels, showLegend = dbChart.ShowLegend, XaxisName = dbChart.XaxisName, YaxisName = dbChart.YaxisName, Id = idSelected, enableRotation = dbChart.EnableRotation,  DrillChartIds = (string.IsNullOrEmpty(dbChart.DrillLevelChartIDs)) ? "" : dbChart.DrillLevelChartIDs };
                        ((BarChart)chartToLoad).LoadChart();
                        ((BarChart)chartToLoad).CreateChart();
                        literalControl.Text = FusionCharts.RenderChart(@"FusionChartLib/" + ((BarChart)chartToLoad).SWF, "", ((BarChart)chartToLoad).ChartXML, literalControl.ID, literalControl.Width, literalControl.Height, false, true); ;
                    }

                }
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void btnCustomize_Click(object sender, EventArgs e)
    {
        Session["SessionSelectedCharts"] = null;
        PlotGraphs();
    }
}
