using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sandler.UI.ChartStructure;
using InfoSoftGlobal;

public partial class IndustryAve : System.Web.UI.Page
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
        Chart iAve = new Chart();
        iAve.Id = ChartID.IndustryAve;
        iAve.SWF = @"FusionChartLib/MSColumn3D.swf";
        iAve.Caption = "Industry Averages";
        iAve.BGColor = "FFFFFF";
        iAve.BGAlpha = "100";
        iAve.CanvasBGColor = "FFFFFF";
        iAve.CanvasBGAlpha = "100";
        iAve.Width = "70%";
        iAve.Hight = "450";
        iAve.LoadChart();
        iAve.CreateChart();

        //string script = "var chartXML = \"" + iAve.ChartXML + "\";";
        //if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "ChartXML"))
        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "ChartXML", script, true);

        chartContainer.Text = FusionCharts.RenderChart(iAve.SWF, "", iAve.ChartXML, "iAvelots", iAve.Width, iAve.Hight, false, false);
    }
}