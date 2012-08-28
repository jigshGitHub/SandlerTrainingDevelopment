USE [SandlerDB]
GO

DECLARE @_coachId int
DECLARE @_franchiseeId int
DECLARE @_UserID uniqueidentifier
DECLARE @regionID int
DECLARE @CurrentTime DATETIME
		
SET @CurrentTime = GetDate();

EXEC [dbo].[aspnet_Membership_CreateUser] @ApplicationName = N'SandlerTraining', @UserName = N'dave.mattson', @Password = N'DE5aG4DJKaWNAC6qtb9Ex1mw0YQ=', @PasswordSalt = N'CgWo/aHD6MDFG4AYqW/5wQ==', @Email = N'dmattson@sandler.com', @PasswordQuestion = NULL, @PasswordAnswer = NULL, @IsApproved = 1, @CurrentTimeUtc = @CurrentTime, @CreateDate = @CurrentTime, @UniqueEmail = NULL, @PasswordFormat = 1, @UserId = @_UserID OUTPUT;
SET @_UserID = NULL;
EXEC [dbo].[aspnet_Membership_CreateUser] @ApplicationName = N'SandlerTraining', @UserName = N'michael.norton', @Password = N'DE5aG4DJKaWNAC6qtb9Ex1mw0YQ=', @PasswordSalt = N'CgWo/aHD6MDFG4AYqW/5wQ==', @Email = N'mnorton@sandler.com', @PasswordQuestion = NULL, @PasswordAnswer = NULL, @IsApproved = 1, @CurrentTimeUtc = @CurrentTime, @CreateDate = @CurrentTime, @UniqueEmail = NULL, @PasswordFormat = 1, @UserId = @_UserID OUTPUT;
SET @_UserID = NULL;
EXEC [dbo].[aspnet_Membership_CreateUser] @ApplicationName = N'SandlerTraining', @UserName = N'kimberly.greer', @Password = N'DE5aG4DJKaWNAC6qtb9Ex1mw0YQ=', @PasswordSalt = N'CgWo/aHD6MDFG4AYqW/5wQ==', @Email = N'kgreer@sandler.com', @PasswordQuestion = NULL, @PasswordAnswer = NULL, @IsApproved = 1, @CurrentTimeUtc = @CurrentTime, @CreateDate = @CurrentTime, @UniqueEmail = NULL, @PasswordFormat = 1, @UserId = @_UserID OUTPUT;
SET @_UserID = NULL;
EXEC [dbo].[aspnet_Membership_CreateUser] @ApplicationName = N'SandlerTraining', @UserName = N'seidman', @Password = N'DE5aG4DJKaWNAC6qtb9Ex1mw0YQ=', @PasswordSalt = N'CgWo/aHD6MDFG4AYqW/5wQ==', @Email = N'seidman@sandler.com', @PasswordQuestion = NULL, @PasswordAnswer = NULL, @IsApproved = 1, @CurrentTimeUtc = @CurrentTime, @CreateDate = @CurrentTime, @UniqueEmail = NULL, @PasswordFormat = 1, @UserId = @_UserID OUTPUT;
SET @_UserID = NULL;
EXEC [dbo].[aspnet_UsersInRoles_AddUsersToRoles] @ApplicationName = N'SandlerTraining', @UserNames = N'dave.mattson,michael.norton,kimberly.greer,seidman', @RoleNames = N'Corporate', @CurrentTimeUtc = @CurrentTime

EXECUTE sp_CreateCoach @user_Name = 'seidman.canada-eastern', @_email = 'seidman@sandler.com',@region_Name = 'Canada-Eastern', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;
EXECUTE sp_CreateCoach @user_Name = 'seidman.canada-western', @_email = 'seidman@sandler.com',@region_Name = 'Canada-Western', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;
EXECUTE sp_CreateCoach @user_Name = 'seidman.greatlakes', @_email = 'seidman@sandler.com',@region_Name = 'Great Lakes', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;
EXECUTE sp_CreateCoach @user_Name = 'seidman.mid-atlantic', @_email = 'seidman@sandler.com',@region_Name = 'Mid-Atlantic', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;
EXECUTE sp_CreateCoach @user_Name = 'seidman.northcentral', @_email = 'seidman@sandler.com',@region_Name = 'North Central', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;
EXECUTE sp_CreateCoach @user_Name = 'seidman.northeast', @_email = 'seidman@sandler.com',@region_Name = 'North East', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;
EXECUTE sp_CreateCoach @user_Name = 'seidman.southeast', @_email = 'seidman@sandler.com',@region_Name = 'South East', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;
EXECUTE sp_CreateCoach @user_Name = 'seidman.west', @_email = 'seidman@sandler.com',@region_Name = 'West', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;

