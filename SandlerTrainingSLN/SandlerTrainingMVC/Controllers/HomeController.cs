using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SandlerRepositories;
using SandlerModels;
using SandlerTrainingMVC.ViewModels;
using Models = SandlerTrainingMVC.Models;
namespace SandlerTrainingMVC.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Message = "Modify this template to kick-start your ASP.NET MVC application.";

            DashBoardVM vm = new DashBoardVM();

            ChartRepository chartRepository = new ChartRepository();
            Chart chart = chartRepository.GetById(2);

            Models.Chart chartM = new Models.Chart();
            chartM.BGAlpha = chart.BGAlpha;
            chartM.BGColor = chart.BGColor;
            chartM.CanvasBGAlpha = chart.CanvasBGAlpha;
            chartM.CanvasBGColor = chart.CanvasBGColor;
            chart.Caption = chart.Caption;
            chart.EnableRotation = chart.EnableRotation;
            chart.ShowLabels = chart.ShowLabels;
            chart.ShowLegend = chart.ShowLegend;
            chart.XaxisName = chart.XaxisName;
            chart.YaxisName = chart.YaxisName;


            ChartCategoryRepository chartCategoryRepository = new ChartCategoryRepository();
            var chartCategories = (from categories in chartCategoryRepository.GetAll()
                                  where categories.ChartId == chart.ID
                                  select categories).ToList<ChartCategory>();

            if (chartCategories.Count > 0) 
            {
                foreach(ChartCategory category in chartCategories){
                    chartM.Categories.Add(new Models.Category{ Label = category.Label});
                }
                
            }

            ChartDatasetRepository chartDSRepository = new ChartDatasetRepository();
            var chartDatasets = (from ds in chartDSRepository.GetAll()
                                 where ds.ChartId == chart.ID
                                 select ds).ToList<ChartDataset>();

            if(chartDatasets.Count > 0)
            {
                foreach (ChartDataset ds in chartDatasets)
                {
                    Models.DataSet dsM = new Models.DataSet();
                    if (ds.ChartDatasetValues.Count > 0)
                    {
                        foreach(ChartDatasetValue value in ds.ChartDatasetValues){
                            dsM.SetsCollection.Add(new Models.SetValue { Color = value.Color, Label = value.Label, Link = value.Link, Value = value.Value });
                        }
                    }
                    dsM.Color = ds.Color;
                    dsM.SeriesName = ds.SeriesName;                    
                    chartM.DataSetCollection.Add(dsM);                    
                }
            }

            vm.Chart = chartM;

            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
