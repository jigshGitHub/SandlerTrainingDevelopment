/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 06/28/2012 20:01:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_LogError]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_LogError]
GO
CREATE PROCEDURE [dbo].[sp_LogError] 
    @ErrorLogID [int] = 0 OUTPUT  -- Contains the ErrorLogID of the row inserted
                                  -- by sp_LogError in the ErrorLog table.

AS
BEGIN
    SET NOCOUNT ON;

    -- Output parameter value of 0 indicates that error 
    -- information was not logged.
    SET @ErrorLogID = 0;

    BEGIN TRY
        -- Return if there is no error information to log.
        IF ERROR_NUMBER() IS NULL
            RETURN;

        -- Return if inside an uncommittable transaction.
        -- Data insertion/modification is not allowed when 
        -- a transaction is in an uncommittable state.
        IF XACT_STATE() = -1
        BEGIN
            PRINT 'Cannot log error since the current transaction is in an uncommittable state. ' 
                + 'Rollback the transaction before executing sp_LogError in order to successfully log error information.';
            RETURN;
        END;

        INSERT [dbo].[TBL_ERRORLOG] 
            (
            [UserName], 
            [ErrorNumber], 
            [ErrorSeverity], 
            [ErrorState], 
            [ErrorProcedure], 
            [ErrorLine], 
            [ErrorMessage]
            ) 
        VALUES 
            (
            CONVERT(sysname, CURRENT_USER), 
            ERROR_NUMBER(),
            ERROR_SEVERITY(),
            ERROR_STATE(),
            ERROR_PROCEDURE(),
            ERROR_LINE(),
            ERROR_MESSAGE()
            );

        -- Pass back the ErrorLogID of the row inserted
        SELECT @ErrorLogID = @@IDENTITY;
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred in stored procedure sp_LogError: ';
        PRINT 'Error ' + CONVERT(varchar(50), ERROR_NUMBER()) +
          ', Severity ' + CONVERT(varchar(5), ERROR_SEVERITY()) +
          ', State ' + CONVERT(varchar(5), ERROR_STATE()) + 
          ', Procedure ' + ISNULL(ERROR_PROCEDURE(), '-') + 
          ', Line ' + CONVERT(varchar(5), ERROR_LINE());
		PRINT ERROR_MESSAGE();
        RETURN -1;
    END CATCH
END; 



GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_CreateRegion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_CreateRegion]
GO


GO

/****** Object:  StoredProcedure [dbo].[sp_CreateRegion]    Script Date: 07/18/2012 11:55:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*
This sp creates Region related  data 
1 It creates data in TBL_Region
*/
CREATE PROCEDURE [dbo].[sp_CreateRegion]
@name VARCHAR(500),
@countryCode CHAR(2),
@region_Id INT OUTPUT
AS

BEGIN TRY

	BEGIN TRANSACTION;

		DECLARE @countryID INT
		SELECT @countryID = ID FROM TBL_COUNTRY WHERE Code = @countryCode;
		INSERT INTO TBL_REGION(Name, CountryID) VALUES(@name,@countryID);
		SELECT @region_Id = @@IDENTITY;
		
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




GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_CreateCoach]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_CreateCoach]
GO


GO

