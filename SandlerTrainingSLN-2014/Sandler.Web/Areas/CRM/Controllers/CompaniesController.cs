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

namespace Sandler.Web.Areas.CRM.Controllers
{
    public class CompaniesController : BaseController
    {

        public EntityViewModel<TBL_COMPANIES> CompanyViewModel;

        public CompaniesController(IUnitOfWork uow) :base(uow)
        {
            CompanyViewModel = new EntityViewModel<TBL_COMPANIES>();
            CompanyViewModel.BaseModel = this.BaseVM;
            CompanyViewModel.EntityModel = new TBL_COMPANIES();
        }

        public CompaniesController():this(new SandlerUnitOfWork(new SandlerRepositoryProvider(new RepositoryFactories()), new SandlerDBContext()))
        {
        }
        //
        // GET: /CRM/Companies/
        public ActionResult Index()
        {
            return PartialView(CompanyViewModel);
        }

        public ActionResult Edit(int id)
        {
            //var company = uow.Repository<TBL_COMPANIES>().GetById(id);
            dynamic model = new System.Dynamic.ExpandoObject();
            model.companyId = id;
            return PartialView("Edit", model);
        }

    }
}
