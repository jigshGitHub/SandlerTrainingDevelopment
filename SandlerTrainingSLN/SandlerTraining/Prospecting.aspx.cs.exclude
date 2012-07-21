using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InfoSoftGlobal;
using Sandler.UI.ChartStructure;
public partial class Prospecting : System.Web.UI.Page
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
        BarChart prosChart = new BarChart();
        prosChart.Id = ChartID.ProspectingResults;
        prosChart.SWF = @"FusionChartLib/Column3D.swf";
        prosChart.Caption = "Prospecting Results";
        prosChart.CanvasBGColor = "FFFFFF";
        prosChart.CanvasBGAlpha = "100";
        prosChart.Width = "70%";
        prosChart.Hight = "450";
        prosChart.YaxisName = "Clients";
        prosChart.LoadChart();
        prosChart.CreateChart();

        //string script = "var chartXML = \"" + prosChart.ChartXML + "\";";
        //if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "ChartXML"))
        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "ChartXML", script, true);

        chartContainer.Text = FusionCharts.RenderChart(prosChart.SWF, "", prosChart.ChartXML, "prosChartlots", prosChart.Width, prosChart.Hight, false, false);
    }
}