using Sandler.DB.Data.Common.Interface;
using Sandler.DB.Data.Repositories.Interfaces;
using Sandler.DB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Sandler.Web.Controllers.API
{
    [Authorize]
    public class CompanyController : BaseApiController
    {
        IRepository<TBL_COMPANIES> companyRepository;

        public CompanyController(IUnitOfWork uow) :base(uow)
        {
            companyRepository = uow.Repository<TBL_COMPANIES>();
        }

        public CompanyController():base()
        {
        }
        //usage api/CompanyView/310577A7-8751-4EC3-B8F7-3E831AF186CB
        [Route("api/CompanyView/{userId}")]
        public HttpResponseMessage Get(string userId)
        {
            return Request.CreateResponse(uow.CompanyRepository().Get(new Guid(userId)));
        }
    }
}
