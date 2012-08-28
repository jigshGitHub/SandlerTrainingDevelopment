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
    public class ContactsController : ApiController
    {
        public IQueryable<TBL_CONTACTS> Get(int companyId)
        {
            return new ContactsRepository().GetAll().Where(c => c.IsActive == true && c.COMPANYID == companyId).AsQueryable();
        }
        [HttpGet]
        public TBL_CONTACTS Details(int id)
        {
            return new ContactsRepository().GetAll().Where(c => c.IsActive == true && c.CONTACTSID == id).Single();
        }
    }
}