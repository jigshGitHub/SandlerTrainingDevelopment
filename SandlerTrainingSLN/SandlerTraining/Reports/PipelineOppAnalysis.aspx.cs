using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerModels.DataIntegration;
using Sandler.UI.ChartStructure;
using SandlerRepositories;
using InfoSoftGlobal;
public partial class Reports_PipelineOppAnalysis : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (string.IsNullOrEmpty(Request.QueryString[QUERYSTRINGPARAMDRILLBY]))
            {
                BindCompanies();
                radBtnCompanySelection.Items[2].Selected = true;
            }
            else
            {
                wzGapAnalysis.ActiveStepIndex = 1;
                PlotSecondIterationGraph(Request.QueryString[QUERYSTRINGPARAMDRILLCHARTIDS], Request.QueryString[QUERYSTRINGPARAMDRILLBY], Request.QueryString["SubType"]);
            }
        }

    }

    protected void lnlNextStep_Click(object sender, CommandEventArgs e)
    {
        string commandArg = e.CommandArgument.ToString();
        string commandName = e.CommandName;
        lblResult.Text = "";

        if (commandArg == "1")
        {
            if (IsDataValid())
            {
                wzGapAnalysis.ActiveStepIndex = int.Parse(commandArg);

                PlotFirstIterationGraph();
            }

        }
    }

    protected void ddlCreateDefaultSelection(object sender, EventArgs e)
    {
        DropDownList dropdownList = sender as DropDownList;
        if (!(dropdownList.Items.Count == 0))
        {
            string defaultSelection = "";
            switch (dropdownList.ID)
            {
                case "drpLstCompanies":
                    defaultSelection = "--Select one company--";
                    break;
                default:
                    defaultSelection = "";
                    break;
            }
            ListItem selectItem = new ListItem(defaultSelection, "0");
            dropdownList.Items.Insert(0, selectItem);
        }
    }

    protected void lbxCreateDefaultSelection(object sender, EventArgs e)
    {
        ListBox lstCompanies = sender as ListBox;
        if (!(lstCompanies.Items.Count == 0))
        {
            string defaultSelection = "";
            switch (lstCompanies.ID)
            {
                case "lstCompanies":
                    defaultSelection = "--Select multiple company--";
                    break;
                default:
                    defaultSelection = "";
                    break;
            }
            ListItem selectItem = new ListItem(defaultSelection, "0");
            lstCompanies.Items.Insert(0, selectItem);
        }
    }

    private void BindCompanies()
    {
        drpLstCompanies.DataSource = UserEntitiesFactory.Get(this.CurrentUser).Companies;
        drpLstCompanies.DataTextField = "CompanyName";
        drpLstCompanies.DataValueField = "COMPANIESID";
        drpLstCompanies.DataBind();

        lstCompanies.DataSource = UserEntitiesFactory.Get(this.CurrentUser).Companies;
        lstCompanies.DataTextField = "CompanyName";
        lstCompanies.DataValueField = "COMPANIESID";
        lstCompanies.DataBind();
    }

    private bool IsDataValid()
    {
        if (radBtnAnalysisType.SelectedItem == null)
        {
            lblResult.Text = "Please select analysis type first.";
            return false;
        }
        if (radBtnCompanySelection.SelectedItem != null)
            return true;
        else if (drpLstCompanies.SelectedIndex > 0)
            return true;
        else if (lstCompanies.GetSelectedIndices().Length > 0)
        {
            if (lstCompanies.GetSelectedIndices().Length == 1 && lstCompanies.GetSelectedIndices()[0] == 0)
            {
                lblResult.Text = "Please select any one option from company(ies).";
                return false;
            }
            return true;
        }
        return false;
    }

    private ChartSubType GetAnalysisSubType()
    {
        if (radBtnAnalysisType.SelectedValue == "ProductsSold" && radBtnQtyValChoice.SelectedValue == "Value")
            return ChartSubType.ProductsSoldBySalesValue;
        else if (radBtnAnalysisType.SelectedValue == "ProductsSold" && radBtnQtyValChoice.SelectedValue == "Quantity")
            return ChartSubType.ProductsSoldBySalesQuantity;
        else if (radBtnAnalysisType.SelectedValue == "OpportunitySource" && radBtnQtyValChoice.SelectedValue == "Value")
            return ChartSubType.SalesValueOppSource;
        else if (radBtnAnalysisType.SelectedValue == "OpportunitySource" && radBtnQtyValChoice.SelectedValue == "Quantity")
            return ChartSubType.SalesQuantityOppSource;
        else if (radBtnAnalysisType.SelectedValue == "OpportunityType" && radBtnQtyValChoice.SelectedValue == "Value")
            return ChartSubType.SalesValueOpportunityType;
        else if (radBtnAnalysisType.SelectedValue == "OpportunityType" && radBtnQtyValChoice.SelectedValue == "Quantity")
            return ChartSubType.SalesQuantityOpportunityType;
        else if (radBtnAnalysisType.SelectedValue == "SalesRep" && radBtnQtyValChoice.SelectedValue == "Value")
            return ChartSubType.SalesValueSalesRep;
        else 
            return ChartSubType.SalesQuantitySalesRep;

    }

    private string GetNewCompanySelection()
    {
        if (radBtnCompanySelection.SelectedItem == null)
            return "";
        return (radBtnCompanySelection.SelectedItem.Value == "2") ? "" : radBtnCompanySelection.SelectedItem.Value;

    }
    private string GetCompaniesSelection()
    {
        if (drpLstCompanies.SelectedIndex > 0)
            return drpLstCompanies.SelectedValue;
        if (lstCompanies.GetSelectedIndices().Length > 0)
        {
            string companies = "";
            foreach (int index in lstCompanies.GetSelectedIndices())
            {
                companies = companies + lstCompanies.Items[index].Value + ",";
            }
            return companies.Substring(0,companies.Length - 1);
        }
        return "";

    }

    private void PlotFirstIterationGraph()
    {
        ChartSubType subType;
        subType = GetAnalysisSubType();
        Session["searchForNewCompany"] = GetNewCompanySelection();
        Session["searchCompanies"] = GetCompaniesSelection();

        SandlerControls.ChartLiteral chartLiteral = new SandlerControls.ChartLiteral();
        chartLiteral.ID = "chartLiteralPipelineOpportunityAnalysis";
        chartLiteral.Width = "80%";
        chartLiteral.Height = "450";

        ChartRepository cR = new ChartRepository();
        SandlerModels.TBL_CHART dbChart = cR.GetAll().Where(c => c.ChartID == "PipelineOpportunityAnalysis" && c.IsActive == true).SingleOrDefault();

        Chart chartToLoad = new Chart() { SubType = subType, BGAlpha = dbChart.BgAlpha, BGColor = dbChart.BgColor, CanvasBGAlpha = dbChart.CanvasBgAlpha, CanvasBGColor = dbChart.CanvasBgColor, Caption = dbChart.Caption, SWF = dbChart.SWFile, NumberSuffix = dbChart.NumberSuffix, PieRadius = dbChart.PieRadius, showLabels = dbChart.ShowLabels, showLegend = dbChart.ShowLegend, XaxisName = dbChart.XaxisName, YaxisName = dbChart.YaxisName, Id = ChartID.PipelineOpportunityAnalysis, enableRotation = dbChart.EnableRotation, DrillChartIds = (string.IsNullOrEmpty(dbChart.DrillLevelChartIDs)) ? "" : dbChart.DrillLevelChartIDs, DrillOverride = false, DrillBy = "" };
        chartToLoad.LoadChart(CurrentUser);
        chartToLoad.CreateChart();

        chartLiteral.Text = FusionCharts.RenderChart(Page.ResolveClientUrl("~/FusionChartLib/" + chartToLoad.SWF), "", chartToLoad.ChartXML, "PipelineOpportunityAnalysis", chartLiteral.Width, chartLiteral.Height, false, true);
        (plotChart.ContentTemplateContainer.FindControl("chartPanel") as Panel).Controls.Add(chartLiteral);                
    }

    private void PlotSecondIterationGraph(string chartId, string drillBy, string subType)
    {
        SandlerControls.ChartLiteral chartLiteral = new SandlerControls.ChartLiteral();
        chartLiteral.ID = "chartLiteralPipelineOpportunityAnalysis";
        chartLiteral.Width = "80%";
        chartLiteral.Height = "450"; 

        ChartRepository cR = new ChartRepository();
        SandlerModels.TBL_CHART dbChart = cR.GetAll().Where(c => c.ChartID == chartId && c.IsActive == true).SingleOrDefault();

        PieChart chartToLoad = new PieChart() { SubType = (ChartSubType)Enum.Parse(typeof(ChartSubType), subType), BGAlpha = dbChart.BgAlpha, BGColor = dbChart.BgColor, CanvasBGAlpha = dbChart.CanvasBgAlpha, CanvasBGColor = dbChart.CanvasBgColor, Caption = dbChart.Caption, SWF = dbChart.SWFile, NumberSuffix = dbChart.NumberSuffix, PieRadius = dbChart.PieRadius, showLabels = dbChart.ShowLabels, showLegend = dbChart.ShowLegend, XaxisName = dbChart.XaxisName, YaxisName = dbChart.YaxisName, Id = ChartID.PipelineOpportunityAnalysisBySource, enableRotation = dbChart.EnableRotation, DrillChartIds = dbChart.DrillLevelChartIDs, DrillOverride = false, DrillBy = drillBy};
        chartToLoad.LoadChart(CurrentUser);
        chartToLoad.CreateChart();

        chartLiteral.Text = FusionCharts.RenderChart(Page.ResolveClientUrl("~/FusionChartLib/" + chartToLoad.SWF), "", ((PieChart)chartToLoad).ChartXML, chartLiteral.ID, chartLiteral.Width, chartLiteral.Height, false, true);
        (plotChart.ContentTemplateContainer.FindControl("chartPanel") as Panel).Controls.Add(chartLiteral);                
    }
}