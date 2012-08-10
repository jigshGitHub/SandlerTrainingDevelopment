BEGIN TRY

	BEGIN TRANSACTION;

		DECLARE @User_Id uniqueidentifier
		DECLARE @CurrentTime DATETIME
		
		SET @CurrentTime = GetDate();
		
		EXEC [dbo].[aspnet_Roles_CreateRole] 'SandlerTraining','SiteAdmin';
		
		EXEC [dbo].[aspnet_Membership_CreateUser] @ApplicationName = N'SandlerTraining', @UserName = N'siteadmin', @Password = N'GNbb2dozNE4rulc7W8bRCSf8g5s=', @PasswordSalt = N'v6TQ0qbGAUIcMs/zYNhlbA==', @Email = N'siteadmin@siteadmin.com', @PasswordQuestion = NULL, @PasswordAnswer = NULL, @IsApproved = 1, @CurrentTimeUtc = @CurrentTime, @CreateDate = @CurrentTime, @UniqueEmail = NULL, @PasswordFormat = 1, @UserId = @User_Id OUTPUT;
		
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

		EXEC sp_CreateRegion @name = 'Canada-Eastern',  @countryCode = 'CA',  @region_Id = @regionID OUTPUT;
		EXEC sp_CreateRegion @name = 'Canada-Western',  @countryCode = 'CA',  @region_Id = @regionID OUTPUT;
		
		PRINT 'Regions created (7 US regions, 2 canada regions created.'
		
						
		EXEC [dbo].[aspnet_Membership_CreateUser] @ApplicationName = N'SandlerTraining', @UserName = N'corporateuser', @Password = N'DE5aG4DJKaWNAC6qtb9Ex1mw0YQ=', @PasswordSalt = N'CgWo/aHD6MDFG4AYqW/5wQ==', @Email = N'corporate@sandler.com', @PasswordQuestion = NULL, @PasswordAnswer = NULL, @IsApproved = 1, @CurrentTimeUtc = @CurrentTime, @CreateDate = @CurrentTime, @UniqueEmail = NULL, @PasswordFormat = 1, @UserId = @User_Id OUTPUT;
		
		EXEC [dbo].[aspnet_UsersInRoles_AddUsersToRoles] @ApplicationName = N'SandlerTraining', @UserNames = N'corporateuser', @RoleNames = N'Corporate', @CurrentTimeUtc = @CurrentTime
		
		PRINT 'CorporateUser created.'
		-- COACH
		DECLARE @coachId int

		EXECUTE sp_CreateCoach @user_Name = 'necoach', @_email = 'necoach@sandler.com',@region_Name = 'North East', @coach_Id = @coachId OUTPUT; 
		EXECUTE sp_CreateCoach @user_Name = 'macoach', @_email = 'macoach@sandler.com',@region_Name = 'Mid-Atlantic', @coach_Id = @coachId OUTPUT; 		
		EXECUTE sp_CreateCoach @user_Name = 'nccoach', @_email = 'nccoach@sandler.com',@region_Name = 'North Central', @coach_Id = @coachId OUTPUT;
		EXECUTE sp_CreateCoach @user_Name = 'glcoach', @_email = 'glcoach@sandler.com',@region_Name = 'Great Lakes', @coach_Id = @coachId OUTPUT;
		EXECUTE sp_CreateCoach @user_Name = 'secoach', @_email = 'secoach@sandler.com',@region_Name = 'South East', @coach_Id = @coachId OUTPUT;
		EXECUTE sp_CreateCoach @user_Name = 'sccoach', @_email = 'nccoach@sandler.com',@region_Name = 'South Central', @coach_Id = @coachId OUTPUT;
		EXECUTE sp_CreateCoach @user_Name = 'wcoach', @_email = 'nccoach@sandler.com',@region_Name = 'West', @coach_Id = @coachId OUTPUT;
		EXECUTE sp_CreateCoach @user_Name = 'cecoach', @_email = 'nccoach@sandler.com',@region_Name = 'Canada-Eastern', @coach_Id = @coachId OUTPUT;
		EXECUTE sp_CreateCoach @user_Name = 'cwoach', @_email = 'nccoach@sandler.com',@region_Name = 'Canada-Western', @coach_Id = @coachId OUTPUT;
		
		PRINT 'Coaches created (7 US regions, 2 canada regions created.'
		-- Franchisee
		DECLARE @franchiseeId int

		EXECUTE sp_CreateFranchisee @user_Name = 'nectfo', @_email = 'necoach@sandler.com', @_name = 'Connecticut Fr', @region_Name = 'North East', @countryCode = 'US', @franchisee_Id = @franchiseeId OUTPUT; 
		EXECUTE sp_CreateFranchisee @user_Name = 'seflfo', @_email = 'secoach@sandler.com', @_name = 'Florida Fr', @region_Name = 'South East', @countryCode = 'US', @franchisee_Id = @franchiseeId OUTPUT; 
		EXECUTE sp_CreateFranchisee @user_Name = 'ncchfo', @_email = 'nccoach@sandler.com', @_name = 'Chicago Fr', @region_Name = 'North Central', @countryCode = 'US', @franchisee_Id = @franchiseeId OUTPUT; 


		EXECUTE sp_CreateFranchisee @user_Name = 'mamd1fo', @_email = 'mamd1fo@sandler.com', @_name = 'Neuberger and Company, Inc.', @region_Name = 'Mid-Atlantic', @countryCode = 'US', @franchisee_Id = @franchiseeId OUTPUT; 
		EXECUTE sp_CreateFranchisee @user_Name = 'mamd2fo', @_email = 'mamd2fo@sandler.com', @_name = 'Professional Achievement Group, Inc.', @region_Name = 'Mid-Atlantic', @countryCode = 'US', @franchisee_Id = @franchiseeId OUTPUT; 
		EXECUTE sp_CreateFranchisee @user_Name = 'mamd3fo', @_email = 'mamd3fo@sandler.com', @_name = 'McDonell Consulting & Development, Inc.', @region_Name = 'Mid-Atlantic', @countryCode = 'US', @franchisee_Id = @franchiseeId OUTPUT; 

		EXECUTE sp_CreateFranchisee @user_Name = 'adarling', @_email = 'adarling@sandler.com', @_name = 'ABC Training Center', @region_Name = 'Mid-Atlantic', @countryCode = 'US', @franchisee_Id = @franchiseeId OUTPUT; 
		EXECUTE sp_CreateFranchisee @user_Name = 'pdarling', @_email = 'pdarling@sandler.com', @_name = 'XYZ Training Center', @region_Name = 'Mid-Atlantic', @countryCode = 'US', @franchisee_Id = @franchiseeId OUTPUT; 
		
		PRINT '8 Franchisees created.'
		-- Franchisee Users
		DECLARE @userId uniqueidentifier
		EXECUTE sp_CreateFranchisee_User @user_Name = 'ctfruser', @_email = 'ctfruser@sandler.com', @franchisee_Name = 'Connecticut Fr', @User_Id = @userId OUTPUT; 
		SET @userId = NULL;
		EXECUTE sp_CreateFranchisee_User @user_Name = 'flfruser', @_email = 'flfruser@sandler.com', @franchisee_Name = 'Florida Fr', @User_Id = @userId OUTPUT; 
		SET @userId = NULL;
		EXECUTE sp_CreateFranchisee_User @user_Name = 'chfruser', @_email = 'chfruser@sandler.com', @franchisee_Name = 'Chicago Fr', @User_Id = @userId OUTPUT; 
		SET @userId = NULL;

		EXECUTE sp_CreateFranchisee_User @user_Name = 'abcuser1', @_email = 'abcuser1@sandler.com', @franchisee_Name = 'ABC Training Center', @User_Id = @userId OUTPUT; 
		SET @userId = NULL;
		EXECUTE sp_CreateFranchisee_User @user_Name = 'xyzuser1', @_email = 'xyzuser1@sandler.com', @franchisee_Name = 'XYZ Training Center', @User_Id = @userId OUTPUT; 
		SET @userId = NULL;
		
		EXECUTE sp_CreateFranchisee_User @user_Name = 'mamd1fouser1', @_email = 'mamd1fouser1@sandler.com', @franchisee_Name = 'Neuberger and Company, Inc.', @User_Id = @userId OUTPUT; 
		SET @userId = NULL;
		EXECUTE sp_CreateFranchisee_User @user_Name = 'mamd2fouser2', @_email = 'mamd2fouser2@sandler.com', @franchisee_Name = 'Professional Achievement Group, Inc.', @User_Id = @userId OUTPUT; 
		SET @userId = NULL;
		EXECUTE sp_CreateFranchisee_User @user_Name = 'mamd3fouser3', @_email = 'mamd3fouser3@sandler.com', @franchisee_Name = 'McDonell Consulting & Development, Inc.', @User_Id = @userId OUTPUT; 
		
		PRINT '8 Franchisees Users created.'
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

		SET IDENTITY_INSERT [dbo].[Tbl_Course] ON
		INSERT [dbo].[Tbl_Course] ([CourseId], [CourseName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES (1, N'Bootcamp', 1, NULL, NULL, N'System')
		INSERT [dbo].[Tbl_Course] ([CourseId], [CourseName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES (2, N'Foundations', 1, NULL, NULL, N'System')
		INSERT [dbo].[Tbl_Course] ([CourseId], [CourseName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES (3, N'Management', 1, NULL, NULL, N'System')
		INSERT [dbo].[Tbl_Course] ([CourseId], [CourseName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES (4, N'PC', 1, NULL, NULL, N'System')
		SET IDENTITY_INSERT [dbo].[Tbl_Course] OFF
		
		PRINT '[Tbl_Course] data created.'
		
		--[Tbl_YesNoOptions] Data
		SET IDENTITY_INSERT [dbo].[Tbl_YesNoOptions] ON
		INSERT [dbo].[Tbl_YesNoOptions] ([id], [Description], [Value]) VALUES (1, N'No', 0)
		INSERT [dbo].[Tbl_YesNoOptions] ([id], [Description], [Value]) VALUES (2, N'Yes', 1)
		SET IDENTITY_INSERT [dbo].[Tbl_YesNoOptions] OFF
		
		PRINT '[Tbl_YesNoOptions] data created.'

		--[Tbl_ProductType] Data
		SET IDENTITY_INSERT [dbo].[Tbl_ProductType] ON
		INSERT [dbo].[Tbl_ProductType] ([Id], [ProductTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy],[FranchiseeId]) VALUES (1, N'Assessment', 1, NULL, NULL, N'System',0);
		INSERT [dbo].[Tbl_ProductType] ([Id], [ProductTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy],[FranchiseeId]) VALUES (2, N'PC', 1, NULL, NULL, N'System',0);
		INSERT [dbo].[Tbl_ProductType] ([Id], [ProductTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy],[FranchiseeId]) VALUES (3, N'Consulting', 1, NULL, NULL, N'System',0);
		INSERT [dbo].[Tbl_ProductType] ([Id], [ProductTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy],[FranchiseeId]) VALUES (4, N'Training', 1, NULL, NULL, N'System',0);
		INSERT [dbo].[Tbl_ProductType] ([Id], [ProductTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy],[FranchiseeId]) VALUES (5, N'Leadership', 1, NULL, NULL, N'System',0);
		INSERT [dbo].[Tbl_ProductType] ([Id], [ProductTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy],[FranchiseeId]) VALUES (6, N'Coaching', 1, NULL, NULL, N'System',0);
		SET IDENTITY_INSERT [dbo].[Tbl_ProductType] OFF
		
		PRINT '[Tbl_ProductType] data created.'

		--[Tbl_IndustryType] Data
		SET IDENTITY_INSERT [dbo].[Tbl_IndustryType] ON
		INSERT [dbo].[Tbl_IndustryType] ([IndId], [IndustryTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES (1, N'Professional Services', 1, NULL, NULL, N'System')
		INSERT [dbo].[Tbl_IndustryType] ([IndId], [IndustryTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES (2, N'Service Industry', 1, NULL, NULL, N'System')
		INSERT [dbo].[Tbl_IndustryType] ([IndId], [IndustryTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES (3, N'Manufacturing', 1, NULL, NULL, N'System')
		INSERT [dbo].[Tbl_IndustryType] ([IndId], [IndustryTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES (4, N'Software', 1, NULL, NULL, N'System')
		INSERT [dbo].[Tbl_IndustryType] ([IndId], [IndustryTypeName], [IsActive], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy]) VALUES (5, N'Consulting', 1, NULL, NULL, N'System')
		SET IDENTITY_INSERT [dbo].[Tbl_IndustryType] OFF
		
		PRINT '[Tbl_IndustryType] data created.' 
		
		--[Tbl_AppointmentsSource] Data
		SET IDENTITY_INSERT [dbo].[Tbl_AppointmentsSource] ON
		INSERT [dbo].[Tbl_AppointmentsSource] ([ApptSourceId], [ApptSourceName], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy], [IsActive]) VALUES (1, N'Referral', NULL, NULL, N'System', 1)
		INSERT [dbo].[Tbl_AppointmentsSource] ([ApptSourceId], [ApptSourceName], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy], [IsActive]) VALUES (2, N'Network', NULL, NULL, N'System', 1)
		INSERT [dbo].[Tbl_AppointmentsSource] ([ApptSourceId], [ApptSourceName], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy], [IsActive]) VALUES (3, N'Talk', NULL, NULL, N'System', 1)
		INSERT [dbo].[Tbl_AppointmentsSource] ([ApptSourceId], [ApptSourceName], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy], [IsActive]) VALUES (4, N'Cold Call', NULL, NULL, N'System', 1)
		INSERT [dbo].[Tbl_AppointmentsSource] ([ApptSourceId], [ApptSourceName], [LastUpdatedDate], [LastUpdatedBy], [CreatedBy], [IsActive]) VALUES (5, N'Follow On', NULL, NULL, N'System', 1)
		SET IDENTITY_INSERT [dbo].[Tbl_AppointmentsSource] OFF

		PRINT '[Tbl_AppointmentsSource] data created.' 
		
		--[Tbl_DocumentStatus] Data
		SET IDENTITY_INSERT [dbo].[Tbl_DocumentStatus] ON
		INSERT [dbo].[Tbl_DocumentStatus] ([DocStatusId], [DocStatusText], [IsActive], [CreatedBy], [UpdatedBy], [UpdatedOn]) VALUES (1, N'Daraft', 1, N'System', NULL, NULL)
		INSERT [dbo].[Tbl_DocumentStatus] ([DocStatusId], [DocStatusText], [IsActive], [CreatedBy], [UpdatedBy], [UpdatedOn]) VALUES (2, N'In Review', 1, N'System', NULL, NULL)
		INSERT [dbo].[Tbl_DocumentStatus] ([DocStatusId], [DocStatusText], [IsActive], [CreatedBy], [UpdatedBy], [UpdatedOn]) VALUES (3, N'Final', 1, N'System', NULL, NULL)
		INSERT [dbo].[Tbl_DocumentStatus] ([DocStatusId], [DocStatusText], [IsActive], [CreatedBy], [UpdatedBy], [UpdatedOn]) VALUES (4, N'Approved', 1, N'System', NULL, NULL)
		INSERT [dbo].[Tbl_DocumentStatus] ([DocStatusId], [DocStatusText], [IsActive], [CreatedBy], [UpdatedBy], [UpdatedOn]) VALUES (5, N'Reference', 1, N'System', NULL, NULL)
		SET IDENTITY_INSERT [dbo].[Tbl_DocumentStatus] OFF
		
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


