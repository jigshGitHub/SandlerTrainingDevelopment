declare @user_Name NVARCHAR(256)
declare @_email NVARCHAR(256)
declare @franchiseeId INT
declare @User_Id uniqueidentifier
DECLARE @CurrentTime DATETIME
		
/* Set all values here */



set @user_Name = 'Dave.mattson-homeoffice'--firstname.lastname
set @_email = 'Dave.mattson@sandler.com'
--set @franchiseeId = 21
SET @CurrentTime = GetDate()
set @User_Id = null


BEGIN TRY

	BEGIN TRANSACTION;

				
		EXEC [dbo].[aspnet_Membership_CreateUser] 
			@ApplicationName = 'SandlerTraining', 
			@UserName = @user_Name, 
			@Password = N'DE5aG4DJKaWNAC6qtb9Ex1mw0YQ=', 
			@PasswordSalt = N'CgWo/aHD6MDFG4AYqW/5wQ==', 
			@Email = @_email, 
			@PasswordQuestion = NULL, 
			@PasswordAnswer = NULL, 
			@IsApproved = 1, 
			@CurrentTimeUtc = @CurrentTime, 
			@CreateDate = @CurrentTime, 
			@UniqueEmail = NULL, 
			@PasswordFormat = 1, 
			@UserId = @User_Id OUTPUT;
		
		If @User_Id IS NOT NULL 
	
		BEGIN
		
				EXEC [dbo].[aspnet_UsersInRoles_AddUsersToRoles] 
					@ApplicationName = 'SandlerTraining', 
					@UserNames = @user_Name, 
					@RoleNames = 'HomeOfficeAdmin', 
					@CurrentTimeUtc = @CurrentTime;
					
				--Insert Into TBL_FRANCHISEE_USERS(FranchiseeID, UserID) VALUES(@franchiseeId, @User_Id);
		
			END 
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
