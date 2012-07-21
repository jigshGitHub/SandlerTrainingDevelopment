using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sandler.UI.ChartStructure;
using InfoSoftGlobal;

public partial class Product_Sales_by_Activity : System.Web.UI.Page
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
        Chart psaValue = new Chart();
        psaValue.Id = ChartID.ProductSalesActivityValue;
        psaValue.SWF = @"FusionChartLib/MSColumn3D.swf";
        psaValue.Caption = "Product Sales by Activity Value";
        psaValue.BGColor = "FFFFFF";
        psaValue.BGAlpha = "100";
        psaValue.CanvasBGColor = "FFFFFF";
        psaValue.CanvasBGAlpha = "100";
        psaValue.Width = "100%";
        psaValue.Hight = "450";
        psaValue.YaxisName = "Sales Value (in $000)";
        psaValue.LoadChart();
        psaValue.CreateChart();

        Chart psaQty = new Chart();
        psaQty.Id = ChartID.ProductSalesActivityQty;
        psaQty.SWF = @"FusionChartLib/MSColumn3D.swf";
        psaQty.Caption = "Product Sales by Activity Quantity";
        psaQty.BGColor = "FFFFFF";
        psaQty.BGAlpha = "100";
        psaQty.CanvasBGColor = "FFFFFF";
        psaQty.CanvasBGAlpha = "100";
        psaQty.Width = "100%";
        psaQty.Hight = "450";
        psaQty.YaxisName = "Sales Quantity";
        psaQty.LoadChart();
        psaQty.CreateChart();

        //string script = "var chartXMLValue = \"" + psaValue.ChartXML + "\";var chartXMLQty = \"" + psaQty.ChartXML + "\"";
        //if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "ChartXML"))
        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "ChartXML", script, true);

        chartContainerValue.Text = FusionCharts.RenderChart(psaValue.SWF, "", psaValue.ChartXML, "psaValuePlots", psaValue.Width, psaValue.Hight, false, false);

        chartContainerQty.Text = FusionCharts.RenderChart(psaQty.SWF, "", psaQty.ChartXML, "psaQtyPlots", psaQty.Width, psaQty.Hight, false, false);
    }
}