EXECUTE sp_CreateCoach @user_Name = 'steve.howell', @_email = 'showell@sandler.com',@region_Name = 'North East', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;

EXECUTE sp_CreateCoach @user_Name = 'bill.art.canada-eastern', @_email = 'bart@sandler.com',@region_Name = 'Canada-Eastern', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;
EXECUTE sp_CreateCoach @user_Name = 'bill.art.greatlakes', @_email = 'bart@sandler.com',@region_Name = 'Great Lakes', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;
EXECUTE sp_CreateCoach @user_Name = 'bill.art.northcentral', @_email = 'bart@sandler.com',@region_Name = 'North Central', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;
EXECUTE sp_CreateCoach @user_Name = 'bill.art.northeast', @_email = 'bart@sandler.com',@region_Name = 'North East', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;
EXECUTE sp_CreateCoach @user_Name = 'bill.art.southeast', @_email = 'bart@sandler.com',@region_Name = 'South East', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;
EXECUTE sp_CreateCoach @user_Name = 'bill.art.southcentral', @_email = 'bart@sandler.com',@region_Name = 'South Central', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;
EXECUTE sp_CreateCoach @user_Name = 'bill.art.west', @_email = 'bart@sandler.com',@region_Name = 'West', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;

EXECUTE sp_CreateCoach @user_Name = 'john.shrum.canada-western', @_email = 'jshrum@sandler.com',@region_Name = 'Canada-Western', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;
EXECUTE sp_CreateCoach @user_Name = 'john.shrum.mid-atlantic', @_email = 'jshrum@sandler.com',@region_Name = 'Mid-Atlantic', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;
EXECUTE sp_CreateCoach @user_Name = 'john.shrum.northcentral', @_email = 'jshrum@sandler.com',@region_Name = 'North Central', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;
EXECUTE sp_CreateCoach @user_Name = 'john.shrum.southcentral', @_email = 'jshrum@sandler.com',@region_Name = 'South Central', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;
EXECUTE sp_CreateCoach @user_Name = 'john.shrum.west', @_email = 'jshrum@sandler.com',@region_Name = 'West', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;

EXECUTE sp_CreateCoach @user_Name = 'tom.fecteau.canada-eastern', @_email = 'tfecteau@sandler.com',@region_Name = 'Canada-Eastern', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;
EXECUTE sp_CreateCoach @user_Name = 'tom.fecteau.mid-atlantic', @_email = 'tfecteau@sandler.com',@region_Name = 'Mid-Atlantic', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;
EXECUTE sp_CreateCoach @user_Name = 'tom.fecteau.northcentral', @_email = 'tfecteau@sandler.com',@region_Name = 'North Central', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;
EXECUTE sp_CreateCoach @user_Name = 'tom.fecteau.northeast', @_email = 'tfecteau@sandler.com',@region_Name = 'North East', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;
EXECUTE sp_CreateCoach @user_Name = 'tom.fecteau.southcentral', @_email = 'tfecteau@sandler.com',@region_Name = 'South Central', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;
EXECUTE sp_CreateCoach @user_Name = 'tom.fecteau.west', @_email = 'tfecteau@sandler.com',@region_Name = 'West', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;

EXECUTE sp_CreateCoach @user_Name = 'rich.levinson.canada-eastern', @_email = 'rlevinson@sandler.com',@region_Name = 'Canada-Eastern', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;
EXECUTE sp_CreateCoach @user_Name = 'rich.levinson.canada-western', @_email = 'rlevinson@sandler.com',@region_Name = 'Canada-western', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;
EXECUTE sp_CreateCoach @user_Name = 'rich.levinson.greatlakes', @_email = 'rlevinson@sandler.com',@region_Name = 'Great Lakes', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;
EXECUTE sp_CreateCoach @user_Name = 'rich.levinson.mid-atlantic', @_email = 'rlevinson@sandler.com',@region_Name = 'Mid-Atlantic', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;
EXECUTE sp_CreateCoach @user_Name = 'rich.levinson.northcentral', @_email = 'rlevinson@sandler.com',@region_Name = 'North Central', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;
EXECUTE sp_CreateCoach @user_Name = 'rich.levinson.northeast', @_email = 'rlevinson@sandler.com',@region_Name = 'North East', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;
EXECUTE sp_CreateCoach @user_Name = 'rich.levinson.southcentral', @_email = 'rlevinson@sandler.com',@region_Name = 'South Central', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;
EXECUTE sp_CreateCoach @user_Name = 'rich.levinson.west', @_email = 'rlevinson@sandler.com',@region_Name = 'West', @coach_Id = @_coachId OUTPUT; 
SET @_coachId = NULL;