/****** Object:  StoredProcedure [dbo].[sp_CreateCoach]    Script Date: 07/18/2012 11:27:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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


GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_CreateFranchisee]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_CreateFranchisee]
GO


GO

/****** Object:  StoredProcedure [dbo].[sp_CreateFranchisee]    Script Date: 07/18/2012 11:27:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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
@region_Name NVARCHAR(500),
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
		DECLARE @coach_Id INT
		DECLARE @countryID INT
		DECLARE @coachUserId uniqueidentifier
		
		SET @CurrentTime = GetDate();
				
		EXEC [dbo].[aspnet_Membership_CreateUser] @ApplicationName = @application_Name, @UserName = @user_Name, @Password = N'DE5aG4DJKaWNAC6qtb9Ex1mw0YQ=', @PasswordSalt = N'CgWo/aHD6MDFG4AYqW/5wQ==', @Email = @_email, @PasswordQuestion = NULL, @PasswordAnswer = NULL, @IsApproved = 1, @CurrentTimeUtc = @CurrentTime, @CreateDate = @CurrentTime, @UniqueEmail = NULL, @PasswordFormat = 1, @UserId = @User_Id OUTPUT;
		
		EXEC [dbo].[aspnet_UsersInRoles_AddUsersToRoles] @ApplicationName = @application_Name, @UserNames = @user_Name, @RoleNames = @franchisee_Role, @CurrentTimeUtc = NULL;
		
		SELECT @coach_Id = c.ID, @coachUserId = c.UserID
		FROM Tbl_Region r INNER JOIN TBL_COACH c ON r.ID = c.RegionID
		WHERE r.Name = @region_Name AND r.IsActive = 1;
		
		SELECT @countryID = ID FROM TBL_COUNTRY WHERE Code = @countryCode;
		
		Insert Into TBL_FRANCHISEE (Name, CoachID, Address1, Address2, City,[State],Zip,CountryID,PhoneNumber, FaxNumber,WebAddress,EmailAddress, CreatedBy, LastUpdatedBy) 
		VALUES(@_name, @coach_Id, @address1, @address2, @city, @state,@zip,@countryID,@phoneNumber,@faxNumber,@webaddress,@emailAddress,@coachUserId,@coachUserId);
		
		SELECT @franchisee_Id = @@IDENTITY;
		
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


GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_CreateFranchisee_User]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_CreateFranchisee_User]
GO


GO

/****** Object:  StoredProcedure [dbo].[sp_CreateFranchisee_User]    Script Date: 07/18/2012 11:27:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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
@franchisee_Name VARCHAR(50),
@franchisee_Role NVARCHAR(256) = 'FranchiseeUser',
@User_Id uniqueidentifier OUTPUT
AS

BEGIN TRY

	BEGIN TRANSACTION;

		DECLARE @CurrentTime DATETIME
		DECLARE @franchisee_Id INT
		
		SET @CurrentTime = GetDate();
				
		EXEC [dbo].[aspnet_Membership_CreateUser] @ApplicationName = @application_Name, @UserName = @user_Name, @Password = N'DE5aG4DJKaWNAC6qtb9Ex1mw0YQ=', @PasswordSalt = N'CgWo/aHD6MDFG4AYqW/5wQ==', @Email = @_email, @PasswordQuestion = NULL, @PasswordAnswer = NULL, @IsApproved = 1, @CurrentTimeUtc = @CurrentTime, @CreateDate = @CurrentTime, @UniqueEmail = NULL, @PasswordFormat = 1, @UserId = @User_Id OUTPUT;
		
		EXEC [dbo].[aspnet_UsersInRoles_AddUsersToRoles] @ApplicationName = @application_Name, @UserNames = @user_Name, @RoleNames = @franchisee_Role, @CurrentTimeUtc = NULL;
		
		SELECT @franchisee_Id = ID FROM TBL_FRANCHISEE WHERE Name = @franchisee_Name AND IsActive = 1;
		
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

--CRM 
USE [SandlerDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetDocStatus]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetDocStatus]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetDocStatus]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllOpportunitiesByUserID]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllOpportunitiesByUserID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllOpportunitiesByUserID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetDocumentsByOppId]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetDocumentsByOppId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetDocumentsByOppId]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetCompaniesForDDLByFrId]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetCompaniesForDDLByFrId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetCompaniesForDDLByFrId]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetCompaniesForDDLByCoachId]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetCompaniesForDDLByCoachId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetCompaniesForDDLByCoachId]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetCompaniesForDDL]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetCompaniesForDDL]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetCompaniesForDDL]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsForCompByUserID]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsForCompByUserID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsForCompByUserID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByUserID]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByUserID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByUserID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCoachID]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByCoachID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByCoachID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByCoachId]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCompaniesByCoachId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCompaniesByCoachId]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetCourseInfo]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetCourseInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetCourseInfo]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetRegForTrainingOptions]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetRegForTrainingOptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetRegForTrainingOptions]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetApptSourceOptions]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetApptSourceOptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetApptSourceOptions]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByFrID]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByFrID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByFrID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCompID]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContactsByCompID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContactsByCompID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllIndustries]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllIndustries]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllIndustries]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllProducts]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllProducts]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllProducts]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetNewItemOptions]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetNewItemOptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetNewItemOptions]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByFrId]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCompaniesByFrId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCompaniesByFrId]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetCompanyDetails]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetCompanyDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetCompanyDetails]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertCompany]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertCompany]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_InsertCompany]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateCompanyDetails]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UpdateCompanyDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UpdateCompanyDetails]
GO

/****** Object:  StoredProcedure [dbo].[sp_CreateFranchisee_User]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_CreateFranchisee_User]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_CreateFranchisee_User]
GO

/****** Object:  StoredProcedure [dbo].[sp_CreateFranchisee]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_CreateFranchisee]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_CreateFranchisee]
GO

/****** Object:  StoredProcedure [dbo].[sp_CreateCoach]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_CreateCoach]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_CreateCoach]
GO

/****** Object:  StoredProcedure [dbo].[sp_CreateRegion]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_CreateRegion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_CreateRegion]
GO

/****** Object:  StoredProcedure [dbo].[sp_LogError]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_LogError]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_LogError]
GO

/****** Object:  StoredProcedure [dbo].[sp_Insert_UpdateROI]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Insert_UpdateROI]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Insert_UpdateROI]
GO

/****** Object:  StoredProcedure [dbo].[sp_createForecast]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_createForecast]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_createForecast]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetForecastDetails]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetForecastDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetForecastDetails]
GO

/****** Object:  StoredProcedure [dbo].[sp_AttachDocument]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AttachDocument]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AttachDocument]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateDocumentDetails]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UpdateDocumentDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UpdateDocumentDetails]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetDocumentDetails]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetDocumentDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetDocumentDetails]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetDocumentsById]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetDocumentsById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetDocumentsById]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateOpportunityDetailsSpecial]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UpdateOpportunityDetailsSpecial]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UpdateOpportunityDetailsSpecial]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateOpportunityDetails]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UpdateOpportunityDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UpdateOpportunityDetails]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertOpportunitySpecial]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertOpportunitySpecial]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_InsertOpportunitySpecial]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertOpportunity]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertOpportunity]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_InsertOpportunity]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetOpportunityDetails]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetOpportunityDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetOpportunityDetails]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllOpportunitiesByID]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllOpportunitiesByID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllOpportunitiesByID]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllOpportunities]    Script Date: 07/29/2012 10:17:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllOpportunities]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllOpportunities]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertAccountSpecial]    Script Date: 07/29/2012 10:17:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertAccountSpecial]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_InsertAccountSpecial]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertAccount]    Script Date: 07/29/2012 10:17:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertAccount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_InsertAccount]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateAccountDetailsSpecial]    Script Date: 07/29/2012 10:17:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UpdateAccountDetailsSpecial]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UpdateAccountDetailsSpecial]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateAccountDetails]    Script Date: 07/29/2012 10:17:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UpdateAccountDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UpdateAccountDetails]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAccountDetails]    Script Date: 07/29/2012 10:17:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAccountDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAccountDetails]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllAccounts]    Script Date: 07/29/2012 10:17:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllAccounts]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllAccounts]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateContactDetailsSpecial]    Script Date: 07/29/2012 10:17:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UpdateContactDetailsSpecial]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UpdateContactDetailsSpecial]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertContactSpecial]    Script Date: 07/29/2012 10:17:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertContactSpecial]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_InsertContactSpecial]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertContact]    Script Date: 07/29/2012 10:17:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertContact]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_InsertContact]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateContactDetails]    Script Date: 07/29/2012 10:17:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UpdateContactDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UpdateContactDetails]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetContactDetails]    Script Date: 07/29/2012 10:17:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetContactDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetContactDetails]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContacts]    Script Date: 07/29/2012 10:17:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllContacts]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllContacts]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompanies]    Script Date: 07/29/2012 10:17:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCompanies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCompanies]
GO

USE [SandlerDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetDocStatus]    Script Date: 07/29/2012 10:17:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create  PROCEDURE [dbo].[sp_GetDocStatus]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	SELECT DocStatusText, DocStatusId from Tbl_DocumentStatus
	ORDER BY DocStatusText
	
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllOpportunitiesByUserID]    Script Date: 07/29/2012 10:17:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_GetAllOpportunitiesByUserID]
	
	(
		@CompanyID int,
		@UserID varchar(50)
	)
	
AS
	Select 
	op.id as oppsid, op.name as oppname
	/*,cp.companyname, op.WEIGHTEDVALUE, 
	op.WINPROBABILITY,
	op.closedate,op.salesreplastname, 
	op.salesrepfirstname*/
	from TBL_OPPORTUNITIES op 
	inner join tbl_companies cp on op.companyid = cp.COMPANIESID 
	where op.companyid = @CompanyID and Upper(op.CreatedBy) = Upper(@UserID)
	order by op.name
		
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_GetDocumentsByOppId]    Script Date: 07/29/2012 10:17:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[sp_GetDocumentsByOppId]
	
	(
		@OppsID int
	)
	
AS
	
	Select 
	dc.docsid, 
	dc.DocName as docFullName,
	substring(dc.DocName, CHARINDEX('_',dc.DocName)+1, LEN(dc.DocName)) as DocName, 
	dc.updateddate,
	op.name as oppname, cp.companyname,
	ds.DocStatusText 
	from tbl_docs dc
	left join tbl_opportunities op on dc.oppsid = op.id
	left join tbl_companies cp on cp.COMPANIESID = op.COMPANYID 
	left join tbl_documentStatus ds on ds.DocStatusId = dc.DocStatusId
	where dc.oppsid = @OppsID
	

	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_GetCompaniesForDDLByFrId]    Script Date: 07/29/2012 10:17:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[sp_GetCompaniesForDDLByFrId]
	
	(
		@FranchiseeId int
	)
	
AS
		
	SELECT 
	cp.COMPANIESID,
	cp.COMPANYNAME
	FROM TBL_COMPANIES cp
	where cp.FranchiseeId = @FranchiseeId 
	ORDER BY COMPANYNAME
	
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_GetCompaniesForDDLByCoachId]    Script Date: 07/29/2012 10:17:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[sp_GetCompaniesForDDLByCoachId]
	
	(
		@CoachId int
	)
	
