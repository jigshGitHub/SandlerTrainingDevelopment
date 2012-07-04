using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sandler.UI.ChartStructure;
using InfoSoftGlobal;

public partial class Revenue_By_Source : System.Web.UI.Page
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
        Chart rbsValue = new Chart();
        rbsValue.Id = ChartID.RevenueBySourceValue;
        rbsValue.SWF = @"FusionChartLib/MSColumn3D.swf";
        rbsValue.Caption = "Revenue by Source Value";
        rbsValue.BGColor = "FFFFFF";
        rbsValue.BGAlpha = "100";
        rbsValue.CanvasBGColor = "FFFFFF";
        rbsValue.CanvasBGAlpha = "100";
        rbsValue.Width = "100%";
        rbsValue.Hight = "450";
        rbsValue.YaxisName = "Sales Value (in $000)";
        rbsValue.LoadChart();
        rbsValue.CreateChart();

        Chart rbsQty = new Chart();
        rbsQty.Id = ChartID.RevenueBySourceQty;
        rbsQty.SWF = @"FusionChartLib/MSColumn3D.swf";
        rbsQty.Caption = "Revenue by Source Quantity";
        rbsQty.BGColor = "FFFFFF";
        rbsQty.BGAlpha = "100";
        rbsQty.CanvasBGColor = "FFFFFF";
        rbsQty.CanvasBGAlpha = "100";
        rbsQty.Width = "100%";
        rbsQty.Hight = "450";
        rbsQty.YaxisName = "Sales Quantity";
        rbsQty.LoadChart();
        rbsQty.CreateChart();

        //string script = "var chartXMLValue = \"" + rbsValue.ChartXML + "\";var chartXMLQty = \"" + rbsQty.ChartXML + "\"";
        //if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "ChartXML"))
        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "ChartXML", script, true);

        chartContainerValue.Text = FusionCharts.RenderChart(rbsValue.SWF, "", rbsValue.ChartXML, "rbsValuePlots", rbsValue.Width, rbsValue.Hight, false, false);

        chartContainerQty.Text = FusionCharts.RenderChart(rbsQty.SWF, "", rbsQty.ChartXML, "rbsQtyPlots", rbsQty.Width, rbsQty.Hight, false, false);


    }
}