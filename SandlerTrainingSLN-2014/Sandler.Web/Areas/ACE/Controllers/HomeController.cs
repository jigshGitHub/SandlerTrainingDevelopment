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
using System.IO;

namespace Sandler.Web.Areas.ACE.Controllers
{
    public class HomeController : BaseController
    {
        
        public EntityViewModel<Tbl_AceMainInfo> aceMainViewModel;
        
        public HomeController(IUnitOfWork uow) :base(uow)
        {
            aceMainViewModel = new EntityViewModel<Tbl_AceMainInfo>();
            aceMainViewModel.BaseModel = this.BaseVM;
            aceMainViewModel.EntityModel = new Tbl_AceMainInfo();
        }

        public HomeController() : this(new SandlerUnitOfWork(new SandlerRepositoryProvider(new RepositoryFactories()), new SandlerDBContext()))
        {
        }
        
        public ActionResult Index()
        {
            return PartialView(aceMainViewModel);
        }

        public ActionResult Create(int? id)
        {
            dynamic model = new System.Dynamic.ExpandoObject();
            model.AceId = id != null ? id : 0;

            return PartialView("Create", model);
        }

        public ActionResult Edit(int? id)
        {
            dynamic model = new System.Dynamic.ExpandoObject();
            model.AceId = id != null ? id : 0;

            return PartialView("Edit", model);
        }


        public ActionResult ViewArchived()
        {
            return PartialView("ViewArchived");
        }

        [HttpPost]
        public JsonResult UploadEmailDocument(HttpPostedFileBase file)
        {
            genericResponseSpl _response;
            try
            {
                //Let us check for the file size first
                if (file.ContentLength <= (4 * 1024 * 1024))
                {
                    //so the size is ok so let us save first...
                    var fileName = String.Format("{0}" + "_" + file.FileName, Guid.NewGuid().ToString());
                    var filePath = Path.Combine(Server.MapPath(Url.Content("~/Uploads")), fileName);
                    //Now save
                    file.SaveAs(filePath);
                    //go back
                    _response = new genericResponseSpl() { success = true, message = fileName, orgfilename = file.FileName, serverfilename = fileName };
                }
                else
                {
                    _response = new genericResponseSpl() { success = false, message = "Attachment exceeded the maximum size of 4 MB." };

                }
                //back
                return Json(_response, JsonRequestBehavior.AllowGet);
            }
            catch
            {
                _response = new genericResponseSpl() { success = false, message = "There is a problem processing attachment for this Event." };
                return Json(_response, JsonRequestBehavior.AllowGet);
            }

        }

        #region [[ Export the Result ]]
        
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
            if (regularorArchived == true)
            {
                query = string.Format("exec [sp_AceMainView] @orderBy='{0}' ,@pageSize={1},@pageNo={2}{3}", "CampaignName ASC", 0, 0, whereClause);
            }
            else
            {
                query = string.Format("exec [sp_AceMainView] @orderBy='{0}' ,@pageSize={1},@pageNo={2}{3}", "CampaignName ASC", 0, 0, whereClause);
            }
            //return
            return query;
        }


        public ActionResult ExportCampaigns()
        {

            string sToday = String.Format("{0:yyyyMMMdd__hh_mm_ss tt}", DateTime.Now);
            string moduleName = "Campaigns";

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

        #endregion

    }
}