AS
		
	SELECT cp.COMPANIESID,cp.COMPANYNAME
	FROM TBL_COMPANIES cp 
	where cp.FranchiseeId in (Select id from Tbl_Franchisee  where CoachID = @CoachId) 
	ORDER BY COMPANYNAME
	
	
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_GetCompaniesForDDL]    Script Date: 07/29/2012 10:17:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_GetCompaniesForDDL]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	SELECT 
	cp.COMPANIESID,
	cp.COMPANYNAME
	FROM TBL_COMPANIES cp
	ORDER BY COMPANYNAME
	
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsForCompByUserID]    Script Date: 07/29/2012 10:17:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetAllContactsForCompByUserID]
	
	(
	@UserID varchar(50),
	@CompanyID int
	)
	
AS
	
		
	select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid 
	,cp.COMPANYNAME
	from tbl_contacts ct 
	join tbl_companies cp on ct.companyid = cp.COMPANIESID 
	where Upper(ct.CreatedBy) = Upper(@UserID) and ct.COMPANYID = @CompanyID
	Order by cp.COMPANYNAME
	
	
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByUserID]    Script Date: 07/29/2012 10:17:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetAllContactsByUserID]
	
	(
	@UserID varchar(50)
	)
	
AS
	
		
	select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid 
	,cp.COMPANYNAME
	from tbl_contacts ct 
	join tbl_companies cp on ct.companyid = cp.COMPANIESID 
	where Upper(ct.CreatedBy) = Upper(@UserID)
	Order by cp.COMPANYNAME
	
	
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCoachID]    Script Date: 07/29/2012 10:17:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[sp_GetAllContactsByCoachID]
	
	(
	@CoachID int 
	)
	
AS
	
		
	select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid 
	,cp.COMPANYNAME
	from tbl_contacts ct 
	join tbl_companies cp on ct.companyid = cp.COMPANIESID 
	where ct.companyid in (Select CompaniesId from tbl_Companies where FranchiseeId in (Select id from Tbl_Franchisee  where CoachID = @CoachId))
	Order by cp.COMPANYNAME
	
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByCoachId]    Script Date: 07/29/2012 10:17:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetAllCompaniesByCoachId]
	
	(
		@CoachId int
	)
	
AS
		
	SELECT cp.COMPANIESID,cp.COMPANYNAME,
	cp.RepLastName+', '+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue
	FROM TBL_COMPANIES cp 
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	where cp.FranchiseeId in (Select id from Tbl_Franchisee  where CoachID = @CoachId) 
	ORDER BY COMPANYNAME
	
	
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_GetCourseInfo]    Script Date: 07/29/2012 10:17:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[sp_GetCourseInfo]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	SELECT * FROM TBL_Course ORDER BY CourseName /* SET NOCOUNT ON */
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_GetRegForTrainingOptions]    Script Date: 07/29/2012 10:17:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[sp_GetRegForTrainingOptions]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	SELECT id, Value as RegForTrainingId, Description  FROM TBL_YesNoOptions ORDER BY Description/* SET NOCOUNT ON */
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_GetApptSourceOptions]    Script Date: 07/29/2012 10:17:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[sp_GetApptSourceOptions]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	SELECT * FROM Tbl_AppointmentsSource ORDER BY ApptSourceName /* SET NOCOUNT ON */
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByFrID]    Script Date: 07/29/2012 10:17:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetAllContactsByFrID]
	
	(
	@FranchiseeID int 
	)
	
AS
	
		
	select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid 
	,cp.COMPANYNAME
	from tbl_contacts ct 
	join tbl_companies cp on ct.companyid = cp.COMPANIESID 
	where ct.companyid in (Select CompaniesId from tbl_Companies where FranchiseeId = @FranchiseeID)
	Order by cp.COMPANYNAME
	
	
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllContactsByCompID]    Script Date: 07/29/2012 10:17:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[sp_GetAllContactsByCompID]
	
	(
	@CompanyID int 
	)
	
AS
	
		
	select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid 
	,cp.COMPANYNAME
	from tbl_contacts ct 
	join tbl_companies cp on ct.companyid = cp.COMPANIESID 
	where ct.companyid = @CompanyID
	Order by cp.COMPANYNAME
	
	
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllIndustries]    Script Date: 07/29/2012 10:17:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_GetAllIndustries]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	SELECT * FROM TBL_IndustryType ORDER BY IndustryTypeName/* SET NOCOUNT ON */
	RETURN
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllProducts]    Script Date: 07/29/2012 10:17:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_GetAllProducts]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	SELECT * FROM TBL_ProductType ORDER BY ProductTypeName/* SET NOCOUNT ON */
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_GetNewItemOptions]    Script Date: 07/29/2012 10:17:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_GetNewItemOptions]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	SELECT * FROM TBL_YesNoOptions ORDER BY Description/* SET NOCOUNT ON */
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompaniesByFrId]    Script Date: 07/29/2012 10:17:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetAllCompaniesByFrId]
	
	(
		@FranchiseeId int
	)
	
AS
		
	SELECT 
	cp.COMPANIESID,
	cp.COMPANYNAME,
	cp.RepLastName+', '+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue
	FROM TBL_COMPANIES cp
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	where cp.FranchiseeId = @FranchiseeId 
	ORDER BY COMPANYNAME
	
	
	
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_GetCompanyDetails]    Script Date: 07/29/2012 10:17:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[sp_GetCompanyDetails]
	(
	@COMPANIESID int 
	)
AS
	select 
	c.COMPANIESID,c.CompanyName, c.Address,c.City, c.State, c.Zip,
	c.POCLastName,c.POCFirstName,
	c.POCPhone,c.COMPANYVALUEGOAL,
	c.RepLastName,c.RepFirstName,c.DiscussionTopic,c.ActionStep,
	ISNULL(c.LastContact_Date, '') as LastContact_Date,
	ISNULL(c.NextContact_Date, '') as NextContact_Date,
	ISNULL(c.CreationDate, '') as CreationDate,
	c.FranchiseeId,
	i.IndustryTypeName as Industry,i.IndId as IndId,
	y.Description as Description, y.Value as Value
	from tbl_companies c 
	left join Tbl_IndustryType i on c.IndustryId = i.IndId
	left join tbl_YesNoOptions y on c.IsNewCompany = y.Value
	where c.COMPANIESID = @COMPANIESID

	RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_InsertCompany]    Script Date: 07/29/2012 10:17:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_InsertCompany]
	(	
		@CompanyName varchar(50), @Address varchar(150),
		@City varchar(50), @State varchar(50), @Zip varchar(50),
		@POCLastName varchar(50), @POCFirstName varchar(50),
		@POCPhone varchar(50), @Value int, @COMPANYVALUEGOAL int,
		/*@Id int, */
		@IndId int,
		@RepLastName varchar(50),@RepFirstName varchar(50),
		@DiscussionTopic varchar(50), @ActionStep varchar(50),
		@LastContact_Date datetime,@NextContact_Date datetime, 
		@CreationDate datetime, @CreatedBy varchar(50),
		@FranchiseeId int
	 )
