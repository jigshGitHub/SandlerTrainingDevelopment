using Sandler.DB.Data.Common;
using Sandler.DB.Data.Common.Implementation;
using Sandler.DB.Data.Common.Interface;
using Sandler.DB.Data.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
//using Breeze.ContextProvider.EF6;
using Sandler.DB.Models;
using Sandler.Web.Models;
namespace Sandler.Web.Controllers.API
{
    public class BaseApiController : ApiController
    {
        protected IUnitOfWork uow;
        protected UserModel CurrentUser;
        //protected readonly EFContextProvider<SandlerDBEntities> _contextProvider;

        public BaseApiController(IUnitOfWork _uow)
        {
            uow = _uow;
            CurrentUser = new UserModel(RequestContext.Principal.Identity.Name);
            CurrentUser.Load(_uow);
        }
        public BaseApiController()
        {
            uow = new SandlerUnitOfWork(new SandlerRepositoryProvider(new RepositoryFactories()), new SandlerDBContext());
            CurrentUser = new UserModel(RequestContext.Principal.Identity.Name);
            CurrentUser.Load(uow);
            //_contextProvider = new EFContextProvider<SandlerDBEntities>();
        }
    }
}
