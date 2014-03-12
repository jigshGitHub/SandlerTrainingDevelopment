using Sandler.DB.Data.Common.Interface;
using Sandler.DB.Data.Repositories.Interfaces;
using Sandler.DB.Models;
using Sandler.Web.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Reflection;
using System.Web;
using System.Web.Caching;
using System.Web.Http;

namespace Sandler.Web.Controllers.API
{
    public class HomeOfficeReportsController : BaseApiController
    {
          public HomeOfficeReportsController(IUnitOfWork uow) :base(uow)
        {
            
        }

      

          public HomeOfficeReportsController()
              : base()
        {
        }

        //
        // GET: /HomeOfficeReports/

        [Route("api/HomeOfficeReports/")]
        public HttpResponseMessage GetHomeOfficeReports(string reportType,int? page, int? pageSize, string recordType)
        {  
            List<ReportView> reportData = null;
            
            string sortField = HttpContext.Current.Request.QueryString["sort[0][field]"];
            string sortDir = HttpContext.Current.Request.QueryString["sort[0][dir]"];

            #region [[ Save the Company Id in the Session for Export Use ]]
            //Clear the Cache first
            string cacheKey_ = "ReportQuery_" + CurrentUser.UserId.ToString();
            //Remove if it exists
            if (HttpRuntime.Cache[cacheKey_] != null)
                HttpRuntime.Cache.Remove(cacheKey_);            
            HttpRuntime.Cache.Insert(cacheKey_, reportType, null, DateTime.Now.Add(new TimeSpan(0, 1, 0)), Cache.NoSlidingExpiration);
            #endregion

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

            if (!string.IsNullOrEmpty(sortField))
                orderBy = sortField;
            if (!string.IsNullOrEmpty(sortField) && !string.IsNullOrEmpty(sortDir))
                orderBy = orderBy + " " + sortDir;

            reportData = uow.FranchiseeRepository().GetReportData(reportType, orderBy, pageSize.Value, page.Value, recordType).ToList();
            return Request.CreateResponse(new { success = true, __count = (reportData.Count > 0) ? reportData.FirstOrDefault().TotalCount : 0, results = reportData });

        }
    }
}
