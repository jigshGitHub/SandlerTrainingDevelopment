using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Sandler.Data;
using Sandler.UI.ChartStructure;
using InfoSoftGlobal;
public partial class GapAnalysisCreate : System.Web.UI.Page
{
    private IGapAnalysis gaData;

    public GapAnalysisCreate()
    {
        gaData = new GapAnalysis();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            PopulateData();
            PopulateSalesRepresentativeData();
        }

    }

    protected void btnViewGapAnalysisReport_Click(object sender, EventArgs e)
    {
        UpdateSalesRepresentativeData();
        //Server.Transfer("Default.aspx");
        Chart gaChart = new Chart();
        gaChart.Id = ChartID.GapAnalysis;
        gaChart.SWF = @"FusionChartLib/MSBar3D.swf";
        gaChart.Caption = "Gap Analysis";
        gaChart.CanvasBGColor = "FFFFFF";
        gaChart.CanvasBGAlpha = "100";
        gaChart.NumberSuffix = "%";
        gaChart.Width = "100%";
        gaChart.Hight = "450";
        gaChart.LoadChart();
        gaChart.CreateChart();
        pnlChart.FindControl("chartContainer").Controls.Add(new LiteralControl(FusionCharts.RenderChart(gaChart.SWF, "", gaChart.ChartXML, "gaChartlots", gaChart.Width, gaChart.Hight, false, false)));
        pnlChart_ModalPopupExtender.Show();
    }

    private void PopulateData()
    {
        DataSet data = gaData.GetData();
        if (data != null)
        {
            drpListSCTAsIs.DataSource = data.Tables[0];
            drpListSCTAsIs.DataTextField = "SalesCycleTime";
            drpListSCTAsIs.DataValueField = "PercentofIndustryAve";
            drpListSCTAsIs.DataBind();

            drpListSCTToBe.DataSource = data.Tables[0];
            drpListSCTToBe.DataTextField = "SalesCycleTime";
            drpListSCTToBe.DataValueField = "PercentofIndustryAve";
            drpListSCTToBe.DataBind();

            drpListSEAsIs.DataSource = data.Tables[1];
            drpListSEAsIs.DataTextField = "SalesEfficiency";
            drpListSEAsIs.DataValueField = "PercentofIndustryAve";
            drpListSEAsIs.DataBind();

            drpListSEToBe.DataSource = data.Tables[1];
            drpListSEToBe.DataTextField = "SalesEfficiency";
            drpListSEToBe.DataValueField = "PercentofIndustryAve";
            drpListSEToBe.DataBind();

            drpListSQAsIs.DataSource = data.Tables[2];
            drpListSQAsIs.DataTextField = "SalesQualification";
            drpListSQAsIs.DataValueField = "PercentofIndustryAve";
            drpListSQAsIs.DataBind();

            drpListSQToBe.DataSource = data.Tables[2];
            drpListSQToBe.DataTextField = "SalesQualification";
            drpListSQToBe.DataValueField = "PercentofIndustryAve";
            drpListSQToBe.DataBind();

            drpListTCSAsIs.DataSource = data.Tables[3];
            drpListTCSAsIs.DataTextField = "TrngCostSavings";
            drpListTCSAsIs.DataValueField = "PercentofIndustryAve";
            drpListTCSAsIs.DataBind();

            drpListTCSToBe.DataSource = data.Tables[3];
            drpListTCSToBe.DataTextField = "TrngCostSavings";
            drpListTCSToBe.DataValueField = "PercentofIndustryAve";
            drpListTCSToBe.DataBind();

            drpListQAAsIs.DataSource = data.Tables[4];
            drpListQAAsIs.DataTextField = "QuotaAchievement";
            drpListQAAsIs.DataValueField = "PercentofIndustryAve";
            drpListQAAsIs.DataBind();

            drpListQAToBe.DataSource = data.Tables[4];
            drpListQAToBe.DataTextField = "QuotaAchievement";
            drpListQAToBe.DataValueField = "PercentofIndustryAve";
            drpListQAToBe.DataBind();

            drpListEBGAsIS.DataSource = data.Tables[5];
            drpListEBGAsIS.DataTextField = "EstBenefitsGained";
            drpListEBGAsIS.DataValueField = "PercentofIndustryAve";
            drpListEBGAsIS.DataBind();

            drpListEBGToBe.DataSource = data.Tables[5];
            drpListEBGToBe.DataTextField = "EstBenefitsGained";
            drpListEBGToBe.DataValueField = "PercentofIndustryAve";
            drpListEBGToBe.DataBind();
        }

    }    

    private void PopulateSalesRepresentativeData()
    {
        SqlDataReader reader = null;
        try
        {
            reader = gaData.GetSalesRepresentativeData("1");
            while(reader.Read())
            {
                drpListSCTAsIs.SelectedValue = reader.GetValue(5).ToString();
                drpListSEAsIs.SelectedValue = reader.GetValue(6).ToString();
                drpListSQAsIs.SelectedValue = reader.GetValue(7).ToString();
                drpListTCSAsIs.SelectedValue = reader.GetValue(8).ToString();
                drpListQAAsIs.SelectedValue = reader.GetValue(9).ToString();
                drpListEBGAsIS.SelectedValue = reader.GetValue(10).ToString();

                drpListSCTToBe.SelectedValue = reader.GetValue(11).ToString();
                drpListSEToBe.SelectedValue = reader.GetValue(12).ToString();
                drpListSQToBe.SelectedValue = reader.GetValue(13).ToString();
                drpListTCSToBe.SelectedValue = reader.GetValue(14).ToString();
                drpListQAToBe.SelectedValue = reader.GetValue(15).ToString();
                drpListEBGToBe.SelectedValue = reader.GetValue(16).ToString();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            if(reader != null)
                if (!reader.IsClosed)
                    reader.Close();
        }
    }

    private void UpdateSalesRepresentativeData()
    {
        gaData.UpdateSalesRepresentativeData("1", drpListSCTAsIs.SelectedItem.Text, drpListSEAsIs.SelectedItem.Text, drpListSQAsIs.SelectedItem.Text, drpListTCSAsIs.SelectedItem.Text, drpListQAAsIs.SelectedItem.Text, drpListEBGAsIS.SelectedItem.Text, drpListSCTAsIs.SelectedItem.Value, drpListSEAsIs.SelectedItem.Value, drpListSQAsIs.SelectedItem.Value, drpListTCSAsIs.SelectedItem.Value, drpListQAAsIs.SelectedItem.Value, drpListEBGAsIS.SelectedItem.Value, drpListSCTToBe.SelectedItem.Text, drpListSEToBe.SelectedItem.Text, drpListSQToBe.SelectedItem.Text, drpListTCSToBe.SelectedItem.Text, drpListQAToBe.SelectedItem.Text, drpListEBGToBe.SelectedItem.Text, drpListSCTToBe.SelectedItem.Value, drpListSEToBe.SelectedItem.Value, drpListSQToBe.SelectedItem.Value, drpListTCSToBe.SelectedItem.Value, drpListQAToBe.SelectedItem.Value, drpListEBGToBe.SelectedItem.Value);
    }

    
    

    
}