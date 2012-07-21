using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sandler.UI.ChartStructure;
using InfoSoftGlobal;

public partial class Return_On_Trng_Invest : System.Web.UI.Page
{
    Chart ROIChart;
    public Return_On_Trng_Invest()
    {
        ROIChart = new Chart();
        ROIChart.Id = ChartID.ReturnOnTrainingInvestment;
        ROIChart.SWF = @"FusionChartLib/MSColumn3d.swf";
        ROIChart.Caption = "Return On Training Investment";
        ROIChart.BGColor = "FFFFFF";
        ROIChart.BGAlpha = "100";
        ROIChart.NumberSuffix = "%";
        ROIChart.Width = "70%";
        ROIChart.Hight = "450";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CreateChart();
        }
    }
    public void CreateChart()
    {
        ROIChart.LoadChart();
        ROIChart.CreateChart();

        chartContainer.Text = FusionCharts.RenderChart(ROIChart.SWF, "", ROIChart.ChartXML, "ROIChartPlots", ROIChart.Width, ROIChart.Hight, false, false);
    }
}