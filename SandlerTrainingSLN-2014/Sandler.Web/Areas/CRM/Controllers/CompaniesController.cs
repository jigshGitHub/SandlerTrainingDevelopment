using Sandler.DB.Models;
using Sandler.Web.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sandler.Web.Areas.CRM.Controllers
{
    public class CompaniesController : BaseController
    {
        //
        // GET: /CRM/Companies/

        public ActionResult Index()
        {
            return PartialView();
        }

        public ActionResult Edit(int id)
        {
            //var company = uow.Repository<TBL_COMPANIES>().GetById(id);
            return PartialView("Edit");
        }

    }
}
