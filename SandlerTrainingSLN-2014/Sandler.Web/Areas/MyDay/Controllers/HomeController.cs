using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;
using Sandler.DB.Data.Common.Interface;
using Sandler.DB.Data.Common.Implementation;
using Sandler.DB.Data.Common;
using Sandler.DB.Data.Repositories;

using Sandler.Web.Controllers;
using Sandler.Web.Models;
using Sandler.DB.Models;

namespace Sandler.Web.Areas.MyDay.Controllers
{
    public class HomeController : BaseController
    {
        public HomeController(IUnitOfWork uow) : base(uow)
        {

        }

        public HomeController() : this(new SandlerUnitOfWork(new SandlerRepositoryProvider(new RepositoryFactories()), new SandlerDBContext()))
        {
        }
        public ActionResult Index()
        {
            return PartialView();
        }


        public ActionResult Dashboard()
        {
            return PartialView();
        }
                
    }
}