SELECT @_coachId = c.ID FROM TBL_COACH c INNER JOIN aspnet_Users u ON u.UserId = c.UserID WHERE u.UserName = 'bill.art.west' AND c.IsActive = 1;
PRINT CAST(@_coachId as VARCHAR(10));

EXECUTE sp_CreateFranchisee @user_Name = 'joan.stephens', @_email = 'joan.stephens@sandler.com', @_name = 'Crossroads Business Development Inc.', @coachId = @_coachId, @countryCode = 'US', @franchisee_Id = @_franchiseeId OUTPUT; 
SET @_franchiseeId=null;

EXECUTE sp_CreateFranchisee @user_Name = 'jim.stephens', @_email = 'jim.stephens@sandler.com', @_name = 'Crossroads Business Development Inc.', @coachId = @_coachId, @countryCode = 'US', @franchisee_Id = @_franchiseeId OUTPUT; 
SET @_franchiseeId=null;

EXECUTE sp_CreateFranchisee @user_Name = 'justin.stephens', @_email = 'justin.stephens@sandler.com', @_name = 'Crossroads Business Development Inc.', @coachId = @_coachId, @countryCode = 'US', @franchisee_Id = @_franchiseeId OUTPUT; 
SET @_franchiseeId=null;

EXECUTE sp_CreateFranchisee @user_Name = 'jenn.stephens', @_email = 'jenn.stephens@sandler.com', @_name = 'Crossroads Business Development Inc.', @coachId = @_coachId, @countryCode = 'US', @franchisee_Id = @_franchiseeId OUTPUT; 
SET @_franchiseeId=null;

EXECUTE sp_CreateFranchisee @user_Name = 'dave.tester', @_email = 'dave.tester@sandler.com', @_name = 'Crossroads Business Development Inc.', @coachId = @_coachId, @countryCode = 'US', @franchisee_Id = @_franchiseeId OUTPUT; 
SET @_franchiseeId=null;

SET @_coachId = NULL;
SELECT @_coachId = c.ID FROM TBL_COACH c INNER JOIN aspnet_Users u ON u.UserId = c.UserID WHERE u.UserName = 'john.shrum.mid-atlantic' AND c.IsActive = 1;
PRINT CAST(@_coachId as VARCHAR(10));

EXECUTE sp_CreateFranchisee @user_Name = 'matthew.neuberger', @_email = 'matthew@neubergerco.com', @_name = 'Neuberger & Company Inc', @coachId = @_coachId, @countryCode = 'US', @franchisee_Id = @_franchiseeId OUTPUT; 

EXECUTE sp_CreateFranchisee_User @user_Name = 'lynn.neuberger', @_email = 'lynne@neubergerco.com', @franchiseeId = @_franchiseeId, @User_Id = @_UserID OUTPUT; 
SET @_UserID = NULL;
EXECUTE sp_CreateFranchisee_User @user_Name = 'patty.neuberger', @_email = 'patty@neubergerco.com', @franchiseeId = @_franchiseeId, @User_Id = @_UserID OUTPUT; 
SET @_UserID = NULL;

SELECT @_coachId = c.ID FROM TBL_COACH c INNER JOIN aspnet_Users u ON u.UserId = c.UserID WHERE u.UserName = 'john.shrum.canada-western' AND c.IsActive = 1;
PRINT CAST(@_coachId as VARCHAR(10));

EXECUTE sp_CreateFranchisee @user_Name = 'hamish.knox', @_email = 'hamish@sandler.com', @_name = 'Hamish Knox.', @coachId = @_coachId, @countryCode = 'US', @franchisee_Id = @_franchiseeId OUTPUT; 
SET @_franchiseeId=null;

SELECT @_coachId = c.ID FROM TBL_COACH c INNER JOIN aspnet_Users u ON u.UserId = c.UserID WHERE u.UserName = 'tom.fecteau.mid-atlantic' AND c.IsActive = 1;
PRINT CAST(@_coachId as VARCHAR(10));

EXECUTE sp_CreateFranchisee @user_Name = 'rochelle.carrington', @_email = 'rochelle@sandler.com', @_name = 'Second Wind Advisory Group', @coachId = @_coachId, @countryCode = 'US', @franchisee_Id = @_franchiseeId OUTPUT; 
EXECUTE sp_CreateFranchisee_User @user_Name = 'judah.domke', @_email = 'judahdomke@gmail.com', @franchiseeId = @_franchiseeId, @User_Id = @_UserID OUTPUT; 
SET @_franchiseeId=null;
SET @_UserID = NULL;

