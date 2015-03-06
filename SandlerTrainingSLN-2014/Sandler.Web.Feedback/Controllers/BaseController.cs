using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Sandler.DB.Data.Common.Interface;
using Sandler.DB.Data.Common.Implementation;
using Sandler.DB.Data.Common;
using Sandler.DB.Data.Repositories;
namespace Sandler.Web.Feedback.Controllers
{

    public class BaseController : Controller
    {
        protected IUnitOfWork uow;

        public BaseController()
        {
        }

        public BaseController(IUnitOfWork _uow)
        {
            uow = _uow;
        }
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            base.OnActionExecuting(filterContext);
        }
    }
}