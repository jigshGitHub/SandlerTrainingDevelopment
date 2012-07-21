using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sandler.UI.ChartStructure;
using InfoSoftGlobal;

public partial class RetentionRate : System.Web.UI.Page
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
        Chart retrateExp = new Chart();
        retrateExp.Id = ChartID.RetentionRateByExp;
        retrateExp.SWF = @"FusionChartLib/MSColumn3D.swf";
        retrateExp.Caption = "Retention Rate Expenditures";
        retrateExp.BGColor = "FFFFFF";
        retrateExp.BGAlpha = "100";
        retrateExp.CanvasBGColor = "FFFFFF";
        retrateExp.CanvasBGAlpha = "100";
        retrateExp.Width = "100%";
        retrateExp.Hight = "450";
        retrateExp.NumberSuffix = "$";
        retrateExp.YaxisName = "Sales Training Expenditure ($000)";
        retrateExp.LoadChart();
        retrateExp.CreateChart();

        Chart retrateEff = new Chart();
        retrateEff.Id = ChartID.RetentionRateByEff;
        retrateEff.SWF = @"FusionChartLib/MSColumn3D.swf";
        retrateEff.Caption = "Retention Rate Effectiveness";
        retrateEff.BGColor = "FFFFFF";
        retrateEff.BGAlpha = "100";
        retrateEff.CanvasBGColor = "FFFFFF";
        retrateEff.CanvasBGAlpha = "100";
        retrateEff.Width = "100%";
        retrateEff.Hight = "450";
        retrateEff.YaxisName = "Effectiveness in %";
        retrateEff.NumberSuffix = "%";
        retrateEff.LoadChart();
        retrateEff.CreateChart();
                
        chartContainerExp.Text = FusionCharts.RenderChart(retrateExp.SWF, "", retrateExp.ChartXML, "retrateExpPlots", retrateExp.Width, retrateExp.Hight, false, false);

        chartContainerEff.Text = FusionCharts.RenderChart(retrateEff.SWF, "", retrateEff.ChartXML, "retrateEffPlots", retrateEff.Width, retrateEff.Hight, false, false);
    }
}