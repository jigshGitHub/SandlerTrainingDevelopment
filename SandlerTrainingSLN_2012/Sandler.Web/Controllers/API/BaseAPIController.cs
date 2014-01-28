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

namespace Sandler.Web.Controllers.API
{
    public class BaseApiController : ApiController
    {
        protected IUnitOfWork uow;

        public BaseApiController(IUnitOfWork _uow)
        {
            uow = _uow;
        }
        public BaseApiController()
        {
            uow = new SandlerUnitOfWork(new SandlerRepositoryProvider(new RepositoryFactories()), new SandlerDBContext());
        }
    }
}
