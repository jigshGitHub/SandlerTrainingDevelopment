using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

using System.Text;
using InfoSoftGlobal;
using Sandler.UI.ChartStructure;

public partial class Reports : System.Web.UI.Page
{
    SandlerRepositories.IGapAnalysis gaData;
    string gapAnalysisXML;
    string roiXML;
    Chart ROIChart;
    Chart cos;
    Chart retrateEff;
    Chart gAChart;
    BarChart prosChart;
    PieChart sCTChart;
    public Reports()
    {
        gaData = new SandlerRepositories.GapAnalysis();

        ROIChart = new Chart();
        ROIChart.Id = ChartID.ReturnOnTrainingInvestment;
        ROIChart.SWF = @"FusionChartLib/MSColumn3d.swf";
        ROIChart.Caption = "Return On Training Investment";
        ROIChart.BGColor = "FFFFFF";
        ROIChart.BGAlpha = "100";
        ROIChart.NumberSuffix = "%";
        ROIChart.Width = "100%";
        ROIChart.Hight = "250";

        cos = new Chart();
        cos.Id = ChartID.CostOfSale;
        cos.SWF = @"FusionChartLib/StackedColumn3D.swf";
        cos.Caption = "Cost of Sale by Product";
        cos.BGColor = "FFFFFF";
        cos.BGAlpha = "100";
        cos.CanvasBGColor = "FFFFFF";
        cos.CanvasBGAlpha = "100";
        cos.Width = "100%";
        cos.Hight = "250";
        cos.DrillLevel = 0;

        retrateEff = new Chart();
        retrateEff.Id = ChartID.RetentionRateByEff;
        retrateEff.SWF = @"FusionChartLib/MSColumn3D.swf";
        retrateEff.Caption = "Retention Rate Effectiveness";
        retrateEff.BGColor = "FFFFFF";
        retrateEff.BGAlpha = "100";
        retrateEff.CanvasBGColor = "FFFFFF";
        retrateEff.CanvasBGAlpha = "100";
        retrateEff.Width = "100%";
        retrateEff.Hight = "250";
        retrateEff.YaxisName = "Effectiveness in %";
        retrateEff.NumberSuffix = "%";

        gAChart = new Chart();
        gAChart.Id = ChartID.GapAnalysis;
        gAChart.SWF = @"FusionChartLib/MSBar3D.swf";
        gAChart.Caption = "Gap Analysis";
        gAChart.CanvasBGColor = "FFFFFF";
        gAChart.CanvasBGAlpha = "100";
        gAChart.NumberSuffix = "%";
        gAChart.Width = "100%";
        gAChart.Hight = "250";

        prosChart = new BarChart();
        prosChart.Id = ChartID.ProspectingResults;
        prosChart.SWF = @"FusionChartLib/Column3D.swf";
        prosChart.Caption = "Prospecting Results";
        prosChart.CanvasBGColor = "FFFFFF";
        prosChart.CanvasBGAlpha = "100";
        prosChart.Width = "100%";
        prosChart.Hight = "250";
        prosChart.YaxisName = "Clients";

        sCTChart = new PieChart();
        sCTChart.Id = ChartID.SalesCycleTimeMain;
        sCTChart.SWF = @"FusionChartLib/Pie3D.swf";
        sCTChart.Caption = "Sales Cycle Time";
        sCTChart.CanvasBGColor = "FFFFFF";
        sCTChart.CanvasBGAlpha = "100";
        sCTChart.Width = "100%";
        sCTChart.Hight = "250";
        sCTChart.showLabels = "0";
        sCTChart.showLegend = "1";
        sCTChart.NumberSuffix = "%";
        sCTChart.PieRadius = "100";
        sCTChart.enableRotation = "1";

        
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            PlotGraphs();
    }

