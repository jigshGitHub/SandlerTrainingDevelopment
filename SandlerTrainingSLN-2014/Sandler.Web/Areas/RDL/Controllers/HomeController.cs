using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sandler.Web.Areas.RDL.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /RDL/Home/

        //public ActionResult Index()
        //{
        //    return View();
        //}

        public ActionResult Index(string Report)
        {
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
        
    }
}
