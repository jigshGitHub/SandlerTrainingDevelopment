using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InfoSoftGlobal;
using Sandler.UI.ChartStructure;

public partial class SCTDrill : System.Web.UI.Page
{
    string drillLevel = "";
    string drillBy = "";
    string drllCategory = "";
    string product = "";
    string company = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["drillCategory"]))
                drllCategory = Request.QueryString["drillCategory"];
            if (!string.IsNullOrEmpty(Request.QueryString["drillLevel"]))
                drillLevel = Request.QueryString["drillLevel"];
            if (!string.IsNullOrEmpty(Request.QueryString["drillBy"]))
                drillBy = Request.QueryString["drillBy"];
            if (Session["Product"] != null)
                product = Session["Product"].ToString();
            if (Session["Company"] != null)
                company = Session["Company"].ToString();
            CreateChart();
        }
    }
    protected void CreateChart()
    {
        PieChart pieChart = new PieChart();
        pieChart.Id = ChartID.SalesCycleTimeDrill;
        pieChart.SWF = @"FusionChartLib/Pie3D.swf";
        if(drillBy  == "Product")
            pieChart.Caption = "Sales Cycle Time " + drllCategory + ", by" + drillBy;
        else if(drillBy == "Company")
            pieChart.Caption = "Sales Cycle Time " + drllCategory + ", " + product + ", by " + drillBy;
        else if (drillBy == "SalesRep")
            pieChart.Caption = "Sales Cycle Time " + drllCategory + ", " + product + ", by " + company + ", by " + drillBy;
        pieChart.CanvasBGColor = "FFFFFF";
        pieChart.CanvasBGAlpha = "100";
        pieChart.Width = "70%";
        pieChart.Hight = "450";
        pieChart.showLabels = "0";
        pieChart.showLegend = "1";
        pieChart.NumberSuffix = "%";
        pieChart.PieRadius = "400";
        pieChart.enableRotation = "1";
        pieChart.DrillLevel = (string.IsNullOrEmpty(drillLevel)) ? 0 : int.Parse(drillLevel);
        pieChart.DrillBy = drillBy;
        pieChart.DrillCategory = drllCategory;
        pieChart.DrillProduct = product;

        pieChart.LoadChart();
        pieChart.CreateChart();

        chartContainer.Text = FusionCharts.RenderChart(pieChart.SWF, "", pieChart.ChartXML, "prosChartlots", pieChart.Width, pieChart.Hight, false, false);
    }
}