    private void PlotGraphs()
    {
        try
        {
            //GenerateGraphsXMLs();
            LoadROIChart();
            LoadCOSChart();
            LoadRetensionRateChart();
            LoadGAChart();
            LoadProspectingResultsChart();
            LoadSalesCycleTimeChart();
            //gaChart.Text = FusionCharts.RenderChart("FusionChartLib/MSBar3D.swf", "", gapAnalysisXML, "GAPlots", "100%", "250", false, false);
            //sctChart.Text = FusionCharts.RenderChart("FusionChartLib/Pie3D.swf", "FusionChartLib/SalesCycleTime.xml", "", "SCTPlots", "100%", "250", false, false);
            //cosbpChart.Text = FusionCharts.RenderChart("FusionChartLib/StackedColumn3D.swf", "FusionChartLib/CostOfSale.xml", "", "COSPlots", "100%", "250", false, false);
            //rrChart.Text = FusionCharts.RenderChart("FusionChartLib/MSColumn3d.swf", "FusionChartLib/Retention_Rate_Effectiveness.xml", "", "RRPlots", "100%", "250", false, false);
            //prChart.Text = FusionCharts.RenderChart("FusionChartLib/Column3D.swf", "FusionChartLib/Prospecting.xml", "", "PRPlots", "100%", "250", false, false);
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void GenerateGraphsXMLs()
    {
        try
        {
            gapAnalysisXML = GenerateGapAnalysisXML("1");
        }
        catch (Exception ex)
        {
        }
    }

    private string GenerateGapAnalysisXML(string repId)
    {
        SqlDataReader reader = null;
        StringBuilder gaXML = null;
        try
        {
            gaXML = new StringBuilder("<chart caption='Gap Analysis' numberSuffix='%' canvasBgColor='FFFFFF' canvasBgAlpha='100'>");
            gaXML.Append("<categories>");
            gaXML.Append("<category label='Sales Cycle Time' />");
            gaXML.Append("<category label='Sales Efficiency' />");
            gaXML.Append("<category label='Sales Qualification' />");
            gaXML.Append("<category label='Trng Cost Savings' />");
            gaXML.Append("<category label='Quota Achievement' />");
            gaXML.Append("<category label='Estimated Benifits Gained' />");
            gaXML.Append("</categories>");
            reader = gaData.GetByRepId(repId);
            while (reader.Read())
            {
                gaXML.Append("<dataset seriesName='As-Is' color='0000FF'>");

                gaXML.Append("<set  value='" + reader.GetValue(5).ToString() + "' link='GapAnalysisCreate.aspx' />");
                gaXML.Append("<set  value='" + reader.GetValue(6).ToString() + "' link='GapAnalysisCreate.aspx' />");
                gaXML.Append("<set  value='" + reader.GetValue(7).ToString() + "' link='GapAnalysisCreate.aspx'  />");
                gaXML.Append("<set  value='" + reader.GetValue(8).ToString() + "' link='GapAnalysisCreate.aspx' />");
                gaXML.Append("<set  value='" + reader.GetValue(9).ToString() + "' link='GapAnalysisCreate.aspx' />");
                gaXML.Append("<set  value='" + reader.GetValue(10).ToString() + "' link='GapAnalysisCreate.aspx' />");

                gaXML.Append("</dataset>");

                gaXML.Append("<dataset seriesName='To-Be' color='8A4B08'>");

                gaXML.Append("<set  value='" + reader.GetValue(11).ToString() + "' link='GapAnalysisCreate.aspx' />");
                gaXML.Append("<set  value='" + reader.GetValue(12).ToString() + "' link='GapAnalysisCreate.aspx' />");
                gaXML.Append("<set  value='" + reader.GetValue(13).ToString() + "' link='GapAnalysisCreate.aspx'  />");
                gaXML.Append("<set  value='" + reader.GetValue(14).ToString() + "' link='GapAnalysisCreate.aspx' />");
                gaXML.Append("<set  value='" + reader.GetValue(15).ToString() + "' link='GapAnalysisCreate.aspx' />");
                gaXML.Append("<set  value='" + reader.GetValue(16).ToString() + "' link='GapAnalysisCreate.aspx' />");

                gaXML.Append("</dataset>");
            }
            gaXML.Append("</chart>");
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            if (reader != null)
                if (!reader.IsClosed)
                    reader.Close();
        }
        return gaXML.ToString();
    }

    private void LoadROIChart()
    {
        ROIChart.LoadChart();
        ROIChart.CreateChart();

        if (ROIChart.ChartXML.Contains("<set "))
            roiChart.Text = FusionCharts.RenderChart(ROIChart.SWF, "", ROIChart.ChartXML, "ROIChartPlots", ROIChart.Width, ROIChart.Hight, false, false);
        else
            roiChart.Text = FusionCharts.RenderChart("FusionChartLib/MSColumn3d.swf", "FusionChartLib/ReturnOnTrainingInvestment.xml", "", "ROIPlots", "100%", "250", false, false);
    }

    private void LoadCOSChart()
    {
        cos.LoadChart();
        cos.CreateChart();

        cosbpChart.Text = FusionCharts.RenderChart(cos.SWF, "", cos.ChartXML, "COSPlots", cos.Width, cos.Hight, false, false);
    }

    private void LoadRetensionRateChart()
    {
        retrateEff.LoadChart();
        retrateEff.CreateChart();

        rrChart.Text = FusionCharts.RenderChart(retrateEff.SWF, "", retrateEff.ChartXML, "retrateEffPlots", retrateEff.Width, retrateEff.Hight, false, false);
    }

    private void LoadGAChart()
    {
        gAChart.LoadChart();
        gAChart.CreateChart();

        gaChart.Text = FusionCharts.RenderChart(gAChart.SWF, "", gAChart.ChartXML, "gAChartlots", gAChart.Width, gAChart.Hight, false, false);
    }

    private void LoadProspectingResultsChart()
    {
        prosChart.LoadChart();
        prosChart.CreateChart();

        prChart.Text = FusionCharts.RenderChart(prosChart.SWF, "", prosChart.ChartXML, "prosChartlots", prosChart.Width, prosChart.Hight, false, false);
    }

    private void LoadSalesCycleTimeChart()
    {
        sCTChart.LoadChart();
        sCTChart.CreateChart();

        sctChart.Text = FusionCharts.RenderChart(sCTChart.SWF, "", sCTChart.ChartXML, "scTChartlots", sCTChart.Width, sCTChart.Hight, false, false);
    }
}