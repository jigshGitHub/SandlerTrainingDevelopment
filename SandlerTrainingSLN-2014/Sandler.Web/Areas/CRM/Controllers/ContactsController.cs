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

namespace Sandler.Web.Areas.CRM.Controllers
{
    public class ContactsController : BaseController
    {
        public EntityViewModel<TBL_CONTACTS> ContactsViewModel;

        public ContactsController(IUnitOfWork uow)
            : base(uow)
        {
            ContactsViewModel = new EntityViewModel<TBL_CONTACTS>();
            ContactsViewModel.BaseModel = this.BaseVM;
        }

        public ContactsController():this(new SandlerUnitOfWork(new SandlerRepositoryProvider(new RepositoryFactories()), new SandlerDBContext()))
        {            
        }
        //
        // GET: /CRM/Companies/

        public ActionResult Index()
        {
            return PartialView(ContactsViewModel);
        }

        public ActionResult Manage(int? id)
        {
            if (id.HasValue)
                ContactsViewModel.EntityModel = uow.Repository<TBL_CONTACTS>().GetById(long.Parse(id.ToString()));
            else
                ContactsViewModel.EntityModel = new TBL_CONTACTS();
            return PartialView("Manage", ContactsViewModel);
        }
        public ActionResult ExportContact()
        {

            string sToday = String.Format("{0:yyyyMMMdd__hh_mm_ss tt}", DateTime.Now);
            string moduleName = "Contact";

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


            return string.Format("exec [sp_ContactView] @orderBy='{0}' ,@pageSize={1},@pageNo={2}{3}"
                , "LASTNAME ASC", 0, 0, whereClause);
        }
    }
}
