using Sandler.DB.Data.Common;
using Sandler.DB.Data.Common.Implementation;
using Sandler.DB.Data.Common.Interface;
using Sandler.DB.Data.Repositories;
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
        public ContactsController(IUnitOfWork uow) :base(uow)
        {
            
        }

        public ContactsController():this(new SandlerUnitOfWork(new SandlerRepositoryProvider(new RepositoryFactories()), new SandlerDBContext()))
        {            
        }
        //
        // GET: /CRM/Companies/

        public ActionResult Index()
        {
            return PartialView();
        }

    }
}
