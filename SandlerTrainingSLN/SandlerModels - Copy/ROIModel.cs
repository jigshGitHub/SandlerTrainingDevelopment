using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SandlerModels
{
    public interface IROIModel
    {

    }
    public class ROIModel : IROIModel
    {
        public int? ID { get; set; }
        public int? ProductID { get; set; }
        public int? FranchiseeID { get; set; }
        public int? ClientID { get; set; }
        public int? RepID { get; set; }
        public int? PeriodYear { get; set; }
        public int? YearDesignation { get; set; }
        public double? InitialTrngInvestment { get; set; }
        public double? ImplementationCost { get; set; }
        public double? TrainingInvestment { get; set; }
        public double? CostReductionSalesCycleTime { get; set; }
        public double? CostReductionSalesEfficiency { get; set; }
        public double? IncreasedQualifiedSales { get; set; }
        public double? SavingsonRetainedSalesReps { get; set; }
        public double? IncreasedQuotaAchievement { get; set; }
        public double? TotalAnnualBenefits { get; set; }
        public double? EstimatedBenefitsGained { get; set; }
        public double? TotalBenefitsRealized { get; set; }
        public double? TotalCost { get; set; }
        public double? AnnualBenefitFlow { get; set; }
        public double? CumBenefitFlow { get; set; }
        public double? DiscountedCosts { get; set; }
        public double? DiscountedBenefits { get; set; }
        public double? TotalDiscountBenefitFlow { get; set; }
        public double? TotalCumDiscountedBenefitFlow { get; set; }
        public double? CostofCapital { get; set; }
        public double? OngoingSupportCosts { get; set; }
        public double? NetPresentValue { get; set; }
        public double? Yr1ROI { get; set; }
        public int? Yr2ROI { get; set; }
        public int? Yr3ROI { get; set; }
        public string Payback { get; set; }
        public bool IsOriginalVersion { get; set; }
        public ROIModel()
        {
            //
            // TODO: Add constructor logic here
            //
        }

    }

  
}