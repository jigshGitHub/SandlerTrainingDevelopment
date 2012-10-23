declare @user_Name NVARCHAR(256)
declare @_email NVARCHAR(256)
declare @franchisee_name VARCHAR(50)
declare @coachId int
declare @franchisee_Id INT 
DECLARE @User_Id uniqueidentifier
DECLARE @CurrentTime DATETIME
DECLARE @coachUserId uniqueidentifier

/* Set all values here */


set @user_Name = 'nectclient'--firstname.lastname
set @_email = 'nectclient@sandler.com'
set @coachId = 1--
set @franchisee_name = 'Connecticut Fr';
SET @CurrentTime = GetDate();
set @User_Id = null;

BEGIN TRY
	
	BEGIN TRANSACTION;
				
		EXEC [dbo].[aspnet_Membership_CreateUser] @ApplicationName = 'SandlerTraining', @UserName = @user_Name, @Password = N'DE5aG4DJKaWNAC6qtb9Ex1mw0YQ=', @PasswordSalt = N'CgWo/aHD6MDFG4AYqW/5wQ==', @Email = @_email, @PasswordQuestion = NULL, @PasswordAnswer = NULL, @IsApproved = 1, @CurrentTimeUtc = @CurrentTime, @CreateDate = @CurrentTime, @UniqueEmail = NULL, @PasswordFormat = 1, @UserId = @User_Id OUTPUT;
		PRINT CAST(@User_Id AS VARCHAR(50))
		
		If @User_Id IS NOT NULL 
		BEGIN
		
			PRINT 'User with username ' + @user_Name + ' has been created';
			EXEC [dbo].[aspnet_UsersInRoles_AddUsersToRoles] @ApplicationName = 'SandlerTraining', @UserNames = @user_Name, @RoleNames = 'Client', @CurrentTimeUtc = @CurrentTime;
			
			SELECT @coachUserId = c.UserID
			FROM TBL_COACH c
			WHERE c.IsActive = 1 AND c.ID = @coachId;
			
			
			IF NOT EXISTS (SELECT ID FROM TBL_FRANCHISEE WHERE Name = @franchisee_name AND CoachID = @coachId)
			BEGIN
				PRINT 'New Frenchisee';
				Insert Into TBL_FRANCHISEE (Name, CoachID,EmailAddress, CreatedBy, LastUpdatedBy) 
				VALUES(@franchisee_name, @coachId,@_email,@coachUserId,@coachUserId);
				
				SELECT @franchisee_Id = @@IDENTITY;
				
				PRINT 'FranchiseeId ' + CAST(@franchisee_Id as varchar(10)) + ' has been created';
			
			END
			ELSE
			BEGIN
				PRINT 'Existing Franchisee';
				SELECT @franchisee_Id = ID FROM TBL_FRANCHISEE WHERE Name = @franchisee_name AND CoachID = @coachId
			
			END
			
			SELECT @franchisee_Id as NewFranchiseeId, 'You will need this franchisee id for creating users' as [Message];
			
			Insert Into TBL_FRANCHISEE_USERS(FranchiseeID, UserID) VALUES(@franchisee_Id, @User_Id);
			
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
