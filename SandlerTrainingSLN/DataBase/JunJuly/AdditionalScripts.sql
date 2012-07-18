BEGIN TRY

	BEGIN TRANSACTION;

		DECLARE @User_Id uniqueidentifier
		DECLARE @CurrentTime DATETIME
		
		SET @CurrentTime = GetDate();
		
		EXEC [dbo].[aspnet_Roles_CreateRole] 'SandlerTraining','SiteAdmin';
		
		EXEC [dbo].[aspnet_Membership_CreateUser] @ApplicationName = N'SandlerTraining', @UserName = N'siteadmin', @Password = N'GNbb2dozNE4rulc7W8bRCSf8g5s=', @PasswordSalt = N'v6TQ0qbGAUIcMs/zYNhlbA==', @Email = N'siteadmin@siteadmin.com', @PasswordQuestion = NULL, @PasswordAnswer = NULL, @IsApproved = 1, @CurrentTimeUtc = @CurrentTime, @CreateDate = @CurrentTime, @UniqueEmail = NULL, @PasswordFormat = 1, @UserId = @User_Id OUTPUT;
		
		EXEC [dbo].[aspnet_UsersInRoles_AddUsersToRoles] @ApplicationName = N'SandlerTraining', @UserNames = N'siteadmin', @RoleNames = N'siteadmin', @CurrentTimeUtc = NULL;
		
		SELECT * FROM [dbo].[aspnet_Roles];
		
		SELECT * FROM [dbo].[aspnet_Membership];
		
		SELECT * FROM [dbo].[aspnet_Users] ;
		
		SELECT * FROM [dbo].[aspnet_UsersInRoles];
		
		INSERT INTO [SandlerDB].[dbo].[TBL_CHART] ([Caption],[SWFile], [ChartID], [TypeOfChart] ,[CanvasBgColor] ,[BgColor] ,[CanvasBgAlpha] ,[BgAlpha] )
		VALUES ('Cost Of Sale','StackedColumn3D.swf', 'CostOfSale','Chart', 'FFFFFF' ,'FFFFFF', '100' ,'100' );
		
		INSERT INTO [SandlerDB].[dbo].[TBL_CHART] ([Caption], [SWFile], [ChartID],[TypeOfChart] ,[CanvasBgColor] ,[BgColor] ,[CanvasBgAlpha] ,[BgAlpha] )
		VALUES ('Industry Averages','MSColumn3D.swf','IndustryAveBenchmarks','Chart', 'FFFFFF' ,'FFFFFF', '100' ,'100' );
		
		INSERT INTO [SandlerDB].[dbo].[TBL_CHART] ([Caption],[SWFile], [ChartID], [TypeOfChart] ,[CanvasBgColor] ,[BgColor] ,[CanvasBgAlpha] ,[BgAlpha],[YaxisName])
		VALUES ('Pipeline Post Training','MSColumn3D.swf','PipelinePostTraining','Chart', 'FFFFFF' ,'FFFFFF', '100' ,'100', 'Measurement Percentage' );
		
		INSERT INTO [SandlerDB].[dbo].[TBL_CHART] ([Caption],[SWFile], [ChartID], [TypeOfChart] ,[CanvasBgColor] ,[CanvasBgAlpha] ,[ShowLegend] ,[NumberSuffix] ,[PieRadius] ,[EnableRotation] )
		VALUES ('Sales Cycle Time','Pie3D.swf','SalesCycleTimeMain','PieChart', 'FFFFFF' ,'100' ,'1' ,'%' ,'100' ,'1' );
		
		INSERT INTO [SandlerDB].[dbo].[TBL_CHART]([Caption],[SWFile], [ChartID], [TypeOfChart],[YaxisName],[CanvasBgColor],[BgColor],[CanvasBgAlpha])
		VALUES('Prospecting Results','Column3D.swf','ProspectingResults','BarChart','Clients','FFFFFF','FFFFFF','100');
		
		INSERT INTO [SandlerDB].[dbo].[TBL_CHART] ([Caption],[SWFile], [ChartID], [TypeOfChart] ,[YaxisName] ,[CanvasBgColor] ,[BgColor] ,[CanvasBgAlpha] ,[BgAlpha])      
		VALUES ('Sales Total Value, by Month and Year' ,'MSColumn3D.swf','SalesTotalsByMonthValue','Chart','Sales Value (in $000)' ,'FFFFFF' ,'FFFFFF' ,'100' ,'100' );

		
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