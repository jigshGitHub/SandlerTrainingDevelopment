using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web.Http;
using SandlerModels;
using SandlerRepositories;
using System.Collections;

namespace SandlerAPI.Controllers
{
    public class OpportunitiesController : ApiController
    {
        public IQueryable<TBL_OPPORTUNITIES> Get(int companyId)
        {
            return new OpportunitiesRepository().GetAll().Where(c => c.IsActive == true && c.COMPANYID == companyId).AsQueryable();
        }
        [HttpGet]
        public TBL_OPPORTUNITIES Details(int id)
        {
            return new OpportunitiesRepository().GetAll().Where(c => c.IsActive == true && c.ID == id).Single();
        }
    }
}