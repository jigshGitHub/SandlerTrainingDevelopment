using Sandler.DB.Data.Common;
using Sandler.DB.Data.Common.Implementation;
using Sandler.DB.Data.Common.Interface;
using Sandler.DB.Data.Repositories;
using Sandler.DB.Models;
using Sandler.Web.Controllers;
using Sandler.Web.ViewModels;
using Sandler.Web.Library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Configuration;
using Sandler.Web.Models;
using System.Data.Entity;

namespace Sandler.Web.Areas.CRM.Controllers
{
    public class HomeOfficeReportsController : BaseController
    {
        public EntityViewModel<TBL_FRANCHISEE> HomeOfficeReportsViewModel;
        //
        // GET: /CRM/HomeOfficeReports/

        public HomeOfficeReportsController(IUnitOfWork uow)
            : base(uow)
        {
            HomeOfficeReportsViewModel = new EntityViewModel<TBL_FRANCHISEE>();
            HomeOfficeReportsViewModel.BaseModel = this.BaseVM;
        }

        public HomeOfficeReportsController()
             : this(new SandlerUnitOfWork(new SandlerRepositoryProvider(new RepositoryFactories()), new SandlerDBContext()))
        {            
        }
        public ActionResult Index()
        {
            return PartialView();
        }
        public ActionResult ExportReport()
        {

            string sToday = String.Format("{0:yyyyMMMdd__hh_mm_ss tt}", DateTime.Now);
            string moduleName = "Report";
            string reportType = "";
            UserModel CurrentUser = BaseVM.CurrentUser;
            string cacheKey_ = "ReportQuery_" + CurrentUser.UserId.ToString();
            if (HttpRuntime.Cache[cacheKey_] != null)
            {                
                reportType = HttpRuntime.Cache[cacheKey_].ToString();

            }
            return new ExcelResult
            {
                fileName = moduleName + "_" + System.Guid.NewGuid() + "_" + sToday + ".xlsx",
                filePath = "~/Downloads/",
                sheetName = moduleName,
                //reportType=reportType,
                clientsidefileName = moduleName + "_" + sToday + ".xlsx",
                sqlStatement = GetSQLStatement(reportType, "Excel"),
                connectionSring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString
            };

        }
        public string GetSQLStatement(string reportType,string recordType)
        {
            string query = "";
            string orderBy = "";
            
            switch (reportType)
            {
                case "frbyawlevel":
                    reportType = "sp_GetHomeOfficeReportfrbyawlevel";                    
                    break;
                case "frbybusarea":                    
                    reportType = "sp_GetHomeOfficeReportfrbybusarea";
                    break;
                case "frbycertlevel":                    
                    reportType = "sp_GetHomeOfficeReportfrbycertlevel";
                    break;
                case "frbycoach":
                    reportType = "sp_GetHomeOfficeReportfrbycoach";
                    break;
                case "frbycontdetails":
                    reportType = "sp_GetHomeOfficeReportfrbycontdetails";
                    break;
                case "ctra":
                    reportType = "sp_GetHomeOfficeReportctra";
                    break;
                case "frbycountry":
                    reportType = "sp_GetHomeOfficeReportfrbycountry";
                    break;
                case "frbytrngdate":
                    reportType = "sp_GetHomeOfficeReportfrbytrngdate";
                    break;
                case "msfc":
                    reportType = "sp_GetHomeOfficeReportmsfc";
                    break;
                case "prpl":
                    reportType = "sp_GetHomeOfficeReportprpl";
                    break;
                case "frbyregion":
                    reportType = "sp_GetHomeOfficeReportfrbyregion";
                    break;
                case "sere":
                    reportType = "sp_GetHomeOfficeReportsere";
                    break;
                case "frbystate":
                    reportType = "sp_GetHomeOfficeReportfrbystate";
                    break;
                case "frbyusingcrm":
                    reportType = "sp_GetHomeOfficeReportfrbyusingcrm";
                    break;
                case "zcbt":
                    reportType = "sp_GetHomeOfficeReportzcbt";
                    break;
                case "mfrd":
                    reportType = "sp_GetHomeOfficeReportmfrd";
                    break;
                case "msfr":
                    reportType = "sp_GetHomeOfficeReportmsfr";
                    break;
                case "msrbykeyopnldr":
                    reportType = "sp_GetHomeOfficeReportmsrbykeyopnldr";
                    break;
                case "msrbyadvboard":
                    reportType = "sp_GetHomeOfficeReportmsrbyadvboard";
                    break;
                case "msrbymktgcom":
                    reportType = "sp_GetHomeOfficeReportmsrbymktgcom";
                    break;
                case "dhsa":
                    reportType = "sp_GetHomeOfficeReportdhsa";
                    break;
                case "frmd":
                    reportType = "sp_GetHomeOfficeReportfrmd";
                    break;
                case "glaa":
                    reportType = "sp_GetHomeOfficeReportglaa";
                    break;

                    
            }
            query = string.Format("exec [" + reportType + "]  @orderBy='{0}', @pageSize={1},@pageNo={2},@recordType='{3}'", orderBy, 0, 0, recordType);                                
            return query;
        }

    }
}
