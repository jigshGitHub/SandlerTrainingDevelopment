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
    public class ContactsController : BaseController
    {
        public EntityViewModel<TBL_CONTACTS> ContactsViewModel;

        public ContactsController(IUnitOfWork uow)
            : base(uow)
        {
            ContactsViewModel = new EntityViewModel<TBL_CONTACTS>();
            ContactsViewModel.BaseModel = this.BaseVM;
        }

        public ContactsController():this(new SandlerUnitOfWork(new SandlerRepositoryProvider(new RepositoryFactories()), new SandlerDBContext()))
        {            
        }
        //
        // GET: /CRM/Companies/

        public ActionResult Index()
        {
            return PartialView(ContactsViewModel);
        }

        public ActionResult Manage(int? id)
        {
            if (id.HasValue)
                ContactsViewModel.EntityModel = uow.Repository<TBL_CONTACTS>().GetById(long.Parse(id.ToString()));
            else
                ContactsViewModel.EntityModel = new TBL_CONTACTS();
            return PartialView("Manage", ContactsViewModel);
        }

    }
}
