using Sandler.DB.Data.Common;
using Sandler.DB.Data.Common.Implementation;
using Sandler.DB.Data.Common.Interface;
using Sandler.DB.Data.Repositories;
using Sandler.DB.Models;
using Sandler.Web.Controllers;
using Sandler.Web.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Configuration;

using Sandler.Web.Library;
using Sandler.Web.Models;

namespace Sandler.Web.Areas.CRM.Controllers
{
    public class CompaniesController : BaseController
    {
        public EntityViewModel<TBL_COMPANIES> CompanyViewModel;

        public CompaniesController(IUnitOfWork uow) :base(uow)
        {
            CompanyViewModel = new EntityViewModel<TBL_COMPANIES>();
            CompanyViewModel.BaseModel = this.BaseVM;
            CompanyViewModel.EntityModel = new TBL_COMPANIES();
        }

        public CompaniesController():this(new SandlerUnitOfWork(new SandlerRepositoryProvider(new RepositoryFactories()), new SandlerDBContext()))
        {
        }
        //
        // GET: /CRM/Companies/
        public ActionResult Index()
        {
            return PartialView(CompanyViewModel);
        }

        public ActionResult Edit(int id)
        {
            //var company = uow.Repository<TBL_COMPANIES>().GetById(id);
            dynamic model = new System.Dynamic.ExpandoObject();
            model.companyId = id;
            return PartialView("Edit", model);
        }

        public ActionResult ViewArchived()
        {
            return PartialView("ViewArchived");
        }

        public string GetSQLStatement(bool regularorArchived)
        {
            //Get the Current User
            UserModel CurrentUser = BaseVM.CurrentUser;

            string query = "";
            string whereClause = "";

            if (CurrentUser.Role == SandlerRoles.Corporate || CurrentUser.Role == SandlerRoles.SiteAdmin || CurrentUser.Role == SandlerRoles.HomeOfficeAdmin || CurrentUser.Role == SandlerRoles.HomeOfficeUser)
            {
                whereClause = "@selectForExcel=1";
            }
            if (CurrentUser.Role == SandlerRoles.Coach)
            {
                if (CurrentUser.CoachID > 0)
                    whereClause = whereClause + ",@coachId=" + CurrentUser.CoachID;

                whereClause = whereClause + ",@selectForExcel=1";
            }
            if (CurrentUser.Role == SandlerRoles.FranchiseeOwner || CurrentUser.Role == SandlerRoles.FranchiseeUser)
            {
                if (CurrentUser.FranchiseeID > 0)
                    whereClause = whereClause + ",@franchiseeId=" + CurrentUser.FranchiseeID;

                whereClause = whereClause + ",@selectForExcel=1";
            }

            //Set PageSize and PageNo as 0 because we want all records
            if(regularorArchived == true)
            {
                query = string.Format("exec [sp_CompanyView] @orderBy='{0}' ,@pageSize={1},@pageNo={2}{3}", "COMPANYNAME ASC", 0, 0, whereClause);
            }
            else
            {
                query = string.Format("exec [sp_ArchiveCompanyView] @orderBy='{0}' ,@pageSize={1},@pageNo={2}{3}", "COMPANYNAME ASC", 0, 0, whereClause);
            }
            //return
            return query;
        }

        public ActionResult ExportCompany()
        {

            string sToday = String.Format("{0:yyyyMMMdd__hh_mm_ss tt}", DateTime.Now);
            string moduleName = "Companies";
                       
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
        
        public ActionResult ExportArchivedCompany()
        {

            string sToday = String.Format("{0:yyyyMMMdd__hh_mm_ss tt}", DateTime.Now);
            string moduleName = "ArchivedCompanies";

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


        
    }
}
