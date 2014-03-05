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
        public ActionResult ViewArchivedContacts()
        {
            return PartialView("ViewArchivedContacts");
        }
        public ActionResult ExportContact()
        {

            string sToday = String.Format("{0:yyyyMMMdd__hh_mm_ss tt}", DateTime.Now);
            string moduleName = "Contacts";

            return new ExcelResult
            {
                fileName = moduleName + "_" + System.Guid.NewGuid() + "_" + sToday + ".xlsx",
                filePath = "~/Downloads/",
                sheetName = moduleName,
                clientsidefileName = moduleName + "_" + sToday + ".xlsx",
                sqlStatement = GetSQLStatement(true),
                connectionSring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString
            };

        }
        public ActionResult ExportArchivedContact()
        {

            string sToday = String.Format("{0:yyyyMMMdd__hh_mm_ss tt}", DateTime.Now);
            string moduleName = "ArchivedContacts";

            return new ExcelResult
            {
                fileName = moduleName + "_" + System.Guid.NewGuid() + "_" + sToday + ".xlsx",
                filePath = "~/Downloads/",
                sheetName = moduleName,
                clientsidefileName = moduleName + "_" + sToday + ".xlsx",
                sqlStatement = GetSQLStatement(false),
                connectionSring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString
            };

        }
        public string GetSQLStatement(bool regularorArchived)
        {
            //Get the Current User
            UserModel CurrentUser = BaseVM.CurrentUser;
            string query = "";
            string whereClause = "";

            if (CurrentUser.Role == SandlerRoles.Corporate || CurrentUser.Role == SandlerRoles.SiteAdmin || CurrentUser.Role == SandlerRoles.HomeOfficeAdmin || CurrentUser.Role == SandlerRoles.HomeOfficeUser)
            {
                whereClause = whereClause + ",@userId=''";
            }
            else if (CurrentUser.Role == SandlerRoles.Coach)
            {
                if (CurrentUser.CoachID > 0)
                    whereClause = whereClause + ",@coachId=" + CurrentUser.CoachID;
            }
            else if (CurrentUser.Role == SandlerRoles.FranchiseeOwner || CurrentUser.Role == SandlerRoles.Client)
            {
                if (CurrentUser.FranchiseeID > 0)
                    whereClause = whereClause + ",@franchiseeId=" + CurrentUser.FranchiseeID;
            }
            else              
                whereClause = whereClause + ",@userId=" + CurrentUser.UserId.ToString();
                    

            //Set PageSize and PageNo as 0 because we want all records
            if (regularorArchived == true)
            {
                query = string.Format("exec [sp_ContactView] @orderBy='{0}' ,@pageSize={1},@pageNo={2}{3}"
                , "LASTNAME ASC", 0, 0, whereClause);
            }
            else
            {
                query = string.Format("exec [sp_ArchiveContactView] @orderBy='{0}' ,@pageSize={1},@pageNo={2}{3}"
                , "LASTNAME ASC", 0, 0, whereClause);
            }
            
            //return
            return query;
        }

      /*  public string GetSQLStatement(int companyId)
        {
            string whereClause = "";
            if (companyId > 0)
                whereClause = whereClause + ", @companyId=" + companyId;


            return string.Format("exec [sp_ContactView] @orderBy='{0}' ,@pageSize={1},@pageNo={2}{3}"
                , "LASTNAME ASC", 0, 0, whereClause);
        }
       * */
    }
}
