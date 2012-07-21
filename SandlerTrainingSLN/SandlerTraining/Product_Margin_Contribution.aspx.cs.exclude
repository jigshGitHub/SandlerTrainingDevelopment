using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sandler.UI.ChartStructure;
using InfoSoftGlobal;

public partial class Product_Margin_Contribution : System.Web.UI.Page
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
        Chart pmcValue = new Chart();
        pmcValue.Id = ChartID.ProductMarginContributionValue;
        pmcValue.SWF = @"FusionChartLib/MSColumn3D.swf";
        pmcValue.Caption = "Product Margin Contribution Value (in $000)";
        pmcValue.BGColor = "FFFFFF";
        pmcValue.BGAlpha = "100";
        pmcValue.CanvasBGColor = "FFFFFF";
        pmcValue.CanvasBGAlpha = "100";
        pmcValue.Width = "100%";
        pmcValue.Hight = "450";
        pmcValue.YaxisName = "Sales Value (in $000)";
        pmcValue.LoadChart();
        pmcValue.CreateChart();

        Chart pmcQty = new Chart();
        pmcQty.Id = ChartID.ProductMarginContributionQty;
        pmcQty.SWF = @"FusionChartLib/MSColumn3D.swf";
        pmcQty.Caption = "Product Margin Contribution Quantity";
        pmcQty.BGColor = "FFFFFF";
        pmcQty.BGAlpha = "100";
        pmcQty.CanvasBGColor = "FFFFFF";
        pmcQty.CanvasBGAlpha = "100";
        pmcQty.Width = "100%";
        pmcQty.Hight = "450";
        pmcQty.YaxisName = "Sales Quantity";
        pmcQty.LoadChart();
        pmcQty.CreateChart();

        //string script = "var chartXMLValue = \"" + pmcValue.ChartXML + "\";var chartXMLQty = \"" + pmcQty.ChartXML + "\"";
        //if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "ChartXML"))
        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "ChartXML", script, true);

        chartContainerValue.Text = FusionCharts.RenderChart(pmcValue.SWF, "", pmcValue.ChartXML, "pmcValuePlots", pmcValue.Width, pmcValue.Hight, false, false);

        chartContainerQty.Text = FusionCharts.RenderChart(pmcQty.SWF, "", pmcQty.ChartXML, "pmcQtyPlots", pmcQty.Width, pmcQty.Hight, false, false);
    }
}