SELECT @_coachId = c.ID FROM TBL_COACH c INNER JOIN aspnet_Users u ON u.UserId = c.UserID WHERE u.UserName = 'john.shrum.mid-atlantic' AND c.IsActive = 1;
PRINT CAST(@_coachId as VARCHAR(10));

EXECUTE sp_CreateFranchisee @user_Name = 'rich.chiarello', @_email = 'richchiarello@aol.com', @_name = 'Above the Line, LLC', @coachId = @_coachId, @countryCode = 'US', @franchisee_Id = @_franchiseeId OUTPUT; 
SET @_franchiseeId=null;
SET @_UserID = NULL;
SELECT @_coachId = c.ID FROM TBL_COACH c INNER JOIN aspnet_Users u ON u.UserId = c.UserID WHERE u.UserName = 'tom.fecteau.southcentral' AND c.IsActive = 1;
PRINT CAST(@_coachId as VARCHAR(10));

EXECUTE sp_CreateFranchisee @user_Name = 'karl.scheible', @_email = 'karls@sandler.com', @_name = 'Market Sense, Inc', @coachId = @_coachId, @countryCode = 'US', @franchisee_Id = @_franchiseeId OUTPUT; 

EXECUTE sp_CreateFranchisee_User @user_Name = 'adam.boyd', @_email = 'adamb@sandler.com', @franchiseeId = @_franchiseeId, @User_Id = @_UserID OUTPUT; 
SET @_UserID = NULL;
EXECUTE sp_CreateFranchisee_User @user_Name = 'sherrie.english', @_email = 'sheriee@ms-tx.com', @franchiseeId = @_franchiseeId, @User_Id = @_UserID OUTPUT; 
SET @_UserID = NULL;
EXECUTE sp_CreateFranchisee_User @user_Name = 'john.oberg', @_email = 'johno@ms-tx.com', @franchiseeId = @_franchiseeId, @User_Id = @_UserID OUTPUT; 
SET @_UserID = NULL;
EXECUTE sp_CreateFranchisee_User @user_Name = 'myles.weynand', @_email = 'mylesw@sandler.com', @franchiseeId = @_franchiseeId, @User_Id = @_UserID OUTPUT; 
SET @_UserID = NULL;
SET @_franchiseeId=null;

SELECT @_coachId = c.ID FROM TBL_COACH c INNER JOIN aspnet_Users u ON u.UserId = c.UserID WHERE u.UserName = 'seidman.canada-eastern' AND c.IsActive = 1;
PRINT CAST(@_coachId as VARCHAR(10));

EXECUTE sp_CreateFranchisee @user_Name = 'terry.ledden', @_email = 'tledden@sandler.com', @_name = 'Sales About Face, Inc', @coachId = @_coachId, @countryCode = 'US', @franchisee_Id = @_franchiseeId OUTPUT; 
SET @_franchiseeId = NULL;
EXECUTE sp_CreateFranchisee @user_Name = 'barb.ledden', @_email = 'bariss@sandler.com', @_name = 'Sales About Face, Inc', @coachId = @_coachId, @countryCode = 'US', @franchisee_Id = @_franchiseeId OUTPUT; 
SET @_franchiseeId = NULL;
EXECUTE sp_CreateFranchisee @user_Name = 'la.palamar', @_email = 'lapalamar@sandler.com', @_name = 'Sales About Face, Inc', @coachId = @_coachId, @countryCode = 'US', @franchisee_Id = @_franchiseeId OUTPUT; 
SET @_franchiseeId = NULL;
EXECUTE sp_CreateFranchisee @user_Name = 'whitney.belanger', @_email = 'wbelanger@sandler.com', @_name = 'Sales About Face, Inc', @coachId = @_coachId, @countryCode = 'US', @franchisee_Id = @_franchiseeId OUTPUT; 
SET @_UserID = NULL;
SET @_franchiseeId=null;
SELECT @_coachId = c.ID FROM TBL_COACH c INNER JOIN aspnet_Users u ON u.UserId = c.UserID WHERE u.UserName = 'john.shrum.mid-atlantic' AND c.IsActive = 1;
PRINT CAST(@_coachId as VARCHAR(10));

EXECUTE sp_CreateFranchisee @user_Name = 'frank.garza', @_email = 'fgarza@sandler.com', @_name = 'Virginia Sandler Training', @coachId = @_coachId, @countryCode = 'US', @franchisee_Id = @_franchiseeId OUTPUT; 

