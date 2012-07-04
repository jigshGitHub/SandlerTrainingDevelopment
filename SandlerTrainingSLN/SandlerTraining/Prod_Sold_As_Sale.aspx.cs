using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sandler.UI.ChartStructure;
using InfoSoftGlobal;

public partial class Prod_Sold_As_Sale : System.Web.UI.Page
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
        Chart psasValue = new Chart();
        psasValue.Id = ChartID.ProdSoldByRepValue;
        psasValue.SWF = @"FusionChartLib/MSColumn3D.swf";
        psasValue.Caption = "Products Sold as a 1st Sale Value";
        psasValue.BGColor = "FFFFFF";
        psasValue.BGAlpha = "100";
        psasValue.CanvasBGColor = "FFFFFF";
        psasValue.CanvasBGAlpha = "100";
        psasValue.Width = "100%";
        psasValue.Hight = "450";
        psasValue.YaxisName = "Sales Value (in $000)";
        psasValue.LoadChart();
        psasValue.CreateChart();

        Chart psasQty = new Chart();
        psasQty.Id = ChartID.ProdSoldByRepQty;
        psasQty.SWF = @"FusionChartLib/MSColumn3D.swf";
        psasQty.Caption = "Products Sold as a 1st Sale Quantity";
        psasQty.BGColor = "FFFFFF";
        psasQty.BGAlpha = "100";
        psasQty.CanvasBGColor = "FFFFFF";
        psasQty.CanvasBGAlpha = "100";
        psasQty.Width = "100%";
        psasQty.Hight = "450";
        psasQty.YaxisName = "Sales Quantity";
        psasQty.LoadChart();
        psasQty.CreateChart();

        //string script = "var chartXMLValue = \"" + psasValue.ChartXML + "\";var chartXMLQty = \"" + psasQty.ChartXML + "\"";
        //if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "ChartXML"))
        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "ChartXML", script, true);

        chartContainerValue.Text = FusionCharts.RenderChart(psasValue.SWF, "", psasValue.ChartXML, "psasValuePlots", psasValue.Width, psasValue.Hight, false, false);

        chartContainerQty.Text = FusionCharts.RenderChart(psasQty.SWF, "", psasQty.ChartXML, "psasQtyPlots", psasQty.Width, psasQty.Hight, false, false);
    }
}