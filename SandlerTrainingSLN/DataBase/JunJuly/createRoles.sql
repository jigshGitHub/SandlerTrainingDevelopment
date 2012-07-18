USE [SandlerDB]
GO
EXEC [dbo].[aspnet_Roles_CreateRole] 'SandlerTraining','Coach';
EXEC [dbo].[aspnet_Roles_CreateRole] 'SandlerTraining','FranchiseeOwner';
EXEC [dbo].[aspnet_Roles_CreateRole] 'SandlerTraining','FranchiseeUser';