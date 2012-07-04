USE [SANDLERDB]
GO
/****** Object:  Table [dbo].[TBL_STRATEGICCUSTCARE]    Script Date: 02/19/2012 20:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_STRATEGICCUSTCARE](
	[Label_Name] [varchar](50) NULL,
	[P1_Value] [int] NULL,
	[P2_Value] [int] NULL,
	[P3_Value] [int] NULL,
	[P1_Qty] [int] NULL,
	[P2_Qty] [int] NULL,
	[P3_Qty] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TBL_STRATEGICCUSTCARE] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Mass Mutual', 15, 18, 18, 10, 13, 15)
INSERT [dbo].[TBL_STRATEGICCUSTCARE] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Castle Metals', 26, 20, 28, 13, 15, 18)
INSERT [dbo].[TBL_STRATEGICCUSTCARE] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Federated Dept Stores', 23, 26, 25, 8, 6, 10)
INSERT [dbo].[TBL_STRATEGICCUSTCARE] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Minnesota Mutual', 8, 10, 12, 6, 7, 8)
INSERT [dbo].[TBL_STRATEGICCUSTCARE] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Robert Half', 18, 22, 21, 10, 8, 14)
INSERT [dbo].[TBL_STRATEGICCUSTCARE] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Sallie Mae', 13, 10, 19, 13, 7, 15)
INSERT [dbo].[TBL_STRATEGICCUSTCARE] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Lowes', 18, 21, 14, 4, 6, 10)
INSERT [dbo].[TBL_STRATEGICCUSTCARE] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'GE Capital Corp', 14, 17, 19, 6, 8, 8)
INSERT [dbo].[TBL_STRATEGICCUSTCARE] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Oracle Systems', 6, 8, 10, 8, 5, 3)
INSERT [dbo].[TBL_STRATEGICCUSTCARE] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'BMW Financial', 7, 10, 13, 4, 8, 6)
/****** Object:  Table [dbo].[TBL_STRATEGICALLIANCIES]    Script Date: 02/19/2012 20:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_STRATEGICALLIANCIES](
	[Label_Name] [varchar](50) NULL,
	[P1_Value] [int] NULL,
	[P2_Value] [int] NULL,
	[P3_Value] [int] NULL,
	[P1_Qty] [int] NULL,
	[P2_Qty] [int] NULL,
	[P3_Qty] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TBL_STRATEGICALLIANCIES] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Mass Mutual', 15, 18, 18, 10, 13, 15)
INSERT [dbo].[TBL_STRATEGICALLIANCIES] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Castle Metals', 26, 20, 28, 13, 15, 18)
INSERT [dbo].[TBL_STRATEGICALLIANCIES] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Federated Dept Stores', 23, 26, 25, 8, 6, 10)
INSERT [dbo].[TBL_STRATEGICALLIANCIES] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Minnesota Mutual', 8, 10, 12, 6, 7, 8)
INSERT [dbo].[TBL_STRATEGICALLIANCIES] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Robert Half', 18, 22, 21, 10, 8, 14)
INSERT [dbo].[TBL_STRATEGICALLIANCIES] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Sallie Mae', 13, 10, 19, 13, 7, 15)
INSERT [dbo].[TBL_STRATEGICALLIANCIES] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Lowes', 18, 21, 14, 4, 6, 10)
INSERT [dbo].[TBL_STRATEGICALLIANCIES] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'GE Capital Corp', 14, 17, 19, 6, 8, 8)
INSERT [dbo].[TBL_STRATEGICALLIANCIES] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Oracle Systems', 6, 8, 10, 8, 5, 3)
INSERT [dbo].[TBL_STRATEGICALLIANCIES] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'BMW Financial', 7, 10, 13, 4, 8, 6)
/****** Object:  Table [dbo].[TBL_SANDLERONLINE]    Script Date: 02/19/2012 20:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_SANDLERONLINE](
	[Label_Name] [varchar](50) NULL,
	[P1_Value] [int] NULL,
	[P2_Value] [int] NULL,
	[P3_Value] [int] NULL,
	[P1_Qty] [int] NULL,
	[P2_Qty] [int] NULL,
	[P3_Qty] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TBL_SANDLERONLINE] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Mass Mutual', 15, 18, 18, 10, 13, 15)
INSERT [dbo].[TBL_SANDLERONLINE] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Castle Metals', 26, 20, 28, 13, 15, 18)
INSERT [dbo].[TBL_SANDLERONLINE] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Federated Dept Stores', 23, 26, 25, 8, 6, 10)
INSERT [dbo].[TBL_SANDLERONLINE] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Minnesota Mutual', 8, 10, 12, 6, 7, 8)
INSERT [dbo].[TBL_SANDLERONLINE] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Robert Half', 18, 22, 21, 10, 8, 14)
INSERT [dbo].[TBL_SANDLERONLINE] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Sallie Mae', 13, 10, 19, 13, 7, 15)
INSERT [dbo].[TBL_SANDLERONLINE] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Lowes', 18, 21, 14, 4, 6, 10)
INSERT [dbo].[TBL_SANDLERONLINE] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'GE Capital Corp', 14, 17, 19, 6, 8, 8)
INSERT [dbo].[TBL_SANDLERONLINE] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Oracle Systems', 6, 8, 10, 8, 5, 3)
INSERT [dbo].[TBL_SANDLERONLINE] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'BMW Financial', 7, 10, 13, 4, 8, 6)
/****** Object:  Table [dbo].[TBL_SALESTOTALBYMONTH]    Script Date: 02/19/2012 20:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_SALESTOTALBYMONTH](
	[Month_Name] [varchar](50) NULL,
	[Value_2010] [int] NULL,
	[Value_2011] [int] NULL,
	[Value_2012] [int] NULL,
	[Qty_2010] [int] NULL,
	[Qty_2011] [int] NULL,
	[Qty_2012] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TBL_SALESTOTALBYMONTH] ([Month_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Jan', 25, 23, 10, 3, 4, 3)
INSERT [dbo].[TBL_SALESTOTALBYMONTH] ([Month_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Feb', 35, 26, 15, 4, 6, 3)
INSERT [dbo].[TBL_SALESTOTALBYMONTH] ([Month_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Mar', 37, 28, 20, 7, 5, 7)
INSERT [dbo].[TBL_SALESTOTALBYMONTH] ([Month_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Apr', 38, 29, 15, 6, 8, 8)
INSERT [dbo].[TBL_SALESTOTALBYMONTH] ([Month_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'May', 37, 28, 20, 4, 5, 4)
INSERT [dbo].[TBL_SALESTOTALBYMONTH] ([Month_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Jun', 38, 29, 13, 2, 1, 5)
INSERT [dbo].[TBL_SALESTOTALBYMONTH] ([Month_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Jul', 25, 22, 17, 5, 3, 2)
INSERT [dbo].[TBL_SALESTOTALBYMONTH] ([Month_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Aug', 30, 21, 12, 7, 7, 4)
INSERT [dbo].[TBL_SALESTOTALBYMONTH] ([Month_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Sep', 32, 26, 21, 3, 4, 4)
INSERT [dbo].[TBL_SALESTOTALBYMONTH] ([Month_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Oct', 42, 25, 19, 2, 3, 6)
INSERT [dbo].[TBL_SALESTOTALBYMONTH] ([Month_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Nov', 35, 29, 15, 4, 8, 7)
INSERT [dbo].[TBL_SALESTOTALBYMONTH] ([Month_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Dec', 37, 28, 20, 6, 3, 3)
/****** Object:  Table [dbo].[TBL_SALESCYCLETIME_MAIN]    Script Date: 02/19/2012 20:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_SALESCYCLETIME_MAIN](
	[Category_Name] [varchar](50) NULL,
	[Value] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TBL_SALESCYCLETIME_MAIN] ([Category_Name], [Value]) VALUES (N'Up to 3 Months', 21)
INSERT [dbo].[TBL_SALESCYCLETIME_MAIN] ([Category_Name], [Value]) VALUES (N'3 to 6 Months', 15)
INSERT [dbo].[TBL_SALESCYCLETIME_MAIN] ([Category_Name], [Value]) VALUES (N'6 to 12 Months', 18)
INSERT [dbo].[TBL_SALESCYCLETIME_MAIN] ([Category_Name], [Value]) VALUES (N'12 to 18 Months', 14)
INSERT [dbo].[TBL_SALESCYCLETIME_MAIN] ([Category_Name], [Value]) VALUES (N'18 to 24 Months', 20)
INSERT [dbo].[TBL_SALESCYCLETIME_MAIN] ([Category_Name], [Value]) VALUES (N'24+ Months', 12)
/****** Object:  Table [dbo].[TBL_SALESCYCLETIME_DRILL]    Script Date: 02/19/2012 20:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_SALESCYCLETIME_DRILL](
	[Category_Name] [varchar](50) NULL,
	[Value_DL1] [int] NULL,
	[Value_DL2] [int] NULL,
	[Value_DL3] [int] NULL,
	[Value_DL4] [int] NULL,
	[Value_DL5] [int] NULL,
	[Value_DL6] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TBL_SALESCYCLETIME_DRILL] ([Category_Name], [Value_DL1], [Value_DL2], [Value_DL3], [Value_DL4], [Value_DL5], [Value_DL6]) VALUES (N'Leadership', 21, 11, 11, 21, 21, 21)
INSERT [dbo].[TBL_SALESCYCLETIME_DRILL] ([Category_Name], [Value_DL1], [Value_DL2], [Value_DL3], [Value_DL4], [Value_DL5], [Value_DL6]) VALUES (N'Sales', 15, 25, 15, 15, 15, 15)
INSERT [dbo].[TBL_SALESCYCLETIME_DRILL] ([Category_Name], [Value_DL1], [Value_DL2], [Value_DL3], [Value_DL4], [Value_DL5], [Value_DL6]) VALUES (N'Sandler Online', 18, 28, 18, 18, 18, 28)
INSERT [dbo].[TBL_SALESCYCLETIME_DRILL] ([Category_Name], [Value_DL1], [Value_DL2], [Value_DL3], [Value_DL4], [Value_DL5], [Value_DL6]) VALUES (N'Negotiations', 14, 12, 14, 14, 4, 14)
INSERT [dbo].[TBL_SALESCYCLETIME_DRILL] ([Category_Name], [Value_DL1], [Value_DL2], [Value_DL3], [Value_DL4], [Value_DL5], [Value_DL6]) VALUES (N'Strategic Customer Care', 20, 20, 10, 20, 20, 20)
INSERT [dbo].[TBL_SALESCYCLETIME_DRILL] ([Category_Name], [Value_DL1], [Value_DL2], [Value_DL3], [Value_DL4], [Value_DL5], [Value_DL6]) VALUES (N'Consulting', 12, 12, 12, 12, 12, 20)
INSERT [dbo].[TBL_SALESCYCLETIME_DRILL] ([Category_Name], [Value_DL1], [Value_DL2], [Value_DL3], [Value_DL4], [Value_DL5], [Value_DL6]) VALUES (N'Coaching', 35, 35, 35, 35, 35, 35)
INSERT [dbo].[TBL_SALESCYCLETIME_DRILL] ([Category_Name], [Value_DL1], [Value_DL2], [Value_DL3], [Value_DL4], [Value_DL5], [Value_DL6]) VALUES (N'Assessments', 28, 27, 28, 28, 18, 28)
INSERT [dbo].[TBL_SALESCYCLETIME_DRILL] ([Category_Name], [Value_DL1], [Value_DL2], [Value_DL3], [Value_DL4], [Value_DL5], [Value_DL6]) VALUES (N'Networking Works', 17, 17, 7, 17, 17, 27)
INSERT [dbo].[TBL_SALESCYCLETIME_DRILL] ([Category_Name], [Value_DL1], [Value_DL2], [Value_DL3], [Value_DL4], [Value_DL5], [Value_DL6]) VALUES (N'Strategic Alliances', 21, 11, 21, 21, 21, 21)
INSERT [dbo].[TBL_SALESCYCLETIME_DRILL] ([Category_Name], [Value_DL1], [Value_DL2], [Value_DL3], [Value_DL4], [Value_DL5], [Value_DL6]) VALUES (N'Corporate Global', 15, 15, 15, 15, 15, 15)
/****** Object:  Table [dbo].[TBL_SALES]    Script Date: 02/19/2012 20:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_SALES](
	[Label_Name] [varchar](50) NULL,
	[P1_Value] [int] NULL,
	[P2_Value] [int] NULL,
	[P3_Value] [int] NULL,
	[P1_Qty] [int] NULL,
	[P2_Qty] [int] NULL,
	[P3_Qty] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TBL_SALES] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Mass Mutual', 15, 18, 18, 10, 13, 15)
INSERT [dbo].[TBL_SALES] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Castle Metals', 26, 20, 28, 13, 15, 18)
INSERT [dbo].[TBL_SALES] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Federated Dept Stores', 23, 26, 25, 8, 6, 10)
INSERT [dbo].[TBL_SALES] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Minnesota Mutual', 8, 10, 12, 6, 7, 8)
INSERT [dbo].[TBL_SALES] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Robert Half', 18, 22, 21, 10, 8, 14)
INSERT [dbo].[TBL_SALES] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Sallie Mae', 13, 10, 19, 13, 7, 15)
INSERT [dbo].[TBL_SALES] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Lowes', 18, 21, 14, 4, 6, 10)
INSERT [dbo].[TBL_SALES] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'GE Capital Corp', 14, 17, 19, 6, 8, 8)
INSERT [dbo].[TBL_SALES] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Oracle Systems', 6, 8, 10, 8, 5, 3)
INSERT [dbo].[TBL_SALES] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'BMW Financial', 7, 10, 13, 4, 8, 6)
/****** Object:  Table [dbo].[TBL_REVBYSOURCE]    Script Date: 02/19/2012 20:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_REVBYSOURCE](
	[Category_Name] [varchar](50) NULL,
	[Value_2010] [int] NULL,
	[Value_2011] [int] NULL,
	[Value_2012] [int] NULL,
	[Qty_2010] [int] NULL,
	[Qty_2011] [int] NULL,
	[Qty_2012] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TBL_REVBYSOURCE] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Referral', 25, 23, 10, 3, 4, 3)
INSERT [dbo].[TBL_REVBYSOURCE] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Existing Customer', 35, 26, 15, 4, 6, 3)
INSERT [dbo].[TBL_REVBYSOURCE] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'New Customer', 37, 28, 20, 7, 5, 7)
INSERT [dbo].[TBL_REVBYSOURCE] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Lead Generator', 38, 29, 15, 6, 8, 8)
INSERT [dbo].[TBL_REVBYSOURCE] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Cold Call', 37, 28, 20, 4, 5, 4)
/****** Object:  Table [dbo].[TBL_RETENTION_RATE]    Script Date: 02/19/2012 20:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_RETENTION_RATE](
	[Year] [int] NULL,
	[Growth_Comp_Exp] [int] NULL,
	[Mass_Mutual_Exp] [int] NULL,
	[Marginal_Comp_Exp] [int] NULL,
	[Growth_Comp_Effect] [int] NULL,
	[Mass_Mutual_Effect] [int] NULL,
	[Marginal_Comp_Effect] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[TBL_RETENTION_RATE] ([Year], [Growth_Comp_Exp], [Mass_Mutual_Exp], [Marginal_Comp_Exp], [Growth_Comp_Effect], [Mass_Mutual_Effect], [Marginal_Comp_Effect]) VALUES (2010, 7, 6, 5, 18, 13, 10)
INSERT [dbo].[TBL_RETENTION_RATE] ([Year], [Growth_Comp_Exp], [Mass_Mutual_Exp], [Marginal_Comp_Exp], [Growth_Comp_Effect], [Mass_Mutual_Effect], [Marginal_Comp_Effect]) VALUES (2011, 12, 8, 6, 25, 19, 12)
INSERT [dbo].[TBL_RETENTION_RATE] ([Year], [Growth_Comp_Exp], [Mass_Mutual_Exp], [Marginal_Comp_Exp], [Growth_Comp_Effect], [Mass_Mutual_Effect], [Marginal_Comp_Effect]) VALUES (2012, 15, 9, 4, 31, 23, 8)
/****** Object:  Table [dbo].[TBL_PROSPECTING]    Script Date: 02/19/2012 20:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_PROSPECTING](
	[FirstLevel_Name] [varchar](50) NULL,
	[FirstLevel_Qty] [int] NULL,
	[SecondLevel_Name] [varchar](50) NULL,
	[SecondLevel_Qty] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TBL_PROSPECTING] ([FirstLevel_Name], [FirstLevel_Qty], [SecondLevel_Name], [SecondLevel_Qty]) VALUES (N'New Conver/Week', 15, N'Partner', 5)
INSERT [dbo].[TBL_PROSPECTING] ([FirstLevel_Name], [FirstLevel_Qty], [SecondLevel_Name], [SecondLevel_Qty]) VALUES (N'Call-to-Mtg Qty', 26, N'Personal', 2)
INSERT [dbo].[TBL_PROSPECTING] ([FirstLevel_Name], [FirstLevel_Qty], [SecondLevel_Name], [SecondLevel_Qty]) VALUES (N'Partners on Call Qty', 23, N'Call-In', 3)
INSERT [dbo].[TBL_PROSPECTING] ([FirstLevel_Name], [FirstLevel_Qty], [SecondLevel_Name], [SecondLevel_Qty]) VALUES (N'Free Talk Qty', 6, N'Expo', 6)
INSERT [dbo].[TBL_PROSPECTING] ([FirstLevel_Name], [FirstLevel_Qty], [SecondLevel_Name], [SecondLevel_Qty]) VALUES (N'Referral Qty', 18, N'Marketing Brochure', 2)
/****** Object:  Table [dbo].[TBL_PRODUCT_MARGIN]    Script Date: 02/19/2012 20:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_PRODUCT_MARGIN](
	[Category_Name] [varchar](50) NULL,
	[Value_2010] [int] NULL,
	[Value_2011] [int] NULL,
	[Value_2012] [int] NULL,
	[Qty_2010] [int] NULL,
	[Qty_2011] [int] NULL,
	[Qty_2012] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TBL_PRODUCT_MARGIN] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Leadership', 25, 23, 10, 3, 4, 3)
INSERT [dbo].[TBL_PRODUCT_MARGIN] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Sales', 35, 26, 15, 4, 6, 3)
INSERT [dbo].[TBL_PRODUCT_MARGIN] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Sandler Online', 37, 28, 20, 7, 5, 7)
INSERT [dbo].[TBL_PRODUCT_MARGIN] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Negotiations', 38, 29, 15, 6, 8, 8)
INSERT [dbo].[TBL_PRODUCT_MARGIN] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Strategic Cust Care', 37, 28, 20, 4, 5, 4)
INSERT [dbo].[TBL_PRODUCT_MARGIN] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Consulting', 38, 29, 13, 2, 1, 5)
INSERT [dbo].[TBL_PRODUCT_MARGIN] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Coaching', 25, 22, 17, 5, 3, 2)
INSERT [dbo].[TBL_PRODUCT_MARGIN] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Assessments', 32, 26, 21, 3, 4, 4)
INSERT [dbo].[TBL_PRODUCT_MARGIN] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Networking Works!', 30, 21, 12, 7, 7, 4)
INSERT [dbo].[TBL_PRODUCT_MARGIN] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Strategic Alliances', 42, 25, 19, 2, 3, 6)
INSERT [dbo].[TBL_PRODUCT_MARGIN] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Corp/Global Training', 35, 29, 15, 4, 8, 7)
/****** Object:  Table [dbo].[TBL_PRODSOLD_BYREP]    Script Date: 02/19/2012 20:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_PRODSOLD_BYREP](
	[Rep_Name] [varchar](50) NULL,
	[Value_2010] [int] NULL,
	[Value_2011] [int] NULL,
	[Value_2012] [int] NULL,
	[Qty_2010] [int] NULL,
	[Qty_2011] [int] NULL,
	[Qty_2012] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TBL_PRODSOLD_BYREP] ([Rep_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Jane Smith', 25, 23, 10, 3, 4, 3)
INSERT [dbo].[TBL_PRODSOLD_BYREP] ([Rep_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'John Doe', 35, 26, 15, 4, 6, 3)
INSERT [dbo].[TBL_PRODSOLD_BYREP] ([Rep_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Bill Clark', 37, 28, 20, 7, 5, 7)
INSERT [dbo].[TBL_PRODSOLD_BYREP] ([Rep_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Harold Frasier', 38, 29, 15, 6, 8, 8)
INSERT [dbo].[TBL_PRODSOLD_BYREP] ([Rep_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Allison Myers', 37, 28, 20, 4, 5, 4)
/****** Object:  Table [dbo].[TBL_PRODSOLD_BYCOMP]    Script Date: 02/19/2012 20:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_PRODSOLD_BYCOMP](
	[Category_Name] [varchar](50) NULL,
	[Value] [int] NULL,
	[Quantity] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TBL_PRODSOLD_BYCOMP] ([Category_Name], [Value], [Quantity]) VALUES (N'Mass Mutual', 72, 22)
INSERT [dbo].[TBL_PRODSOLD_BYCOMP] ([Category_Name], [Value], [Quantity]) VALUES (N'Castle Metals', 68, 19)
INSERT [dbo].[TBL_PRODSOLD_BYCOMP] ([Category_Name], [Value], [Quantity]) VALUES (N'Fed. Dept. Stores', 62, 18)
INSERT [dbo].[TBL_PRODSOLD_BYCOMP] ([Category_Name], [Value], [Quantity]) VALUES (N'Minnesota Mutual', 58, 15)
INSERT [dbo].[TBL_PRODSOLD_BYCOMP] ([Category_Name], [Value], [Quantity]) VALUES (N'Robert Half', 50, 12)
INSERT [dbo].[TBL_PRODSOLD_BYCOMP] ([Category_Name], [Value], [Quantity]) VALUES (N'Sallie Mae', 45, 8)
INSERT [dbo].[TBL_PRODSOLD_BYCOMP] ([Category_Name], [Value], [Quantity]) VALUES (N'Lowes', 38, 6)
INSERT [dbo].[TBL_PRODSOLD_BYCOMP] ([Category_Name], [Value], [Quantity]) VALUES (N'GE Capital Corp', 34, 5)
INSERT [dbo].[TBL_PRODSOLD_BYCOMP] ([Category_Name], [Value], [Quantity]) VALUES (N'Oracle Systems', 29, 5)
INSERT [dbo].[TBL_PRODSOLD_BYCOMP] ([Category_Name], [Value], [Quantity]) VALUES (N'BMW Financial', 25, 4)
/****** Object:  Table [dbo].[TBL_PRODSOLD_AS_SALE]    Script Date: 02/19/2012 20:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_PRODSOLD_AS_SALE](
	[Category_Name] [varchar](50) NULL,
	[Value_2010] [int] NULL,
	[Value_2011] [int] NULL,
	[Value_2012] [int] NULL,
	[Qty_2010] [int] NULL,
	[Qty_2011] [int] NULL,
	[Qty_2012] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TBL_PRODSOLD_AS_SALE] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Leadership', 25, 23, 10, 3, 4, 3)
INSERT [dbo].[TBL_PRODSOLD_AS_SALE] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Sales', 35, 26, 15, 4, 6, 3)
INSERT [dbo].[TBL_PRODSOLD_AS_SALE] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Sandler Online', 37, 28, 20, 7, 5, 7)
INSERT [dbo].[TBL_PRODSOLD_AS_SALE] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Negotiations', 38, 29, 15, 6, 8, 8)
INSERT [dbo].[TBL_PRODSOLD_AS_SALE] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Strategic Cust Care', 37, 28, 20, 4, 5, 4)
INSERT [dbo].[TBL_PRODSOLD_AS_SALE] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Consulting', 38, 29, 13, 2, 1, 5)
INSERT [dbo].[TBL_PRODSOLD_AS_SALE] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Coaching', 25, 22, 17, 5, 3, 2)
INSERT [dbo].[TBL_PRODSOLD_AS_SALE] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Assessments', 30, 21, 12, 7, 7, 4)
INSERT [dbo].[TBL_PRODSOLD_AS_SALE] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Networking Works!', 32, 26, 21, 3, 4, 4)
INSERT [dbo].[TBL_PRODSOLD_AS_SALE] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Strategic Alliances', 42, 25, 19, 2, 3, 6)
INSERT [dbo].[TBL_PRODSOLD_AS_SALE] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Corp/Global Training', 35, 29, 15, 4, 8, 7)
/****** Object:  Table [dbo].[TBL_PRDSALES_BYACT]    Script Date: 02/19/2012 20:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_PRDSALES_BYACT](
	[Category_Name] [varchar](50) NULL,
	[Value_2010] [int] NULL,
	[Value_2011] [int] NULL,
	[Value_2012] [int] NULL,
	[Qty_2010] [int] NULL,
	[Qty_2011] [int] NULL,
	[Qty_2012] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TBL_PRDSALES_BYACT] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'1st Call to 2nd', 25, 23, 10, 3, 4, 3)
INSERT [dbo].[TBL_PRDSALES_BYACT] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'2nd Call to Present', 35, 26, 15, 4, 6, 3)
INSERT [dbo].[TBL_PRDSALES_BYACT] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Present to Close', 37, 28, 20, 7, 5, 7)
INSERT [dbo].[TBL_PRDSALES_BYACT] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Discount %', 38, 29, 15, 6, 8, 8)
INSERT [dbo].[TBL_PRDSALES_BYACT] ([Category_Name], [Value_2010], [Value_2011], [Value_2012], [Qty_2010], [Qty_2011], [Qty_2012]) VALUES (N'Close Rate %', 37, 28, 20, 4, 5, 4)
/****** Object:  Table [dbo].[TBL_PIPELINE_POST]    Script Date: 02/19/2012 20:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_PIPELINE_POST](
	[Category_Name] [varchar](50) NULL,
	[Before_Value] [int] NULL,
	[After_Value] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TBL_PIPELINE_POST] ([Category_Name], [Before_Value], [After_Value]) VALUES (N'Reps Achieving Quota', 23, 25)
INSERT [dbo].[TBL_PIPELINE_POST] ([Category_Name], [Before_Value], [After_Value]) VALUES (N'Team Achiveing Quota', 26, 35)
INSERT [dbo].[TBL_PIPELINE_POST] ([Category_Name], [Before_Value], [After_Value]) VALUES (N'Customer Renewal Rate', 28, 37)
INSERT [dbo].[TBL_PIPELINE_POST] ([Category_Name], [Before_Value], [After_Value]) VALUES (N'Lead Conversion Rate', 29, 38)
INSERT [dbo].[TBL_PIPELINE_POST] ([Category_Name], [Before_Value], [After_Value]) VALUES (N'Sales Cycle Time Reduction', 28, 37)
INSERT [dbo].[TBL_PIPELINE_POST] ([Category_Name], [Before_Value], [After_Value]) VALUES (N'Turnover Reduction', 29, 38)
/****** Object:  Table [dbo].[TBL_NETWORKINGWORKS]    Script Date: 02/19/2012 20:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_NETWORKINGWORKS](
	[Label_Name] [varchar](50) NULL,
	[P1_Value] [int] NULL,
	[P2_Value] [int] NULL,
	[P3_Value] [int] NULL,
	[P1_Qty] [int] NULL,
	[P2_Qty] [int] NULL,
	[P3_Qty] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TBL_NETWORKINGWORKS] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Mass Mutual', 15, 18, 18, 10, 13, 15)
INSERT [dbo].[TBL_NETWORKINGWORKS] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Castle Metals', 26, 20, 28, 13, 15, 18)
INSERT [dbo].[TBL_NETWORKINGWORKS] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Federated Dept Stores', 23, 26, 25, 8, 6, 10)
INSERT [dbo].[TBL_NETWORKINGWORKS] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Minnesota Mutual', 8, 10, 12, 6, 7, 8)
INSERT [dbo].[TBL_NETWORKINGWORKS] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Robert Half', 18, 22, 21, 10, 8, 14)
INSERT [dbo].[TBL_NETWORKINGWORKS] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Sallie Mae', 13, 10, 19, 13, 7, 15)
INSERT [dbo].[TBL_NETWORKINGWORKS] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Lowes', 18, 21, 14, 4, 6, 10)
INSERT [dbo].[TBL_NETWORKINGWORKS] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'GE Capital Corp', 14, 17, 19, 6, 8, 8)
INSERT [dbo].[TBL_NETWORKINGWORKS] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Oracle Systems', 6, 8, 10, 8, 5, 3)
INSERT [dbo].[TBL_NETWORKINGWORKS] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'BMW Financial', 7, 10, 13, 4, 8, 6)
/****** Object:  Table [dbo].[TBL_NEGOTIATIONS]    Script Date: 02/19/2012 20:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_NEGOTIATIONS](
	[Label_Name] [varchar](50) NULL,
	[P1_Value] [int] NULL,
	[P2_Value] [int] NULL,
	[P3_Value] [int] NULL,
	[P1_Qty] [int] NULL,
	[P2_Qty] [int] NULL,
	[P3_Qty] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TBL_NEGOTIATIONS] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Mass Mutual', 15, 18, 18, 10, 13, 15)
INSERT [dbo].[TBL_NEGOTIATIONS] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Castle Metals', 26, 20, 28, 13, 15, 18)
INSERT [dbo].[TBL_NEGOTIATIONS] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Federated Dept Stores', 23, 26, 25, 8, 6, 10)
INSERT [dbo].[TBL_NEGOTIATIONS] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Minnesota Mutual', 8, 10, 12, 6, 7, 8)
INSERT [dbo].[TBL_NEGOTIATIONS] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Robert Half', 18, 22, 21, 10, 8, 14)
INSERT [dbo].[TBL_NEGOTIATIONS] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Sallie Mae', 13, 10, 19, 13, 7, 15)
INSERT [dbo].[TBL_NEGOTIATIONS] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Lowes', 18, 21, 14, 4, 6, 10)
INSERT [dbo].[TBL_NEGOTIATIONS] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'GE Capital Corp', 14, 17, 19, 6, 8, 8)
INSERT [dbo].[TBL_NEGOTIATIONS] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Oracle Systems', 6, 8, 10, 8, 5, 3)
INSERT [dbo].[TBL_NEGOTIATIONS] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'BMW Financial', 7, 10, 13, 4, 8, 6)
/****** Object:  Table [dbo].[TBL_LEADERSHIP]    Script Date: 02/19/2012 20:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_LEADERSHIP](
	[Label_Name] [varchar](50) NULL,
	[P1_Value] [int] NULL,
	[P2_Value] [int] NULL,
	[P3_Value] [int] NULL,
	[P1_Qty] [int] NULL,
	[P2_Qty] [int] NULL,
	[P3_Qty] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TBL_LEADERSHIP] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Mass Mutual', 15, 18, 18, 10, 13, 15)
INSERT [dbo].[TBL_LEADERSHIP] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Castle Metals', 26, 20, 28, 13, 15, 18)
INSERT [dbo].[TBL_LEADERSHIP] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Federated Dept Stores', 23, 26, 25, 8, 6, 10)
INSERT [dbo].[TBL_LEADERSHIP] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Minnesota Mutual', 8, 10, 12, 6, 7, 8)
INSERT [dbo].[TBL_LEADERSHIP] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Robert Half', 18, 22, 21, 10, 8, 14)
INSERT [dbo].[TBL_LEADERSHIP] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Sallie Mae', 13, 10, 19, 13, 7, 15)
INSERT [dbo].[TBL_LEADERSHIP] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Lowes', 18, 21, 14, 4, 6, 10)
INSERT [dbo].[TBL_LEADERSHIP] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'GE Capital Corp', 14, 17, 19, 6, 8, 8)
INSERT [dbo].[TBL_LEADERSHIP] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Oracle Systems', 6, 8, 10, 8, 5, 3)
INSERT [dbo].[TBL_LEADERSHIP] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'BMW Financial', 7, 10, 13, 4, 8, 6)
/****** Object:  Table [dbo].[TBL_IND_AVERAGES]    Script Date: 02/19/2012 20:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_IND_AVERAGES](
	[Category_Name] [varchar](50) NULL,
	[Best_In_Class_Value] [int] NULL,
	[Mass_Mutual_Value] [int] NULL,
	[Ind_Avg_Value] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TBL_IND_AVERAGES] ([Category_Name], [Best_In_Class_Value], [Mass_Mutual_Value], [Ind_Avg_Value]) VALUES (N'More Meaningful Sales', 25, 23, 10)
INSERT [dbo].[TBL_IND_AVERAGES] ([Category_Name], [Best_In_Class_Value], [Mass_Mutual_Value], [Ind_Avg_Value]) VALUES (N'Enhanced Sales Prospecting', 35, 26, 15)
INSERT [dbo].[TBL_IND_AVERAGES] ([Category_Name], [Best_In_Class_Value], [Mass_Mutual_Value], [Ind_Avg_Value]) VALUES (N'Standardized Messaging', 37, 28, 20)
INSERT [dbo].[TBL_IND_AVERAGES] ([Category_Name], [Best_In_Class_Value], [Mass_Mutual_Value], [Ind_Avg_Value]) VALUES (N'Maximized Time Selling', 38, 29, 15)
INSERT [dbo].[TBL_IND_AVERAGES] ([Category_Name], [Best_In_Class_Value], [Mass_Mutual_Value], [Ind_Avg_Value]) VALUES (N'Increased Deal Size', 37, 28, 20)
INSERT [dbo].[TBL_IND_AVERAGES] ([Category_Name], [Best_In_Class_Value], [Mass_Mutual_Value], [Ind_Avg_Value]) VALUES (N'Increased Qualified Deals', 38, 29, 15)
/****** Object:  Table [dbo].[TBL_FORECAST]    Script Date: 02/19/2012 20:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_FORECAST](
	[FORECAST_ID] [int] IDENTITY(1,1) NOT NULL,
	[COMP_ID] [int] NULL,
	[Q2TOTAL] [int] NULL,
	[Q3TOTAL] [int] NULL,
	[Q4TOTAL] [int] NULL,
	[YEAR] [int] NULL,
	[SEASON_INDEX] [varchar](50) NULL,
	[GROWTH_INDEX] [varchar](50) NULL,
	[TRAINED_REPS] [varchar](50) NULL,
	[SALES_CYCLE_TIME] [varchar](50) NULL,
	[QuotaTotal] [int] NULL,
	[BestCaseTotal] [int] NULL,
	[SalesPLTotal] [int] NULL,
	[Q2Quota] [bigint] NULL,
	[Q2BestCase] [bigint] NULL,
	[Q2SalesPL] [bigint] NULL,
	[Q3Quota] [bigint] NULL,
	[Q3BestCase] [bigint] NULL,
	[Q3SalesPL] [bigint] NULL,
	[Q4Quota] [bigint] NULL,
	[Q4BestCase] [bigint] NULL,
	[Q4SalesPL] [bigint] NULL,
 CONSTRAINT [PK_TBL_FORECAST] PRIMARY KEY CLUSTERED 
(
	[FORECAST_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_FORECAST] ON
INSERT [dbo].[TBL_FORECAST] ([FORECAST_ID], [COMP_ID], [Q2TOTAL], [Q3TOTAL], [Q4TOTAL], [YEAR], [SEASON_INDEX], [GROWTH_INDEX], [TRAINED_REPS], [SALES_CYCLE_TIME], [QuotaTotal], [BestCaseTotal], [SalesPLTotal], [Q2Quota], [Q2BestCase], [Q2SalesPL], [Q3Quota], [Q3BestCase], [Q3SalesPL], [Q4Quota], [Q4BestCase], [Q4SalesPL]) VALUES (1, 1, 60, 150, 240, 2012, N'5%', N'10%', N'50', N'3 to 6 months', 120, 150, 180, 10, 20, 30, 40, 50, 60, 70, 80, 90)
INSERT [dbo].[TBL_FORECAST] ([FORECAST_ID], [COMP_ID], [Q2TOTAL], [Q3TOTAL], [Q4TOTAL], [YEAR], [SEASON_INDEX], [GROWTH_INDEX], [TRAINED_REPS], [SALES_CYCLE_TIME], [QuotaTotal], [BestCaseTotal], [SalesPLTotal], [Q2Quota], [Q2BestCase], [Q2SalesPL], [Q3Quota], [Q3BestCase], [Q3SalesPL], [Q4Quota], [Q4BestCase], [Q4SalesPL]) VALUES (2, 1, 600, 1500, 2400, 2012, N'15%', N'20%', N'70', N'6 to 9 months', 120, 150, 180, 100, 200, 300, 400, 500, 600, 700, 800, 900)
INSERT [dbo].[TBL_FORECAST] ([FORECAST_ID], [COMP_ID], [Q2TOTAL], [Q3TOTAL], [Q4TOTAL], [YEAR], [SEASON_INDEX], [GROWTH_INDEX], [TRAINED_REPS], [SALES_CYCLE_TIME], [QuotaTotal], [BestCaseTotal], [SalesPLTotal], [Q2Quota], [Q2BestCase], [Q2SalesPL], [Q3Quota], [Q3BestCase], [Q3SalesPL], [Q4Quota], [Q4BestCase], [Q4SalesPL]) VALUES (3, 1, 600, 1500, 2400, 2012, N'15%', N'20%', N'70', N'6 to 9 months', 120, 150, 180, 100, 200, 300, 400, 500, 600, 700, 800, 900)
INSERT [dbo].[TBL_FORECAST] ([FORECAST_ID], [COMP_ID], [Q2TOTAL], [Q3TOTAL], [Q4TOTAL], [YEAR], [SEASON_INDEX], [GROWTH_INDEX], [TRAINED_REPS], [SALES_CYCLE_TIME], [QuotaTotal], [BestCaseTotal], [SalesPLTotal], [Q2Quota], [Q2BestCase], [Q2SalesPL], [Q3Quota], [Q3BestCase], [Q3SalesPL], [Q4Quota], [Q4BestCase], [Q4SalesPL]) VALUES (4, 1, 600, 1500, 2400, 2012, N'15%', N'20%', N'70', N'6 to 9 months', 120, 150, 180, 100, 200, 300, 400, 500, 600, 700, 800, 900)
INSERT [dbo].[TBL_FORECAST] ([FORECAST_ID], [COMP_ID], [Q2TOTAL], [Q3TOTAL], [Q4TOTAL], [YEAR], [SEASON_INDEX], [GROWTH_INDEX], [TRAINED_REPS], [SALES_CYCLE_TIME], [QuotaTotal], [BestCaseTotal], [SalesPLTotal], [Q2Quota], [Q2BestCase], [Q2SalesPL], [Q3Quota], [Q3BestCase], [Q3SalesPL], [Q4Quota], [Q4BestCase], [Q4SalesPL]) VALUES (5, 1, 600, 1500, 2400, 2012, N'15%', N'20%', N'70', N'6 to 9 months', 1200, 1500, 1800, 100, 200, 300, 400, 500, 600, 700, 800, 900)
INSERT [dbo].[TBL_FORECAST] ([FORECAST_ID], [COMP_ID], [Q2TOTAL], [Q3TOTAL], [Q4TOTAL], [YEAR], [SEASON_INDEX], [GROWTH_INDEX], [TRAINED_REPS], [SALES_CYCLE_TIME], [QuotaTotal], [BestCaseTotal], [SalesPLTotal], [Q2Quota], [Q2BestCase], [Q2SalesPL], [Q3Quota], [Q3BestCase], [Q3SalesPL], [Q4Quota], [Q4BestCase], [Q4SalesPL]) VALUES (6, 1, 660, 1500, 2400, 2012, N'35%', N'10%', N'80', N'6 to 9 months', 1220, 1520, 1820, 120, 220, 320, 400, 500, 600, 700, 800, 900)
SET IDENTITY_INSERT [dbo].[TBL_FORECAST] OFF
/****** Object:  Table [dbo].[TBL_COSTOFSALE_MAIN]    Script Date: 02/19/2012 20:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_COSTOFSALE_MAIN](
	[Category_Name] [varchar](50) NULL,
	[Cost] [int] NULL,
	[Profit] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TBL_COSTOFSALE_MAIN] ([Category_Name], [Cost], [Profit]) VALUES (N'Leadership', 60, -9)
INSERT [dbo].[TBL_COSTOFSALE_MAIN] ([Category_Name], [Cost], [Profit]) VALUES (N'Sales', 72, -10)
INSERT [dbo].[TBL_COSTOFSALE_MAIN] ([Category_Name], [Cost], [Profit]) VALUES (N'Sandler Online', 74, 8)
INSERT [dbo].[TBL_COSTOFSALE_MAIN] ([Category_Name], [Cost], [Profit]) VALUES (N'Negotiations', 60, 5)
INSERT [dbo].[TBL_COSTOFSALE_MAIN] ([Category_Name], [Cost], [Profit]) VALUES (N'Strategic Customer Care', 72, -5)
INSERT [dbo].[TBL_COSTOFSALE_MAIN] ([Category_Name], [Cost], [Profit]) VALUES (N'Consulting', 74, 8)
INSERT [dbo].[TBL_COSTOFSALE_MAIN] ([Category_Name], [Cost], [Profit]) VALUES (N'Coaching', 60, 5)
INSERT [dbo].[TBL_COSTOFSALE_MAIN] ([Category_Name], [Cost], [Profit]) VALUES (N'Assessments', 72, 2)
INSERT [dbo].[TBL_COSTOFSALE_MAIN] ([Category_Name], [Cost], [Profit]) VALUES (N'Networking Works!', 74, 8)
INSERT [dbo].[TBL_COSTOFSALE_MAIN] ([Category_Name], [Cost], [Profit]) VALUES (N'Strategic Alliances', 60, 5)
INSERT [dbo].[TBL_COSTOFSALE_MAIN] ([Category_Name], [Cost], [Profit]) VALUES (N'Corporate/Global Training', 72, 2)
/****** Object:  Table [dbo].[TBL_COSTOFSALE_DRILL]    Script Date: 02/19/2012 20:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_COSTOFSALE_DRILL](
	[Category_Name] [varchar](50) NULL,
	[Cost] [int] NULL,
	[Profit] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TBL_COSTOFSALE_DRILL] ([Category_Name], [Cost], [Profit]) VALUES (N'Tom Brady', 72, -2)
INSERT [dbo].[TBL_COSTOFSALE_DRILL] ([Category_Name], [Cost], [Profit]) VALUES (N'Aaron Rodgers', 72, -5)
INSERT [dbo].[TBL_COSTOFSALE_DRILL] ([Category_Name], [Cost], [Profit]) VALUES (N'Eli Manning', 72, 8)
INSERT [dbo].[TBL_COSTOFSALE_DRILL] ([Category_Name], [Cost], [Profit]) VALUES (N'Drew Brees', 72, 5)
INSERT [dbo].[TBL_COSTOFSALE_DRILL] ([Category_Name], [Cost], [Profit]) VALUES (N'Peyton Manning', 72, -27)
/****** Object:  Table [dbo].[TBL_CORPGLOBALTRAINING]    Script Date: 02/19/2012 20:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_CORPGLOBALTRAINING](
	[Label_Name] [varchar](50) NULL,
	[P1_Value] [int] NULL,
	[P2_Value] [int] NULL,
	[P3_Value] [int] NULL,
	[P1_Qty] [int] NULL,
	[P2_Qty] [int] NULL,
	[P3_Qty] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TBL_CORPGLOBALTRAINING] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Mass Mutual', 15, 18, 18, 10, 13, 15)
INSERT [dbo].[TBL_CORPGLOBALTRAINING] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Castle Metals', 26, 20, 28, 13, 15, 18)
INSERT [dbo].[TBL_CORPGLOBALTRAINING] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Federated Dept Stores', 23, 26, 25, 8, 6, 10)
INSERT [dbo].[TBL_CORPGLOBALTRAINING] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Minnesota Mutual', 8, 10, 12, 6, 7, 8)
INSERT [dbo].[TBL_CORPGLOBALTRAINING] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Robert Half', 18, 22, 21, 10, 8, 14)
INSERT [dbo].[TBL_CORPGLOBALTRAINING] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Sallie Mae', 13, 10, 19, 13, 7, 15)
INSERT [dbo].[TBL_CORPGLOBALTRAINING] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Lowes', 18, 21, 14, 4, 6, 10)
INSERT [dbo].[TBL_CORPGLOBALTRAINING] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'GE Capital Corp', 14, 17, 19, 6, 8, 8)
INSERT [dbo].[TBL_CORPGLOBALTRAINING] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Oracle Systems', 6, 8, 10, 8, 5, 3)
INSERT [dbo].[TBL_CORPGLOBALTRAINING] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'BMW Financial', 7, 10, 13, 4, 8, 6)
/****** Object:  Table [dbo].[TBL_CONSULTING]    Script Date: 02/19/2012 20:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_CONSULTING](
	[Label_Name] [varchar](50) NULL,
	[P1_Value] [int] NULL,
	[P2_Value] [int] NULL,
	[P3_Value] [int] NULL,
	[P1_Qty] [int] NULL,
	[P2_Qty] [int] NULL,
	[P3_Qty] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TBL_CONSULTING] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Mass Mutual', 15, 18, 18, 10, 13, 15)
INSERT [dbo].[TBL_CONSULTING] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Castle Metals', 26, 20, 28, 13, 15, 18)
INSERT [dbo].[TBL_CONSULTING] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Federated Dept Stores', 23, 26, 25, 8, 6, 10)
INSERT [dbo].[TBL_CONSULTING] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Minnesota Mutual', 8, 10, 12, 6, 7, 8)
INSERT [dbo].[TBL_CONSULTING] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Robert Half', 18, 22, 21, 10, 8, 14)
INSERT [dbo].[TBL_CONSULTING] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Sallie Mae', 13, 10, 19, 13, 7, 15)
INSERT [dbo].[TBL_CONSULTING] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Lowes', 18, 21, 14, 4, 6, 10)
INSERT [dbo].[TBL_CONSULTING] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'GE Capital Corp', 14, 17, 19, 6, 8, 8)
INSERT [dbo].[TBL_CONSULTING] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Oracle Systems', 6, 8, 10, 8, 5, 3)
INSERT [dbo].[TBL_CONSULTING] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'BMW Financial', 7, 10, 13, 4, 8, 6)
/****** Object:  Table [dbo].[TBL_COACHING]    Script Date: 02/19/2012 20:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_COACHING](
	[Label_Name] [varchar](50) NULL,
	[P1_Value] [int] NULL,
	[P2_Value] [int] NULL,
	[P3_Value] [int] NULL,
	[P1_Qty] [int] NULL,
	[P2_Qty] [int] NULL,
	[P3_Qty] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TBL_COACHING] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Mass Mutual', 15, 18, 18, 10, 13, 15)
INSERT [dbo].[TBL_COACHING] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Castle Metals', 26, 20, 28, 13, 15, 18)
INSERT [dbo].[TBL_COACHING] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Federated Dept Stores', 23, 26, 25, 8, 6, 10)
INSERT [dbo].[TBL_COACHING] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Minnesota Mutual', 8, 10, 12, 6, 7, 8)
INSERT [dbo].[TBL_COACHING] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Robert Half', 18, 22, 21, 10, 8, 14)
INSERT [dbo].[TBL_COACHING] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Sallie Mae', 13, 10, 19, 13, 7, 15)
INSERT [dbo].[TBL_COACHING] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Lowes', 18, 21, 14, 4, 6, 10)
INSERT [dbo].[TBL_COACHING] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'GE Capital Corp', 14, 17, 19, 6, 8, 8)
INSERT [dbo].[TBL_COACHING] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Oracle Systems', 6, 8, 10, 8, 5, 3)
INSERT [dbo].[TBL_COACHING] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'BMW Financial', 7, 10, 13, 4, 8, 6)
/****** Object:  Table [dbo].[TBL_ASSESSMENTS]    Script Date: 02/19/2012 20:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_ASSESSMENTS](
	[Label_Name] [varchar](50) NULL,
	[P1_Value] [int] NULL,
	[P2_Value] [int] NULL,
	[P3_Value] [int] NULL,
	[P1_Qty] [int] NULL,
	[P2_Qty] [int] NULL,
	[P3_Qty] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TBL_ASSESSMENTS] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Mass Mutual', 15, 18, 18, 10, 13, 15)
INSERT [dbo].[TBL_ASSESSMENTS] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Castle Metals', 26, 20, 28, 13, 15, 18)
INSERT [dbo].[TBL_ASSESSMENTS] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Federated Dept Stores', 23, 26, 25, 8, 6, 10)
INSERT [dbo].[TBL_ASSESSMENTS] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Minnesota Mutual', 8, 10, 12, 6, 7, 8)
INSERT [dbo].[TBL_ASSESSMENTS] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Robert Half', 18, 22, 21, 10, 8, 14)
INSERT [dbo].[TBL_ASSESSMENTS] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Sallie Mae', 13, 10, 19, 13, 7, 15)
INSERT [dbo].[TBL_ASSESSMENTS] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Lowes', 18, 21, 14, 4, 6, 10)
INSERT [dbo].[TBL_ASSESSMENTS] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'GE Capital Corp', 14, 17, 19, 6, 8, 8)
INSERT [dbo].[TBL_ASSESSMENTS] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'Oracle Systems', 6, 8, 10, 8, 5, 3)
INSERT [dbo].[TBL_ASSESSMENTS] ([Label_Name], [P1_Value], [P2_Value], [P3_Value], [P1_Qty], [P2_Qty], [P3_Qty]) VALUES (N'BMW Financial', 7, 10, 13, 4, 8, 6)
