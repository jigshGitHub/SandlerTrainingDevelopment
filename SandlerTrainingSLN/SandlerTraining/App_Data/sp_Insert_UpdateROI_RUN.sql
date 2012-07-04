USE [SandlerDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[sp_Insert_UpdateROI]
		@ID = NULL,
		@ProductID = NULL,
		@FranchiseeID = NULL,
		@ClientID = NULL,
		@RepID = 1,
		@PeriodYear = 2012,
		@YearDesignation = NULL,
		@InitialTrngInvestment = NULL,
		@ImplementationCost = NULL,
		@TrainingInvestment = NULL,
		@CostReductionSalesCycleTime = NULL,
		@CostReductionSalesEfficiency = NULL,
		@IncreasedQualifiedSales = NULL,
		@SavingsonRetainedSalesReps = NULL,
		@IncreasedQuotaAchievement = NULL,
		@TotalAnnualBenefits = NULL,
		@EstimatedBenefitsGained = NULL,
		@TotalBenefitsRealized = NULL,
		@TotalCost = NULL,
		@AnnualBenefitFlow = NULL,
		@CumBenefitFlow = NULL,
		@DiscountedCosts = NULL,
		@DiscountedBenefits = NULL,
		@TotalDiscountBenefitFlow = NULL,
		@TotalCumDiscountedBenefitFlow = NULL,
		@CostofCapital = NULL,
		@NetPresentValue = NULL,
		@Yr1ROI = NULL,
		@Yr2ROI = NULL,
		@Yr3ROI = NULL,
		@Payback = NULL,
		@OngoingSupportCosts = NULL

SELECT	'Return Value' = @return_value

GO
