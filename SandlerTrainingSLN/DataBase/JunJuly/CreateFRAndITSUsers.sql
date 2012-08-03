USE [SandlerDB]
GO

DECLARE @franchiseeId int;
DECLARE @regionName NVARCHAR(500);
DECLARE @franchiseeName NVARCHAR(500);
DECLARE @userId uniqueidentifier;
DECLARE @franchiseeOwnerUserName NVARCHAR(500), @franchiseeOwnerEmail NVARCHAR(500),@franchiseeUserName NVARCHAR(500), @franchiseeUserEmail NVARCHAR(500); 

--Set values 
SET @regionName = 'Mid-Atlantic';
SET @franchiseeName = 'GAorida Tech Center';
SET @franchiseeOwnerUserName = 'jshahGAFO';
SET @franchiseeOwnerEmail = 'jshahGAFO@sandler.com';
SET @franchiseeUserName = 'jshahGAFU2';
SET @franchiseeUserEmail = 'jshahGAFU2@sandler.com';

BEGIN TRY
	BEGIN TRAN
	-- --Create franchisee
	EXECUTE sp_CreateFranchisee @user_Name = @franchiseeOwnerUserName, @_email = @franchiseeOwnerEmail, @_name = @franchiseeName, @region_Name = @regionName, @countryCode = 'US', @franchisee_Id = @franchiseeId OUTPUT; 
	PRINT @franchiseeName + ' created';

	-- Create 1st user.
	EXECUTE sp_CreateFranchisee_User @user_Name = @franchiseeUserName, @_email = @franchiseeUserEmail, @franchisee_Name = @franchiseeName, @User_Id = @userId OUTPUT; 
	PRINT @franchiseeUserName + ' created';
	
	COMMIT TRAN
END TRY

BEGIN CATCH
	
	ROLLBACK TRAN
	PRINT 'Error ' + CONVERT(varchar(50), ERROR_NUMBER()) +
          ', Severity ' + CONVERT(varchar(5), ERROR_SEVERITY()) +
          ', State ' + CONVERT(varchar(5), ERROR_STATE()) + 
          ', Procedure ' + ISNULL(ERROR_PROCEDURE(), '-') + 
          ', Line ' + CONVERT(varchar(5), ERROR_LINE());
		PRINT ERROR_MESSAGE(); 
	
	
END CATCH