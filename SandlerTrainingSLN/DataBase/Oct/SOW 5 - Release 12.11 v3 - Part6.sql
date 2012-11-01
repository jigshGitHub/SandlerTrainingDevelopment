/*
executed in 139 on 10/31 at 11:00PM
*/
INSERT [dbo].[TBL_CHART] ([TypeOfChart], [Caption], [SWFile], [ChartID], [NumberSuffix], [SNumberSuffix], [XaxisName], [YaxisName], [CanvasBgColor], [BgColor], [CanvasBgAlpha], [BgAlpha], [PieRadius], [EnableRotation], [ShowLegend], [ShowLabels], [PlotGradientColor], [DrillLevelChartIDs], [IsActive], [LastUpdatedDate], [LastCreatedDate], [LastUpdatedBy], [LastCreatedBy]) VALUES ( N'Chart', N'Products Sold To Company Name by Product (By Month)', N'MSColumn3D.swf', N'ProductSoldToCompanyByProductByMonth', NULL, NULL, NULL, N'Product Quantity Sold', N'FFFFFF', N'FFFFFF', N'100', N'100', NULL, N'0', N'0', N'0', NULL, N'ProductSalesByCompanyQuantity_ProductSalesByCompanyValue', 1, GetDate(), GetDate(), NULL, NULL)
GO
INSERT [dbo].[TBL_CHART] ([TypeOfChart], [Caption], [SWFile], [ChartID], [NumberSuffix], [SNumberSuffix], [XaxisName], [YaxisName], [CanvasBgColor], [BgColor], [CanvasBgAlpha], [BgAlpha], [PieRadius], [EnableRotation], [ShowLegend], [ShowLabels], [PlotGradientColor], [DrillLevelChartIDs], [IsActive], [LastUpdatedDate], [LastCreatedDate], [LastUpdatedBy], [LastCreatedBy]) VALUES ( N'PieChart', N'Quantity of Product Sales To Company Name', N'Pie3D.swf', N'ProductSalesByCompanyQuantity', N'%', NULL, NULL, NULL, N'FFFFFF', NULL, N'100', NULL, N'100', N'1', N'1', N'0', NULL, NULL, 1, GetDate(), GetDate(), NULL, NULL)
GO
INSERT [dbo].[TBL_CHART] ([TypeOfChart], [Caption], [SWFile], [ChartID], [NumberSuffix], [SNumberSuffix], [XaxisName], [YaxisName], [CanvasBgColor], [BgColor], [CanvasBgAlpha], [BgAlpha], [PieRadius], [EnableRotation], [ShowLegend], [ShowLabels], [PlotGradientColor], [DrillLevelChartIDs], [IsActive], [LastUpdatedDate], [LastCreatedDate], [LastUpdatedBy], [LastCreatedBy]) VALUES ( N'PieChart', N'Value of Product Sales To Company Name', N'Pie3D.swf', N'ProductSalesByCompanyValue', N'%', NULL, NULL, NULL, N'FFFFFF', NULL, N'100', NULL, N'100', N'1', N'1', N'0', NULL, NULL, 1, GetDate(), GetDate(), NULL, NULL)
GO

INSERT [dbo].[TBL_CHART] ([TypeOfChart], [Caption], [SWFile], [ChartID], [NumberSuffix], [SNumberSuffix], [XaxisName], [YaxisName], [CanvasBgColor], [BgColor], [CanvasBgAlpha], [BgAlpha], [PieRadius], [EnableRotation], [ShowLegend], [ShowLabels], [PlotGradientColor], [DrillLevelChartIDs], [IsActive], [LastUpdatedDate], [LastCreatedDate], [LastUpdatedBy], [LastCreatedBy]) VALUES ( N'Chart', N'Products Sold By Sales Rep by Product (By Month)', N'MSColumn3D.swf', N'ProductSoldBySalesRepByProductByMonth', NULL, NULL, NULL, N'Product Quantity Sold', N'FFFFFF', N'FFFFFF', N'100', N'100', NULL, N'0', N'0', N'0', NULL, N'ProductSalesBySalesRepQuantity_ProductSalesBySalesRepValue', 1, GetDate(), GetDate(), NULL, NULL)
GO
INSERT [dbo].[TBL_CHART] ([TypeOfChart], [Caption], [SWFile], [ChartID], [NumberSuffix], [SNumberSuffix], [XaxisName], [YaxisName], [CanvasBgColor], [BgColor], [CanvasBgAlpha], [BgAlpha], [PieRadius], [EnableRotation], [ShowLegend], [ShowLabels], [PlotGradientColor], [DrillLevelChartIDs], [IsActive], [LastUpdatedDate], [LastCreatedDate], [LastUpdatedBy], [LastCreatedBy]) VALUES ( N'PieChart', N'Product Sales Quantity By Sales Rep', N'Pie3D.swf', N'ProductSalesBySalesRepQuantity', N'%', NULL, NULL, NULL, N'FFFFFF', NULL, N'100', NULL, N'100', N'1', N'1', N'0', NULL, NULL, 1, GetDate(), GetDate(), NULL, NULL)
GO
INSERT [dbo].[TBL_CHART] ([TypeOfChart], [Caption], [SWFile], [ChartID], [NumberSuffix], [SNumberSuffix], [XaxisName], [YaxisName], [CanvasBgColor], [BgColor], [CanvasBgAlpha], [BgAlpha], [PieRadius], [EnableRotation], [ShowLegend], [ShowLabels], [PlotGradientColor], [DrillLevelChartIDs], [IsActive], [LastUpdatedDate], [LastCreatedDate], [LastUpdatedBy], [LastCreatedBy]) VALUES ( N'PieChart', N'Product Sales Value By Sales Rep', N'Pie3D.swf', N'ProductSalesBySalesRepValue', N'%', NULL, NULL, NULL, N'FFFFFF', NULL, N'100', NULL, N'100', N'1', N'1', N'0', NULL, NULL, 1, GetDate(), GetDate(), NULL, NULL)
GO

Create PROCEDURE [dbo].[sp_GetAllContactsAddressesByFrId]
	 (
		 @FranchiseeId int
	 )
AS


	 If @FranchiseeId = 0

	 Begin 
 
		SELECT ContactsId,' ' + EMAIL as Email,LASTNAME + ',' + FirstName as Fullname
		FROM [SandlerDB].[dbo].[TBL_CONTACTS] 
		where IsEmailSubscription = 1 and EMAIL is not null 
		and FirstName is not null and LastName is not null 
		order by LastName, FirstName

    End

		
 
	If @FranchiseeId > 0

	 Begin 

	 SELECT ContactsId,' ' + EMAIL as Email,LASTNAME + ',' + FirstName as Fullname
	 FROM [SandlerDB].[dbo].[TBL_CONTACTS] 
	 where IsEmailSubscription = 1 and EMAIL is not null 
	 and FirstName is not null and LastName is not null 
	 and COMPANYID in
	 (Select  COMPANIESID from [SandlerDB].[dbo].TBL_COMPANIES where  FranchiseeId = @FranchiseeId) 
	 order by LastName,FirstName

    End

	

	

	 /* SET NOCOUNT ON */

	 RETURN
 








