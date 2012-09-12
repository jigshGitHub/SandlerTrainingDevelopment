USE [SandlerDB]
GO

DECLARE @regionID INT 
DECLARE @coachId int
DECLARE @franchiseeId int
DECLARE @userId uniqueidentifier
DECLARE @CurrentTime DATETIME
DECLARE @_corporateUserId uniqueidentifier
SET @CurrentTime = GetDate();

EXEC [dbo].[aspnet_Membership_CreateUser] @ApplicationName = N'SandlerTraining', @UserName = N'adarling', @Password = N'DE5aG4DJKaWNAC6qtb9Ex1mw0YQ=', @PasswordSalt = N'CgWo/aHD6MDFG4AYqW/5wQ==', @Email = N'adarling@sandler.com', @PasswordQuestion = NULL, @PasswordAnswer = NULL, @IsApproved = 1, @CurrentTimeUtc = @CurrentTime, @CreateDate = @CurrentTime, @UniqueEmail = NULL, @PasswordFormat = 1, @UserId = @_corporateUserId OUTPUT;
		
EXEC [dbo].[aspnet_UsersInRoles_AddUsersToRoles] @ApplicationName = N'SandlerTraining', @UserNames = N'adarling', @RoleNames = N'Corporate', @CurrentTimeUtc = @CurrentTime

PRINT 'CorporateUser created.'
SET @userId = NULL;

EXEC sp_CreateRegion @name = 'London Region',  @countryCode = 'GB',  @region_Id = @regionID OUTPUT;
PRINT 'London Region created Id = ' + CAST(@regionID as VARCHAR(10));

EXECUTE sp_CreateCoach @user_Name = 'CLondon', @_email = 'CLondon@sandler.com',@region_Name = 'London Region', @corporateUserID = @_corporateUserId, @coach_Id = @coachId OUTPUT; 
PRINT 'London Coach created Id = ' + CAST(@coachId as VARCHAR(10));

EXECUTE sp_CreateFranchisee @user_Name = 'FOLondon1', @_email = 'FOLondon1@sandler.com', @_name = 'London Franchise1', @region_Name = 'London Region', @countryCode = 'GB', @franchisee_Id = @franchiseeId OUTPUT; 
PRINT 'London Franchise1 created Id = ' + CAST(@franchiseeId as VARCHAR(10));

EXECUTE sp_CreateFranchisee_User @user_Name = 'User1London1', @_email = 'User1London1@sandler.com', @franchisee_Name = 'London Franchise1', @User_Id = @userId OUTPUT; 
PRINT 'London Franchise1 User1 created Id = ' 
PRINT @userId;
SET @userId = Null;

EXECUTE sp_CreateFranchisee_User @user_Name = 'User2London1', @_email = 'User2London1@sandler.com', @franchisee_Name = 'London Franchise1', @User_Id = @userId OUTPUT; 
PRINT 'London Franchise1 User2 created Id = ' 
PRINT @userId;
SET @userId = Null;

EXECUTE sp_CreateFranchisee @user_Name = 'FOLondon2', @_email = 'FOLondon2@sandler.com', @_name = 'London Franchise2', @region_Name = 'London Region', @countryCode = 'GB', @franchisee_Id = @franchiseeId OUTPUT; 
PRINT 'London Franchise2 created Id = ' + CAST(@franchiseeId as VARCHAR(10));

EXECUTE sp_CreateFranchisee_User @user_Name = 'User1London2', @_email = 'User1London2@sandler.com', @franchisee_Name = 'London Franchise2', @User_Id = @userId OUTPUT; 
PRINT 'London Franchise2 User1 created Id = ' 
PRINT @userId;
SET @userId = Null;

EXECUTE sp_CreateFranchisee_User @user_Name = 'User2London2', @_email = 'User2London2@sandler.com', @franchisee_Name = 'London Franchise2', @User_Id = @userId OUTPUT; 
PRINT 'London Franchise2 User2 created Id = ' 
PRINT @userId;
SET @userId = Null;

