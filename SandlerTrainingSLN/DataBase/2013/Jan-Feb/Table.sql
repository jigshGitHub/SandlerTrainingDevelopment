

ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [IsMasterFranchiseeExists] [bit] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [MasterFranchiseeId] [int] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [LastName] [varchar](50) NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [FirstName] [varchar](50) NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [Title] [varchar](80) NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [SandlerRoleId] [int] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [OfficePhone] [varchar](80) NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [HomePhone] [varchar](80) NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [MobilePhone] [varchar](80) NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [Fax] [varchar](80) NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [AwardLevelId] [int] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [PurchaseLevelId] [int] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [CertifiedLevelId] [int] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [PrimaryBusinessId] [int] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [InitialContractDate] [datetime] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [RenewalDate] [datetime] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [ContractFormDate] [datetime] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [IsContractorPermitted] [bit] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [IsSandlerMailRequired] [bit] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [IsKOLMember] [bit] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [IsAdvBoard] [bit] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [IsMktgCommittee] [bit] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [IsUsingSandlerCRM] [bit] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [IsDHSAwardWinner] [bit] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [DHSAwardDate] [datetime] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [InitialTrngDate] [datetime] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [IsReqToSubmitFinancial] [bit] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [IsRepAgreement] [bit] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [WorkEmail] [varchar](80) NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [WorkAddress] [varchar](200) NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [WorkCity] [varchar](80) NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [WorkStateId] [int] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [WorkZip] [varchar](80) NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [WorkCountryId] [int] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [AlternateEmail] [varchar](80) NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [IsSameHomeAddress] [bit] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [HomeAddress] [varchar](200) NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [HomeCity] [varchar](80) NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [HomeStateId] [int] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [HomeZip] [varchar](80) NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [HomeCountryId] [int] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [SpouseName] [varchar](50) NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [Birthday] [datetime] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [Anniversary] [datetime] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [YearsWithCompany] [int] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [IsCanPrintLocally] [bit] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [IsBuyFromCustomer] [bit] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [IsFixedPricePurchase] [bit] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [IsBehindInTerDev] [bit] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [CostPlusAmountId] [int] NULL
ALTER TABLE [dbo].[TBL_FRANCHISEE] ADD [BehindAmountId] [int] NULL


