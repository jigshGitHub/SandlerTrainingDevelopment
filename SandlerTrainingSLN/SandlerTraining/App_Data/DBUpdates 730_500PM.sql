SET IDENTITY_INSERT [dbo].[Tbl_DocumentStatus] ON
INSERT [dbo].[Tbl_DocumentStatus] ([DocStatusId], [DocStatusText], [IsActive], [CreatedBy], [UpdatedBy], [UpdatedOn]) VALUES (1, N'Daraft', 1, N'System', NULL, NULL)
INSERT [dbo].[Tbl_DocumentStatus] ([DocStatusId], [DocStatusText], [IsActive], [CreatedBy], [UpdatedBy], [UpdatedOn]) VALUES (2, N'In Review', 1, N'System', NULL, NULL)
INSERT [dbo].[Tbl_DocumentStatus] ([DocStatusId], [DocStatusText], [IsActive], [CreatedBy], [UpdatedBy], [UpdatedOn]) VALUES (3, N'Final', 1, N'System', NULL, NULL)
INSERT [dbo].[Tbl_DocumentStatus] ([DocStatusId], [DocStatusText], [IsActive], [CreatedBy], [UpdatedBy], [UpdatedOn]) VALUES (4, N'Approved', 1, N'System', NULL, NULL)
INSERT [dbo].[Tbl_DocumentStatus] ([DocStatusId], [DocStatusText], [IsActive], [CreatedBy], [UpdatedBy], [UpdatedOn]) VALUES (5, N'Reference', 1, N'System', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Tbl_DocumentStatus] OFF