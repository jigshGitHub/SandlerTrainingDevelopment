CREATE TABLE [dbo].[Tbl_ModulesForUserIds](
		[ModuleId] [int] NOT NULL,
		[UserId] [nvarchar](256) NOT NULL,
	 CONSTRAINT [PK_Tbl_ModulesForUserIds] PRIMARY KEY CLUSTERED 
	(
		[ModuleId] ASC,
		[UserId] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]


/****** Object:  StoredProcedure [dbo].[MSI_GetLeftSideMenuWithUserId]    Script Date: 11/04/2014 14:10:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_GetLeftSideMenuWithUserId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MSI_GetLeftSideMenuWithUserId]
GO

USE [MetricsIntelligence]
GO

/****** Object:  StoredProcedure [dbo].[MSI_GetLeftSideMenuWithUserId]    Script Date: 11/04/2014 14:10:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE  Procedure [dbo].[MSI_GetLeftSideMenuWithUserId]
@roleName varchar(50),
@userId varchar(50) 
AS

Begin

if(@roleName != 'FranchiseeOwner')

Begin

select distinct m.moduleId, m.pageMenuGroups from module m join tbl_modulesForRoles mr
on m.moduleId = mr.ModuleId where Upper(mr.RoleName) = @roleName

End

if(@roleName = 'FranchiseeOwner')

Begin

select distinct m.moduleId, m.pageMenuGroups 
from module m join tbl_modulesForRoles mr
on m.moduleId = mr.ModuleId 
where Upper(mr.RoleName) = @roleName
Union
Select distinct m.moduleId, m.pageMenuGroups 
from module m join tbl_modulesForUserIds mr
on m.moduleId = mr.ModuleId 
where Upper(mr.UserId) = Upper(@userId) 


End

End


GO



