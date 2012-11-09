/*
Executed on 10.1.10.2 11/9/ at 12:45AM
*/

INSERT INTO [SandlerDB].[dbo].[TBL_CHART] ([Caption],[SWFile], [ChartID], [NumberSuffix], [TypeOfChart] ,[YaxisName] ,[CanvasBgColor] ,[BgColor] ,[CanvasBgAlpha] ,[BgAlpha], [DrillLevelChartIDs]) VALUES ('Benchmark - Region Name to Country Name (By Month)' ,'StackedColumn3D.swf','BenchmarkRegionCountry', N'%','Chart','' ,'FFFFFF' ,'FFFFFF' ,'100' ,'100','BenchmarkRegionCountryQty_BenchmarkRegionCountryValue' );
GO
INSERT [dbo].[TBL_CHART] ([TypeOfChart], [Caption], [SWFile], [ChartID], [NumberSuffix], [SNumberSuffix], [XaxisName], [YaxisName], [CanvasBgColor], [BgColor], [CanvasBgAlpha], [BgAlpha], [PieRadius], [EnableRotation], [ShowLegend], [ShowLabels], [PlotGradientColor], [DrillLevelChartIDs], [IsActive], [LastUpdatedDate], [LastCreatedDate], [LastUpdatedBy], [LastCreatedBy]) VALUES ( N'PieChart', N'Region Name to Country Name Quantity', N'Pie3D.swf', N'BenchmarkRegionCountryQty', N'%', NULL, NULL, NULL, N'FFFFFF', NULL, N'100', NULL, N'100', N'1', N'1', N'0', NULL, NULL, 1, GetDate(), GetDate(), NULL, NULL)
GO
INSERT [dbo].[TBL_CHART] ([TypeOfChart], [Caption], [SWFile], [ChartID], [NumberSuffix], [SNumberSuffix], [XaxisName], [YaxisName], [CanvasBgColor], [BgColor], [CanvasBgAlpha], [BgAlpha], [PieRadius], [EnableRotation], [ShowLegend], [ShowLabels], [PlotGradientColor], [DrillLevelChartIDs], [IsActive], [LastUpdatedDate], [LastCreatedDate], [LastUpdatedBy], [LastCreatedBy]) VALUES ( N'PieChart', N'Region Name to Country Name Value', N'Pie3D.swf', N'BenchmarkRegionCountryValue', N'%', NULL, NULL, NULL, N'FFFFFF', NULL, N'100', NULL, N'100', N'1', N'1', N'0', NULL, NULL, 1, GetDate(), GetDate(), NULL, NULL)
GO


INSERT INTO [SandlerDB].[dbo].[TBL_CHART] ([Caption],[SWFile], [ChartID], [NumberSuffix], [TypeOfChart] ,[YaxisName] ,[CanvasBgColor] ,[BgColor] ,[CanvasBgAlpha] ,[BgAlpha], [DrillLevelChartIDs]) VALUES ('Benchmark - Country Name to "All" (By Month)' ,'StackedColumn3D.swf','BenchmarkCountryAll', N'%','Chart','' ,'FFFFFF' ,'FFFFFF' ,'100' ,'100','BenchmarkCountryAllQty_BenchmarkCountryAllValue' );
GO
INSERT [dbo].[TBL_CHART] ([TypeOfChart], [Caption], [SWFile], [ChartID], [NumberSuffix], [SNumberSuffix], [XaxisName], [YaxisName], [CanvasBgColor], [BgColor], [CanvasBgAlpha], [BgAlpha], [PieRadius], [EnableRotation], [ShowLegend], [ShowLabels], [PlotGradientColor], [DrillLevelChartIDs], [IsActive], [LastUpdatedDate], [LastCreatedDate], [LastUpdatedBy], [LastCreatedBy]) VALUES ( N'PieChart', N'Country Name to "All" Quantity', N'Pie3D.swf', N'BenchmarkCountryAllQty', N'%', NULL, NULL, NULL, N'FFFFFF', NULL, N'100', NULL, N'100', N'1', N'1', N'0', NULL, NULL, 1, GetDate(), GetDate(), NULL, NULL)
GO
INSERT [dbo].[TBL_CHART] ([TypeOfChart], [Caption], [SWFile], [ChartID], [NumberSuffix], [SNumberSuffix], [XaxisName], [YaxisName], [CanvasBgColor], [BgColor], [CanvasBgAlpha], [BgAlpha], [PieRadius], [EnableRotation], [ShowLegend], [ShowLabels], [PlotGradientColor], [DrillLevelChartIDs], [IsActive], [LastUpdatedDate], [LastCreatedDate], [LastUpdatedBy], [LastCreatedBy]) VALUES ( N'PieChart', N'Country Name to "All" Value', N'Pie3D.swf', N'BenchmarkCountryAllValue', N'%', NULL, NULL, NULL, N'FFFFFF', NULL, N'100', NULL, N'100', N'1', N'1', N'0', NULL, NULL, 1, GetDate(), GetDate(), NULL, NULL)
GO

/****** Object:  StoredProcedure [dbo].[sp_GetBenchMarkSalesFranchisee]    Script Date: 11/02/2012 13:25:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetBenchMarkCountryAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetBenchMarkCountryAll]
GO


Create Procedure [dbo].[sp_GetBenchMarkCountryAll]
(
@month int,
@year int 
)

As
Select sum(vw.value) as TotalValue, count(vw.id) as TotalQty, c.ID AS CountryID
FROM [vw_Opportunities] vw INNER JOIN TBL_REGION r INNER JOIN TBL_COUNTRY c ON r.CountryID = c.ID ON r.ID = vw.RegionID
WHERE DATEPART(MONTH,vw.CloseDate) = @month AND  DATEPART(YEAR,vw.CloseDate) = @year
group by c.ID;

GO