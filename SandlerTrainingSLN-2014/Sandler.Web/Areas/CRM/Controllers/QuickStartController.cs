using Sandler.DB.Data.Common;
using Sandler.DB.Data.Common.Implementation;
using Sandler.DB.Data.Common.Interface;
using Sandler.DB.Data.Repositories;
using Sandler.DB.Models;
using Sandler.Web.Controllers;
using Sandler.Web.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Configuration;

using Sandler.Web.Library;
using Sandler.Web.Models;

namespace Sandler.Web.Areas.CRM.Controllers
{
    public class QuickStartController : BaseController
    {
        public EntityViewModel<TBL_OPPORTUNITIES> QuickStartViewModel;

        public QuickStartController(IUnitOfWork uow) :base(uow)
        {
            QuickStartViewModel = new EntityViewModel<TBL_OPPORTUNITIES>();
            QuickStartViewModel.BaseModel = this.BaseVM;
            TBL_OPPORTUNITIES opportunity = new TBL_OPPORTUNITIES();
            opportunity.NAME = "test opp";
            QuickStartViewModel.EntityModel = new TBL_OPPORTUNITIES();
        }

        public QuickStartController():this(new SandlerUnitOfWork(new SandlerRepositoryProvider(new RepositoryFactories()), new SandlerDBContext()))
        {
        }

        public ActionResult Index()
        {
            return PartialView(QuickStartViewModel);
        }

        public ActionResult Add()
        {
            return PartialView(QuickStartViewModel);
        }
    }
}
