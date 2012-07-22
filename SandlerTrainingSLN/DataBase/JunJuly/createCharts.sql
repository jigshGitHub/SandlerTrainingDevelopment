BEGIN TRY

	BEGIN TRANSACTION;
		
		INSERT INTO [SandlerDB].[dbo].[TBL_CHART] ([Caption],[SWFile], [ChartID], [TypeOfChart] ,[YaxisName] ,[CanvasBgColor] ,[BgColor] ,[CanvasBgAlpha] ,[BgAlpha], [DrillLevelChartIDs])      
		VALUES ('New Appointments By Source (By Month)' ,'MSColumn3D.swf','NewAppointmentsBySourceMonth','Chart','Appointment Quantity' ,'FFFFFF' ,'FFFFFF' ,'100' ,'100', 'NewAppointmentsBySource' );
		
		INSERT INTO [SandlerDB].[dbo].[TBL_CHART] ([Caption],[SWFile], [ChartID], [TypeOfChart] ,[CanvasBgColor] ,[CanvasBgAlpha] ,[ShowLegend] ,[NumberSuffix] ,[PieRadius] ,[EnableRotation] )
		VALUES ('New Appointments By Source ','Pie3D.swf','NewAppointmentsBySource','PieChart', 'FFFFFF' ,'100' ,'1' ,'%' ,'100' ,'1' );
		
		INSERT INTO [SandlerDB].[dbo].[TBL_CHART] ([Caption],[SWFile], [ChartID], [TypeOfChart] ,[YaxisName] ,[CanvasBgColor] ,[BgColor] ,[CanvasBgAlpha] ,[BgAlpha], [DrillLevelChartIDs])      
		VALUES ('New Clients By Product Type (By Month)' ,'MSColumn3D.swf','NewClientsByProductTypeMonth','Chart','New Client Quantity' ,'FFFFFF' ,'FFFFFF' ,'100' ,'100', 'NewClientByProductType' );
		
		INSERT INTO [SandlerDB].[dbo].[TBL_CHART] ([Caption],[SWFile], [ChartID], [TypeOfChart] ,[CanvasBgColor] ,[CanvasBgAlpha] ,[ShowLegend] ,[NumberSuffix] ,[PieRadius] ,[EnableRotation] )
		VALUES ('New Clients By Product Type ','Pie3D.swf','NewClientByProductType','PieChart', 'FFFFFF' ,'100' ,'1' ,'%' ,'100' ,'1' );
		
		INSERT INTO [SandlerDB].[dbo].[TBL_CHART] ([Caption],[SWFile], [ChartID], [TypeOfChart] ,[YaxisName] ,[CanvasBgColor] ,[BgColor] ,[CanvasBgAlpha] ,[BgAlpha], [DrillLevelChartIDs])      
		VALUES ('New Client Quantity & Average Contract Price (By Month)' ,'MSColumn3D.swf','NewClientQuantityAverageContractPriceByMonth','Chart','New Client Quantity Ave Contract Price ($000)' ,'FFFFFF' ,'FFFFFF' ,'100' ,'100', 'NewClientQuantity_ContractPrice' );
		
		INSERT INTO [SandlerDB].[dbo].[TBL_CHART] ([Caption],[SWFile], [ChartID], [TypeOfChart] ,[CanvasBgColor] ,[CanvasBgAlpha] ,[ShowLegend] ,[NumberSuffix] ,[PieRadius] ,[EnableRotation] )
		VALUES ('New Client Quantity','Pie3D.swf','NewClientQuantity','PieChart', 'FFFFFF' ,'100' ,'1' ,'%' ,'100' ,'1' );
		
		INSERT INTO [SandlerDB].[dbo].[TBL_CHART] ([Caption],[SWFile], [ChartID], [TypeOfChart] ,[CanvasBgColor] ,[CanvasBgAlpha] ,[ShowLegend] ,[NumberSuffix] ,[PieRadius] ,[EnableRotation] )
		VALUES ('Contract Price ($000)','Pie3D.swf','ContractPrice','PieChart', 'FFFFFF' ,'100' ,'1' ,'%' ,'100' ,'1' );
		
		INSERT INTO [SandlerDB].[dbo].[TBL_CHART] ([Caption],[SWFile], [ChartID], [TypeOfChart] ,[YaxisName] ,[CanvasBgColor] ,[BgColor] ,[CanvasBgAlpha] ,[BgAlpha], [DrillLevelChartIDs])      
		VALUES ('Class Headcount By Course & Industry (By Month)' ,'MSColumn3D.swf','ClassHeadcountByCourseIndustryMonth','Chart','New Client Quantity Ave Contract Price ($000)' ,'FFFFFF' ,'FFFFFF' ,'100' ,'100',  'HeadcountByCourse_HeadcountByIndustry' );
		
		INSERT INTO [SandlerDB].[dbo].[TBL_CHART] ([Caption],[SWFile], [ChartID], [TypeOfChart] ,[CanvasBgColor] ,[CanvasBgAlpha] ,[ShowLegend] ,[NumberSuffix] ,[PieRadius] ,[EnableRotation] )
		VALUES ('Headcount By Course','Pie3D.swf','HeadcountByCourse','PieChart', 'FFFFFF' ,'100' ,'1' ,'%' ,'100' ,'1' );
		
		INSERT INTO [SandlerDB].[dbo].[TBL_CHART] ([Caption],[SWFile], [ChartID], [TypeOfChart] ,[CanvasBgColor] ,[CanvasBgAlpha] ,[ShowLegend] ,[NumberSuffix] ,[PieRadius] ,[EnableRotation] )
		VALUES ('Headcount By Industry','Pie3D.swf','HeadcountByIndustry','PieChart', 'FFFFFF' ,'100' ,'1' ,'%' ,'100' ,'1' );
		
		INSERT INTO [SandlerDB].[dbo].[TBL_CHART] ([Caption],[SWFile], [ChartID], [TypeOfChart] ,[YaxisName] ,[CanvasBgColor] ,[BgColor] ,[CanvasBgAlpha] ,[BgAlpha])      
		VALUES ('Actual Dollars Booked and Comparison to Goal (By Month)' ,'MSColumn3D.swf','ActualDollarsBookedComparisonGoal','Chart','Actual Dollars Booked ($000) Comparison to Goal (in %)' ,'FFFFFF' ,'FFFFFF' ,'100' ,'100');
		
		INSERT INTO [SandlerDB].[dbo].[TBL_CHART]([Caption],[SWFile], [ChartID], [TypeOfChart],[YaxisName],[CanvasBgColor],[BgColor],[CanvasBgAlpha])
		VALUES('Average Length of Time for Active Clients (By Industry)','Column3D.swf','AverageLengthTimeActiveClientsByIndustry','BarChart','Average Months','FFFFFF','FFFFFF','100');

		
		
	COMMIT TRANSACTION;

