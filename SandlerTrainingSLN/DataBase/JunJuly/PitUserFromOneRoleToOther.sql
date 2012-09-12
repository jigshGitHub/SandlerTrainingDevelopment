SELECT R.RoleName, R.RoleId, U.* FROM aspnet_Users U
INNER JOIN aspnet_UsersInRoles UR ON UR.UserId = U.UserId
INNER JOIN aspnet_Roles R ON R.RoleId = UR.RoleId
WHERE U.UserName = 'PDARLING';



declare @userId uniqueidentifier 
declare @applicationId uniqueidentifier 
select @applicationId = applicationId from aspnet_Applications where ApplicationName = 'sandlertraining';
print @applicationId 
select @userId = userid from aspnet_users where ApplicationId = @applicationId and UserName = 'pdarling'
print @userId
DECLARE @CurrentTime DATETIME
DECLARE @_corporateUserId uniqueidentifier
SET @CurrentTime = GetDate();

delete from TBL_FRANCHISEE_USERS where [USERID] = @userId;
delete from aspnet_UsersInRoles where [USERID] = @userId;
delete from aspnet_Membership where [USERID] = @userId and ApplicationId = @applicationId;
delete from aspnet_users where [USERID] = @userId and ApplicationId = @applicationId;


EXEC [dbo].[aspnet_Membership_CreateUser] @ApplicationName = N'SandlerTraining', @UserName = N'pdarling', @Password = N'DE5aG4DJKaWNAC6qtb9Ex1mw0YQ=', @PasswordSalt = N'CgWo/aHD6MDFG4AYqW/5wQ==', @Email = N'pdarling@sandler.com', @PasswordQuestion = NULL, @PasswordAnswer = NULL, @IsApproved = 1, @CurrentTimeUtc = @CurrentTime, @CreateDate = @CurrentTime, @UniqueEmail = NULL, @PasswordFormat = 1, @UserId = @_corporateUserId OUTPUT;
		
EXEC [dbo].[aspnet_UsersInRoles_AddUsersToRoles] @ApplicationName = N'SandlerTraining', @UserNames = N'pdarling', @RoleNames = N'Corporate', @CurrentTimeUtc = @CurrentTime

SELECT R.RoleName, R.RoleId, U.* FROM aspnet_Users U
INNER JOIN aspnet_UsersInRoles UR ON UR.UserId = U.UserId
INNER JOIN aspnet_Roles R ON R.RoleId = UR.RoleId
WHERE U.UserName = 'PDARLING';
