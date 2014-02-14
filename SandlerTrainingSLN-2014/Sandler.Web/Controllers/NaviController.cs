using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Sandler.Web.Models;
using Sandler.Web.ViewModels;

namespace Sandler.Web.Controllers
{
    [Authorize]
    public class NaviController : Controller
    {
        public ActionResult Index(string url, string data, string udlo)
        {
            #region [ Page Model ]
            naviPage _pageInfo = new naviPage();
            if (udlo == "y")
                _pageInfo.LayoutPage = "~/Views/Shared/_LayoutBlank.cshtml";
            else
                _pageInfo.LayoutPage = "";
            _pageInfo.title = "Project Title";
            _pageInfo.startUrl = url;
            _pageInfo.startUrlData = data;
            #endregion

            return View(_pageInfo);
        }
    }
}
