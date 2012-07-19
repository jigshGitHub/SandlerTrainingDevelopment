USE [SandlerDB]
GO
delete from TBL_FRANCHISEE_USERS;
delete from TBL_FRANCHISEE;
delete from TBL_COACH;
delete from Tbl_Region;
delete from TBL_CHART;
--Membership cleanup
delete from aspnet_UsersInRoles;
delete from aspnet_Roles;
delete from aspnet_Users;
delete from aspnet_Membership;
delete from aspnet_Applications;