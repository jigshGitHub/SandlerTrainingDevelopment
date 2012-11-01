﻿using System;
using System.Net;
using System.Text;
using System.Web.Http;
using System.Collections.Generic;
using SandlerModels;
using SandlerRepositories;
using System.Collections;
using System.Linq;
using SandlerData.Models;
using Sandler.UI.ChartStructure;

namespace SandlerAPI.Controllers
{
    public class ChartController : ApiController
    {

        public IChart Get(string id, string strChartIds, string strChartSubType, string strDrillBy, string strUserName, string strSearchParameter)
        {
            string[] chartIds = strChartIds.Split(new char[] { '_' });
            string chartSubtype = strChartSubType;
            ChartID idSelected;
            ChartRepository cR;
            SandlerModels.TBL_CHART dbChart;
            IChart chartToLoad = null;
            UserModel CurrentUser;
            CurrentUser = new UserModel(strUserName);
            new UserDataModel().Load(CurrentUser);
            foreach (string chartId in chartIds)
            {

                idSelected = (ChartID)Enum.Parse(typeof(ChartID), chartId, true);

                cR = new ChartRepository();
                dbChart = cR.GetAll().Where(c => c.ChartID == chartId && c.IsActive == true).SingleOrDefault();


                if (dbChart.TypeOfChart == "Chart")
                {
                    chartToLoad = new Chart() { SearchParameter = strSearchParameter, SubType = string.IsNullOrEmpty(chartSubtype) ? ChartSubType.NoSubType : (ChartSubType)Enum.Parse(typeof(ChartSubType), chartSubtype), BGAlpha = dbChart.BgAlpha, BGColor = dbChart.BgColor, CanvasBGAlpha = dbChart.CanvasBgAlpha, CanvasBGColor = dbChart.CanvasBgColor, Caption = dbChart.Caption, SWF = dbChart.SWFile, NumberSuffix = dbChart.NumberSuffix, PieRadius = dbChart.PieRadius, showLabels = dbChart.ShowLabels, showLegend = dbChart.ShowLegend, XaxisName = dbChart.XaxisName, YaxisName = dbChart.YaxisName, Id = idSelected, enableRotation = dbChart.EnableRotation, DrillChartIds = (string.IsNullOrEmpty(dbChart.DrillLevelChartIDs)) ? "" : dbChart.DrillLevelChartIDs, DrillOverride = false, DrillBy = (string.IsNullOrEmpty(strDrillBy)) ? "" : strDrillBy };
                    chartToLoad.LoadChart(CurrentUser);
                    chartToLoad.CreateChart();
                }
                else if (dbChart.TypeOfChart == "PieChart")
                {
                    chartToLoad = new PieChart() { SearchParameter = strSearchParameter, SubType = string.IsNullOrEmpty(chartSubtype) ? ChartSubType.NoSubType : (ChartSubType)Enum.Parse(typeof(ChartSubType), chartSubtype), BGAlpha = dbChart.BgAlpha, BGColor = dbChart.BgColor, CanvasBGAlpha = dbChart.CanvasBgAlpha, CanvasBGColor = dbChart.CanvasBgColor, Caption = dbChart.Caption, SWF = dbChart.SWFile, NumberSuffix = dbChart.NumberSuffix, PieRadius = dbChart.PieRadius, showLabels = dbChart.ShowLabels, showLegend = dbChart.ShowLegend, XaxisName = dbChart.XaxisName, YaxisName = dbChart.YaxisName, Id = idSelected, enableRotation = dbChart.EnableRotation, DrillChartIds = (string.IsNullOrEmpty(dbChart.DrillLevelChartIDs)) ? "" : dbChart.DrillLevelChartIDs, DrillOverride = false, DrillBy = (string.IsNullOrEmpty(strDrillBy)) ? "" : strDrillBy };
                    ((PieChart)chartToLoad).LoadChart(CurrentUser);
                    ((PieChart)chartToLoad).CreateChart();
                }
                else if (dbChart.TypeOfChart == "BarChart")
                {
                    chartToLoad = new BarChart() { SearchParameter = strSearchParameter, SubType = string.IsNullOrEmpty(chartSubtype) ? ChartSubType.NoSubType : (ChartSubType)Enum.Parse(typeof(ChartSubType), chartSubtype), BGAlpha = dbChart.BgAlpha, BGColor = dbChart.BgColor, CanvasBGAlpha = dbChart.CanvasBgAlpha, CanvasBGColor = dbChart.CanvasBgColor, Caption = dbChart.Caption, SWF = dbChart.SWFile, NumberSuffix = dbChart.NumberSuffix, PieRadius = dbChart.PieRadius, showLabels = dbChart.ShowLabels, showLegend = dbChart.ShowLegend, XaxisName = dbChart.XaxisName, YaxisName = dbChart.YaxisName, Id = idSelected, enableRotation = dbChart.EnableRotation, DrillChartIds = (string.IsNullOrEmpty(dbChart.DrillLevelChartIDs)) ? "" : dbChart.DrillLevelChartIDs, DrillOverride = false, DrillBy = (string.IsNullOrEmpty(strDrillBy)) ? "" : strDrillBy };
                    ((BarChart)chartToLoad).LoadChart(CurrentUser);
                    ((BarChart)chartToLoad).CreateChart();
                }
            }
            return chartToLoad;
        }
    }
}