using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web.Http;
using SandlerModels;
using SandlerRepositories;

namespace SandlerAPI.Controllers
{
    public class OpportunityStatusController : ApiController
    {
        
        public IEnumerable<TBL_OPPORTUNITYSTATUS> Get()
        {
            return new OpprtunityStatusRepository().GetAll().Where(s => s.IsActive == true).AsEnumerable();
        }
    }
}