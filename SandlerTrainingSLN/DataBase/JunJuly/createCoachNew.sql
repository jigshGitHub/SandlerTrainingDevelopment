declare @user_Name NVARCHAR(256)
declare @_email NVARCHAR(256)
declare @region_Id INT
declare @coach_Id INT
declare @User_Id uniqueidentifier
declare @CurrentTime DATETIME
/* Set all values here */


set @user_Name = 'kathy.szpakowski'--firstname.lastname
set @_email = 'kszpakowski@sandler.com'
set @region_Id = 12-- Take region id from tbl_region table for example, region International has id 12 ..

set @CurrentTime = GetDate();
set @User_Id = null;

BEGIN TRY

	
		
	BEGIN TRANSACTION;

				
		EXEC [dbo].[aspnet_Membership_CreateUser] @ApplicationName = 'SandlerTraining', @UserName = @user_Name, @Password = N'DE5aG4DJKaWNAC6qtb9Ex1mw0YQ=', @PasswordSalt = N'CgWo/aHD6MDFG4AYqW/5wQ==', @Email = @_email, @PasswordQuestion = NULL, @PasswordAnswer = NULL, @IsApproved = 1, @CurrentTimeUtc = @CurrentTime, @CreateDate = @CurrentTime, @UniqueEmail = NULL, @PasswordFormat = 1, @UserId = @User_Id OUTPUT;
		
		If @User_Id IS NOT NULL 
		BEGIN
		
			PRINT 'User with username ' + @user_Name + ' has been created';
			
			EXEC [dbo].[aspnet_UsersInRoles_AddUsersToRoles] @ApplicationName = 'SandlerTraining', @UserNames = @user_Name, @RoleNames = 'Coach', @CurrentTimeUtc = @CurrentTime;
			
			PRINT 'User ' + @user_Name + ' has been assigned a Coach role';
			
			Insert Into TBL_COACH (UserID, RegionID) VALUES(@User_Id, @region_Id);
			
			SELECT @coach_Id = @@IDENTITY;
			
			PRINT 'CoachId ' + CAST(@coach_Id as varchar(10)) + ' has been created, this coach id will require to create franchisee data';
			
			
			SELECT @coach_Id as NewCoachId, 'You will need this coach id for creating franchisee' as [Message];
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