/****** Object:  Table [dbo].[TBL_State]    Script Date: 01/29/2013 22:13:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_State](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_TBL_State] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_State] ON
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (1, N'Virginia', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (2, N'Texas', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (3, N'Ohio', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (4, N'Maryland', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (5, N'West Virginia', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (6, N'New York', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (7, N'Nevada', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (8, N'California', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (9, N'Alabama', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (10, N'Alaska', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (11, N'Arizona', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (12, N'Arkansas', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (13, N'Colorado', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (14, N'Connecticut', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (15, N'Delaware', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (16, N'Florida', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (17, N'Georgia', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (18, N'Hawaii', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (19, N'Idaho', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (20, N'Illinois', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (21, N'Indiana', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (22, N'Iowa', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (23, N'Kansas', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (24, N'Kentuky', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (25, N'Louisiana', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (26, N'Maine', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (27, N'Massachusetts', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (28, N'Michigan', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (29, N'Minnesota', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (30, N'Mississippi', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (31, N'Missouri', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (32, N'Montana', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (33, N'Nebraska', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (34, N'New Hampshire', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (35, N'New Jersey', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (36, N'New Mexico', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (37, N'North Carolina', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (38, N'North Dakota', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (39, N'Oklahoma', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (40, N'Oregon', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (41, N'Pennsylvania', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (42, N'Rhode Island', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (43, N'South Carolina', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (44, N'South Dakota', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (45, N'Tennessee', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (46, N'Utah', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (47, N'Vermont', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (48, N'Washington', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (49, N'Wisconsin', 1)
INSERT [dbo].[TBL_State] ([Id], [Name], [IsActive]) VALUES (50, N'Wyoming', 1)
SET IDENTITY_INSERT [dbo].[TBL_State] OFF
/****** Object:  Table [dbo].[Tbl_SandlerRole]    Script Date: 01/29/2013 22:13:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_SandlerRole](
	[SandlerRoleId] [int] IDENTITY(1,1) NOT NULL,
	[SandlerRoleText] [varchar](150) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Tbl_SandlerRole] PRIMARY KEY CLUSTERED 
(
	[SandlerRoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_SandlerRole] ON
INSERT [dbo].[Tbl_SandlerRole] ([SandlerRoleId], [SandlerRoleText], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (1, N'Master Franchisee', N'System', CAST(0x0000A15100000000 AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Tbl_SandlerRole] ([SandlerRoleId], [SandlerRoleText], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (2, N'Coach', N'System', CAST(0x0000A15100000000 AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Tbl_SandlerRole] ([SandlerRoleId], [SandlerRoleText], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (3, N'Franchisee Owner', N'System', CAST(0x0000A15100000000 AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Tbl_SandlerRole] ([SandlerRoleId], [SandlerRoleText], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (4, N'Franchisee Associate', N'System', CAST(0x0000A15100000000 AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Tbl_SandlerRole] OFF
/****** Object:  Table [dbo].[Tbl_PurchaseLevel]    Script Date: 01/29/2013 22:13:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_PurchaseLevel](
	[PurchaseLevelId] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseLevelText] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Tbl_PurchaseLevel] PRIMARY KEY CLUSTERED 
(
	[PurchaseLevelId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_PurchaseLevel] ON
INSERT [dbo].[Tbl_PurchaseLevel] ([PurchaseLevelId], [PurchaseLevelText], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (1, N'PL Test Option 1', N'System', CAST(0x0000A15100000000 AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Tbl_PurchaseLevel] ([PurchaseLevelId], [PurchaseLevelText], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (2, N'PL Test Option 2', N'System', CAST(0x0000A15100000000 AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Tbl_PurchaseLevel] ([PurchaseLevelId], [PurchaseLevelText], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (3, N'PL Test Option 3', N'System', CAST(0x0000A15100000000 AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Tbl_PurchaseLevel] OFF
/****** Object:  Table [dbo].[Tbl_PrimaryBusiness]    Script Date: 01/29/2013 22:13:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_PrimaryBusiness](
	[PrimaryBusinessId] [int] IDENTITY(1,1) NOT NULL,
	[PrimaryBusinessText] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Tbl_PrimaryBusiness] PRIMARY KEY CLUSTERED 
(
	[PrimaryBusinessId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_PrimaryBusiness] ON
INSERT [dbo].[Tbl_PrimaryBusiness] ([PrimaryBusinessId], [PrimaryBusinessText], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (1, N'PB Test Option 1', N'System', CAST(0x0000A15100000000 AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Tbl_PrimaryBusiness] ([PrimaryBusinessId], [PrimaryBusinessText], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (2, N'PB Test Option 2', N'System', CAST(0x0000A15100000000 AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Tbl_PrimaryBusiness] ([PrimaryBusinessId], [PrimaryBusinessText], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (3, N'PB Test Option 3', N'System', CAST(0x0000A15100000000 AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Tbl_PrimaryBusiness] OFF
/****** Object:  Table [dbo].[Tbl_CostPlusAmount]    Script Date: 01/29/2013 22:13:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_CostPlusAmount](
	[CostPlusAmountId] [int] IDENTITY(1,1) NOT NULL,
	[CostPlusAmountText] [varchar](150) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Tbl_CostPlusAmount] PRIMARY KEY CLUSTERED 
(
	[CostPlusAmountId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_CostPlusAmount] ON
INSERT [dbo].[Tbl_CostPlusAmount] ([CostPlusAmountId], [CostPlusAmountText], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (1, N'Cost+20', N'System', CAST(0x0000A15100000000 AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Tbl_CostPlusAmount] ([CostPlusAmountId], [CostPlusAmountText], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (2, N'Cost+25', N'System', CAST(0x0000A15100000000 AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Tbl_CostPlusAmount] OFF
/****** Object:  Table [dbo].[Tbl_CertifiedLevel]    Script Date: 01/29/2013 22:13:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_CertifiedLevel](
	[CertifiedLevelId] [int] IDENTITY(1,1) NOT NULL,
	[CertifiedLevelText] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Tbl_CertifiedLevel] PRIMARY KEY CLUSTERED 
(
	[CertifiedLevelId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_CertifiedLevel] ON
INSERT [dbo].[Tbl_CertifiedLevel] ([CertifiedLevelId], [CertifiedLevelText], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (1, N'CL Test Option 1', N'System', CAST(0x0000A15100000000 AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Tbl_CertifiedLevel] ([CertifiedLevelId], [CertifiedLevelText], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (2, N'CL Test Option 2', N'System', CAST(0x0000A15100000000 AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Tbl_CertifiedLevel] ([CertifiedLevelId], [CertifiedLevelText], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (3, N'CL Test Option 3', N'System', CAST(0x0000A15100000000 AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Tbl_CertifiedLevel] OFF
/****** Object:  Table [dbo].[Tbl_BehindAmount]    Script Date: 01/29/2013 22:13:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_BehindAmount](
	[BehindAmountId] [int] IDENTITY(1,1) NOT NULL,
	[BehindAmountText] [varchar](150) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Tbl_BehindAmount] PRIMARY KEY CLUSTERED 
(
	[BehindAmountId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_BehindAmount] ON
INSERT [dbo].[Tbl_BehindAmount] ([BehindAmountId], [BehindAmountText], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (1, N'BAmt Test Option 1', N'System', CAST(0x0000A15100000000 AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Tbl_BehindAmount] ([BehindAmountId], [BehindAmountText], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (2, N'BAmt Test Option 2', N'System', CAST(0x0000A15100000000 AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Tbl_BehindAmount] ([BehindAmountId], [BehindAmountText], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (3, N'BAmt Test Option 3', N'System', CAST(0x0000A15100000000 AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Tbl_BehindAmount] OFF
/****** Object:  Table [dbo].[Tbl_AwardLevel]    Script Date: 01/29/2013 22:13:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_AwardLevel](
	[AwardLevelId] [int] IDENTITY(1,1) NOT NULL,
	[AwardLevelText] [varchar](150) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Tbl_AwardLevel] PRIMARY KEY CLUSTERED 
(
	[AwardLevelId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_AwardLevel] ON
INSERT [dbo].[Tbl_AwardLevel] ([AwardLevelId], [AwardLevelText], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (1, N'AL Test Option 1', N'System', CAST(0x0000A15100000000 AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Tbl_AwardLevel] ([AwardLevelId], [AwardLevelText], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (2, N'AL Test Option 2', N'System', CAST(0x0000A15100000000 AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Tbl_AwardLevel] ([AwardLevelId], [AwardLevelText], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (3, N'AL Test Option 3', N'System', CAST(0x0000A15100000000 AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Tbl_AwardLevel] OFF
