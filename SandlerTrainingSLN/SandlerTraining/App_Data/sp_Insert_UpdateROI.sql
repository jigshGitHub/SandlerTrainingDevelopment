
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,,>
-- Description:	@Description,,>
-- =============================================

IF OBJECT_ID('sp_Insert_UpdateROI', 'P') IS NOT NULL
	DROP PROCEDURE dbo.sp_Insert_UpdateROI
GO

CREATE PROCEDURE sp_Insert_UpdateROI 
@ID int = NULL
,@ProductID int = NULL
,@FranchiseeID int = NULL
,@ClientID int = NULL
,@RepID int = NULL
,@PeriodYear int = NULL
,@YearDesignation int = NULL
,@InitialTrngInvestment money = NULL
,@ImplementationCost money = NULL
,@TrainingInvestment money = NULL
,@CostReductionSalesCycleTime money = NULL
,@CostReductionSalesEfficiency money = NULL
,@IncreasedQualifiedSales money = NULL
,@SavingsonRetainedSalesReps money = NULL
,@IncreasedQuotaAchievement money = NULL
,@TotalAnnualBenefits money = NULL
,@EstimatedBenefitsGained int = NULL
,@TotalBenefitsRealized money = NULL
,@TotalCost money = NULL
,@AnnualBenefitFlow money = NULL
,@CumBenefitFlow money = NULL
,@DiscountedCosts money = NULL
,@DiscountedBenefits money = NULL
,@TotalDiscountBenefitFlow money = NULL
,@TotalCumDiscountedBenefitFlow money = NULL
,@CostofCapital int = NULL
,@NetPresentValue money = NULL
,@Yr1ROI int = NULL
,@Yr2ROI int = NULL
,@Yr3ROI int = NULL
,@Payback nvarchar(255)
,@OngoingSupportCosts money = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	BEGIN TRAN
	
	print 'Updated data';
	UPDATE [dbo].[Return_on_Trng_Investment]
		SET 
			--[ID] = @ID
		 -- ,[ProductID] = @ProductID
		 -- ,[FranchiseeID] = @FranchiseeID
		 -- ,[ClientID] = @ClientID
		  [RepID] = @RepID
		  ,[PeriodYear] = @PeriodYear
		  ,[YearDesignation] = @YearDesignation
		  ,[InitialTrngInvestment] = @InitialTrngInvestment
		  ,[ImplementationCost] = @ImplementationCost
		  ,[TrainingInvestment] = @TrainingInvestment
		  ,[CostReductionSalesCycleTime] = @CostReductionSalesCycleTime
		  ,[CostReductionSalesEfficiency] = @CostReductionSalesEfficiency
		  ,[IncreasedQualifiedSales] = @IncreasedQualifiedSales
		  ,[SavingsonRetainedSalesReps] = @SavingsonRetainedSalesReps
		  ,[IncreasedQuotaAchievement] = @IncreasedQuotaAchievement
		  ,[TotalAnnualBenefits] = @TotalAnnualBenefits
		  ,[EstimatedBenefitsGained] = @EstimatedBenefitsGained
		  ,[TotalBenefitsRealized] = @TotalBenefitsRealized
		  ,[TotalCost] = @TotalCost
		  ,[AnnualBenefitFlow] = @AnnualBenefitFlow
		  ,[CumBenefitFlow] = @CumBenefitFlow
		  ,[DiscountedCosts] = @DiscountedCosts
		  ,[DiscountedBenefits] = @DiscountedBenefits
		  ,[TotalDiscountBenefitFlow] = @TotalDiscountBenefitFlow
		  ,[TotalCumDiscountedBenefitFlow] = @TotalCumDiscountedBenefitFlow
		  ,[CostofCapital] = @CostofCapital
		  ,[NetPresentValue] = @NetPresentValue
		  ,[Yr1ROI] = @Yr1ROI
		  ,[Yr2ROI] = @Yr2ROI
		  ,[Yr3ROI] = @Yr3ROI
		  ,[Payback] = @Payback
		  ,[OngoingSupportCosts] = @OngoingSupportCosts
		  ,[IsOriginalVersion] = 0
		WHERE RepID = @RepID AND PeriodYear = @PeriodYear AND IsOriginalVersion = 0
	
	IF @@ROWCOUNT = 0 
	BEGIN
		DECLARE @nextId INT
		DECLARE @IsOriginalVersion bit
		
		SELECT @nextId = MAX(ID) FROM [dbo].[Return_on_Trng_Investment];
		SELECT @IsOriginalVersion = IsOriginalVersion FROM [dbo].[Return_on_Trng_Investment] WHERE RepID = @RepID AND PeriodYear = @PeriodYear;

		SET @nextId = ISNULL(@nextId,0) + 1;
		IF @IsOriginalVersion IS NULL
			SET @IsOriginalVersion = 1;
		ELSE
			SET @IsOriginalVersion = 0;	
		
		INSERT INTO [dbo].[Return_on_Trng_Investment]
			   (
			   ID
			   --,[ProductID]
			   --,[FranchiseeID]
			   --,[ClientID]
			   ,[RepID]
			   ,[PeriodYear]
			   ,[YearDesignation]
			   ,[InitialTrngInvestment]
			   ,[ImplementationCost]
			   ,[TrainingInvestment]
			   ,[CostReductionSalesCycleTime]
			   ,[CostReductionSalesEfficiency]
			   ,[IncreasedQualifiedSales]
			   ,[SavingsonRetainedSalesReps]
			   ,[IncreasedQuotaAchievement]
			   ,[TotalAnnualBenefits]
			   ,[EstimatedBenefitsGained]
			   ,[TotalBenefitsRealized]
			   ,[TotalCost]
			   ,[AnnualBenefitFlow]
			   ,[CumBenefitFlow]
			   ,[DiscountedCosts]
			   ,[DiscountedBenefits]
			   ,[TotalDiscountBenefitFlow]
			   ,[TotalCumDiscountedBenefitFlow]
			   ,[CostofCapital]
			   ,[NetPresentValue]
			   ,[Yr1ROI]
			   ,[Yr2ROI]
			   ,[Yr3ROI]
			   ,[Payback]
			   ,[OngoingSupportCosts]
			   ,[IsOriginalVersion]
			   )
		 VALUES
			   (
			   @nextId
			   --,@ProductID
			   --,@FranchiseeID
			   --@ClientID
			   ,@RepID
			   ,@PeriodYear
			   ,@YearDesignation
			   ,@InitialTrngInvestment
			   ,@ImplementationCost
			   ,@TrainingInvestment
			   ,@CostReductionSalesCycleTime
			   ,@CostReductionSalesEfficiency
			   ,@IncreasedQualifiedSales
			   ,@SavingsonRetainedSalesReps
			   ,@IncreasedQuotaAchievement
			   ,@TotalAnnualBenefits
			   ,@EstimatedBenefitsGained
			   ,@TotalBenefitsRealized
			   ,@TotalCost
			   ,@AnnualBenefitFlow
			   ,@CumBenefitFlow
			   ,@DiscountedCosts
			   ,@DiscountedBenefits
			   ,@TotalDiscountBenefitFlow
			   ,@TotalCumDiscountedBenefitFlow
			   ,@CostofCapital
			   ,@NetPresentValue
			   ,@Yr1ROI
			   ,@Yr2ROI
			   ,@Yr3ROI
			   ,@Payback
			   ,@OngoingSupportCosts
			   ,@IsOriginalVersion
			   );
		END
	COMMIT TRAN	   
END
GO


