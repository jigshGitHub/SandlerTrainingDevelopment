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
    public class PipelineController : BaseController
    {
        public EntityViewModel<TBL_OPPORTUNITIES> PipelineViewModel;

        public PipelineController(IUnitOfWork uow) :base(uow)
        {
            PipelineViewModel = new EntityViewModel<TBL_OPPORTUNITIES>();
            PipelineViewModel.BaseModel = this.BaseVM;
            PipelineViewModel.EntityModel = new TBL_OPPORTUNITIES();
        }

        public PipelineController():this(new SandlerUnitOfWork(new SandlerRepositoryProvider(new RepositoryFactories()), new SandlerDBContext())){
        }
        //
        // GET: /CRM/Pipeline/
        public ActionResult Index()
        {
            return PartialView(PipelineViewModel);
        }

        public ActionResult Edit(int id)
        {
            //var company = uow.Repository<TBL_Pipeline>().GetById(id);
            dynamic model = new System.Dynamic.ExpandoObject();
            model.companyId = id;
            return PartialView("Edit", model);
        }

    }
}
