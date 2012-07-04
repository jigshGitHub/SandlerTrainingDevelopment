using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sandler.UI.ChartStructure;
using InfoSoftGlobal;

public partial class Prod_Sold_By_Company : System.Web.UI.Page
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
        Chart psbcValue = new Chart();
        psbcValue.Id = ChartID.ProductSoldByCompValue;
        psbcValue.SWF = @"FusionChartLib/MSColumn3D.swf";
        psbcValue.Caption = "Products Sold by Company Value";
        psbcValue.BGColor = "FFFFFF";
        psbcValue.BGAlpha = "100";
        psbcValue.CanvasBGColor = "FFFFFF";
        psbcValue.CanvasBGAlpha = "100";
        psbcValue.Width = "100%";
        psbcValue.Hight = "450";
        psbcValue.YaxisName = "Sales Value (in $000)";
        psbcValue.LoadChart();
        psbcValue.CreateChart();

        Chart psbcQty = new Chart();
        psbcQty.Id = ChartID.ProductSoldByCompQty;
        psbcQty.SWF = @"FusionChartLib/MSColumn3D.swf";
        psbcQty.Caption = "Products Sold by Company Quantity";
        psbcQty.BGColor = "FFFFFF";
        psbcQty.BGAlpha = "100";
        psbcQty.CanvasBGColor = "FFFFFF";
        psbcQty.CanvasBGAlpha = "100";
        psbcQty.Width = "100%";
        psbcQty.Hight = "450";
        psbcQty.YaxisName = "Sales Quantity";
        psbcQty.LoadChart();
        psbcQty.CreateChart();

        //string script = "var chartXMLValue = \"" + psbcValue.ChartXML + "\";var chartXMLQty = \"" + psbcQty.ChartXML + "\"";
        //if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "ChartXML"))
        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "ChartXML", script, true);

        chartContainerValue.Text = FusionCharts.RenderChart(psbcValue.SWF, "", psbcValue.ChartXML, "psbcValuePlots", psbcValue.Width, psbcValue.Hight, false, false);

        chartContainerQty.Text = FusionCharts.RenderChart(psbcQty.SWF, "", psbcQty.ChartXML, "psbcQtyPlots", psbcQty.Width, psbcQty.Hight, false, false);

        
    }
}