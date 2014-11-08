using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Sandler.Web.Models;
using System.IO;
using Sandler.Web.Controllers;


namespace Sandler.Web.Areas.RDL.Controllers
{
    public class HomeController : BaseController
    {
        //
        // GET: /RDL/Home/

        //public ActionResult Index()
        //{
        //    return View();
        //}

        public ActionResult Index(string Report)
        {
            Session["UserID"] = UserId.ToString();
            Session["UserRole"] = UserRoles.First();
            Session["UserName"] = UserName;
            //Get the view....
            return View();
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


        [HttpPost]
        public JsonResult UploadEmailDocument(HttpPostedFileBase file)
        {
            genericResponse _response;
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
                    _response = new genericResponse() { success = true, message = fileName, orgfilename = file.FileName, serverfilename = fileName };
                }
                else
                {
                    _response = new genericResponse() { success = false, message = "Attachment exceeded the maximum size of 4 MB." };

                }
                //back
                return Json(_response, JsonRequestBehavior.AllowGet);
            }
            catch
            {
                _response = new genericResponse() { success = false, message = "There is a problem processing attachment for this Event." };
                return Json(_response, JsonRequestBehavior.AllowGet);
            }

        }
        
    }
}