AS
	
	if @LastContact_Date < '2/1/1755'
	Begin
	  Set @LastContact_Date = null
	End
	
	
	
	Insert into tbl_Companies
	(CompanyName, Address,City, State, Zip,POCLastName,POCFirstName,
	 POCPhone,IsNewCompany, COMPANYVALUEGOAL,
	 /*ProductId,*/
	 IndustryId,
	 RepLastName,RepFirstName,DiscussionTopic,ActionStep,
	 LastContact_Date,NextContact_Date,CreationDate, CreatedBy, FranchiseeId,IsActive)
	values
	(@CompanyName, @Address,@City, @State, @Zip,@POCLastName,@POCFirstName,
		@POCPhone , @Value, @COMPANYVALUEGOAL,
		/*@Id ,*/
		@IndId ,@RepLastName ,@RepFirstName,
		@DiscussionTopic , @ActionStep,	@LastContact_Date,
	 @NextContact_Date,@CreationDate,@CreatedBy,@FranchiseeId,1)
	
	/* SET NOCOUNT ON */
	RETURN


GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateCompanyDetails]    Script Date: 07/29/2012 10:17:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_UpdateCompanyDetails]
	(
		@COMPANIESID int,@CompanyName varchar(50), @Address varchar(150),
		@City varchar(50), @State varchar(50), @Zip varchar(50),
		@POCLastName varchar(50), @POCFirstName varchar(50),
		@POCPhone varchar(50), @Value int, @COMPANYVALUEGOAL int,
		/*@Id int, */
		@IndId int,
		@RepLastName varchar(50),@RepFirstName varchar(50),
		@DiscussionTopic varchar(50), @ActionStep varchar(50),
		@LastContact_Date datetime,@NextContact_Date datetime, 
		@CreationDate datetime, @UpdatedBy varchar(50)
		
	)
AS
	
	if @LastContact_Date < '2/1/1755'
	Begin
	  Set @LastContact_Date = null
	End
	
	Update tbl_companies

	Set 
	CompanyName = @CompanyName,
	Address = @Address,
	City = @City,
	State = @State,
	Zip = @Zip,
	POCLastName = @POCLastName,
	POCFirstName = @POCFirstName,
	POCPhone = @POCPhone,
	COMPANYVALUEGOAL = @COMPANYVALUEGOAL,
	RepLastName = @RepLastName,
	RepFirstName = @RepFirstName,
	DiscussionTopic = @DiscussionTopic,
	ActionStep = @ActionStep,
	LastContact_Date = @LastContact_Date, 
	NextContact_Date = @NextContact_Date,
	CreationDate = @CreationDate,
	/*ProductId = @Id,*/
	IndustryId = @IndId,
	IsNewCompany = @Value,
	UpdatedBy = @UpdatedBy,
	UPdatedDate = GETDATE()
	where COMPANIESID = @COMPANIESID


	RETURN




GO

/****** Object:  StoredProcedure [dbo].[sp_CreateFranchisee_User]    Script Date: 07/29/2012 10:17:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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
@franchisee_Name VARCHAR(50),
@franchisee_Role NVARCHAR(256) = 'FranchiseeUser',
@User_Id uniqueidentifier OUTPUT
AS

BEGIN TRY

	BEGIN TRANSACTION;

		DECLARE @CurrentTime DATETIME
		DECLARE @franchisee_Id INT
		
		SET @CurrentTime = GetDate();
				
		EXEC [dbo].[aspnet_Membership_CreateUser] @ApplicationName = @application_Name, @UserName = @user_Name, @Password = N'DE5aG4DJKaWNAC6qtb9Ex1mw0YQ=', @PasswordSalt = N'CgWo/aHD6MDFG4AYqW/5wQ==', @Email = @_email, @PasswordQuestion = NULL, @PasswordAnswer = NULL, @IsApproved = 1, @CurrentTimeUtc = @CurrentTime, @CreateDate = @CurrentTime, @UniqueEmail = NULL, @PasswordFormat = 1, @UserId = @User_Id OUTPUT;
		
		EXEC [dbo].[aspnet_UsersInRoles_AddUsersToRoles] @ApplicationName = @application_Name, @UserNames = @user_Name, @RoleNames = @franchisee_Role, @CurrentTimeUtc = @CurrentTime;
		
		SELECT @franchisee_Id = ID FROM TBL_FRANCHISEE WHERE Name = @franchisee_Name AND IsActive = 1;
		
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

/****** Object:  StoredProcedure [dbo].[sp_CreateFranchisee]    Script Date: 07/29/2012 10:17:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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
@region_Name NVARCHAR(500),
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
		DECLARE @coach_Id INT
		DECLARE @countryID INT
		SET @CurrentTime = GetDate();
				
		EXEC [dbo].[aspnet_Membership_CreateUser] @ApplicationName = @application_Name, @UserName = @user_Name, @Password = N'DE5aG4DJKaWNAC6qtb9Ex1mw0YQ=', @PasswordSalt = N'CgWo/aHD6MDFG4AYqW/5wQ==', @Email = @_email, @PasswordQuestion = NULL, @PasswordAnswer = NULL, @IsApproved = 1, @CurrentTimeUtc = @CurrentTime, @CreateDate = @CurrentTime, @UniqueEmail = NULL, @PasswordFormat = 1, @UserId = @User_Id OUTPUT;
		
		EXEC [dbo].[aspnet_UsersInRoles_AddUsersToRoles] @ApplicationName = @application_Name, @UserNames = @user_Name, @RoleNames = @franchisee_Role, @CurrentTimeUtc = NULL;
		
		SELECT @coach_Id = c.ID FROM Tbl_Region r INNER JOIN TBL_COACH c ON r.ID = c.RegionID
		WHERE r.Name = @region_Name AND r.IsActive = 1;
		
		SELECT @countryID = ID FROM TBL_COUNTRY WHERE Code = @countryCode;
		
		Insert Into TBL_FRANCHISEE (Name, CoachID, Address1, Address2, City,[State],Zip,CountryID,PhoneNumber, FaxNumber,WebAddress,EmailAddress) 
		VALUES(@_name, @coach_Id, @address1, @address2, @city, @state,@zip,@countryID,@phoneNumber,@faxNumber,@webaddress,@emailAddress);
		
		SELECT @franchisee_Id = @@IDENTITY;
		
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

/****** Object:  StoredProcedure [dbo].[sp_CreateCoach]    Script Date: 07/29/2012 10:17:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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

/****** Object:  StoredProcedure [dbo].[sp_CreateRegion]    Script Date: 07/29/2012 10:17:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/*
This sp creates Region related  data 
1 It creates data in TBL_Region
*/
CREATE PROCEDURE [dbo].[sp_CreateRegion]
@name VARCHAR(500),
@countryCode CHAR(2),
@region_Id INT OUTPUT
AS

BEGIN TRY

	BEGIN TRANSACTION;

		DECLARE @countryID INT
		SELECT @countryID = ID FROM TBL_COUNTRY WHERE Code = @countryCode;
		INSERT INTO TBL_REGION(Name, CountryID) VALUES(@name,@countryID);
		SELECT @region_Id = @@IDENTITY;
		
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

