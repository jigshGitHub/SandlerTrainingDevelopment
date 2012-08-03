declare @userId uniqueidentifier 
declare @applicationId uniqueidentifier 
select @applicationId = applicationId from aspnet_Applications where ApplicationName = 'sandlertraining';
print @applicationId 
select @userId = userid from aspnet_users where ApplicationId = @applicationId and UserName = 'jshahVTFU1'
print @userId

delete from TBL_FRANCHISEE_USERS where [USERID] = @userId;
delete from aspnet_UsersInRoles where [USERID] = @userId;
delete from aspnet_Membership where [USERID] = @userId and ApplicationId = @applicationId;
delete from aspnet_users where [USERID] = @userId and ApplicationId = @applicationId;
