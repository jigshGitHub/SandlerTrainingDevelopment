/*
This script executed in 139
*/
ALTER TABLE TBL_COACH ADD FirstName NVARCHAR(50);
GO
ALTER TABLE TBL_COACH ADD LastName NVARCHAR(50);
GO
ALTER TABLE TBL_COACH ADD PhoneNumber NVARCHAR(25);
GO
ALTER TABLE TBL_COACH ADD [ADDRESS] NVARCHAR(50);
GO
ALTER TABLE TBL_COACH ADD City NVARCHAR(25);
GO
ALTER TABLE TBL_COACH ADD [State] NVARCHAR(25);
GO
ALTER TABLE TBL_COACH ADD Zip NVARCHAR(10);
GO
ALTER TABLE TBL_COACH ADD IsEmailSubscribtion BIT
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TBL_COACH_IsEmailSubscribtion]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TBL_COACH] DROP CONSTRAINT [DF_TBL_COACH_IsEmailSubscribtion]
END
GO

ALTER TABLE [dbo].[TBL_COACH] ADD  CONSTRAINT [DF_TBL_COACH_IsEmailSubscribtion]  DEFAULT ((1)) FOR [IsEmailSubscribtion]
GO

ALTER TABLE TBL_FRANCHISEE_USERS ADD FirstName NVARCHAR(50);
GO
ALTER TABLE TBL_FRANCHISEE_USERS ADD LastName NVARCHAR(50);
GO
ALTER TABLE TBL_FRANCHISEE_USERS ADD ContactNumber NVARCHAR(25);
GO
ALTER TABLE TBL_FRANCHISEE_USERS ADD [ADDRESS] NVARCHAR(50);
GO
ALTER TABLE TBL_FRANCHISEE_USERS ADD City NVARCHAR(25);
GO
ALTER TABLE TBL_FRANCHISEE_USERS ADD [State] NVARCHAR(25);
GO
ALTER TABLE TBL_FRANCHISEE_USERS ADD Zip NVARCHAR(10);
GO
ALTER TABLE TBL_FRANCHISEE_USERS ADD CountryID INT
GO
ALTER TABLE TBL_FRANCHISEE_USERS ADD IsEmailSubscribtion BIT
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_FRANCHISEE_USERS_TBL_COUNTRY]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_FRANCHISEE_USERS]'))
ALTER TABLE [dbo].[TBL_FRANCHISEE_USERS] DROP CONSTRAINT [FK_TBL_FRANCHISEE_USERS_TBL_COUNTRY]
GO


ALTER TABLE [dbo].[TBL_FRANCHISEE_USERS]  WITH CHECK ADD  CONSTRAINT [FK_TBL_FRANCHISEE_USERS_TBL_COUNTRY] FOREIGN KEY([CountryID])
REFERENCES [dbo].[TBL_COUNTRY] ([ID])
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TBL_FRANCHISEE_USERS_IsEmailSubscribtion]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TBL_FRANCHISEE_USERS] DROP CONSTRAINT [DF_TBL_FRANCHISEE_USERS_IsEmailSubscribtion]
END
GO

ALTER TABLE [dbo].[TBL_FRANCHISEE_USERS] ADD  CONSTRAINT [DF_TBL_FRANCHISEE_USERS_IsEmailSubscribtion]  DEFAULT ((1)) FOR [IsEmailSubscribtion]
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_CreateFranchisee]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_CreateFranchisee]
GO

