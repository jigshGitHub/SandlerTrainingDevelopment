using Sandler.Web.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sandler.Web.Areas.CRM.Controllers
{
    public class ContactsController : BaseController
    {
        //
        // GET: /CRM/Companies/

        public ActionResult Index()
        {
            return PartialView();
        }

    }
}
