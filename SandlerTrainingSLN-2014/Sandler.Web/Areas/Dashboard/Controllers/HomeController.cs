using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;

using Sandler.Web.Controllers;
namespace Sandler.Web.Areas.Dashboard.Controllers
{
    public class HomeController : BaseController
    {
        public ActionResult Index()
        {
           return PartialView();
        }
    }
}