/*
This stored procedure creates Franchisee related data 
1 It creates the user with Franchisee Owner Role , default password 'pa$$word' ('DE5aG4DJKaWNAC6qtb9Ex1mw0YQ='), default passwordsalt = 'CgWo/aHD6MDFG4AYqW/5wQ=='
2 It adds user to Franchisee Owner role
3 It creates data in TBL_COACH
*/
CREATE PROCEDURE [dbo].[sp_CreateFranchisee]
@application_Name NVARCHAR(256) = 'SandlerTraining',
@user_Name NVARCHAR(256),
@_email NVARCHAR(256),
@_name VARCHAR(50),
@franchisee_Role NVARCHAR(256) = 'FranchiseeOwner',
@coachId int,
@address1 NVARCHAR(500) = NULL,
@address2 NVARCHAR(500) = NULL,
@city NVARCHAR(500) = NULL,
@zip NVARCHAR(500) = NULL,
@state NVARCHAR(500) = NULL,
@countryCode CHAR(2) = NULL,
@phoneNumber NUMERIC = NULL,
@faxNumber NUMERIC = NULL,
@webaddress NVARCHAR(500) = NULL,
@emailAddress NVARCHAR(500) = NULL,
@franchisee_Id INT OUTPUT
AS

BEGIN TRY

	BEGIN TRANSACTION;

		DECLARE @User_Id uniqueidentifier
		DECLARE @CurrentTime DATETIME
		DECLARE @countryID INT
		DECLARE @coachUserId uniqueidentifier
		
		SET @CurrentTime = GetDate();
				
		EXEC [dbo].[aspnet_Membership_CreateUser] @ApplicationName = @application_Name, @UserName = @user_Name, @Password = N'DE5aG4DJKaWNAC6qtb9Ex1mw0YQ=', @PasswordSalt = N'CgWo/aHD6MDFG4AYqW/5wQ==', @Email = @_email, @PasswordQuestion = NULL, @PasswordAnswer = NULL, @IsApproved = 1, @CurrentTimeUtc = @CurrentTime, @CreateDate = @CurrentTime, @UniqueEmail = NULL, @PasswordFormat = 1, @UserId = @User_Id OUTPUT;
		PRINT CAST(@User_Id AS VARCHAR(50))
		
		EXEC [dbo].[aspnet_UsersInRoles_AddUsersToRoles] @ApplicationName = @application_Name, @UserNames = @user_Name, @RoleNames = @franchisee_Role, @CurrentTimeUtc = NULL;
		
		SELECT @coachUserId = c.UserID
		FROM TBL_COACH c
		WHERE c.IsActive = 1 AND c.ID = @coachId;
		
		SELECT @countryID = ID FROM TBL_COUNTRY WHERE Code = @countryCode;
		
		IF NOT EXISTS (SELECT ID FROM TBL_FRANCHISEE WHERE Name = @_name AND CoachID = @coachId)
		BEGIN
			PRINT 'New Frenchisee';
			Insert Into TBL_FRANCHISEE (Name, CoachID, Address1, Address2, City,[State],Zip,CountryID,PhoneNumber, FaxNumber,WebAddress,EmailAddress, CreatedBy, LastUpdatedBy) 
			VALUES(@_name, @coachId, @address1, @address2, @city, @state,@zip,@countryID,@phoneNumber,@faxNumber,@webaddress,@emailAddress,@coachUserId,@coachUserId);
			
			SELECT @franchisee_Id = @@IDENTITY;
		
		END
		ELSE
		BEGIN
			PRINT 'Existing Franchisee';
			SELECT @franchisee_Id = ID FROM TBL_FRANCHISEE WHERE Name = @_name AND CoachID = @coachId
		
		END
		Insert Into TBL_FRANCHISEE_USERS(FranchiseeID, UserID) VALUES(@franchisee_Id, @User_Id);
		
	COMMIT TRANSACTION;

END TRY

BEGIN CATCH

	PRINT 'Error ' + CONVERT(varchar(50), ERROR_NUMBER()) +
          ', Severity ' + CONVERT(varchar(5), ERROR_SEVERITY()) +
          ', State ' + CONVERT(varchar(5), ERROR_STATE()) + 
          ', Procedure ' + ISNULL(ERROR_PROCEDURE(), '-') + 
          ', Line ' + CONVERT(varchar(5), ERROR_LINE());
    PRINT ERROR_MESSAGE();
	
	EXEC sp_LogError
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
GO


ALTER TABLE TBL_COMPANIES DROP COLUMN Zip;
GO

