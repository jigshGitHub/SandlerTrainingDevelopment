using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerData.Models;
using SandlerModels;
using System.Text;
using System.Web.Services;
using Sandler.UI.ChartStructure;
using InfoSoftGlobal;

public partial class ROI : System.Web.UI.Page
{
    IROIDataModel roiDataModel;
    Control MainContent;
    List<int?> roiYears;
    public bool ModfificationVersion;
    public int repId;
    public int YearDesignation;
    public ROI()
    {
        roiDataModel = new ROIDataModel();
        roiYears = new List<int?>();
        roiYears.Add(2012);
        roiYears.Add(2013);
        roiYears.Add(2014);
        roiYears.Add(2015);

        ModfificationVersion = false;

        repId = 1;
        YearDesignation = 0;
    }

    public string PopulateYears()
    {
        StringBuilder years = new StringBuilder();
        foreach (int year in roiYears)
        {
            years.Append("<th>" + year.ToString() + "</th>");
        }
        return years.ToString();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        
        MainContent = Page.Master.FindControl("MainContent");
        if (!Page.IsPostBack)
        {
            PopulateROIData();
            SetReadOnlyTextBoxes();
        }
    }

    private void SetReadOnlyTextBoxes()
    {
        foreach (int periodYear in roiYears)
        {
            TextBox totalAnnualBenefits = MainContent.FindControl("_" + periodYear.ToString() + "TotalAnnualBenefits") as TextBox;
            if (totalAnnualBenefits != null)
                totalAnnualBenefits.Attributes.Add("readonly", "readonly");

            TextBox tTotalBenefitsRealized = MainContent.FindControl("_" + periodYear.ToString() + "TotalBenefitsRealized") as TextBox;
            if (tTotalBenefitsRealized != null)
                tTotalBenefitsRealized.Attributes.Add("readonly", "readonly");

            TextBox annualBenefitFlow = MainContent.FindControl("_" + periodYear.ToString() + "AnnualBenefitFlow") as TextBox;
            if (annualBenefitFlow != null)
                annualBenefitFlow.Attributes.Add("readonly", "readonly");

            TextBox cumBenefitFlow = MainContent.FindControl("_" + periodYear.ToString() + "CumBenefitFlow") as TextBox;
            if (cumBenefitFlow != null)
                cumBenefitFlow.Attributes.Add("readonly", "readonly");


            TextBox DiscountedCosts = MainContent.FindControl("_" + periodYear.ToString() + "DiscountedCosts") as TextBox;
            if (DiscountedCosts != null)
                DiscountedCosts.Attributes.Add("readonly", "readonly");

            TextBox DiscountedBenefits = MainContent.FindControl("_" + periodYear.ToString() + "DiscountedBenefits") as TextBox;
            if (DiscountedBenefits != null)
                DiscountedBenefits.Attributes.Add("readonly", "readonly");

            TextBox TotalDiscountBenefitFlow = MainContent.FindControl("_" + periodYear.ToString() + "TotalDiscountBenefitFlow") as TextBox;
            if (TotalDiscountBenefitFlow != null)
                TotalDiscountBenefitFlow.Attributes.Add("readonly", "readonly");

            TextBox TotalCumDiscountedBenefitFlow = MainContent.FindControl("_" + periodYear.ToString() + "TotalCumDiscountedBenefitFlow") as TextBox;
            if (TotalCumDiscountedBenefitFlow != null)
                TotalCumDiscountedBenefitFlow.Attributes.Add("readonly", "readonly");

            TextBox TotalCosts = MainContent.FindControl("_" + periodYear.ToString() + "TotalCosts") as TextBox;
            if (TotalCosts != null)
                TotalCosts.Attributes.Add("readonly", "readonly");

            TextBox ROI = MainContent.FindControl("_" + periodYear.ToString() + "ROI") as TextBox;
            if (ROI != null)
                ROI.Attributes.Add("readonly", "readonly");
        }

        TextBox NetPresentValue = MainContent.FindControl("NetPresentValue") as TextBox;
        if (NetPresentValue != null)
            NetPresentValue.Attributes.Add("readonly", "readonly");

        TextBox PayBackInYears = MainContent.FindControl("PayBackInYears") as TextBox;
        if (PayBackInYears != null)
            PayBackInYears.Attributes.Add("readonly", "readonly");
    }

