USE [SandlerDB]
GO

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






