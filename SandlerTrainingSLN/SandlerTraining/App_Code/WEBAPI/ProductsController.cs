using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web.Http;
using SandlerModels;
using SandlerRepositories;

namespace SandlerAPI.Controllers
{
    public class ProductsController : ApiController
    {
        public IEnumerable<Tbl_ProductType> Get()
        {
            return new ProductTypesRepository().GetAll().Where(p => p.IsActive == true).AsEnumerable();
        }
    }
}