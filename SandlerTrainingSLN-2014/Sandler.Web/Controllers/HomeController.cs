using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Sandler.Web.Models;
using Sandler.Web.ViewModels;
using Sandler.DB.Data.Common.Interface;
using Sandler.DB.Data.Common.Implementation;
using Sandler.DB.Data.Common;
using Sandler.DB.Data.Repositories;
namespace Sandler.Web.Controllers
{
    public class HomeController : BaseController
    {
        public HomeController(IUnitOfWork uow) :base(uow)
        {
            
        }

        public HomeController()
            : this(new SandlerUnitOfWork(new SandlerRepositoryProvider(new RepositoryFactories()), new SandlerDBContext()))
        {
        }
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
