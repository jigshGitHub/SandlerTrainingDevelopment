using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sandler.UI.ChartStructure;
using InfoSoftGlobal;

public partial class Prod_Sold_By_Rep : System.Web.UI.Page
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
        Chart psbrValue = new Chart();
        psbrValue.Id = ChartID.ProdSoldByRepValue;
        psbrValue.SWF = @"FusionChartLib/MSColumn3D.swf";
        psbrValue.Caption = "Products Sold by Rep Value";
        psbrValue.BGColor = "FFFFFF";
        psbrValue.BGAlpha = "100";
        psbrValue.CanvasBGColor = "FFFFFF";
        psbrValue.CanvasBGAlpha = "100";
        psbrValue.Width = "100%";
        psbrValue.Hight = "450";
        psbrValue.YaxisName = "Sales Value (in $000)";
        psbrValue.LoadChart();
        psbrValue.CreateChart();

        Chart psbrQty = new Chart();
        psbrQty.Id = ChartID.ProdSoldByRepQty;
        psbrQty.SWF = @"FusionChartLib/MSColumn3D.swf";
        psbrQty.Caption = "Products Sold by Rep Quantity";
        psbrQty.BGColor = "FFFFFF";
        psbrQty.BGAlpha = "100";
        psbrQty.CanvasBGColor = "FFFFFF";
        psbrQty.CanvasBGAlpha = "100";
        psbrQty.Width = "100%";
        psbrQty.Hight = "450";
        psbrQty.YaxisName = "Sales Quantity";
        psbrQty.LoadChart();
        psbrQty.CreateChart();

        //string script = "var chartXMLValue = \"" + psbrValue.ChartXML + "\";var chartXMLQty = \"" + psbrQty.ChartXML + "\"";
        //if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "ChartXML"))
        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "ChartXML", script, true);

        chartContainerValue.Text = FusionCharts.RenderChart(psbrValue.SWF, "", psbrValue.ChartXML, "psbrValuePlots", psbrValue.Width, psbrValue.Hight, false, false);

        chartContainerQty.Text = FusionCharts.RenderChart(psbrQty.SWF, "", psbrQty.ChartXML, "psbrQtyPlots", psbrQty.Width, psbrQty.Hight, false, false);
    }
}