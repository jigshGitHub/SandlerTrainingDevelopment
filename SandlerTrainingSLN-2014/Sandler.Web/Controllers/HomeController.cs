using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Sandler.Web.Models;
using Sandler.Web.ViewModels;
namespace Sandler.Web.Controllers
{
    public class HomeController : BaseController
    {
        public ActionResult Index(int? workspaceId, int? moduleId, int? pageMenuId)
        {
            workspaceId = workspaceId ?? 0;
            moduleId = moduleId ?? 0;
            pageMenuId = pageMenuId ?? 0;

            pageInfo p = new pageInfo()
            {
                title = "Mined System Compliance Tracking Tool",
                currentWorkspaceId = workspaceId.Value,
                currentModuleId = moduleId.Value,
                currentPageMenuId = pageMenuId.Value
            };
            return View("Index", p);
        }

    }
}
