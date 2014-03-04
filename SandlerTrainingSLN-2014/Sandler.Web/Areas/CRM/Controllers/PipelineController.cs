using Sandler.DB.Data.Common;
using Sandler.DB.Data.Common.Implementation;
using Sandler.DB.Data.Common.Interface;
using Sandler.DB.Data.Repositories;
using Sandler.DB.Models;
using Sandler.Web.Controllers;
using Sandler.Web.Library;
using Sandler.Web.Models;
using Sandler.Web.ViewModels;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sandler.Web.Areas.CRM.Controllers
{
    public class PipelineController : BaseController
    {
        public EntityViewModel<TBL_OPPORTUNITIES> PipelineViewModel;

        public PipelineController(IUnitOfWork uow) :base(uow)
        {
            PipelineViewModel = new EntityViewModel<TBL_OPPORTUNITIES>();
            PipelineViewModel.BaseModel = this.BaseVM;
        }

        public PipelineController():this(new SandlerUnitOfWork(new SandlerRepositoryProvider(new RepositoryFactories()), new SandlerDBContext())){
        }
        //
        // GET: /CRM/Pipeline/
        public ActionResult Index()
        {
            return PartialView(PipelineViewModel);
        }

        public ActionResult Manage(int? id)
        {
            if (id.HasValue)
                PipelineViewModel.EntityModel = uow.Repository<TBL_OPPORTUNITIES>().GetById(long.Parse(id.ToString()));
            else
                PipelineViewModel.EntityModel = new TBL_OPPORTUNITIES();
            return PartialView("Manage", PipelineViewModel);
        }

        public ActionResult ExportCompany()
        {

            string sToday = String.Format("{0:yyyyMMMdd__hh_mm_ss tt}", DateTime.Now);
            string moduleName = "Pipeline";

            return new ExcelResult
            {
                fileName = moduleName + "_" + System.Guid.NewGuid() + "_" + sToday + ".xlsx",
                filePath = "~/Downloads/",
                sheetName = moduleName,
                clientsidefileName = moduleName + "_" + sToday + ".xlsx",
                sqlStatement = GetSQLStatement(0),
                connectionSring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString
            };

        }

        public string GetSQLStatement(int companyId)
        {
            string whereClause = "";
            if (companyId > 0)
                whereClause = whereClause + ", @companyId=" + companyId;

            return string.Format("exec [sp_OpportunityView] @userId='{0}', @orderBy='{1}', @pageSize={2}, @pageNo={3}{4}"
                , BaseVM.CurrentUser.UserId.ToString(), "NAME ASC", 0, 0, whereClause);
        }
    }
}
