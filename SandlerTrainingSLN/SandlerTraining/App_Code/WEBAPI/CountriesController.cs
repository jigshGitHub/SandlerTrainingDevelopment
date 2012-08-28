using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web.Http;
using SandlerModels;
using SandlerRepositories;

namespace SandlerAPI.Controllers
{
    public class CountriesController : ApiController
    {
        public IEnumerable<TBL_COUNTRY> Get()
        {
            return new CountryRepository().GetAll().Where(c => c.IsActive == true).AsEnumerable();
        }
    }
}