/****** Object:  StoredProcedure [dbo].[sp_LogError]    Script Date: 07/29/2012 10:17:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_LogError] 
    @ErrorLogID [int] = 0 OUTPUT  -- Contains the ErrorLogID of the row inserted
                                  -- by sp_LogError in the ErrorLog table.

AS
BEGIN
    SET NOCOUNT ON;

    -- Output parameter value of 0 indicates that error 
    -- information was not logged.
    SET @ErrorLogID = 0;

    BEGIN TRY
        -- Return if there is no error information to log.
        IF ERROR_NUMBER() IS NULL
            RETURN;

        -- Return if inside an uncommittable transaction.
        -- Data insertion/modification is not allowed when 
        -- a transaction is in an uncommittable state.
        IF XACT_STATE() = -1
        BEGIN
            PRINT 'Cannot log error since the current transaction is in an uncommittable state. ' 
                + 'Rollback the transaction before executing sp_LogError in order to successfully log error information.';
            RETURN;
        END;

        INSERT [dbo].[TBL_ERRORLOG] 
            (
            [UserName], 
            [ErrorNumber], 
            [ErrorSeverity], 
            [ErrorState], 
            [ErrorProcedure], 
            [ErrorLine], 
            [ErrorMessage]
            ) 
        VALUES 
            (
            CONVERT(sysname, CURRENT_USER), 
            ERROR_NUMBER(),
            ERROR_SEVERITY(),
            ERROR_STATE(),
            ERROR_PROCEDURE(),
            ERROR_LINE(),
            ERROR_MESSAGE()
            );

        -- Pass back the ErrorLogID of the row inserted
        SELECT @ErrorLogID = @@IDENTITY;
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred in stored procedure sp_LogError: ';
        PRINT 'Error ' + CONVERT(varchar(50), ERROR_NUMBER()) +
          ', Severity ' + CONVERT(varchar(5), ERROR_SEVERITY()) +
          ', State ' + CONVERT(varchar(5), ERROR_STATE()) + 
          ', Procedure ' + ISNULL(ERROR_PROCEDURE(), '-') + 
          ', Line ' + CONVERT(varchar(5), ERROR_LINE());
		PRINT ERROR_MESSAGE();
        RETURN -1;
    END CATCH
END; 




GO

/****** Object:  StoredProcedure [dbo].[sp_Insert_UpdateROI]    Script Date: 07/29/2012 10:17:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_Insert_UpdateROI] 
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

/****** Object:  StoredProcedure [dbo].[sp_createForecast]    Script Date: 07/29/2012 10:17:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_createForecast]
	
	(
		@CompanyID int, 
		@Q2Total int, @Q3Total int, @Q4Total int, @Year int,
		@QuotaTotal int, @BestCaseTotal int, @SalesPLTotal int,
		@Q2Quota bigint,@Q2BestCase bigint,@Q2SalesPL bigint,
		@Q3Quota bigint,@Q3BestCase bigint,@Q3SalesPL bigint,
		@Q4Quota bigint,@Q4BestCase bigint,@Q4SalesPL bigint,
		@SeasonIndex varchar(50), @GrowthIndex varchar(50), 
		@Trained_Reps varchar(50),@SalesCycle varchar(50)
	)
	

	
	
AS
	
	Insert into tbl_Forecast
	(Comp_ID, Q2Total, Q3Total, Q4Total,
	 Year, QuotaTotal,BestCaseTotal,SalesPLTotal,
	 Q2Quota,Q2BestCase,Q2SalesPL,
	 Q3Quota,Q3BestCase,Q3SalesPL,
	 Q4Quota,Q4BestCase,Q4SalesPL,
	 Season_Index,Growth_Index,Trained_Reps,Sales_Cycle_Time)
	values
	(@CompanyID,@Q2Total,@Q3Total,@Q4Total,@Year, 
		@QuotaTotal,@BestCaseTotal,@SalesPLTotal,
		@Q2Quota,@Q2BestCase ,@Q2SalesPL,
		@Q3Quota,@Q3BestCase ,@Q3SalesPL,
		@Q4Quota,@Q4BestCase ,@Q4SalesPL,
	 @SeasonIndex,@GrowthIndex , @Trained_Reps ,@SalesCycle)
	
	/* SET NOCOUNT ON */
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_GetForecastDetails]    Script Date: 07/29/2012 10:17:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetForecastDetails]
	
	(
		@CompID int
	)
	
AS
	/* SET NOCOUNT ON */

	Select *
	/* Comp_ID, Q2Total, Q3Total, Q4Total,Year, Season_Index,Growth_Index,Trained_Reps,Sales_Cycle_Time */
	from tbl_forecast where comp_id = @CompID
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_AttachDocument]    Script Date: 07/29/2012 10:17:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_AttachDocument]
	
	(
		@OppsID int,@DocName varchar(150), @DocStatus int, 
		@LastModifyDate datetime, @CreatedBy varchar(50)
	)
	
AS
	
	Insert into tbl_docs
	(oppsid, docname,docstatusid,Updateddate, CreatedBy, IsActive)
	values
	(@OppsID,@DocName,@DocStatus,@LastModifyDate, @CreatedBy,1)
	
	/* SET NOCOUNT ON */
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateDocumentDetails]    Script Date: 07/29/2012 10:17:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UpdateDocumentDetails]
	(
		
		@DocsID int,@OppsID int,@DocName varchar(50), @DocStatus int, 
		@LastModifyDate datetime, @UpdatedBy varchar(50)
		
	)
AS
	
	Update tbl_docs

	Set docstatusid = @DocStatus, 
	DocName = @DocName,
	OPPSID = @OppsID,
	UpdatedDate = @LastModifyDate ,
	UpdatedBy = @UpdatedBy
	where DocsID = @DocsID
	
	
	


	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_GetDocumentDetails]    Script Date: 07/29/2012 10:17:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetDocumentDetails]
	
	(
		@DocsID int
	)
	
AS
	Select 
	dc.DocsID, 
	dc.DocName as docFullName,
	substring(dc.DocName, CHARINDEX('_',dc.DocName)+1, LEN(dc.DocName)) as DocName,
	dc.updateddate as LastModifyDate,
	ds.DocStatusId, op.name as OppName, op.id as OppsID,
	cp.CompanyName, ds.DocStatusText,cp.COMPANIESID
	from tbl_docs dc
	left join tbl_opportunities op on dc.oppsid = op.id
	left join tbl_companies cp on cp.COMPANIESID = op.companyid
	left join tbl_documentstatus ds on ds.docstatusid = dc.docstatusid
	where dc.docsid = @DocsID
	
	

	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_GetDocumentsById]    Script Date: 07/29/2012 10:17:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetDocumentsById]
	
	(
		@OppsID int
	)
	
AS
	
	Select 
	dc.docsid, 
	dc.DocName as docFullName,
	substring(dc.DocName, CHARINDEX('_',dc.DocName)+1, LEN(dc.DocName)) as DocName,
	dc.updateddate,
	op.name as oppname, cp.companyname,
	ds.DocStatusText 
	from tbl_docs dc
	left join tbl_opportunities op on dc.oppsid = op.id
	left join tbl_companies cp on cp.COMPANIESID = op.COMPANYID 
	left join tbl_documentStatus ds on ds.DocStatusId = dc.DocStatusId
	where dc.oppsid = @OppsID
	

	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateOpportunityDetailsSpecial]    Script Date: 07/29/2012 10:17:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UpdateOpportunityDetailsSpecial]
	
	(
		@OppId int,@CompanyID int,
		@OppName varchar(50),@SalesPhone varchar(50),@SalesRep varchar(50),
		@CompContact varchar(50),@CompPhone varchar(50),@CompEmail varchar(50),
		@WeightedValue int,@WinProbability int,@AcctOppStatus varchar(50),@AcctID int,@TotalActValue int
				
		
	)
	
	
