using Sandler.DB.Data.Common.Interface;
using Sandler.DB.Data.Repositories.Interfaces;
using Sandler.DB.Models;
using Sandler.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;

namespace Sandler.Web.Controllers.API
{
    [Authorize]
    public class ContactController : BaseApiController
    {
        public ContactController(IUnitOfWork uow)
            : base(uow)
        {
            
        }

        public ContactController()
            : base()
        {
           
        }

        public HttpResponseMessage Get()
        {
            return Request.CreateResponse(uow.Repository<TBL_CONTACTS>().GetAll());
        }

        //http://localhost:5580/api/ContactView?companyId=0&page=1&pageSize=100
        [System.Web.Http.HttpGet]
        [Route("api/ContactView/")]
        public HttpResponseMessage GetContacts(int? page, int? pageSize, int companyId)
        {
            List<ContactView> contacts = null;
            //sort%5B0%5D%5Bfield%5D=COMPANYNAME&sort%5B0%5D%5Bdir%5D=asc
            string sortField = HttpContext.Current.Request.QueryString["sort[0][field]"];
            string sortDir = HttpContext.Current.Request.QueryString["sort[0][dir]"];

            string orderBy = "LastName ASC";
            if (!string.IsNullOrEmpty(sortField))
                orderBy = sortField;
            if (!string.IsNullOrEmpty(sortField) && !string.IsNullOrEmpty(sortDir))
                orderBy = orderBy + " " + sortDir;


            if (companyId>0)
            {
                if (CurrentUser.Role == SandlerRoles.FranchiseeUser)
                    contacts = uow.ContactRepository().Get(orderBy, pageSize.Value, page.Value, null, null, null, CurrentUser.UserId.ToString()).ToList();
                else
                    contacts = uow.ContactRepository().Get(orderBy, pageSize.Value, page.Value, null, null, companyId, "").ToList();
            }
            else
            {
                if (CurrentUser.Role == SandlerRoles.Corporate || CurrentUser.Role == SandlerRoles.SiteAdmin || CurrentUser.Role == SandlerRoles.HomeOfficeAdmin || CurrentUser.Role == SandlerRoles.HomeOfficeUser)
                {
                    contacts = uow.ContactRepository().Get(orderBy, pageSize.Value, page.Value, null, null, null, "").ToList();
                }
                else if (CurrentUser.Role == SandlerRoles.Coach)
                {
                    contacts = uow.ContactRepository().Get(orderBy, pageSize.Value, page.Value, CurrentUser.CoachID, null, null, "").ToList();
                }
                else if (CurrentUser.Role == SandlerRoles.FranchiseeOwner || CurrentUser.Role == SandlerRoles.Client)
                {
                    contacts = uow.ContactRepository().Get(orderBy, pageSize.Value, page.Value, null, CurrentUser.FranchiseeID, null, "").ToList();
                }
                else
                    contacts = uow.ContactRepository().Get(orderBy, pageSize.Value, page.Value, null, null, null, CurrentUser.UserId.ToString()).ToList();
            
            }
            return Request.CreateResponse(new { success = true, __count = (contacts.Count > 0) ? contacts.FirstOrDefault().TotalCount : 0, results = contacts });
        }

        [Route("api/ContactSave")]
        [HttpPost()]
        public HttpResponseMessage Save(TBL_CONTACTS contact)
        {
            if (!VerifyRequiredFields(contact))
                return new HttpResponseMessage(HttpStatusCode.InternalServerError);
            if (contact.CONTACTSID > 0)
            {
                uow.Repository<TBL_CONTACTS>().Update(contact);
                contact.UpdatedBy = CurrentUser.UserId.ToString();
                contact.UpdatedDate = DateTime.Now;
            }
            else
            {
                contact.CreatedBy = CurrentUser.UserId.ToString();
                contact.CreatedDate = DateTime.Now;
                contact.IsActive = true;
                uow.Repository<TBL_CONTACTS>().Add(contact);
            }

            uow.Save();
            return Request.CreateResponse(contact);
        }

        private bool VerifyRequiredFields(TBL_CONTACTS contact)
        {
            return (!string.IsNullOrEmpty(contact.FIRSTNAME) && !string.IsNullOrEmpty(contact.LASTNAME));
        }
    }
}
