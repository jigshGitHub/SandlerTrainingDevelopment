using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InfoSoftGlobal;
using Sandler.UI.ChartStructure;

public partial class ProductsSales : System.Web.UI.Page
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
        BarChart ChartVP1 = new BarChart();
        ChartVP1.Id = ChartID.SalesValuePeriod1;
        ChartVP1.SWF = @"FusionChartLib/Column3D.swf";
        ChartVP1.Caption = "Sales Product: 2010 Sales Value";
        ChartVP1.CanvasBGColor = "FFF7b7";
        ChartVP1.CanvasBGAlpha = "100";
        ChartVP1.Width = "100%";
        ChartVP1.Hight = "250";
        ChartVP1.YaxisName = "Sales Value in ($000)";
        ChartVP1.LoadChart();
        ChartVP1.CreateChart();

        BarChart ChartVP2 = new BarChart();
        ChartVP2.Id = ChartID.SalesValuePeriod2;
        ChartVP2.SWF = @"FusionChartLib/Column3D.swf";
        ChartVP2.Caption = "Sales Product: 2011 Sales Value";
        ChartVP2.CanvasBGColor = "C0E0DA";
        ChartVP2.CanvasBGAlpha = "100";
        ChartVP2.Width = "100%";
        ChartVP2.Hight = "250";
        ChartVP2.YaxisName = "Sales Value in ($000)";
        ChartVP2.LoadChart();
        ChartVP2.CreateChart();

        BarChart ChartVP3 = new BarChart();
        ChartVP3.Id = ChartID.SalesValuePeriod3;
        ChartVP3.SWF = @"FusionChartLib/Column3D.swf";
        ChartVP3.Caption = "Sales Product: 2012 Sales Value";
        ChartVP3.CanvasBGColor = "4985d6";
        ChartVP3.CanvasBGAlpha = "100";
        ChartVP3.Width = "100%";
        ChartVP3.Hight = "250";
        ChartVP3.YaxisName = "Sales Value in ($000)";
        ChartVP3.LoadChart();
        ChartVP3.CreateChart();
        
        BarChart ChartQP1 = new BarChart();
        ChartQP1.Id = ChartID.SalesQtyPeriod1;
        ChartQP1.SWF = @"FusionChartLib/Column3D.swf";
        ChartQP1.Caption = "Sales Product: 2010 Sales Qty";
        ChartQP1.CanvasBGColor = "FFF7b7";
        ChartQP1.CanvasBGAlpha = "100";
        ChartQP1.Width = "100%";
        ChartQP1.Hight = "250";
        ChartQP1.YaxisName = "Sales Quantity";
        ChartQP1.LoadChart();
        ChartQP1.CreateChart();

        BarChart ChartQP2 = new BarChart();
        ChartQP2.Id = ChartID.SalesQtyPeriod2;
        ChartQP2.SWF = @"FusionChartLib/Column3D.swf";
        ChartQP2.Caption = "Sales Product: 2011 Sales Qty";
        ChartQP2.CanvasBGColor = "C0E0DA";
        ChartQP2.CanvasBGAlpha = "100";
        ChartQP2.Width = "100%";
        ChartQP2.Hight = "250";
        ChartQP2.YaxisName = "Sales Quantity";
        ChartQP2.LoadChart();
        ChartQP2.CreateChart();

        BarChart ChartQP3 = new BarChart();
        ChartQP3.Id = ChartID.SalesQtyPeriod3;
        ChartQP3.SWF = @"FusionChartLib/Column3D.swf";
        ChartQP3.Caption = "Sales Product: 2012 Sales Qty";
        ChartQP3.CanvasBGColor = "4985d6";
        ChartQP3.CanvasBGAlpha = "100";
        ChartQP3.Width = "100%";
        ChartQP3.Hight = "250";
        ChartQP3.YaxisName = "Sales Quantity";
        ChartQP3.LoadChart();
        ChartQP3.CreateChart();
        
        //For Value
        chartContainerVP1.Text = FusionCharts.RenderChart(ChartVP1.SWF, "", ChartVP1.ChartXML, "ChartVP1lots", ChartVP1.Width, ChartVP1.Hight, false, false);
        chartContainerVP2.Text = FusionCharts.RenderChart(ChartVP2.SWF, "", ChartVP2.ChartXML, "ChartVP2lots", ChartVP2.Width, ChartVP2.Hight, false, false);
        chartContainerVP3.Text = FusionCharts.RenderChart(ChartVP3.SWF, "", ChartVP3.ChartXML, "ChartVP3lots", ChartVP3.Width, ChartVP3.Hight, false, false);
        //for Quantity
        chartContainerQP1.Text = FusionCharts.RenderChart(ChartQP1.SWF, "", ChartQP1.ChartXML, "ChartQP1lots", ChartQP1.Width, ChartQP1.Hight, false, false);
        chartContainerQP2.Text = FusionCharts.RenderChart(ChartQP2.SWF, "", ChartQP2.ChartXML, "ChartQP2lots", ChartQP2.Width, ChartQP2.Hight, false, false);
        chartContainerQP3.Text = FusionCharts.RenderChart(ChartQP3.SWF, "", ChartQP3.ChartXML, "ChartQP3lots", ChartQP3.Width, ChartQP3.Hight, false, false);


    }
}