AS
	
	Update tbl_Opportunity

	Set Company_id = @CompanyID, Opp_Name = @OppName, Weighted_Value = @WeightedValue,
	Win_Probability = @WinProbability, Rep_Phone = @SalesPhone, Sales_Rep = @SalesRep, Comp_contact = @CompContact,
	 Comp_Phone = @CompPhone
	 ,Email = @CompEmail
	 ,Acct_Opp_Status = @AcctOppStatus
	 ,Acct_id = @AcctID
	 ,Close_Date = null
	 ,Total_Value = @TotalActValue
	 where opp_id = @OppId

	
		
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateOpportunityDetails]    Script Date: 07/29/2012 10:17:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UpdateOpportunityDetails]
	
	(
		@OppId int,@CompanyID int,
		@OppName varchar(50),@SalesPhone varchar(50),@SalesRep varchar(50),
		@CompContact varchar(50),@CompPhone varchar(50),@CompEmail varchar(50),
		@WeightedValue int,@WinProbability int,@AcctOppStatus varchar(50),@AcctID int,@CloseDate datetime,@TotalActValue int
				
		
	)
	
	
AS
	
	Update tbl_Opportunity

	Set Company_id = @CompanyID, Opp_Name = @OppName, Weighted_Value = @WeightedValue,
	Win_Probability = @WinProbability, Rep_Phone = @SalesPhone, Sales_Rep = @SalesRep, Comp_contact = @CompContact,
	 Comp_Phone = @CompPhone
	 ,Email = @CompEmail
	 ,Acct_Opp_Status = @AcctOppStatus
	 ,Acct_id = @AcctID
	 ,Close_Date = @CloseDate
	 ,Total_Value = @TotalActValue
	 where opp_id = @OppId

	
		
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_InsertOpportunitySpecial]    Script Date: 07/29/2012 10:17:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[sp_InsertOpportunitySpecial]
	
	(
		@CompanyID int,
		@OppName varchar(50),@SalesPhone varchar(50),@SalesRep varchar(50),
		@CompContact varchar(50),@CompPhone varchar(50),@CompEmail varchar(50),
		@WeightedValue int,@WinProbability int,@AcctOppStatus varchar(50),@AcctID int,@TotalActValue int
				
		
	)
	
	
AS
	
	Insert into tbl_Opportunity
	(Company_id, Opp_Name, Weighted_Value, Win_Probability,Rep_Phone,Sales_Rep,Comp_contact,Comp_Phone,Email,Acct_Opp_Status,Acct_id,Total_Value,Close_Date)
	values
	(@CompanyID,@OppName,@WeightedValue,@WinProbability,@SalesPhone,@SalesRep,@CompContact,@CompPhone,@CompEmail,@AcctOppStatus,@AcctID,@TotalActValue,null)
	
		
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_InsertOpportunity]    Script Date: 07/29/2012 10:17:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertOpportunity]
	
	(
		@CompanyID int,
		@OppName varchar(50),@SalesPhone varchar(50),@SalesRep varchar(50),
		@CompContact varchar(50),@CompPhone varchar(50),@CompEmail varchar(50),
		@WeightedValue int,@WinProbability int,@AcctOppStatus varchar(50),@AcctID int,@CloseDate datetime,@TotalActValue int
				
		
	)
	
	
AS
	
	Insert into tbl_Opportunity
	(Company_id, Opp_Name, Weighted_Value, Win_Probability,Rep_Phone,Sales_Rep,Comp_contact,Comp_Phone,Email,Acct_Opp_Status,Acct_id,Close_Date,Total_Value)
	values
	(@CompanyID,@OppName,@WeightedValue,@WinProbability,@SalesPhone,@SalesRep,@CompContact,@CompPhone,@CompEmail,@AcctOppStatus,@AcctID,@CloseDate,@TotalActValue)
	
		
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_GetOpportunityDetails]    Script Date: 07/29/2012 10:17:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetOpportunityDetails]
	(
	@OppID int 
	)
AS
	
	Select op.Opp_ID,op.opp_name, op.acct_id, op.opp_name, op.sales_rep,
	op.total_value,op.email, op.comp_phone,op.comp_contact, op.rep_phone,
	op.weighted_value,op.win_probability,
	ISNULL(op.close_date, '') as close_date,
	cp.Company_Name, op.acct_opp_status,cp.id
	from tbl_opportunity op 
	join tbl_company cp on op.company_id = cp.id where op.opp_id = @OppID
	
	
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllOpportunitiesByID]    Script Date: 07/29/2012 10:17:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetAllOpportunitiesByID]
	
	(
		@CompanyID int
	)
	
AS
	Select 
	op.id as oppsid, op.name as oppname
	/*,cp.companyname, op.WEIGHTEDVALUE, 
	op.WINPROBABILITY,
	op.closedate,op.salesreplastname, 
	op.salesrepfirstname*/
	from TBL_OPPORTUNITIES op 
	inner join tbl_companies cp on op.companyid = cp.COMPANIESID 
	where op.companyid = @CompanyID
	order by op.name
		
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllOpportunities]    Script Date: 07/29/2012 10:17:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetAllOpportunities]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	
	Select op.opp_id,op.acct_id, op.opp_name, cp.company_name, op.weighted_value, op.win_probability,
	op.total_value, op.close_date,op.sales_rep, op.acct_opp_status
	from tbl_opportunity op join tbl_company cp on op.company_id = cp.id order by op.opp_name

	
		
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_InsertAccountSpecial]    Script Date: 07/29/2012 10:17:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertAccountSpecial]
	
	(
		@CompanyName varchar(50), @ActName varchar(50),@Sales_Rep varchar(50),@LastDate datetime, 
	    @Comment varchar(max), @ActionStep varchar(50), @Account_Value int,@Product varchar(50)
	)
	

	
	
AS
	
	Insert into tbl_Company
	(Company_Name, Account_Name, Sales_Rep, Last_Contact_Date,Comment,Action_Step,Account_Value,Product,Next_contact_Date)
	values
	(@CompanyName , @ActName ,@Sales_Rep ,@LastDate,@Comment, @ActionStep , @Account_Value ,@Product,null)
	
	/* SET NOCOUNT ON */
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_InsertAccount]    Script Date: 07/29/2012 10:17:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertAccount]
	
	(
		@CompanyName varchar(50), @ActName varchar(50),@Sales_Rep varchar(50),@LastDate datetime,@NextDate datetime, 
	    @Comment varchar(max), @ActionStep varchar(50), @Account_Value int,@Product varchar(50)
	)
	

	
	
AS
	
	Insert into tbl_Company
	(Company_Name, Account_Name, Sales_Rep, Last_Contact_Date,Next_Contact_Date, Comment,Action_Step,Account_Value,Product)
	values
	(@CompanyName , @ActName ,@Sales_Rep ,@LastDate ,@NextDate, 
	    @Comment, @ActionStep , @Account_Value ,@Product)
	
	/* SET NOCOUNT ON */
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateAccountDetailsSpecial]    Script Date: 07/29/2012 10:17:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UpdateAccountDetailsSpecial]
	(
		@AccountID int,@CompanyName varchar(50),@AccountName varchar(50),
		@Product varchar(50),@LastDate datetime,
		@Comment varchar(Max),@ActionStep varchar(50),
		@ActValue int,@SalesRep varchar(50)
	)