    private void PopulateROIData()
    {
        List<ROIModel> roiModels;
        ROIModel roiModel;
        try
        {
            roiModels = roiDataModel.GetROIModel(repId);
            //roiYears = roiModels.Select(r => r.PeriodYear);
            ModfificationVersion = (roiModels.FindAll(r => r.IsOriginalVersion == false).Count > 0);
            btnNext.Text = (ModfificationVersion) ? "Modify ROI" : "Create ROI";
            foreach (int periodYear in roiYears)
            {
                if (ModfificationVersion)
                {
                    roiModel = roiModels.FindAll(r => r.IsOriginalVersion == false).Where(r => r.PeriodYear == periodYear).SingleOrDefault();
                    btnNext.Text = "Update ROI";
                }
                else
                    roiModel = roiModels.Where(r => r.PeriodYear == periodYear).SingleOrDefault();

                if (roiModel != null)
                {
                    PopulateTrainingInvestmentData(periodYear, roiModel);
                    PopulateAreasOfImproveMent(periodYear, roiModel);
                    PopulateEstimatedBenefitsGainedData(periodYear, roiModel);
                    PopulateTotalAnnualBenefits(periodYear, roiModel);
                    PopulateTotalAnnualBenefitsRealized(periodYear, roiModel);
                    PopulateBenefits(periodYear, roiModel);
                    PopulateDiscountedBenefitsFlow(periodYear, roiModel);
                    PopulateInvestmentImplementationCosts(periodYear, roiModel);
                    PopulateROIMeasursData(periodYear, roiModel);
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void PopulateTrainingInvestmentData(int periodYear, ROIModel roiModel)
    {
        TextBox trainingInvestment = MainContent.FindControl("_" + periodYear.ToString() + "TrainingInvestment") as TextBox;
        if (trainingInvestment != null)
            trainingInvestment.Text = (roiModel.TrainingInvestment.HasValue) ? roiModel.TrainingInvestment.ToString() : "";
    }

    private void PopulateAreasOfImproveMent(int periodYear, ROIModel roiModel)
    {
        try
        {
            TextBox costReductionSalesCycleTime = MainContent.FindControl("_" + periodYear.ToString() + "CostReductionSalesCycleTime") as TextBox;
            if (costReductionSalesCycleTime != null)
                costReductionSalesCycleTime.Text = (roiModel.CostReductionSalesCycleTime.HasValue) ? roiModel.CostReductionSalesCycleTime.ToString() : "";

            TextBox costReductionSalesEfficiency = MainContent.FindControl("_" + periodYear.ToString() + "CostReductionSalesEfficiency") as TextBox;
            if (costReductionSalesEfficiency != null)
                costReductionSalesEfficiency.Text = (roiModel.CostReductionSalesEfficiency.HasValue) ? roiModel.CostReductionSalesEfficiency.ToString() : "";

            TextBox increasedQualifiedSales = MainContent.FindControl("_" + periodYear.ToString() + "IncreasedQualifiedSales") as TextBox;
            if (increasedQualifiedSales != null)
                increasedQualifiedSales.Text = (roiModel.IncreasedQualifiedSales.HasValue) ? roiModel.IncreasedQualifiedSales.ToString() : "";

            TextBox savingsonRetainedSalesReps = MainContent.FindControl("_" + periodYear.ToString() + "SavingsonRetainedSalesReps") as TextBox;
            if (savingsonRetainedSalesReps != null)
                savingsonRetainedSalesReps.Text = (roiModel.SavingsonRetainedSalesReps).HasValue ? roiModel.SavingsonRetainedSalesReps.ToString() : "";

            TextBox increasedQuotaAchievement = MainContent.FindControl("_" + periodYear.ToString() + "IncreasedQuotaAchievement") as TextBox;
            if (increasedQuotaAchievement != null)
                increasedQuotaAchievement.Text = (roiModel.IncreasedQuotaAchievement).HasValue ? roiModel.IncreasedQuotaAchievement.ToString() : "";

        }
        catch (Exception ex)
        {
            throw ex;
        }

    }

    private void PopulateEstimatedBenefitsGainedData(int periodYear, ROIModel roiModel)
    {
        TextBox estimatedBenefitsGained = MainContent.FindControl("_" + periodYear.ToString() + "EstimatedBenefitsGained") as TextBox;
        if (estimatedBenefitsGained != null)
            estimatedBenefitsGained.Text = (roiModel.EstimatedBenefitsGained.HasValue) ? roiModel.EstimatedBenefitsGained.ToString() + "%" : "";
    }

    private void PopulateTotalAnnualBenefits(int periodYear, ROIModel roiModel)
    {
        TextBox totalAnnualBenefits = MainContent.FindControl("_" + periodYear.ToString() + "TotalAnnualBenefits") as TextBox;
        if (totalAnnualBenefits != null)
            totalAnnualBenefits.Text = (roiModel.TotalAnnualBenefits.HasValue) ? roiModel.TotalAnnualBenefits.ToString() : "";
    }

    private void PopulateTotalAnnualBenefitsRealized(int periodYear, ROIModel roiModel)
    {
        TextBox totalBenefitsRealized = MainContent.FindControl("_" + periodYear.ToString() + "TotalBenefitsRealized") as TextBox;
        if (totalBenefitsRealized != null)
            totalBenefitsRealized.Text = (roiModel.TotalBenefitsRealized.HasValue) ? roiModel.TotalBenefitsRealized.ToString() : "";
    }

    private void PopulateBenefits(int periodYear, ROIModel roiModel)
    {
        PopulateAnnualBenefits(periodYear, roiModel);
        PopulateCumBenefitFlow(periodYear, roiModel);
    }

    private void PopulateAnnualBenefits(int periodYear, ROIModel roiModel)
    {
        TextBox annualBenefitFlow = MainContent.FindControl("_" + periodYear.ToString() + "AnnualBenefitFlow") as TextBox;
        if (annualBenefitFlow != null)
            annualBenefitFlow.Text = (roiModel.AnnualBenefitFlow.HasValue) ? roiModel.AnnualBenefitFlow.ToString() : "";
    }

    private void PopulateCumBenefitFlow(int periodYear, ROIModel roiModel)
    {
        TextBox cumBenefitFlow = MainContent.FindControl("_" + periodYear.ToString() + "CumBenefitFlow") as TextBox;
        if (cumBenefitFlow != null)
            cumBenefitFlow.Text = (roiModel.CumBenefitFlow.HasValue) ? roiModel.CumBenefitFlow.ToString() : "";
    }

    private void PopulateDiscountedBenefitsFlow(int periodYear, ROIModel roiModel)
    {
        PopulateDiscountedCosts(periodYear, roiModel);
        PopulateDiscountedBenefits(periodYear, roiModel);
        PopulateTotalDiscountedBenefits(periodYear, roiModel);
        PopulateTotalCumDiscountedBenefitFlow(periodYear, roiModel);
    }

    private void PopulateDiscountedCosts(int periodYear, ROIModel roiModel)
    {
        TextBox discountedCosts = MainContent.FindControl("_" + periodYear.ToString() + "DiscountedCosts") as TextBox;
        if (discountedCosts != null)
            discountedCosts.Text = (roiModel.DiscountedCosts.HasValue) ? roiModel.DiscountedCosts.ToString() : "";
    }

    private void PopulateDiscountedBenefits(int periodYear, ROIModel roiModel)
    {
        TextBox discountedBenefits = MainContent.FindControl("_" + periodYear.ToString() + "DiscountedBenefits") as TextBox;
        if (discountedBenefits != null)
            discountedBenefits.Text = (roiModel.DiscountedBenefits.HasValue) ? roiModel.DiscountedBenefits.ToString() : "";
    }

    private void PopulateTotalDiscountedBenefits(int periodYear, ROIModel roiModel)
    {
        TextBox totalDiscountBenefitFlow = MainContent.FindControl("_" + periodYear.ToString() + "TotalDiscountBenefitFlow") as TextBox;
        if (totalDiscountBenefitFlow != null)
            totalDiscountBenefitFlow.Text = (roiModel.TotalDiscountBenefitFlow.HasValue) ? roiModel.TotalDiscountBenefitFlow.ToString() : "";
    }

    private void PopulateTotalCumDiscountedBenefitFlow(int periodYear, ROIModel roiModel)
    {
        TextBox totalCumDiscountedBenefitFlow = MainContent.FindControl("_" + periodYear.ToString() + "TotalCumDiscountedBenefitFlow") as TextBox;
        if (totalCumDiscountedBenefitFlow != null)
            totalCumDiscountedBenefitFlow.Text = (roiModel.TotalCumDiscountedBenefitFlow.HasValue) ? roiModel.TotalCumDiscountedBenefitFlow.ToString() : "";
    }

    private void PopulateInvestmentImplementationCosts(int periodYear, ROIModel roiModel)
    {
        TextBox initialTrngInvestment = MainContent.FindControl("_" + periodYear.ToString() + "InitialTrngInvestment") as TextBox;
        if (initialTrngInvestment != null)
            initialTrngInvestment.Text = (roiModel.InitialTrngInvestment.HasValue) ? roiModel.InitialTrngInvestment.ToString() : "";

        TextBox implementationCost = MainContent.FindControl("_" + periodYear.ToString() + "ImplementationCost") as TextBox;
        if (implementationCost != null)
            implementationCost.Text = (roiModel.ImplementationCost.HasValue) ? roiModel.ImplementationCost.ToString() : "";

        TextBox ongoingSupportCosts = MainContent.FindControl("_" + periodYear.ToString() + "OngoingSupportCosts") as TextBox;
        if (ongoingSupportCosts != null)
            ongoingSupportCosts.Text = (roiModel.OngoingSupportCosts.HasValue) ? roiModel.OngoingSupportCosts.ToString() : "";

        TextBox totalCosts = MainContent.FindControl("_" + periodYear.ToString() + "TotalCosts") as TextBox;
        if (totalCosts != null)
            totalCosts.Text = (roiModel.TotalCost.HasValue) ? roiModel.TotalCost.ToString() : "";
    }

    private void PopulateROIMeasursData(int periodYear, ROIModel roiModel)
    {
        TextBox costOfCapital = MainContent.FindControl("_" + periodYear.ToString() + "CostOfCapital") as TextBox;
        if (costOfCapital != null)
            costOfCapital.Text = (roiModel.CostofCapital.HasValue) ? roiModel.CostofCapital.ToString() + "%" : "";

        TextBox netPresentValue = MainContent.FindControl("NetPresentValue") as TextBox;
        if (netPresentValue != null)
            netPresentValue.Text = (roiModel.NetPresentValue.HasValue) ? roiModel.NetPresentValue.ToString() : "";

        TextBox roi = MainContent.FindControl("_" + periodYear.ToString() + "ROI") as TextBox;
        if (roi != null)
            roi.Text = (roiModel.Yr1ROI.HasValue) ? roiModel.Yr1ROI.ToString() : "";

        TextBox payBackInYears = MainContent.FindControl("PayBackInYears") as TextBox;
        if (payBackInYears != null)
            payBackInYears.Text = (string.IsNullOrEmpty(roiModel.Payback)) ? "" : roiModel.Payback;
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        List<ROIModel> roiModels;
        ROIModel roiModel;
        try
        {
            roiModels = new List<ROIModel>();

            foreach (int periodYear in roiYears)
            {
                roiModel = new ROIModel();
                roiModel.PeriodYear = periodYear;
                roiModel.RepID = repId;
                roiModel.YearDesignation = YearDesignation++;

                BindTrainingInvestmentData(periodYear, roiModel);
                BindAreasOfImproveMent(periodYear, roiModel);
                BindEstimatedBenefitsGained(periodYear, roiModel);
                BindTotalAnnualBenefits(periodYear, roiModel);
                BindTotalAnnualBenefitsRealized(periodYear, roiModel);
                BindBenefits(periodYear, roiModel);
                BindDiscountedBenefitsFlow(periodYear, roiModel);
                BindInvestmentOngoingSupportCosts(periodYear, roiModel);
                BindROIMeasure(periodYear, roiModel);

                roiModels.Add(roiModel);
            }

            roiDataModel.Update(repId, roiModels);
            SetReadOnlyTextBoxes();


            PlotChart();
            //pnlChart_ModalPopupExtender.Show();
            //string script = "var chartData = \"" + FusionCharts.RenderChart(ROIChart.SWF, "", ROIChart.ChartXML, "ROIChartPlots", ROIChart.Width, ROIChart.Hight, false, false) + "\";"; ;
            //if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "ChartXML"))
            //    Page.ClientScript.RegisterStartupScript(this.GetType(), "ChartXML", script, true);
            pnlChart_ModalPopupExtender.Show();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void BindTrainingInvestmentData(int periodYear, ROIModel roiModel)
    {
        TextBox trainingInvestment = MainContent.FindControl("_" + periodYear.ToString() + "TrainingInvestment") as TextBox;
        if (trainingInvestment != null)
            if (!string.IsNullOrEmpty(trainingInvestment.Text))
                roiModel.TrainingInvestment = Convert.ToDouble(trainingInvestment.Text);
    }

    private void BindAreasOfImproveMent(int periodYear, ROIModel roiModel)
    {
        try
        {
            TextBox costReductionSalesCycleTime = MainContent.FindControl("_" + periodYear.ToString() + "CostReductionSalesCycleTime") as TextBox;
            if (costReductionSalesCycleTime != null)
                if (!string.IsNullOrEmpty(costReductionSalesCycleTime.Text))
                    roiModel.CostReductionSalesCycleTime = Convert.ToDouble(costReductionSalesCycleTime.Text);

            TextBox costReductionSalesEfficiency = MainContent.FindControl("_" + periodYear.ToString() + "CostReductionSalesEfficiency") as TextBox;
            if (costReductionSalesEfficiency != null)
                if (!string.IsNullOrEmpty(costReductionSalesEfficiency.Text))
                    roiModel.CostReductionSalesEfficiency = Convert.ToDouble(costReductionSalesEfficiency.Text);

            TextBox increasedQualifiedSales = MainContent.FindControl("_" + periodYear.ToString() + "IncreasedQualifiedSales") as TextBox;
            if (increasedQualifiedSales != null)
                if (!string.IsNullOrEmpty(increasedQualifiedSales.Text))
                    roiModel.IncreasedQualifiedSales = Convert.ToDouble(increasedQualifiedSales.Text);

            TextBox savingsonRetainedSalesReps = MainContent.FindControl("_" + periodYear.ToString() + "SavingsonRetainedSalesReps") as TextBox;
            if (savingsonRetainedSalesReps != null)
                if (!string.IsNullOrEmpty(savingsonRetainedSalesReps.Text))
                    roiModel.SavingsonRetainedSalesReps = Convert.ToDouble(savingsonRetainedSalesReps.Text);

            TextBox increasedQuotaAchievement = MainContent.FindControl("_" + periodYear.ToString() + "IncreasedQuotaAchievement") as TextBox;
            if (increasedQuotaAchievement != null)
                if (!string.IsNullOrEmpty(increasedQuotaAchievement.Text))
                    roiModel.IncreasedQuotaAchievement = Convert.ToDouble(increasedQuotaAchievement.Text);
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }

    private void BindEstimatedBenefitsGained(int periodYear, ROIModel roiModel)
    {
        TextBox estimatedBenefitsGained = MainContent.FindControl("_" + periodYear.ToString() + "EstimatedBenefitsGained") as TextBox;
        if (estimatedBenefitsGained != null)
            if (!string.IsNullOrEmpty(estimatedBenefitsGained.Text))
                roiModel.EstimatedBenefitsGained = Convert.ToDouble(estimatedBenefitsGained.Text);
    }

    private void BindTotalAnnualBenefits(int periodYear, ROIModel roiModel)
    {
        TextBox totalAnnualBenefits = MainContent.FindControl("_" + periodYear.ToString() + "TotalAnnualBenefits") as TextBox;
        if (totalAnnualBenefits != null)
            if (!string.IsNullOrEmpty(totalAnnualBenefits.Text))
                roiModel.TotalAnnualBenefits = Convert.ToDouble(totalAnnualBenefits.Text);
    }

    private void BindTotalAnnualBenefitsRealized(int periodYear, ROIModel roiModel)
    {
        TextBox totalBenefitsRealized = MainContent.FindControl("_" + periodYear.ToString() + "TotalBenefitsRealized") as TextBox;
        if (totalBenefitsRealized != null)
            if (!string.IsNullOrEmpty(totalBenefitsRealized.Text))
                roiModel.TotalBenefitsRealized = Convert.ToDouble(totalBenefitsRealized.Text);
    }

    private void BindBenefits(int periodYear, ROIModel roiModel)
    {
        TextBox annualBenefitFlow = MainContent.FindControl("_" + periodYear.ToString() + "AnnualBenefitFlow") as TextBox;
        if (annualBenefitFlow != null)
            if (!string.IsNullOrEmpty(annualBenefitFlow.Text))
                roiModel.AnnualBenefitFlow = Convert.ToDouble(annualBenefitFlow.Text);

        TextBox cumBenefitFlow = MainContent.FindControl("_" + periodYear.ToString() + "CumBenefitFlow") as TextBox;
        if (cumBenefitFlow != null)
            if (!string.IsNullOrEmpty(cumBenefitFlow.Text))
                roiModel.CumBenefitFlow = Convert.ToDouble(cumBenefitFlow.Text);
    }

    private void BindDiscountedBenefitsFlow(int periodYear, ROIModel roiModel)
    {
        TextBox discountedCosts = MainContent.FindControl("_" + periodYear.ToString() + "DiscountedCosts") as TextBox;
        if (discountedCosts != null)
            if (!string.IsNullOrEmpty(discountedCosts.Text))
                roiModel.DiscountedCosts = Convert.ToDouble(discountedCosts.Text);

        TextBox discountedBenefits = MainContent.FindControl("_" + periodYear.ToString() + "DiscountedBenefits") as TextBox;
        if (discountedBenefits != null)
            if (!string.IsNullOrEmpty(discountedBenefits.Text))
                roiModel.DiscountedBenefits = Convert.ToDouble(discountedBenefits.Text);

        TextBox totalDiscountBenefitFlow = MainContent.FindControl("_" + periodYear.ToString() + "TotalDiscountBenefitFlow") as TextBox;
        if (totalDiscountBenefitFlow != null)
            if (!string.IsNullOrEmpty(totalDiscountBenefitFlow.Text))
                roiModel.TotalDiscountBenefitFlow = Convert.ToDouble(totalDiscountBenefitFlow.Text);

        TextBox totalCumDiscountedBenefitFlow = MainContent.FindControl("_" + periodYear.ToString() + "TotalCumDiscountedBenefitFlow") as TextBox;
        if (totalCumDiscountedBenefitFlow != null)
            if (!string.IsNullOrEmpty(totalCumDiscountedBenefitFlow.Text))
                roiModel.TotalCumDiscountedBenefitFlow = Convert.ToDouble(totalCumDiscountedBenefitFlow.Text);
    }

    private void BindInvestmentOngoingSupportCosts(int periodYear, ROIModel roiModel)
    {
        TextBox initialTrngInvestment = MainContent.FindControl("_" + periodYear.ToString() + "InitialTrngInvestment") as TextBox;
        if (initialTrngInvestment != null)
            if (!string.IsNullOrEmpty(initialTrngInvestment.Text))
                roiModel.InitialTrngInvestment = Convert.ToDouble(initialTrngInvestment.Text);

        TextBox implementationCost = MainContent.FindControl("_" + periodYear.ToString() + "ImplementationCost") as TextBox;
        if (implementationCost != null)
            if (!string.IsNullOrEmpty(implementationCost.Text))
                roiModel.ImplementationCost = Convert.ToDouble(implementationCost.Text);

        TextBox ongoingSupportCosts = MainContent.FindControl("_" + periodYear.ToString() + "OngoingSupportCosts") as TextBox;
        if (ongoingSupportCosts != null)
            if (!string.IsNullOrEmpty(ongoingSupportCosts.Text))
                roiModel.OngoingSupportCosts = Convert.ToDouble(ongoingSupportCosts.Text);

        TextBox totalCosts = MainContent.FindControl("_" + periodYear.ToString() + "TotalCosts") as TextBox;
        if (totalCosts != null)
            if (!string.IsNullOrEmpty(totalCosts.Text))
                roiModel.TotalCost = Convert.ToDouble(totalCosts.Text);
    }

    private void BindROIMeasure(int periodYear, ROIModel roiModel)
    {
        TextBox costOfCapital = MainContent.FindControl("_" + periodYear.ToString() + "CostOfCapital") as TextBox;
        if (costOfCapital != null)
            if (!string.IsNullOrEmpty(costOfCapital.Text))
                roiModel.CostofCapital = Convert.ToDouble(costOfCapital.Text);

        TextBox netPresentValue = MainContent.FindControl("NetPresentValue") as TextBox;
        if (netPresentValue != null)
            if (!string.IsNullOrEmpty(netPresentValue.Text))
                roiModel.NetPresentValue = Convert.ToDouble(netPresentValue.Text);

        TextBox roi = MainContent.FindControl("_" + periodYear.ToString() + "ROI") as TextBox;
        if (roi != null)
            if (!string.IsNullOrEmpty(roi.Text))
                roiModel.Yr1ROI = Convert.ToDouble(roi.Text);

        TextBox payBackInYears = MainContent.FindControl("PayBackInYears") as TextBox;
        if (payBackInYears != null)
            if (!string.IsNullOrEmpty(payBackInYears.Text))
                roiModel.Payback = payBackInYears.Text;
    }

    private void PlotChart()
    {
        Chart ROIChart = new Chart();
        ROIChart.Id = ChartID.ReturnOnTrainingInvestment;
        ROIChart.SWF = @"FusionChartLib/MSColumn3d.swf";
        ROIChart.Caption = "Return On Training Investment";
        ROIChart.BGColor = "FFFFFF";
        ROIChart.BGAlpha = "100";
        ROIChart.NumberSuffix = "%";
        ROIChart.Width = "100%";
        ROIChart.Hight = "450";
        ROIChart.LoadChart();
        ROIChart.CreateChart();
        

        pnlChart.FindControl("chartContainer").Controls.Add(new LiteralControl(FusionCharts.RenderChart(ROIChart.SWF, "", ROIChart.ChartXML, "ROIChartPlots", ROIChart.Width, ROIChart.Hight, false, false)));
        
    }
}