using System.IO;
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

namespace Sandler.Web.Areas.RDL.Controllers
{
    public class HomeController : BaseController
    {

        public EntityViewModel<TBL_PerformanceGoals> PerformanceGoalsViewModel;

        public HomeController(IUnitOfWork uow)
            : base(uow)
        {
            PerformanceGoalsViewModel = new EntityViewModel<TBL_PerformanceGoals>();
            PerformanceGoalsViewModel.BaseModel = this.BaseVM;
            PerformanceGoalsViewModel.EntityModel = new TBL_PerformanceGoals();
        }

        public HomeController()
            : this(new SandlerUnitOfWork(new SandlerRepositoryProvider(new RepositoryFactories()), new SandlerDBContext()))
        {
        }

        public ActionResult Index(string Report)
        {
            Session["UserID"] = UserId.ToString();
            Session["UserRole"] = UserRoles.First();
            Session["UserName"] = UserName;
            //Get the view....
            return View();
        }

        //For Editing Performance Goal Page...
        public ActionResult EditPG(int id)
        {
            dynamic model = new System.Dynamic.ExpandoObject();
            model.GoalId = id;
            return PartialView("EditPG", model);
        }


        public ActionResult BenchMarks(string Report)
        {
            return View();
        }

        public ActionResult SandlerRules(string Report)
        {
            return View();
        }

        public ActionResult SPMHelp(string Report)
        {
            return View();
        }

        public ActionResult Associates(string Report)
        {
            return View();
        }

        public ActionResult Performance(string Report)
        {
            return View();

        }

        public ActionResult PerformanceGoals(string Report)
        {
            return PartialView(PerformanceGoalsViewModel);
        }

        public ActionResult Assignments(string Report)
        {
            return View();
        }

        public ActionResult Reports()
        {
            return View();
        }

        public ActionResult NewFunctionality1()
        {
            return View();
        }

        public ActionResult NewFunctionality2()
        {
            return View();
        }

        public ActionResult NewFunctionality3()
        {
            return View();
        }

        public ActionResult NewFunctionality4()
        {
            return View();
        }

        public ActionResult SendMail()
        {
            return View();
        }

        public ActionResult SendInvite()
        {
            return View();
        }

        public ActionResult CreateGroup()
        {
            return View();
        }

        public ActionResult ViewArchivedPG()
        {
            return View();
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
            if (regularorArchived == true)
            {
                query = string.Format("exec [sp_PerformanceGoalView] @orderBy='{0}' ,@pageSize={1},@pageNo={2}{3}", "UserName ASC", 0, 0, whereClause);
            }
            else
            {
                query = string.Format("exec [sp_ArchivePerformanceGoalView] @orderBy='{0}' ,@pageSize={1},@pageNo={2}{3}", "UserName ASC", 0, 0, whereClause);
            }
            //return
            return query;
        }
        
        public ActionResult ExportPGoals()
        {
            string sToday = String.Format("{0:yyyyMMMdd__hh_mm_ss tt}", DateTime.Now);
            string moduleName = "Goals";

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
        
        public ActionResult ExportArchivedGoals()
        {

            string sToday = String.Format("{0:yyyyMMMdd__hh_mm_ss tt}", DateTime.Now);
            string moduleName = "ArchivedGoals";

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
        
        [HttpPost]
        public JsonResult UploadEmailDocument(HttpPostedFileBase file)
        {
            genericResponseForUI _response;
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
                    _response = new genericResponseForUI() { success = true, message = fileName, orgfilename = file.FileName, serverfilename = fileName };
                }
                else
                {
                    _response = new genericResponseForUI() { success = false, message = "Attachment exceeded the maximum size of 4 MB." };

                }
                //back
                return Json(_response, JsonRequestBehavior.AllowGet);
            }
            catch
            {
                _response = new genericResponseForUI() { success = false, message = "There is a problem processing attachment for this Event." };
                return Json(_response, JsonRequestBehavior.AllowGet);
            }

        }

    }
}
