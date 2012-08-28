BEGIN TRY

	BEGIN TRANSACTION;

		DECLARE @User_Id uniqueidentifier
		DECLARE @CurrentTime DATETIME
		
		SET @CurrentTime = GetDate();
		
		EXEC [dbo].[aspnet_Roles_CreateRole] 'SandlerTraining','SiteAdmin';
		
		EXEC [dbo].[aspnet_Membership_CreateUser] @ApplicationName = N'SandlerTraining', @UserName = N'siteadmin', @Password = N'GNbb2dozNE4rulc7W8bRCSf8g5s=', @PasswordSalt = N'v6TQ0qbGAUIcMs/zYNhlbA==', @Email = N'siteadmin@siteadmin.com', @PasswordQuestion = NULL, @PasswordAnswer = NULL, @IsApproved = 1, @CurrentTimeUtc = @CurrentTime, @CreateDate = @CurrentTime, @UniqueEmail = NULL, @PasswordFormat = 1, @UserId = @User_Id OUTPUT;
		SET @User_Id = NULL;
		EXEC [dbo].[aspnet_UsersInRoles_AddUsersToRoles] @ApplicationName = N'SandlerTraining', @UserNames = N'siteadmin', @RoleNames = N'siteadmin', @CurrentTimeUtc = @CurrentTime;
		
		PRINT 'SiteAdmin created.'
				
		-- Countries
		INSERT INTO [SandlerDB].[dbo].[TBL_COUNTRY] ([Code], [Name]) VALUES ( 'AU' ,'Australia');
		INSERT INTO [SandlerDB].[dbo].[TBL_COUNTRY] ([Code], [Name]) VALUES ( 'BE' ,'Belgium');
		INSERT INTO [SandlerDB].[dbo].[TBL_COUNTRY] ([Code], [Name]) VALUES ( 'BR' ,'Brazil');
		INSERT INTO [SandlerDB].[dbo].[TBL_COUNTRY] ([Code], [Name]) VALUES ( 'CA' ,'Canada');
		INSERT INTO [SandlerDB].[dbo].[TBL_COUNTRY] ([Code], [Name]) VALUES ( 'CL' ,'Chile');
		INSERT INTO [SandlerDB].[dbo].[TBL_COUNTRY] ([Code], [Name]) VALUES ( 'CN' ,'China');
		INSERT INTO [SandlerDB].[dbo].[TBL_COUNTRY] ([Code], [Name]) VALUES ( 'CR' ,'Costa Rica');
		INSERT INTO [SandlerDB].[dbo].[TBL_COUNTRY] ([Code], [Name]) VALUES ( 'CZ' ,'Czech Republic');
		INSERT INTO [SandlerDB].[dbo].[TBL_COUNTRY] ([Code], [Name]) VALUES ( 'DE' ,'Germany');
		INSERT INTO [SandlerDB].[dbo].[TBL_COUNTRY] ([Code], [Name]) VALUES ( 'GR' ,'Greece');
		INSERT INTO [SandlerDB].[dbo].[TBL_COUNTRY] ([Code], [Name]) VALUES ( 'GT' ,'Guatemala');
		INSERT INTO [SandlerDB].[dbo].[TBL_COUNTRY] ([Code], [Name]) VALUES ( 'IE' ,'Ireland');
		INSERT INTO [SandlerDB].[dbo].[TBL_COUNTRY] ([Code], [Name]) VALUES ( 'KE' ,'Kenya');
		INSERT INTO [SandlerDB].[dbo].[TBL_COUNTRY] ([Code], [Name]) VALUES ( 'LU' ,'Luxembourg');
		INSERT INTO [SandlerDB].[dbo].[TBL_COUNTRY] ([Code], [Name]) VALUES ( 'MX' ,'Mexico');
		INSERT INTO [SandlerDB].[dbo].[TBL_COUNTRY] ([Code], [Name]) VALUES ( 'NL' ,'Netherlands');
		INSERT INTO [SandlerDB].[dbo].[TBL_COUNTRY] ([Code], [Name]) VALUES ( 'PL' ,'Poland');
		INSERT INTO [SandlerDB].[dbo].[TBL_COUNTRY] ([Code], [Name]) VALUES ( 'RO' ,'Romania');
		INSERT INTO [SandlerDB].[dbo].[TBL_COUNTRY] ([Code], [Name]) VALUES ( 'SW' ,'Switzerland');
		INSERT INTO [SandlerDB].[dbo].[TBL_COUNTRY] ([Code], [Name]) VALUES ( 'SA' ,'Saudi Arabia');
		INSERT INTO [SandlerDB].[dbo].[TBL_COUNTRY] ([Code], [Name]) VALUES ( 'SG' ,'Singapore');
		INSERT INTO [SandlerDB].[dbo].[TBL_COUNTRY] ([Code], [Name]) VALUES ( 'ES' ,'Spain');
		INSERT INTO [SandlerDB].[dbo].[TBL_COUNTRY] ([Code], [Name]) VALUES ( 'TR' ,'Turkey');
		INSERT INTO [SandlerDB].[dbo].[TBL_COUNTRY] ([Code], [Name]) VALUES ( 'GB' ,'United Kingdom');
		INSERT INTO [SandlerDB].[dbo].[TBL_COUNTRY] ([Code], [Name]) VALUES ( 'US' ,'United States');
		
		PRINT '[TBL_COUNTRY] data created.'
		-- Roles
		EXEC [dbo].[aspnet_Roles_CreateRole] 'SandlerTraining','Corporate';
		EXEC [dbo].[aspnet_Roles_CreateRole] 'SandlerTraining','Coach';
		EXEC [dbo].[aspnet_Roles_CreateRole] 'SandlerTraining','FranchiseeOwner';
		EXEC [dbo].[aspnet_Roles_CreateRole] 'SandlerTraining','FranchiseeUser';

		PRINT '4 Roles created.'
		-- Regions
		DECLARE @regionID INT 

		EXEC sp_CreateRegion @name = 'North East',  @countryCode = 'US',  @region_Id = @regionID OUTPUT;		
		EXEC sp_CreateRegion @name = 'Mid-Atlantic',  @countryCode = 'US',  @region_Id = @regionID OUTPUT;
		EXEC sp_CreateRegion @name = 'North Central',  @countryCode = 'US',  @region_Id = @regionID OUTPUT;
		EXEC sp_CreateRegion @name = 'Great Lakes',  @countryCode = 'US',  @region_Id = @regionID OUTPUT;
		EXEC sp_CreateRegion @name = 'South East',  @countryCode = 'US',  @region_Id = @regionID OUTPUT;
		EXEC sp_CreateRegion @name = 'South Central',  @countryCode = 'US',  @region_Id = @regionID OUTPUT;
		EXEC sp_CreateRegion @name = 'West',  @countryCode = 'US',  @region_Id = @regionID OUTPUT;
		EXEC sp_CreateRegion @name = 'Boise Idaho',  @countryCode = 'US',  @region_Id = @regionID OUTPUT;

		EXEC sp_CreateRegion @name = 'Canada-Eastern',  @countryCode = 'CA',  @region_Id = @regionID OUTPUT;
		EXEC sp_CreateRegion @name = 'Canada-Western',  @countryCode = 'CA',  @region_Id = @regionID OUTPUT;
		
		PRINT 'Regions created (7 US regions, 2 canada regions created.'
		
						
		EXEC [dbo].[aspnet_Membership_CreateUser] @ApplicationName = N'SandlerTraining', @UserName = N'corporateuser', @Password = N'DE5aG4DJKaWNAC6qtb9Ex1mw0YQ=', @PasswordSalt = N'CgWo/aHD6MDFG4AYqW/5wQ==', @Email = N'corporate@sandler.com', @PasswordQuestion = NULL, @PasswordAnswer = NULL, @IsApproved = 1, @CurrentTimeUtc = @CurrentTime, @CreateDate = @CurrentTime, @UniqueEmail = NULL, @PasswordFormat = 1, @UserId = @User_Id OUTPUT;
		
		EXEC [dbo].[aspnet_UsersInRoles_AddUsersToRoles] @ApplicationName = N'SandlerTraining', @UserNames = N'corporateuser', @RoleNames = N'Corporate', @CurrentTimeUtc = @CurrentTime
		
		PRINT 'CorporateUser created.'
		-- COACH
		DECLARE @_coachId int
		DECLARE @franchiseeId int
		DECLARE @userId uniqueidentifier

		EXECUTE sp_CreateCoach @user_Name = 'necoach', @_email = 'necoach@sandler.com',@region_Name = 'North East', @coach_Id = @_coachId OUTPUT; 
		EXECUTE sp_CreateFranchisee @user_Name = 'nectfo', @_email = 'necoach@sandler.com', @_name = 'Connecticut Fr', @coachId = @_coachId, @countryCode = 'US', @franchisee_Id = @franchiseeId OUTPUT; 
		EXECUTE sp_CreateFranchisee_User @user_Name = 'ctfruser', @_email = 'ctfruser@sandler.com', @franchiseeId=@franchiseeId, @User_Id = @userId OUTPUT; 
		SET @userId = NULL;
		
		set @_coachId = null;
		
		EXECUTE sp_CreateCoach @user_Name = 'macoach', @_email = 'macoach@sandler.com',@region_Name = 'Mid-Atlantic', @coach_Id = @_coachId OUTPUT; 		
		
		EXECUTE sp_CreateCoach @user_Name = 'nccoach', @_email = 'nccoach@sandler.com',@region_Name = 'North Central', @coach_Id = @_coachId OUTPUT;
		EXECUTE sp_CreateFranchisee @user_Name = 'ncchfo', @_email = 'nccoach@sandler.com', @_name = 'Chicago Fr', @coachId = @_coachId, @countryCode = 'US', @franchisee_Id = @franchiseeId OUTPUT; 
		EXECUTE sp_CreateFranchisee_User @user_Name = 'chfruser', @_email = 'chfruser@sandler.com', @franchiseeId=@franchiseeId, @User_Id = @userId OUTPUT; 
		SET @userId = NULL;set @_coachId = null;
		
		EXECUTE sp_CreateCoach @user_Name = 'glcoach', @_email = 'glcoach@sandler.com',@region_Name = 'Great Lakes', @coach_Id = @_coachId OUTPUT;
		
		EXECUTE sp_CreateCoach @user_Name = 'secoach', @_email = 'secoach@sandler.com',@region_Name = 'South East', @coach_Id = @_coachId OUTPUT;
		EXECUTE sp_CreateFranchisee @user_Name = 'seflfo', @_email = 'secoach@sandler.com', @_name = 'Florida Fr', @coachId = @_coachId, @countryCode = 'US', @franchisee_Id = @franchiseeId OUTPUT; 
		EXECUTE sp_CreateFranchisee_User @user_Name = 'flfruser', @_email = 'flfruser@sandler.com', @franchiseeId=@franchiseeId, @User_Id = @userId OUTPUT; 
		SET @userId = NULL;
		
		set @_coachId = null;
		
		EXECUTE sp_CreateCoach @user_Name = 'sccoach', @_email = 'nccoach@sandler.com',@region_Name = 'South Central', @coach_Id = @_coachId OUTPUT;
		EXECUTE sp_CreateCoach @user_Name = 'wcoach', @_email = 'nccoach@sandler.com',@region_Name = 'West', @coach_Id = @_coachId OUTPUT;
		EXECUTE sp_CreateCoach @user_Name = 'cecoach', @_email = 'nccoach@sandler.com',@region_Name = 'Canada-Eastern', @coach_Id = @_coachId OUTPUT;
		EXECUTE sp_CreateCoach @user_Name = 'cwoach', @_email = 'nccoach@sandler.com',@region_Name = 'Canada-Western', @coach_Id = @_coachId OUTPUT;
		
		PRINT 'Coaches created (7 US regions, 2 canada regions created.'
		-- Franchisee
		
		

		PRINT 'Franchisees created.'
		-- Franchisee Users
		

		PRINT 'Franchisees Users created.'
		--Charts
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

		PRINT '[TBL_CHART] data created.'
		--'[TBL_OPPORTUNITYSTATUS] Status
		INSERT INTO [SandlerDB].[dbo].[TBL_OPPORTUNITYSTATUS]([Name])VALUES('Prospect');
		INSERT INTO [SandlerDB].[dbo].[TBL_OPPORTUNITYSTATUS]([Name])VALUES('Assessment');
		INSERT INTO [SandlerDB].[dbo].[TBL_OPPORTUNITYSTATUS]([Name])VALUES('Suspect');

		PRINT '[TBL_OPPORTUNITYSTATUS] data created.'
		--[Tbl_Course] Data

		INSERT [dbo].[Tbl_Course] ( [CourseName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES ( N'Bootcamp', 1, NULL, NULL, N'System')
		INSERT [dbo].[Tbl_Course] ( [CourseName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES ( N'Foundations', 1, NULL, NULL, N'System')
		INSERT [dbo].[Tbl_Course] ( [CourseName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES ( N'Management', 1, NULL, NULL, N'System')
		INSERT [dbo].[Tbl_Course] ( [CourseName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES ( N'PC', 1, NULL, NULL, N'System')
		
		PRINT '[Tbl_Course] data created.'
		
		--[Tbl_YesNoOptions] Data
		INSERT [dbo].[Tbl_YesNoOptions] ( [Description], [Value]) VALUES ( N'No', 0)
		INSERT [dbo].[Tbl_YesNoOptions] ( [Description], [Value]) VALUES ( N'Yes', 1)
		
		PRINT '[Tbl_YesNoOptions] data created.'

		--[Tbl_ProductType] Data
		INSERT [dbo].[Tbl_ProductType] ( [ProductTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy],[FranchiseeId]) VALUES (N'Assessment', 1, NULL, NULL, N'System',0);
		INSERT [dbo].[Tbl_ProductType] ( [ProductTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy],[FranchiseeId]) VALUES (N'PC', 1, NULL, NULL, N'System',0);
		INSERT [dbo].[Tbl_ProductType] ( [ProductTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy],[FranchiseeId]) VALUES (N'Consulting', 1, NULL, NULL, N'System',0);
		INSERT [dbo].[Tbl_ProductType] ( [ProductTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy],[FranchiseeId]) VALUES (N'Training', 1, NULL, NULL, N'System',0);
		INSERT [dbo].[Tbl_ProductType] ( [ProductTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy],[FranchiseeId]) VALUES (N'Leadership', 1, NULL, NULL, N'System',0);
		INSERT [dbo].[Tbl_ProductType] ( [ProductTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy],[FranchiseeId]) VALUES (N'Coaching', 1, NULL, NULL, N'System',0);
		
		
		PRINT '[Tbl_ProductType] data created.'

		--[Tbl_IndustryType] Data
		INSERT [dbo].[Tbl_IndustryType] ([IndustryTypeName] ,[IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES ('Professional Services',1, NULL, NULL, N'System')
		INSERT [dbo].[Tbl_IndustryType] ([IndustryTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES ('Service Industry', 1, NULL, NULL, N'System')
		INSERT [dbo].[Tbl_IndustryType] ([IndustryTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES ('Manufacturing', 1, NULL, NULL, N'System')
		INSERT [dbo].[Tbl_IndustryType] ([IndustryTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES ('Software', 1, NULL, NULL, N'System')
		INSERT [dbo].[Tbl_IndustryType] ([IndustryTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES ('Consulting', 1, NULL, NULL, N'System')
		INSERT [dbo].[Tbl_IndustryType] ([IndustryTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES ('High Tech', 1, NULL, NULL, N'System')
		
		PRINT '[Tbl_IndustryType] data created.' 
		
		--[Tbl_AppointmentsSource] Data
		INSERT [dbo].[Tbl_AppointmentsSource] ( [ApptSourceName], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy], [IsActive]) VALUES (N'Referral', NULL, NULL, N'System', 1)
		INSERT [dbo].[Tbl_AppointmentsSource] ( [ApptSourceName], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy], [IsActive]) VALUES (N'Network', NULL, NULL, N'System', 1)
		INSERT [dbo].[Tbl_AppointmentsSource] ( [ApptSourceName], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy], [IsActive]) VALUES (N'Talk', NULL, NULL, N'System', 1)
		INSERT [dbo].[Tbl_AppointmentsSource] ( [ApptSourceName], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy], [IsActive]) VALUES (N'Cold Call', NULL, NULL, N'System', 1)
		INSERT [dbo].[Tbl_AppointmentsSource] ( [ApptSourceName], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy], [IsActive]) VALUES (N'Follow On', NULL, NULL, N'System', 1)
		
		PRINT '[Tbl_AppointmentsSource] data created.' 
		
		--[Tbl_DocumentStatus] Data
		INSERT [dbo].[Tbl_DocumentStatus] ( [DocStatusText], [IsActive], [CreatedBy], [UpdatedBy], [UpdatedOn]) VALUES (N'Daraft', 1, N'System', NULL, NULL)
		INSERT [dbo].[Tbl_DocumentStatus] ( [DocStatusText], [IsActive], [CreatedBy], [UpdatedBy], [UpdatedOn]) VALUES (N'In Review', 1, N'System', NULL, NULL)
		INSERT [dbo].[Tbl_DocumentStatus] ( [DocStatusText], [IsActive], [CreatedBy], [UpdatedBy], [UpdatedOn]) VALUES (N'Final', 1, N'System', NULL, NULL)
		INSERT [dbo].[Tbl_DocumentStatus] ( [DocStatusText], [IsActive], [CreatedBy], [UpdatedBy], [UpdatedOn]) VALUES (N'Approved', 1, N'System', NULL, NULL)
		INSERT [dbo].[Tbl_DocumentStatus] ( [DocStatusText], [IsActive], [CreatedBy], [UpdatedBy], [UpdatedOn]) VALUES (N'Reference', 1, N'System', NULL, NULL)
		
		
		PRINT '[Tbl_DocumentStatus] data created.' 
	COMMIT TRANSACTION;

END TRY

BEGIN CATCH

	PRINT 'Error ' + CONVERT(varchar(50), ERROR_NUMBER()) +
          ', Severity ' + CONVERT(varchar(5), ERROR_SEVERITY()) +
          ', State ' + CONVERT(varchar(5), ERROR_STATE()) + 
          ', Procedure ' + ISNULL(ERROR_PROCEDURE(), '-') + 
          ', Line ' + CONVERT(varchar(5), ERROR_LINE());
    PRINT ERROR_MESSAGE();
	
	
        ROLLBACK TRANSACTION;



END CATCH


