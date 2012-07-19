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
@region_Id INT OUTPUT
AS

BEGIN TRY

	BEGIN TRANSACTION;

		Insert Into TBL_REGION(Name) VALUES(@name);
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
@franchisee_Id INT OUTPUT
AS

BEGIN TRY

	BEGIN TRANSACTION;

		DECLARE @User_Id uniqueidentifier
		DECLARE @CurrentTime DATETIME
		DECLARE @region_Id INT
		
		SET @CurrentTime = GetDate();
				
		EXEC [dbo].[aspnet_Membership_CreateUser] @ApplicationName = @application_Name, @UserName = @user_Name, @Password = N'DE5aG4DJKaWNAC6qtb9Ex1mw0YQ=', @PasswordSalt = N'CgWo/aHD6MDFG4AYqW/5wQ==', @Email = @_email, @PasswordQuestion = NULL, @PasswordAnswer = NULL, @IsApproved = 1, @CurrentTimeUtc = @CurrentTime, @CreateDate = @CurrentTime, @UniqueEmail = NULL, @PasswordFormat = 1, @UserId = @User_Id OUTPUT;
		
		EXEC [dbo].[aspnet_UsersInRoles_AddUsersToRoles] @ApplicationName = @application_Name, @UserNames = @user_Name, @RoleNames = @franchisee_Role, @CurrentTimeUtc = NULL;
		
		SELECT @region_Id = ID FROM Tbl_Region WHERE Name = @region_Name AND IsActive = 1;
		
		Insert Into TBL_FRANCHISEE (Name, RegionID) VALUES(@_name, @region_Id);
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



