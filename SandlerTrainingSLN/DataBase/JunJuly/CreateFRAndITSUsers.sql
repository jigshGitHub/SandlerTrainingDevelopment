USE [SandlerDB]
GO

DECLARE @franchiseeId int;
DECLARE @regionName NVARCHAR(500);
DECLARE @franchiseeName NVARCHAR(500);
DECLARE @franchiseeUserId uniqueidentifier;
DECLARE @franchiseeOwnerUserName NVARCHAR(500), @franchiseeOwnerEmail NVARCHAR(500),@franchiseeUserName NVARCHAR(500), @franchiseeUserEmail NVARCHAR(500); 

--Set values 
SET @regionName = 'Mid-Atlantic';

SET @franchiseeName = 'BSun';
SET @franchiseeOwnerUserName = 'jshahBSunFO';
SET @franchiseeOwnerEmail = 'jshahBSunFO@sandler.com';
SET @franchiseeUserName = 'jshahBSunFU1';
SET @franchiseeUserEmail = 'jshahBSunFU1@sandler.com';

BEGIN TRY
	BEGIN TRAN
	-- --Create franchisee
	EXECUTE sp_CreateFranchisee @user_Name = @franchiseeOwnerUserName, @_email = @franchiseeOwnerEmail, @_name = @franchiseeName, @region_Name = @regionName, @countryCode = 'US', @franchisee_Id = @franchiseeId OUTPUT; 
	PRINT @franchiseeName + ' created';

	-- Create 1st user.
	EXECUTE sp_CreateFranchisee_User @user_Name = @franchiseeUserName, @_email = @franchiseeUserEmail, @franchisee_Name = @franchiseeName, @User_Id = @franchiseeUserId OUTPUT; 
	PRINT @franchiseeUserName + ' created';
	
	INSERT INTO [SandlerDB].[dbo].[TBL_COMPANIES] ([COMPANYNAME] ,[CITY] ,[STATE] ,[ZIP] ,[POCLastName] ,[POCFirstName] ,[POCPhone] ,[IsNewCompany] ,[COMPANYVALUEGOAL] ,[IndustryId] ,[RepLastName] ,[RepFirstName] ,[DiscussionTopic] ,[ACTIONSTEP] ,[LASTCONTACT_DATE] ,[NEXTCONTACT_DATE] ,[CreationDate] ,[FranchiseeId] ,[IsActive] ,[CreatedBy] ,[UpdatedDate] ,[UpdatedBy] ,[Address])
    VALUES ('MABSunCompany1','MABSunCompany1City','MABSunCompany1St',12452,'MABSunCompany1POCln','MABSunCompany1POCfn','8888525623',1,800000, 2, 'MABSunCompany1RepLn' ,'MABSunCompany1RepFn','Dicussion topic-nothing','ActionStep nothing',DATEADD(MONTH,-2,GETDATE()),DATEADD(MONTH,-1,GETDATE()),GETDATE() ,@franchiseeId ,1 ,@franchiseeUserId,GETDATE() ,@franchiseeUserId,'MABSunCompany1 Address');

	print 'MABSunCompany1 created';

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