ALTER TABLE TBL_COMPANIES ADD Zip VARCHAR(50);
GO

ALTER TABLE TBL_CONTACTS ADD IsEmailSubscribtion BIT
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TBL_CONTACTS_IsEmailSubscribtion]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TBL_CONTACTS] DROP CONSTRAINT [DF_TBL_CONTACTS_IsEmailSubscribtion]
END
GO

ALTER TABLE [dbo].[TBL_CONTACTS] ADD  CONSTRAINT [DF_TBL_CONTACTS_IsEmailSubscribtion]  DEFAULT ((1)) FOR [IsEmailSubscribtion]
GO

/****** Object:  StoredProcedure [dbo].[sp_LoadCompanyContactsData]    Script Date: 08/24/2012 23:38:58 ******/
USE [SandlerDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_LoadCompanyContactsData]    Script Date: 08/25/2012 13:45:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_LoadCompanyContactsData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_LoadCompanyContactsData]
GO

USE [SandlerDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_LoadCompanyContactsData]    Script Date: 08/25/2012 13:45:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_LoadCompanyContactsData]
@FranchiseeId int,
@CoachUserId varchar(50),
@FranchiseeOwnerUserId varchar(50)
AS
BEGIN TRY
     -- DECLARE VARIABLE
	 DECLARE @CompanyId INT
	 DECLARE @CompanyName varchar(150)
	 DECLARE @NewCompanyId INT
	 DECLARE @RecordCount INT
	 	

	 SELECT @RecordCount = COUNT(*) FROM [dbo].[TBL_COMPANIES$] WHERE IsActive = 1
	 WHILE (@RecordCount) > 0
	 BEGIN
	 -- LET US HAVE FIRST RECORD FROM TEMP TABLE
	 SELECT top 1 @CompanyId = CompaniesID,@CompanyName = COMPANYNAME FROM [dbo].[TBL_COMPANIES$] where IsActive = 1;
	 -- NOW INSERT COMPANY RECORD
	 
	 IF NOT EXISTS (SELECT CompaniesID FROM [dbo].[TBL_COMPANIES] WHERE COMPANYNAME = @CompanyName)
	 Begin
	 print' Insert if does not exist'
	 print @CompanyName
	 print @CompanyId
	 INSERT INTO [dbo].[TBL_COMPANIES]
           ([COMPANYNAME],[CITY],[STATE],[ZIP],[POCLastName]
           ,[POCFirstName],[POCPhone],[IsNewCompany],[COMPANYVALUEGOAL]
           ,[IndustryId],[RepLastName],[RepFirstName],[DiscussionTopic],[ACTIONSTEP],[LASTCONTACT_DATE],[NEXTCONTACT_DATE],[CreationDate]
           ,[FranchiseeId],[IsActive],[CreatedBy],[UpdatedBy],[Address],[CreatedDate],[UpdatedDate])
     SELECT top 1 [COMPANYNAME],[CITY],[STATE],[ZIP],[POCLastName]
           ,[POCFirstName],[POCPhone],[IsNewCompany],[COMPANYVALUEGOAL],[IndustryId],[RepLastName],[RepFirstName],[DiscussionTopic]
           ,[ACTIONSTEP],[LASTCONTACT_DATE],[NEXTCONTACT_DATE],[CreationDate],@FranchiseeId,[IsActive],@CoachUserId,[UpdatedBy]
           ,[Address],[CreatedDate],[UpdatedDate] From [dbo].[TBL_COMPANIES$] where CompaniesId = @CompanyId
       
      -- GET THE NEW COMPANY ID     
      SELECT @NewCompanyId = @@IDENTITY;
      Print @NewCompanyId  
      
      -- Now Add Contacts for this new Company
      INSERT INTO [dbo].[TBL_CONTACTS]
      ([COMPANYID],[LASTNAME],[FIRSTNAME]
           ,[PHONE],[EMAIL],[IsNewAppointment]
           ,[ApptSourceId],[IsRegisteredForTraining],[CourseId]
           ,[CourseTrainingDate],[DiscussionTopic],[ACTIONSTEP]
           ,[LAST_CONTACT_DATE],[NEXT_CONTACT_DATE],[IsActive]
           ,[UpdatedBy],[CreatedBy],[CreatedDate]
           ,[UpdatedDate],[IsEmailSubscribtion])
           SELECT 
           @NewCompanyId ,[LASTNAME] ,[FIRSTNAME] ,[PHONE]
           ,[E-MAIL],[IsNewAppointment],[ApptSourceId]
           ,CASE WHEN [IsRegisteredForTraining] = '' THEN 0 ELSE [IsRegisteredForTraining],[CourseId]
           ,[CourseTrainingDate],[DiscussionTopic]
           ,[ACTIONSTEP],[LASTCONTACT_DATE]
           ,[NEXT_CONTACT_DATE] ,1
           ,[UpdatedBy] ,@FranchiseeOwnerUserId
           ,[CreatedDate],[UpdatedDate],1 from [dbo].[TBL_CONTACTS$] WHERE CompanyId = @CompanyId
            
      END
      
    
      -- now delete from the table
      --Delete from [dbo].[TBL_COMPANIES$] where CompaniesId = @CompanyId
      Update [dbo].[TBL_COMPANIES$] Set IsActive = 0 where CompaniesId = @CompanyId
      -- check if more records exist or not
      SELECT @RecordCount = COUNT(*) FROM [dbo].[TBL_COMPANIES$] WHERE IsActive = 1
      IF (@RecordCount) = 0
		BREAK
	  ELSE
		CONTINUE
	  END
	  