END TRY

BEGIN CATCH

	PRINT 'Error ' + CONVERT(varchar(50), ERROR_NUMBER()) +
          ', Severity ' + CONVERT(varchar(5), ERROR_SEVERITY()) +
          ', State ' + CONVERT(varchar(5), ERROR_STATE()) + 
          ', Procedure ' + ISNULL(ERROR_PROCEDURE(), '-') + 
          ', Line ' + CONVERT(varchar(5), ERROR_LINE());
    PRINT ERROR_MESSAGE();
	
	-- Execute error retrieval routine.
    EXECUTE sp_LogError;

    -- Test XACT_STATE:
        -- If 1, the transaction is committable.
        -- If -1, the transaction is uncommittable and should 
        --     be rolled back.
        -- XACT_STATE = 0 means that there is no transaction and
        --     a commit or rollback operation would generate an error.

    -- Test whether the transaction is uncommittable.
    IF (XACT_STATE()) = -1
    BEGIN
        PRINT
            N'The transaction is in an uncommittable state.' +
            'Rolling back transaction.'
        ROLLBACK TRANSACTION;
    END;

    -- Test whether the transaction is committable.
    IF (XACT_STATE()) = 1
    BEGIN
        PRINT
            N'The transaction is committable.' +
            'Committing transaction.'
        COMMIT TRANSACTION;   
    END;



END CATCH