SET @regionID = NULL;
SET @coachId = NULL;
SET @franchiseeId = NULL;
SET @userId = Null;

INSERT INTO [SandlerDB].[dbo].[TBL_COUNTRY] ([Code], [Name]) VALUES ( 'SL' ,'Scotland');

EXEC sp_CreateRegion @name = 'Scotland Region',  @countryCode = 'SL',  @region_Id = @regionID OUTPUT;
PRINT 'Scotland Region created Id = ' + CAST(@regionID as VARCHAR(10));

EXECUTE sp_CreateCoach @user_Name = 'CScotland', @_email = 'CScotland@sandler.com',@region_Name = 'Scotland Region',@corporateUserID = @_corporateUserId, @coach_Id = @coachId OUTPUT; 
PRINT 'Scotland Coach created Id = ' + CAST(@coachId as VARCHAR(10));

EXECUTE sp_CreateFranchisee @user_Name = 'FOScotland1', @_email = 'FOScotland1@sandler.com', @_name = 'Scotland Franchise1', @region_Name = 'Scotland Region', @countryCode = 'SL', @franchisee_Id = @franchiseeId OUTPUT; 
PRINT 'Scotland Franchise1 created Id = ' + CAST(@franchiseeId as VARCHAR(10));

EXECUTE sp_CreateFranchisee_User @user_Name = 'User1Scotland1', @_email = 'User1Scotland1@sandler.com', @franchisee_Name = 'Scotland Franchise1', @User_Id = @userId OUTPUT; 
PRINT 'Scotland Franchise1 User1 created Id = ' 
PRINT @userId;
SET @userId = Null;

EXECUTE sp_CreateFranchisee_User @user_Name = 'User2Scotland1', @_email = 'User2Scotland1@sandler.com', @franchisee_Name = 'Scotland Franchise1', @User_Id = @userId OUTPUT; 
PRINT 'Scotland Franchise1 User2 created Id = ' 
PRINT @userId;
SET @userId = Null;

EXECUTE sp_CreateFranchisee @user_Name = 'FOScotland2', @_email = 'FOScotland2@sandler.com', @_name = 'Scotland Franchise2', @region_Name = 'Scotland Region', @countryCode = 'SL', @franchisee_Id = @franchiseeId OUTPUT; 
PRINT 'Scotland Franchise2 created Id = ' + CAST(@franchiseeId as VARCHAR(10));

EXECUTE sp_CreateFranchisee_User @user_Name = 'User1Scotland2', @_email = 'User1Scotland2@sandler.com', @franchisee_Name = 'Scotland Franchise2', @User_Id = @userId OUTPUT; 
PRINT 'Scotland Franchise2 User1 created Id = '  
PRINT @userId;
SET @userId = Null;

EXECUTE sp_CreateFranchisee_User @user_Name = 'User2Scotland2', @_email = 'User2Scotland2@sandler.com', @franchisee_Name = 'Scotland Franchise2', @User_Id = @userId OUTPUT; 
PRINT 'Scotland Franchise2 User2 created Id = ' 
PRINT @userId;
SET @userId = Null;

EXEC [dbo].[aspnet_Membership_CreateUser] @ApplicationName = N'SandlerTraining', @UserName = N'pdarling', @Password = N'DE5aG4DJKaWNAC6qtb9Ex1mw0YQ=', @PasswordSalt = N'CgWo/aHD6MDFG4AYqW/5wQ==', @Email = N'corporate@sandler.com', @PasswordQuestion = NULL, @PasswordAnswer = NULL, @IsApproved = 1, @CurrentTimeUtc = @CurrentTime, @CreateDate = @CurrentTime, @UniqueEmail = NULL, @PasswordFormat = 1, @UserId = @userId OUTPUT;
		
EXEC [dbo].[aspnet_UsersInRoles_AddUsersToRoles] @ApplicationName = N'SandlerTraining', @UserNames = N'pdarling', @RoleNames = N'Corporate', @CurrentTimeUtc = @CurrentTime
		