END TRY

BEGIN CATCH

PRINT 'Error ' + CONVERT(varchar(50), ERROR_NUMBER()) +
          ', Severity ' + CONVERT(varchar(5), ERROR_SEVERITY()) +
          ', State ' + CONVERT(varchar(5), ERROR_STATE()) + 
          ', Procedure ' + ISNULL(ERROR_PROCEDURE(), '-') + 
          ', Line ' + CONVERT(varchar(5), ERROR_LINE());
    PRINT ERROR_MESSAGE();
END CATCH


GO



/****** Object:  StoredProcedure [dbo].[sp_CreateFranchisee_User]    Script Date: 08/25/2012 01:03:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_CreateFranchisee_User]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_CreateFranchisee_User]
GO


/*
This stored procedure creates Franchisee related data 
1 It creates the user with Franchisee Owner Role , default password 'pa$$word' ('DE5aG4DJKaWNAC6qtb9Ex1mw0YQ='), default passwordsalt = 'CgWo/aHD6MDFG4AYqW/5wQ=='
2 It adds user to Franchisee Owner role
3 It creates data in TBL_COACH
*/
CREATE PROCEDURE [dbo].[sp_CreateFranchisee_User]
@application_Name NVARCHAR(256) = 'SandlerTraining',
@user_Name NVARCHAR(256),
@_email NVARCHAR(256),
@franchiseeId INT,
@franchisee_Role NVARCHAR(256) = 'FranchiseeUser',
@User_Id uniqueidentifier OUTPUT
AS

BEGIN TRY

	BEGIN TRANSACTION;

		DECLARE @CurrentTime DATETIME
		
		SET @CurrentTime = GetDate();
				
		EXEC [dbo].[aspnet_Membership_CreateUser] @ApplicationName = @application_Name, @UserName = @user_Name, @Password = N'DE5aG4DJKaWNAC6qtb9Ex1mw0YQ=', @PasswordSalt = N'CgWo/aHD6MDFG4AYqW/5wQ==', @Email = @_email, @PasswordQuestion = NULL, @PasswordAnswer = NULL, @IsApproved = 1, @CurrentTimeUtc = @CurrentTime, @CreateDate = @CurrentTime, @UniqueEmail = NULL, @PasswordFormat = 1, @UserId = @User_Id OUTPUT;
		PRINT CAST(@User_Id AS VARCHAR(50))
		
		EXEC [dbo].[aspnet_UsersInRoles_AddUsersToRoles] @ApplicationName = @application_Name, @UserNames = @user_Name, @RoleNames = @franchisee_Role, @CurrentTimeUtc = @CurrentTime;
				
		Insert Into TBL_FRANCHISEE_USERS(FranchiseeID, UserID) VALUES(@franchiseeId, @User_Id);
		
	COMMIT TRANSACTION;

