using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sandler.UI.ChartStructure;
using InfoSoftGlobal;
public partial class Cost_of_Sale : System.Web.UI.Page
{
    string drillLevel = "";
    string drillBy = "Product";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["drillLevel"]))
                drillLevel = Request.QueryString["drillLevel"];
            if (!string.IsNullOrEmpty(Request.QueryString["drillBy"]))
                drillBy = Request.QueryString["drillBy"];
            hdnDrillLevel.Value = drillLevel;
            CreateChart();
        }
    }

    protected void CreateChart()
    {
        Chart cos = new Chart();
        cos.Id = ChartID.CostOfSale;
        cos.SWF = @"FusionChartLib/StackedColumn3D.swf";
        cos.Caption = "Cost of Sale by " + drillBy;
        cos.BGColor = "FFFFFF";
        cos.BGAlpha = "100";
        cos.CanvasBGColor = "FFFFFF";
        cos.CanvasBGAlpha = "100";
        cos.Width = "70%";
        cos.Hight = "450";
        cos.DrillLevel = (string.IsNullOrEmpty(drillLevel)) ? 0 : int.Parse(drillLevel);
        cos.LoadChart();
        cos.CreateChart();

        string script = "var chartXML = \"" + cos.ChartXML + "\";";
        if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "ChartXML"))
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ChartXML", script, true);

        chartContainer.Text = FusionCharts.RenderChart(cos.SWF, "", cos.ChartXML, "COSPlots", cos.Width, cos.Hight, false, false);
            
    }
}