/*
Executed in 139 10/30 at 10:45AM
*/
INSERT [dbo].[TBL_CHART] ([TypeOfChart], [Caption], [SWFile], [ChartID], [NumberSuffix], [SNumberSuffix], [XaxisName], [YaxisName], [CanvasBgColor], [BgColor], [CanvasBgAlpha], [BgAlpha], [PieRadius], [EnableRotation], [ShowLegend], [ShowLabels], [PlotGradientColor], [DrillLevelChartIDs], [IsActive], [LastUpdatedDate], [LastCreatedDate], [LastUpdatedBy], [LastCreatedBy]) VALUES ( N'Chart', N'Product Margin Contribution by Product (By Month)', N'MSColumn3D.swf', N'ProductMarginContributionByProductByMonth', NULL, NULL, NULL, N'Product Margin Value($000)', N'FFFFFF', N'FFFFFF', N'100', N'100', NULL, N'0', N'0', N'0', NULL, N'ProductSalesQty_ProductMarginValue', 1, GetDate(), GetDate(), NULL, NULL)
GO
INSERT [dbo].[TBL_CHART] ([TypeOfChart], [Caption], [SWFile], [ChartID], [NumberSuffix], [SNumberSuffix], [XaxisName], [YaxisName], [CanvasBgColor], [BgColor], [CanvasBgAlpha], [BgAlpha], [PieRadius], [EnableRotation], [ShowLegend], [ShowLabels], [PlotGradientColor], [DrillLevelChartIDs], [IsActive], [LastUpdatedDate], [LastCreatedDate], [LastUpdatedBy], [LastCreatedBy]) VALUES ( N'PieChart', N'Product Sales Quantity', N'Pie3D.swf', N'ProductSalesQty', N'%', NULL, NULL, NULL, N'FFFFFF', NULL, N'100', NULL, N'100', N'1', N'1', N'0', NULL, NULL, 1, GetDate(), GetDate(), NULL, NULL)
GO
INSERT [dbo].[TBL_CHART] ([TypeOfChart], [Caption], [SWFile], [ChartID], [NumberSuffix], [SNumberSuffix], [XaxisName], [YaxisName], [CanvasBgColor], [BgColor], [CanvasBgAlpha], [BgAlpha], [PieRadius], [EnableRotation], [ShowLegend], [ShowLabels], [PlotGradientColor], [DrillLevelChartIDs], [IsActive], [LastUpdatedDate], [LastCreatedDate], [LastUpdatedBy], [LastCreatedBy]) VALUES ( N'PieChart', N'Product Margin Value', N'Pie3D.swf', N'ProductMarginValue', N'%', NULL, NULL, NULL, N'FFFFFF', NULL, N'100', NULL, N'100', N'1', N'1', N'0', NULL, NULL, 1, GetDate(), GetDate(), NULL, NULL)
GO

INSERT [dbo].[TBL_CHART] ([TypeOfChart], [Caption], [SWFile], [ChartID], [NumberSuffix], [SNumberSuffix], [XaxisName], [YaxisName], [CanvasBgColor], [BgColor], [CanvasBgAlpha], [BgAlpha], [PieRadius], [EnableRotation], [ShowLegend], [ShowLabels], [PlotGradientColor], [DrillLevelChartIDs], [IsActive], [LastUpdatedDate], [LastCreatedDate], [LastUpdatedBy], [LastCreatedBy]) VALUES ( N'Chart', N'1st Sale Product Value By Product(By Month)', N'MSColumn3D.swf', N'FirstSaleProductValueByProductByMonth', NULL, NULL, NULL, N'1st Sale Product Value($000)', N'FFFFFF', N'FFFFFF', N'100', N'100', NULL, N'0', N'0', N'0', NULL, N'ProductFirstSalesQty_ProductFirstSalesValue', 1, GetDate(), GetDate(), NULL, NULL)
GO
INSERT [dbo].[TBL_CHART] ([TypeOfChart], [Caption], [SWFile], [ChartID], [NumberSuffix], [SNumberSuffix], [XaxisName], [YaxisName], [CanvasBgColor], [BgColor], [CanvasBgAlpha], [BgAlpha], [PieRadius], [EnableRotation], [ShowLegend], [ShowLabels], [PlotGradientColor], [DrillLevelChartIDs], [IsActive], [LastUpdatedDate], [LastCreatedDate], [LastUpdatedBy], [LastCreatedBy]) VALUES ( N'PieChart', N'Product 1st Sale Quantity', N'Pie3D.swf', N'ProductFirstSalesQty', N'%', NULL, NULL, NULL, N'FFFFFF', NULL, N'100', NULL, N'100', N'1', N'1', N'0', NULL, NULL, 1, GetDate(), GetDate(), NULL, NULL)
GO
INSERT [dbo].[TBL_CHART] ([TypeOfChart], [Caption], [SWFile], [ChartID], [NumberSuffix], [SNumberSuffix], [XaxisName], [YaxisName], [CanvasBgColor], [BgColor], [CanvasBgAlpha], [BgAlpha], [PieRadius], [EnableRotation], [ShowLegend], [ShowLabels], [PlotGradientColor], [DrillLevelChartIDs], [IsActive], [LastUpdatedDate], [LastCreatedDate], [LastUpdatedBy], [LastCreatedBy]) VALUES ( N'PieChart', N'Product 1st Sale Value', N'Pie3D.swf', N'ProductFirstSalesValue', N'%', NULL, NULL, NULL, N'FFFFFF', NULL, N'100', NULL, N'100', N'1', N'1', N'0', NULL, NULL, 1, GetDate(), GetDate(), NULL, NULL)
GO