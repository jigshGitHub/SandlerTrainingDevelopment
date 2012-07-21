using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sandler.UI.ChartStructure;
using InfoSoftGlobal;

public partial class Sales_Totals_ByMonth : System.Web.UI.Page
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
        Chart salesTotValue = new Chart();
        salesTotValue.Id = ChartID.SalesTotalsByMonthValue;
        salesTotValue.SWF = @"FusionChartLib/MSColumn3D.swf";
        salesTotValue.Caption = "Sales Total Value, by Month and Year";
        salesTotValue.BGColor = "FFFFFF";
        salesTotValue.BGAlpha = "100";
        salesTotValue.CanvasBGColor = "FFFFFF";
        salesTotValue.CanvasBGAlpha = "100";
        salesTotValue.Width = "100%";
        salesTotValue.Hight = "450";
        salesTotValue.YaxisName = "Sales Value (in $000)";
        salesTotValue.LoadChart();
        salesTotValue.CreateChart();

        Chart salesTotQty = new Chart();
        salesTotQty.Id = ChartID.SalesTotalsByMonthQty;
        salesTotQty.SWF = @"FusionChartLib/MSColumn3D.swf";
        salesTotQty.Caption = "Sales Total Quantity, by Month and Year";
        salesTotQty.BGColor = "FFFFFF";
        salesTotQty.BGAlpha = "100";
        salesTotQty.CanvasBGColor = "FFFFFF";
        salesTotQty.CanvasBGAlpha = "100";
        salesTotQty.Width = "100%";
        salesTotQty.Hight = "450";
        salesTotQty.YaxisName = "Sales Quantity";
        salesTotQty.LoadChart();
        salesTotQty.CreateChart();

        
        chartContainerValue.Text = FusionCharts.RenderChart(salesTotValue.SWF, "", salesTotValue.ChartXML, "salesTotValuePlots", salesTotValue.Width, salesTotValue.Hight, false, false);

        chartContainerQty.Text = FusionCharts.RenderChart(salesTotQty.SWF, "", salesTotQty.ChartXML, "salesTotQtyPlots", salesTotQty.Width, salesTotQty.Hight, false, false);
    }
}