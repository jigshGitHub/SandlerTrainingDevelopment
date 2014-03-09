using Sandler.DB.Data.Common;
using Sandler.DB.Data.Common.Implementation;
using Sandler.DB.Data.Common.Interface;
using Sandler.DB.Data.Repositories;
using Sandler.DB.Models;
using Sandler.Web.Controllers;
using Sandler.Web.ViewModels;
using Sandler.Web.Library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Configuration;
using Sandler.Web.Models;
using System.Data.Entity;

namespace Sandler.Web.Areas.CRM.Controllers
{
    public class GlobalSearchController : BaseController
    {
        public EntityViewModel<TBL_CONTACTS> GlobalSearchViewModel;
        //
        // GET: /CRM/GlobalSearch/

         public GlobalSearchController(IUnitOfWork uow)
            : base(uow)
        {
            GlobalSearchViewModel = new EntityViewModel<TBL_CONTACTS>();
            GlobalSearchViewModel.BaseModel = this.BaseVM;
        }

         public GlobalSearchController()
             : this(new SandlerUnitOfWork(new SandlerRepositoryProvider(new RepositoryFactories()), new SandlerDBContext()))
        {            
        }
        public ActionResult Index()
        {
            return PartialView();
        }

    }
}
