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
using SandlerWeb = Sandler.Web;
using System.Text;
public partial class ChartUC : System.Web.UI.UserControl
{
    public string ChartIds { get; set; }
    public int GAId { get; set; }
    public string ChartSubType { get; set; }
    public string ChartWidth { get; set; }
    public string ChartHeight { get; set; }
    public string UserName { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BasePage page = this.Page as BasePage;
            ChartIds = Request.QueryString[page.QUERYSTRINGPARAMDRILLCHARTIDS];
            ChartSubType = Request.QueryString["SubType"];
            ChartWidth = page.GENERICCHARTLITERALWIDTH;
            ChartHeight = page.GENERICCHARTLITERALHEIGHT;
            UserName = page.CurrentUser.UserName;
            GAId = (!String.IsNullOrEmpty(Request.QueryString["GAId"])) ? int.Parse(Request.QueryString["GAId"]) : 0;

            StringBuilder jScript = new StringBuilder("<script type='text/javascript'>");
            jScript.Append("var chartIds='" + ChartIds + "';");
            jScript.Append("var chartSubType='" + ChartSubType + "';");
            jScript.Append("var userName='" + UserName + "';");
            jScript.Append("var chartWidth='" + ChartWidth + "';");
            jScript.Append("var chartHeight='" + ChartHeight + "';");
            jScript.Append("var gaId='" + GAId + "';");
            jScript.Append("</script>");
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(),"setUpChartAPIProperties", jScript.ToString());
            //string[] chartIds = Request.QueryString[page.QUERYSTRINGPARAMDRILLCHARTIDS].Split(new char[] { '_' });
            //string chartSubtype = Request.QueryString["SubType"];
            //ChartLiteral genericChartLiteral;
            //ChartID idSelected;
            //ChartRepository cR;
            //SandlerModels.TBL_CHART dbChart;
            //IChart chartToLoad;
            //int GAid = (!String.IsNullOrEmpty(Request.QueryString["GAId"])) ? int.Parse(Request.QueryString["GAId"]) : 0;

            //foreach (string chartId in chartIds)
            //{
            //    genericChartLiteral = new ChartLiteral();
            //    genericChartLiteral.ID = chartId;
            //    genericChartLiteral.Text = "";
            //    genericChartLiteral.Width = page.GENERICCHARTLITERALWIDTH;
            //    genericChartLiteral.Height = page.GENERICCHARTLITERALHEIGHT;

            //    idSelected = (ChartID)Enum.Parse(typeof(ChartID), chartId, true);

            //    cR = new ChartRepository();
            //    dbChart = cR.GetAll().Where(c => c.ChartID == chartId && c.IsActive == true).SingleOrDefault();


            //    if (dbChart.TypeOfChart == "Chart")
            //    {
            //        chartToLoad = new Chart() {GAId=GAid, BGAlpha = dbChart.BgAlpha, BGColor = dbChart.BgColor, CanvasBGAlpha = dbChart.CanvasBgAlpha, CanvasBGColor = dbChart.CanvasBgColor, Caption = dbChart.Caption, SWF = dbChart.SWFile, NumberSuffix = dbChart.NumberSuffix, PieRadius = dbChart.PieRadius, showLabels = dbChart.ShowLabels, showLegend = dbChart.ShowLegend, XaxisName = dbChart.XaxisName, YaxisName = dbChart.YaxisName, Id = idSelected, enableRotation = dbChart.EnableRotation, DrillChartIds = (string.IsNullOrEmpty(dbChart.DrillLevelChartIDs)) ? "" : dbChart.DrillLevelChartIDs, DrillOverride = false, DrillBy = (string.IsNullOrEmpty(Request.QueryString[page.QUERYSTRINGPARAMDRILLBY])) ? "" : Request.QueryString[page.QUERYSTRINGPARAMDRILLBY] };
            //        chartToLoad.LoadChart(page.CurrentUser);
            //        chartToLoad.CreateChart();

            //        genericChartLiteral.Text = FusionCharts.RenderChart(@"FusionChartLib/" + ((Chart)chartToLoad).SWF, "", ((Chart)chartToLoad).ChartXML, genericChartLiteral.ID, genericChartLiteral.Width, genericChartLiteral.Height, false, true);
            //    }
            //    else if (dbChart.TypeOfChart == "PieChart")
            //    {
            //        chartToLoad = new PieChart() { GAId=GAid,BGAlpha = dbChart.BgAlpha, BGColor = dbChart.BgColor, CanvasBGAlpha = dbChart.CanvasBgAlpha, CanvasBGColor = dbChart.CanvasBgColor, Caption = dbChart.Caption, SWF = dbChart.SWFile, NumberSuffix = dbChart.NumberSuffix, PieRadius = dbChart.PieRadius, showLabels = dbChart.ShowLabels, showLegend = dbChart.ShowLegend, XaxisName = dbChart.XaxisName, YaxisName = dbChart.YaxisName, Id = idSelected, enableRotation = dbChart.EnableRotation, DrillChartIds = (string.IsNullOrEmpty(dbChart.DrillLevelChartIDs)) ? "" : dbChart.DrillLevelChartIDs, DrillOverride = false, DrillBy = (string.IsNullOrEmpty(Request.QueryString[page.QUERYSTRINGPARAMDRILLBY])) ? "" : Request.QueryString[page.QUERYSTRINGPARAMDRILLBY] };
            //        ((PieChart)chartToLoad).LoadChart(page.CurrentUser);
            //        ((PieChart)chartToLoad).CreateChart();

            //        genericChartLiteral.Text = FusionCharts.RenderChart(@"FusionChartLib/" + ((PieChart)chartToLoad).SWF, "", ((PieChart)chartToLoad).ChartXML, genericChartLiteral.ID, genericChartLiteral.Width, genericChartLiteral.Height, false, true);
            //    }
            //    else if (dbChart.TypeOfChart == "BarChart")
            //    {
            //        chartToLoad = new BarChart() {GAId=GAid, BGAlpha = dbChart.BgAlpha, BGColor = dbChart.BgColor, CanvasBGAlpha = dbChart.CanvasBgAlpha, CanvasBGColor = dbChart.CanvasBgColor, Caption = dbChart.Caption, SWF = dbChart.SWFile, NumberSuffix = dbChart.NumberSuffix, PieRadius = dbChart.PieRadius, showLabels = dbChart.ShowLabels, showLegend = dbChart.ShowLegend, XaxisName = dbChart.XaxisName, YaxisName = dbChart.YaxisName, Id = idSelected, enableRotation = dbChart.EnableRotation, DrillChartIds = (string.IsNullOrEmpty(dbChart.DrillLevelChartIDs)) ? "" : dbChart.DrillLevelChartIDs, DrillOverride = false, DrillBy = (string.IsNullOrEmpty(Request.QueryString[page.QUERYSTRINGPARAMDRILLBY])) ? "" : Request.QueryString[page.QUERYSTRINGPARAMDRILLBY] };
            //        ((BarChart)chartToLoad).LoadChart(page.CurrentUser);
            //        ((BarChart)chartToLoad).CreateChart();
            //        genericChartLiteral.Text = FusionCharts.RenderChart(@"FusionChartLib/" + ((BarChart)chartToLoad).SWF, "", ((BarChart)chartToLoad).ChartXML, genericChartLiteral.ID, genericChartLiteral.Width, genericChartLiteral.Height, false, true); ;
            //    }
            //    chartPanel.Controls.Add(genericChartLiteral);
            //}
        }
    }
}