AS
	
	Update tbl_company

	Set Company_Name = @CompanyName, Account_Name = @AccountName,Account_value = @ActValue,
	Last_Contact_Date = @LastDate, Sales_Rep = @SalesRep,Next_Contact_Date = null, 
	Action_Step = @ActionStep, Product = @Product,Comment = @Comment where ID = @AccountID


	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateAccountDetails]    Script Date: 07/29/2012 10:17:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UpdateAccountDetails]
	(
		@AccountID int,@CompanyName varchar(50),@AccountName varchar(50),
		@Product varchar(50),@LastDate datetime,@NextDate datetime,
		@Comment varchar(Max),@ActionStep varchar(50),
		@ActValue int,@SalesRep varchar(50)
	)
AS
	
	Update tbl_company

	Set Company_Name = @CompanyName, Account_Name = @AccountName,Account_value = @ActValue,
	Last_Contact_Date = @LastDate, Next_Contact_Date = @NextDate,Sales_Rep = @SalesRep,
	Action_Step = @ActionStep, Product = @Product, Comment = @Comment where ID = @AccountID


	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_GetAccountDetails]    Script Date: 07/29/2012 10:17:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetAccountDetails]
	(
	@AccountID int 
	)
AS
	select ID, ISNULL(next_contact_date, '') as next_contact_date, last_contact_date,
	Product, Account_name, Account_Value, Comment, Company_Name,Sales_Rep, Action_Step 
	from tbl_company where id = @AccountID

	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllAccounts]    Script Date: 07/29/2012 10:17:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetAllAccounts]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	SELECT * FROM TBL_COMPANY ORDER BY ACCOUNT_NAME/* SET NOCOUNT ON */
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateContactDetailsSpecial]    Script Date: 07/29/2012 10:17:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UpdateContactDetailsSpecial]
	
	(
		@ContactsID int, @CompanyID int, @LastName varchar(50),
        @FirstName varchar(50), 
        @Phone varchar(50), 
        @Email varchar(50), 
        @DiscussionTopic varchar(50), 
        @ActionStep varchar(50), 
        @IsRegisteredForTrng int, 
        @IsNewAppt int, 
        @CourseId int, 
        @AppsSourceId int, 
        @LastDate datetime,
        @NextDate datetime,
        @UpdatedBy varchar(50)
	)
	
AS
	Update Tbl_Contacts

	Set LastName = @LastName, 
	FirstName = @FirstName,
	Phone = @Phone, 
	Email = @Email,
	Last_Contact_Date = @LastDate, 
	Next_Contact_Date = @NextDate, 
	DiscussionTopic = @DiscussionTopic,
	ActionStep = @ActionStep, 
	Companyid = @CompanyID,
	ApptSourceId = @AppsSourceId,
	IsNewAppointment = @IsNewAppt,
	CourseId = @CourseId,
	IsRegisteredForTraining = @IsRegisteredForTrng,
	UpdatedBy = @UpdatedBy,
	UpdatedDate = GETDATE()
	where CONTACTSID = @ContactsID

	
	/* SET NOCOUNT ON */
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_InsertContactSpecial]    Script Date: 07/29/2012 10:17:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertContactSpecial]
	
	(
		@COMPANIESID int, @LastName varchar(50), @FirstName varchar(50),
		@Phone varchar(50), @Email varchar(50),
		@Value int, @ApptSourceId int, @RegForTrainingId int, @CourseId int, 
        @DiscussionTopic varchar(50), 
        @ACTIONSTEP varchar(50), 
        @Last_Contact_Date datetime, @Next_Contact_Date datetime, @CreatedBy varchar(50)
	)
	
	
AS
	
	if(@CourseId = 0) 
	Begin
	 Set @CourseId = null
	End
	
	
	
	Insert into tbl_contacts 
	(COMPANYID, LastName,FirstName,Phone,Email, IsNewAppointment,ApptSourceId,IsRegisteredForTraining,
	 CourseId, DiscussionTopic,ActionStep,LAST_CONTACT_DATE,NEXT_CONTACT_DATE, IsActive, CreatedBy )
	values
	(@COMPANIESID , @LastName , @FirstName ,@Phone , @Email,
	 @Value , @ApptSourceId , @RegForTrainingId , @CourseId , 
     @DiscussionTopic , @ACTIONSTEP, 
     @Last_Contact_Date , @Next_Contact_Date,1,@CreatedBy)
	
	
	/* SET NOCOUNT ON */
	RETURN

GO


CREATE PROCEDURE [dbo].[sp_InsertContact]
	
	(
		@COMPANIESID int, @LastName varchar(50), @FirstName varchar(50),
		@Phone varchar(50), @Email varchar(50),
		@Value int, @ApptSourceId int, @RegForTrainingId int, @CourseId int, 
        @CourseTrngDate datetime, @DiscussionTopic varchar(50), 
        @ACTIONSTEP varchar(50), 
        @Last_Contact_Date datetime, @Next_Contact_Date datetime, @CreatedBy varchar(50)
	)
	
AS

		
	if(@CourseId = 0) 
	Begin
	 Set @CourseId = null
	End
	
	if(@ApptSourceId = 0) 
	Begin
	 Set @ApptSourceId = null
	End
	
	if @Last_Contact_Date < '2/1/1755'
	Begin
	  Set @Last_Contact_Date = null
	End
	
	
	if @CourseTrngDate < '2/1/1755'
	Begin
	  Set @CourseTrngDate = null
	End
	
	
	
	Insert into tbl_contacts 
	(COMPANYID, LastName,FirstName,Phone,Email, IsNewAppointment,ApptSourceId,IsRegisteredForTraining,
	 CourseId,CourseTrainingDate, DiscussionTopic,ActionStep,LAST_CONTACT_DATE,NEXT_CONTACT_DATE, IsActive, CreatedBy )
	values
	(@COMPANIESID , @LastName , @FirstName ,@Phone , @Email,
	 @Value , @ApptSourceId , @RegForTrainingId , @CourseId , 
     @CourseTrngDate , @DiscussionTopic , @ACTIONSTEP, 
     @Last_Contact_Date , @Next_Contact_Date,1,@CreatedBy)
	
	/* SET NOCOUNT ON */
	RETURN




GO







CREATE PROCEDURE [dbo].[sp_UpdateContactDetails]	
	(		
		@ContactsID int, @CompanyID int, @LastName varchar(50),
        @FirstName varchar(50), 
        @Phone varchar(50), 
        @Email varchar(50), 
        @DiscussionTopic varchar(50), 
        @ActionStep varchar(50), 
        @IsRegisteredForTrng int, 
        @IsNewAppt int, 
        @CourseId int, 
        @AppsSourceId int, 
        @LastDate datetime,
        @NextDate datetime,
        @CourseTrngDate datetime,
        @UpdatedBy varchar(50)		
	)
	
AS
	if(@CourseId = 0) 
	Begin
	 Set @CourseId = null
	End
	
	if(@AppsSourceId = 0) 
	Begin
	 Set @AppsSourceId = null
	End
	
	
	if @LastDate < '2/1/1755'
	Begin
	  Set @LastDate = null
	End
	
	
	if @CourseTrngDate < '2/1/1755'
	Begin
	  Set @CourseTrngDate = null
	End
	
	
	Update Tbl_Contacts

	Set LastName = @LastName, 
	FirstName = @FirstName,
	Phone = @Phone, 
	Email = @Email,
	Last_Contact_Date = @LastDate, 
	Next_Contact_Date = @NextDate, 
	DiscussionTopic = @DiscussionTopic,
	ActionStep = @ActionStep, 
	Companyid = @CompanyID,
	ApptSourceId = @AppsSourceId,
	IsNewAppointment = @IsNewAppt,
	CourseId = @CourseId,
	IsRegisteredForTraining = @IsRegisteredForTrng,
	CourseTrainingDate = @CourseTrngDate,
	UpdatedBy = @UpdatedBy,
	UpdatedDate = GETDATE()
	where CONTACTSID = @ContactsID
	
	/* SET NOCOUNT ON */
	RETURN