END TRY

BEGIN CATCH

	PRINT 'Error ' + CONVERT(varchar(50), ERROR_NUMBER()) +
          ', Severity ' + CONVERT(varchar(5), ERROR_SEVERITY()) +
          ', State ' + CONVERT(varchar(5), ERROR_STATE()) + 
          ', Procedure ' + ISNULL(ERROR_PROCEDURE(), '-') + 
          ', Line ' + CONVERT(varchar(5), ERROR_LINE());
    PRINT ERROR_MESSAGE();
	
	EXEC sp_LogError
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


/****** Object:  StoredProcedure [dbo].[sp_CreateCoach]    Script Date: 08/25/2012 03:13:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_CreateCoach]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_CreateCoach]
GO

/*
This stored procedure creates Coach related data 
1 It creates the user with Coach Role , default password 'pa$$word' ('DE5aG4DJKaWNAC6qtb9Ex1mw0YQ='), default passwordsalt = 'CgWo/aHD6MDFG4AYqW/5wQ=='
2 It adds user to Coach role
3 It creates data in TBL_COACH
*/
CREATE PROCEDURE [dbo].[sp_CreateCoach]
@application_Name NVARCHAR(256) = 'SandlerTraining',
@user_Name NVARCHAR(256),
@_email NVARCHAR(256),
@coach_Role NVARCHAR(256) = 'Coach',
@region_Name NVARCHAR(500),
@coach_Id INT OUTPUT
AS

BEGIN TRY

	BEGIN TRANSACTION;

		DECLARE @User_Id uniqueidentifier
		DECLARE @CurrentTime DATETIME
		DECLARE @region_Id INT
		
		SET @CurrentTime = GetDate();
				
		EXEC [dbo].[aspnet_Membership_CreateUser] @ApplicationName = @application_Name, @UserName = @user_Name, @Password = N'DE5aG4DJKaWNAC6qtb9Ex1mw0YQ=', @PasswordSalt = N'CgWo/aHD6MDFG4AYqW/5wQ==', @Email = @_email, @PasswordQuestion = NULL, @PasswordAnswer = NULL, @IsApproved = 1, @CurrentTimeUtc = @CurrentTime, @CreateDate = @CurrentTime, @UniqueEmail = NULL, @PasswordFormat = 1, @UserId = @User_Id OUTPUT;
		
		EXEC [dbo].[aspnet_UsersInRoles_AddUsersToRoles] @ApplicationName = @application_Name, @UserNames = @user_Name, @RoleNames = @coach_Role, @CurrentTimeUtc = NULL;
		
		SELECT @region_Id = ID FROM Tbl_Region WHERE Name = @region_Name AND IsActive = 1;
		
		Insert Into TBL_COACH (UserID, RegionID) VALUES(@User_Id, @region_Id);
		SELECT @coach_Id = @@IDENTITY;
		
	COMMIT TRANSACTION;

END TRY

BEGIN CATCH

	PRINT 'Error ' + CONVERT(varchar(50), ERROR_NUMBER()) +
          ', Severity ' + CONVERT(varchar(5), ERROR_SEVERITY()) +
          ', State ' + CONVERT(varchar(5), ERROR_STATE()) + 
          ', Procedure ' + ISNULL(ERROR_PROCEDURE(), '-') + 
          ', Line ' + CONVERT(varchar(5), ERROR_LINE());
    PRINT ERROR_MESSAGE();
	
	EXEC sp_LogError
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


GO

