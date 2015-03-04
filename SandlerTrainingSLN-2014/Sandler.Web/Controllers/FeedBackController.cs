using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Sandler.Web.Controllers;
using Sandler.DB.Data.Common;
using Sandler.DB.Data.Common.Implementation;
using Sandler.DB.Data.Common.Interface;
using Sandler.DB.Data.Repositories;
using Sandler.DB.Models;
namespace Sandler.Web.Controllers
{
    [Authorize]
    public class FeedBackController : BaseController
    {
        //
        // GET: /ACE/FeedBack/
        public FeedBackController(IUnitOfWork uow)
            : base(uow)
        {   
        }
        public FeedBackController() : this(new SandlerUnitOfWork(new SandlerRepositoryProvider(new RepositoryFactories()), new SandlerDBContext()))
        {
        }
        public ActionResult Index()
        {
            return View();
        }
        [AllowAnonymous]
        public ActionResult Update(string id)
        {
            Tbl_AceEmailTracker receipient = this.uow.AceEmailTrackerRepository().Get(id);
            receipient.IsViewed = true;
            this.uow.AceEmailTrackerRepository().Update(receipient);
            return View();
        }
    }
}