GO
CREATE PROCEDURE [dbo].[sp_GetContactDetails]
	(
	@ContactID int 
	)
AS
		
	Select 
	ct.CONTACTSID,
	ct.LASTNAME,
	ct.FIRSTNAME,   
	ct.Phone, 
	ct.Email, 
	ct.DiscussionTopic,
	ct.ACTIONSTEP,
	ISNULL(ct.LAST_CONTACT_DATE, '') as LAST_CONTACT_DATE,
	ISNULL(ct.NEXT_CONTACT_DATE, '') as NEXT_CONTACT_DATE,
	ISNULL(ct.CourseTrainingDate, '') as CourseTrainingDate,
	cp.COMPANYNAME,cp.COMPANIESID,
	yn.Description as NewApptDescription, yn.Value as Value,
	aps.ApptSourceName , 
	yno.Description as RegForTrngDescription, yno.Value as RegForTrainingId,
	cs.CourseName, 
	ISNULL(cs.courseId,1) as courseId,
	ISNULL(aps.ApptSourceId,1) as ApptSourceId
	/*ISNULL(ct.next_contact_date, '') as next_contact_date*/
	from tbl_contacts ct 
	left join tbl_companies cp on ct.companyid = cp.COMPANIESID 
	left join Tbl_YesNoOptions yn on ct.IsNewAppointment = yn.Value 
	left join Tbl_AppointmentsSource aps on ct.ApptSourceId = aps.ApptSourceId
	left join Tbl_YesNoOptions yno on ct.IsRegisteredForTraining = yno.Value
	left join Tbl_Course cs on ct.CourseId = cs.CourseId  
	where ct.CONTACTSID = @ContactID
	
	RETURN




GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllContacts]    Script Date: 07/29/2012 10:17:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetAllContacts]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
		
	select 
	ct.lastname + ',' + ct.FirstName as FullName, 
	ct.phone,
	ct.Email, ct.contactsid 
	,cp.COMPANYNAME
	from tbl_contacts ct 
	join tbl_companies cp on ct.companyid = cp.COMPANIESID 
	Order by cp.COMPANYNAME
	
	
	/* SET NOCOUNT ON */
	RETURN

GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllCompanies]    Script Date: 07/29/2012 10:17:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetAllCompanies]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	SELECT 
	cp.COMPANIESID,
	cp.COMPANYNAME,
	cp.RepLastName+', '+ cp.RepFirstName as Representative,
	p.ProductTypeName as Product,
	i.IndustryTypeName as Industry,
	dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue
	FROM TBL_COMPANIES cp
	left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
	left join Tbl_ProductType p on os.PRODUCTID = p.Id 
	left join Tbl_IndustryType i on cp.IndustryId = i.IndId
	ORDER BY COMPANYNAME
	
	RETURN

GO


Create PROCEDURE [dbo].[sp_UpdateCompanyDetailsSpecial]
	(
		@COMPANIESID int,@CompanyName varchar(50), @Address varchar(150),
		@City varchar(50), @State varchar(50), @Zip varchar(50),
		@POCLastName varchar(50), @POCFirstName varchar(50),
		@POCPhone varchar(50), @Value int, @COMPANYVALUEGOAL int,
		/*@Id int, */
		@IndId int,
		@RepLastName varchar(50),@RepFirstName varchar(50),
		@DiscussionTopic varchar(50), @ActionStep varchar(50),
		@NextContact_Date datetime, 
		@CreationDate datetime, @UpdatedBy varchar(50)
		
	)
AS
	
	Update tbl_companies

	Set 
	CompanyName = @CompanyName,
	Address = @Address,
	City = @City,
	State = @State,
	Zip = @Zip,
	POCLastName = @POCLastName,
	POCFirstName = @POCFirstName,
	POCPhone = @POCPhone,
	COMPANYVALUEGOAL = @COMPANYVALUEGOAL,
	RepLastName = @RepLastName,
	RepFirstName = @RepFirstName,
	DiscussionTopic = @DiscussionTopic,
	ActionStep = @ActionStep,
	NextContact_Date = @NextContact_Date,
	CreationDate = @CreationDate,
	/*ProductId = @Id,*/
	IndustryId = @IndId,
	IsNewCompany = @Value,
	UpdatedBy = @UpdatedBy,
	UPdatedDate = GETDATE()
	where COMPANIESID = @COMPANIESID


	RETURN
	
GO




Create PROCEDURE [dbo].[sp_InsertCompanySpecial]
	
	(	
		@CompanyName varchar(50), @Address varchar(150),
		@City varchar(50), @State varchar(50), @Zip varchar(50),
		@POCLastName varchar(50), @POCFirstName varchar(50),
		@POCPhone varchar(50), @Value int, @COMPANYVALUEGOAL int,
		/*@Id int, */
		@IndId int,
		@RepLastName varchar(50),@RepFirstName varchar(50),
		@DiscussionTopic varchar(50), @ActionStep varchar(50),
		@NextContact_Date datetime, 
		@CreationDate datetime, @CreatedBy varchar(50),
		@FranchiseeId int
	 )
AS
	Insert into tbl_Companies
	(CompanyName, Address,City, State, Zip,POCLastName,POCFirstName,
	 POCPhone,IsNewCompany, COMPANYVALUEGOAL,
	 /*ProductId,*/
	 IndustryId,
	 RepLastName,RepFirstName,DiscussionTopic,ActionStep,
	 NextContact_Date,CreationDate, CreatedBy, FranchiseeId,IsActive)
	values
	(@CompanyName, @Address,@City, @State, @Zip,@POCLastName,@POCFirstName,
		@POCPhone , @Value, @COMPANYVALUEGOAL,
		/*@Id ,*/
		@IndId ,@RepLastName ,@RepLastName,
		@DiscussionTopic , @ActionStep,	
	 @NextContact_Date,@CreationDate,@CreatedBy,@FranchiseeId,1)
	
	/* SET NOCOUNT ON */
	RETURN
	
GO

/****** Object:  UserDefinedFunction [dbo].[GetTotalCompanyValue]    Script Date: 07/30/2012 12:58:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetTotalCompanyValue]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GetTotalCompanyValue]
GO

Create FUNCTION [dbo].[GetTotalCompanyValue]
(
	@CompId INT
		
)
RETURNS Int
AS
BEGIN
	DECLARE @Total Int
	
	SELECT  @Total = Sum(WEIGHTEDVALUE) FROM TBL_OPPORTUNITIES WHERE Companyid = @CompId 
			
		
	
	RETURN @Total
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AddProduct]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AddProduct]
GO

CREATE PROCEDURE [dbo].[sp_AddProduct]
	
	(
		@ProductTypeName varchar(50), 
		@CreatedBy varchar(50),
		@FranchiseeId int
	)
	

	
	
AS
	
	Insert into tbl_ProductType
	(ProductTypeName, CreatedBy, FranchiseeId)
	values
	(@ProductTypeName, @CreatedBy ,@FranchiseeId) 
	
	/* SET NOCOUNT ON */
	RETURN


GO

