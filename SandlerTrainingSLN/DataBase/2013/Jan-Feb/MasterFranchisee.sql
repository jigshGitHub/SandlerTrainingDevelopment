USE [SandlerDB]
GO
/****** Object:  Table [dbo].[Tbl_MasterFranchisee]    Script Date: 01/28/2013 11:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_MasterFranchisee](
	[MasterFranchiseeId] [int] IDENTITY(1,1) NOT NULL,
	[MasterFranchiseeName] [varchar](150) NULL,
 CONSTRAINT [PK_Tbl_MasterFranchisee] PRIMARY KEY CLUSTERED 
(
	[MasterFranchiseeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_MasterFranchisee] ON
INSERT [dbo].[Tbl_MasterFranchisee] ([MasterFranchiseeId], [MasterFranchiseeName]) VALUES (1, N'MF 1')
INSERT [dbo].[Tbl_MasterFranchisee] ([MasterFranchiseeId], [MasterFranchiseeName]) VALUES (2, N'MF 2')
SET IDENTITY_INSERT [dbo].[Tbl_MasterFranchisee] OFF
