
/****** Object:  StoredProcedure [dbo].[MSI_GetLeftSideMenu]    Script Date: 02/08/2014 03:25:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_GetLeftSideMenu]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MSI_GetLeftSideMenu]
GO
/****** Object:  StoredProcedure [dbo].[MSI_GetMenuDetails]    Script Date: 02/08/2014 03:25:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_GetMenuDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MSI_GetMenuDetails]
GO
/****** Object:  Table [dbo].[pageMenu]    Script Date: 02/08/2014 03:24:58 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_pageMenu_isNewWindow]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[pageMenu] DROP CONSTRAINT [DF_pageMenu_isNewWindow]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_pageMenu_isModal]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[pageMenu] DROP CONSTRAINT [DF_pageMenu_isModal]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_pageMenu_inIFRAME]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[pageMenu] DROP CONSTRAINT [DF_pageMenu_inIFRAME]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_ModulesForRoles]') AND type in (N'U'))
TRUNCATE TABLE [dbo].[Tbl_ModulesForRoles]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pageMenu]') AND type in (N'U'))
TRUNCATE TABLE [dbo].[pageMenu]
GO
/****** Object:  Table [dbo].[pageMenuGroup]    Script Date: 02/08/2014 03:24:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pageMenuGroup]') AND type in (N'U'))
TRUNCATE TABLE [dbo].[pageMenuGroup]
GO
/****** Object:  Table [dbo].[module]    Script Date: 02/08/2014 03:24:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[module]') AND type in (N'U'))
TRUNCATE TABLE [dbo].[module]
GO
/****** Object:  Table [dbo].[pageMenu]    Script Date: 02/08/2014 03:24:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pageMenu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[pageMenu](
	[pageMenuId] [int]  NOT NULL,
	[appId] [int] NULL,
	[name] [nvarchar](100) NOT NULL,
	[shortCaption] [nvarchar](50) NOT NULL,
	[longCaption] [nvarchar](250) NOT NULL,
	[description] [nvarchar](max) NULL,
	[iconPath] [nvarchar](250) NULL,
	[pagePath] [nvarchar](250) NULL,
	[pageParams] [nvarchar](500) NULL,
	[isNewWindow] [bit] NULL CONSTRAINT [DF_pageMenu_isNewWindow]  DEFAULT ((0)),
	[isModal] [bit] NULL CONSTRAINT [DF_pageMenu_isModal]  DEFAULT ((0)),
	[inIFRAME] [bit] NULL CONSTRAINT [DF_pageMenu_inIFRAME]  DEFAULT ((0)),
	[aElementIdentifier] [varchar](100) NULL,
 CONSTRAINT [PK_pageMenu] PRIMARY KEY CLUSTERED 
(
	[pageMenuId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
--SET IDENTITY_INSERT [dbo].[pageMenu] ON

INSERT [dbo].[pageMenu] ( [pageMenuId] , [appId], [name], [shortCaption], [longCaption], [description], [iconPath], [pagePath], [pageParams], [isNewWindow], [isModal], [inIFRAME], [aElementIdentifier]) 
VALUES ( 1,1, N'Dashboard Overview', N'Dashboard', N'Overview', NULL, NULL, N'/Dashboard/Home/Index', NULL, 0, 0, 0, N'');
--Reports
INSERT [dbo].[pageMenu] ( [pageMenuId] , [appId], [name], [shortCaption], [longCaption], [description], [iconPath], [pagePath], [pageParams], [isNewWindow], [isModal], [inIFRAME], [aElementIdentifier]) 
VALUES ( 2,1, N'Franchisee', N'Franchisee', N'Franchisee', NULL, NULL, N'/Reports/Home/Franchisee', N'', 0, 0, 0, N'');
INSERT [dbo].[pageMenu] ( [pageMenuId] , [appId], [name], [shortCaption], [longCaption], [description], [iconPath], [pagePath], [pageParams], [isNewWindow], [isModal], [inIFRAME], [aElementIdentifier]) 
VALUES ( 3,1, N'Client', N'Client', N'Client', NULL, NULL, N'/Reports/Home/Client', N'', 0, 0, 0, N'');
INSERT [dbo].[pageMenu] ( [pageMenuId] , [appId], [name], [shortCaption], [longCaption], [description], [iconPath], [pagePath], [pageParams], [isNewWindow], [isModal], [inIFRAME], [aElementIdentifier]) 
VALUES ( 4,1, N'Product', N'Product', N'Product', NULL, NULL, N'/Reports/Home/Product', N'', 0, 0, 0, N'');
INSERT [dbo].[pageMenu] ( [pageMenuId] , [appId], [name], [shortCaption], [longCaption], [description], [iconPath], [pagePath], [pageParams], [isNewWindow], [isModal], [inIFRAME], [aElementIdentifier]) 
VALUES ( 5,1, N'Home Office', N'Home Office', N'Home Office', NULL, NULL, N'/Reports/Home/HomeOffice', N'', 0, 0, 0, N'');
INSERT [dbo].[pageMenu] ( [pageMenuId] , [appId], [name], [shortCaption], [longCaption], [description], [iconPath], [pagePath], [pageParams], [isNewWindow], [isModal], [inIFRAME], [aElementIdentifier]) 
VALUES ( 6,1, N'Custom Reporting Dashboard', N'Custom Reporting Dashboard', N'Custom Reporting Dashboard', NULL, NULL, N'/Reports/Home/CRDB', N'', 0, 0, 0, N'');
--Benchmarks
INSERT [dbo].[pageMenu] ( [pageMenuId] , [appId], [name], [shortCaption], [longCaption], [description], [iconPath], [pagePath], [pageParams], [isNewWindow], [isModal], [inIFRAME], [aElementIdentifier]) 
VALUES ( 7,1, N'Rep to Franchise', N'Rep to Franchise', N'Rep to Franchise', NULL, NULL, N'/Reports/Benchmarks/SalesrepToFranchisee', N'', 0, 0, 0, N'');
INSERT [dbo].[pageMenu] ( [pageMenuId] , [appId], [name], [shortCaption], [longCaption], [description], [iconPath], [pagePath], [pageParams], [isNewWindow], [isModal], [inIFRAME], [aElementIdentifier]) 
VALUES ( 8,1, N'Franchise to Region', N'Franchise to Region', N'Franchise to Region', NULL, NULL, N'/Reports/Benchmarks/FranchiseToRegion', N'', 0, 0, 0, N'');
INSERT [dbo].[pageMenu] ( [pageMenuId] , [appId], [name], [shortCaption], [longCaption], [description], [iconPath], [pagePath], [pageParams], [isNewWindow], [isModal], [inIFRAME], [aElementIdentifier]) 
VALUES ( 9,1, N'Region to Country', N'Region to Country', N'Region to Country', NULL, NULL, N'/Reports/Benchmarks/RegionToCountry', N'', 0, 0, 0, N'');
INSERT [dbo].[pageMenu] ( [pageMenuId] , [appId], [name], [shortCaption], [longCaption], [description], [iconPath], [pagePath], [pageParams], [isNewWindow], [isModal], [inIFRAME], [aElementIdentifier]) 
VALUES ( 10,1, N'Country to "All"', N'Country to "All"', N'Country to "All"', NULL, NULL, N'/Reports/Benchmarks/CountryToAll', N'', 0, 0, 0, N'');
--CRM
INSERT [dbo].[pageMenu] ( [pageMenuId] , [appId], [name], [shortCaption], [longCaption], [description], [iconPath], [pagePath], [pageParams], [isNewWindow], [isModal], [inIFRAME], [aElementIdentifier]) 
VALUES ( 11,1, N'QuickStart', N'QuickStart', N'QuickStart', NULL, NULL, N'/CRM/QuickStart/Index', N'', 0, 0, 0, N'');
INSERT [dbo].[pageMenu] ( [pageMenuId] , [appId], [name], [shortCaption], [longCaption], [description], [iconPath], [pagePath], [pageParams], [isNewWindow], [isModal], [inIFRAME], [aElementIdentifier]) 
VALUES ( 12,1, N'Companies', N'Companies', N'Companies', NULL, NULL, N'/CRM/Companies/Index', N'', 0, 0, 0, N'');
INSERT [dbo].[pageMenu] ( [pageMenuId] , [appId], [name], [shortCaption], [longCaption], [description], [iconPath], [pagePath], [pageParams], [isNewWindow], [isModal], [inIFRAME], [aElementIdentifier]) 
VALUES ( 13,1, N'Contacts', N'Contacts', N'Contacts', NULL, NULL, N'/CRM/Contacts/Index', N'', 0, 0, 0, N'');
INSERT [dbo].[pageMenu] ( [pageMenuId] , [appId], [name], [shortCaption], [longCaption], [description], [iconPath], [pagePath], [pageParams], [isNewWindow], [isModal], [inIFRAME], [aElementIdentifier]) 
VALUES ( 14,1, N'Pipeline', N'Pipeline', N'Pipeline', NULL, NULL, N'/CRM/Pipeline/Index', N'', 0, 0, 0, N'');
INSERT [dbo].[pageMenu] ( [pageMenuId] , [appId], [name], [shortCaption], [longCaption], [description], [iconPath], [pagePath], [pageParams], [isNewWindow], [isModal], [inIFRAME], [aElementIdentifier]) 
VALUES ( 15,1, N'Home Office', N'Home Office', N'Home Office', NULL, NULL, N'/CRM/HomeOffice/Index', N'', 0, 0, 0, N'');
--SET IDENTITY_INSERT [dbo].[pageMenu] OFF



SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pageMenuGroup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[pageMenuGroup](
	[pageMenuGroupId] [int]  NOT NULL,
	[appId] [int] NULL,
	[caption] [nvarchar](50) NULL,
	[description] [nvarchar](max) NULL,
	[iconPath] [nvarchar](250) NULL,
	[iconClass] [nvarchar](50) NULL,
	[pageMenuIds] [varchar](100) NULL,
	[DefaultPage] [nvarchar](1000) NULL,
	[name] [nvarchar](1000) NULL,
 CONSTRAINT [PK_pageMenuGroup] PRIMARY KEY CLUSTERED 
(
	[pageMenuGroupId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
--SET IDENTITY_INSERT [dbo].[pageMenuGroup] ON
INSERT [dbo].[pageMenuGroup] ([pageMenuGroupId], [appId], [caption], [description], [iconPath], [iconClass], [pageMenuIds], [DefaultPage], [name]) VALUES 
(1, 1, N'DASHBOARD', NULL, NULL, NULL, N'1', NULL, N'DASHBOARD');
INSERT [dbo].[pageMenuGroup] ([pageMenuGroupId], [appId], [caption], [description], [iconPath], [iconClass], [pageMenuIds], [DefaultPage], [name]) VALUES 
(2, 1, N'REPORTS', NULL, NULL, NULL, N'2,3,4,5,6', NULL, N'REPORTS');
INSERT [dbo].[pageMenuGroup] ([pageMenuGroupId], [appId], [caption], [description], [iconPath], [iconClass], [pageMenuIds], [DefaultPage], [name]) VALUES 
(3, 1, N'BENCHMARKS', NULL, NULL, NULL, N'7,8,9,10', NULL, N'BENCHMARKS');
INSERT [dbo].[pageMenuGroup] ([pageMenuGroupId], [appId], [caption], [description], [iconPath], [iconClass], [pageMenuIds], [DefaultPage], [name]) VALUES 
(4, 1, N'CRM', NULL, NULL, NULL, N'11,12,13,14,15', NULL, N'CRM');
--SET IDENTITY_INSERT [dbo].[pageMenuGroup] OFF



/****** Object:  Table [dbo].[module]    Script Date: 02/08/2014 03:24:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[module]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[module](
	[moduleId] [int]  NOT NULL,
	[pageMenuGroups] [nvarchar](1000) NULL,
 CONSTRAINT [PK_module] PRIMARY KEY NONCLUSTERED 
(
	[moduleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
--SET IDENTITY_INSERT [dbo].[module] ON
INSERT [dbo].[module] ([moduleId], [pageMenuGroups]) VALUES (1, N'1,2,3,4')
--SET IDENTITY_INSERT [dbo].[module] OFF
/****** Object:  Table [dbo].[pageMenuGroup]    Script Date: 02/08/2014 03:24:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_ModulesForRoles]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[Tbl_ModulesForRoles](
		[ModuleId] [int] NOT NULL,
		[RoleName] [nvarchar](256) NOT NULL,
	 CONSTRAINT [PK_Tbl_ModulesForRoles] PRIMARY KEY CLUSTERED 
	(
		[ModuleId] ASC,
		[RoleName] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
GO

INSERT INTO [dbo].[Tbl_ModulesForRoles]([ModuleId],[RoleName])VALUES (1,'FranchiseeOwner');
GO


/****** Object:  StoredProcedure [dbo].[MSI_GetMenuDetails]    Script Date: 02/08/2014 03:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_GetMenuDetails]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create Procedure [dbo].[MSI_GetMenuDetails]
  @appId int
AS
  
  
SELECT	DISTINCT
		W.pageMenuGroupId, M.pageMenuId, 
		CASE WHEN PATINDEX(CAST(M.pageMenuId AS VARCHAR(10))+'',%'', W.pageMenuIds)>0 
				THEN PATINDEX(CAST(M.pageMenuId AS VARCHAR(10))+'',%'', W.pageMenuIds)
			 WHEN PATINDEX(''%''+CAST(M.pageMenuId AS VARCHAR(10)), W.pageMenuIds)>0 
				THEN PATINDEX(''%''+CAST(M.pageMenuId AS VARCHAR(10)), W.pageMenuIds)				
			 WHEN PATINDEX(''%,''+CAST(M.pageMenuId AS VARCHAR(10))+'',%'', W.pageMenuIds)>0 
				THEN PATINDEX(''%,''+CAST(M.pageMenuId AS VARCHAR(10))+'',%'', W.pageMenuIds)
			 ELSE 99 END AS listOrder
	FROM	pageMenu M
			INNER JOIN pageMenuGroup W ON 
					W.pageMenuIds LIKE CAST(M.pageMenuId AS VARCHAR(10))		-- Itself
					OR W.pageMenuIds LIKE CAST(M.pageMenuId AS VARCHAR(10))+'',%''		-- If a starting element
					OR W.pageMenuIds LIKE ''%,''+CAST(M.pageMenuId AS VARCHAR(10))		-- If an ending element
					OR W.pageMenuIds LIKE ''%,''+CAST(M.pageMenuId AS VARCHAR(10))+'',%''	-- If a middle element

			--INNER JOIN accessElement E ON E.aElementIdentifier = M.aElementIdentifier
			--INNER JOIN auth A ON E.aElementId = A.aElementId AND A.accessRightId>0
			--INNER JOIN userGroup UG ON UG.userGroupId = A.userGroupId
			--INNER JOIN access AC ON UG.userGroupId = AC.userGroupId
			--INNER JOIN project P ON P.projectId = AC.projectId
			--INNER JOIN aspnet_Users U ON U.userId = AC.userId
	WHERE	W.appId = @appId
			--	AND E.appId = @appId
			--	AND P.appId = @appId 
			--AND UG.userGroupId = @userGroupId 
			--AND P.projectId = @projectId

	ORDER BY W.pageMenuGroupId,
			 listOrder
' 
END
GO
/****** Object:  StoredProcedure [dbo].[MSI_GetLeftSideMenu]    Script Date: 02/08/2014 03:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MSI_GetLeftSideMenu]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
Create  Procedure [dbo].[MSI_GetLeftSideMenu]
@roleName varchar(50) 
AS
select distinct m.moduleId, m.pageMenuGroups from module m join tbl_modulesForRoles mr
on m.moduleId = mr.ModuleId where Upper(mr.RoleName) = @roleName
' 
END
GO
