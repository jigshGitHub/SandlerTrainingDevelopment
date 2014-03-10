INSERT [dbo].[pageMenu] ([pageMenuId], [appId], [name], [shortCaption], [longCaption], [description], [iconPath], [pagePath], [pageParams], [isNewWindow], [isModal], [inIFRAME], [aElementIdentifier]) 
VALUES (17, 1, N'My Calendar', N'My Calendar', N'My Calendar', NULL, NULL, N'/MyDay/Home/Index', NULL, 0, 0, 0, NULL);
GO
INSERT [dbo].[pageMenu] ([pageMenuId], [appId], [name], [shortCaption], [longCaption], [description], [iconPath], [pagePath], [pageParams], [isNewWindow], [isModal], [inIFRAME], [aElementIdentifier]) 
VALUES (18, 1, N'My Dashboard', N'My Dashboard', N'My Dashboard', NULL, NULL, N'/MyDay/Home/Dashboard', NULL, 0, 0, 0, NULL);
GO

INSERT [dbo].[pageMenuGroup] ([pageMenuGroupId], [appId], [caption], [description], [iconPath], [iconClass], [pageMenuIds], [DefaultPage], [name]) VALUES 
(5, 1, N'DASHBOARD', NULL, NULL, NULL, N'1', NULL, N'DASHBOARD');
GO

UPDATE [dbo].[pageMenuGroup] SET caption = 'My Day', [pageMenuIds] = '18,17', name = 'My Day' WHERE [pageMenuGroupId] = 1;
GO

UPDATE [dbo].[module] SET [pageMenuGroups] = '1,2,3,4,5' WHERE [moduleId] = 1;
GO