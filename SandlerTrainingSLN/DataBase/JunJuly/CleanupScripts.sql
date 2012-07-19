USE [SandlerDB]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_ERRORLOG]') AND type in (N'U'))
	delete from TBL_ERRORLOG;
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_FRANCHISEE_USERS]') AND type in (N'U'))	
	delete from TBL_FRANCHISEE_USERS;
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_FRANCHISEE]') AND type in (N'U'))
	delete from TBL_FRANCHISEE;
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_COACH]') AND type in (N'U'))
	delete from TBL_COACH;
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_Region]') AND type in (N'U'))
	delete from Tbl_Region;
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_CHART]') AND type in (N'U'))
	delete from TBL_CHART;
--Membership cleanup
delete from aspnet_UsersInRoles;
delete from aspnet_Roles;
delete from aspnet_Membership;
delete from aspnet_Users;
delete from aspnet_Applications;