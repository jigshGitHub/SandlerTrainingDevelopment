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
        public HttpResponseMessage GetContacts(int? page, int? pageSize, string searchText, bool selectForExcel)
        {
            List<ContactView> contacts = null;
            //sort%5B0%5D%5Bfield%5D=COMPANYNAME&sort%5B0%5D%5Bdir%5D=asc
            string sortField = HttpContext.Current.Request.QueryString["sort[0][field]"];
            string sortDir = HttpContext.Current.Request.QueryString["sort[0][dir]"];
            bool filterByCompany = !string.IsNullOrEmpty(HttpContext.Current.Request.QueryString["filter[filters][0][field]"]);            
            string orderBy = "LastName ASC";
            int? companyId = null;
            if (!string.IsNullOrEmpty(sortField))
                orderBy = sortField;
            if (!string.IsNullOrEmpty(sortField) && !string.IsNullOrEmpty(sortDir))
                orderBy = orderBy + " " + sortDir;
            if (filterByCompany)
                companyId = int.Parse(HttpContext.Current.Request.QueryString["filter[filters][0][value]"]);

            if (companyId>0)
            {
                if (CurrentUser.Role == SandlerRoles.FranchiseeUser)
                    contacts = uow.ContactRepository().Get(orderBy, pageSize.Value, page.Value, null, null, null, CurrentUser.UserId.ToString(),searchText, selectForExcel).ToList();
                else
                    contacts = uow.ContactRepository().Get(orderBy, pageSize.Value, page.Value, null, null, companyId, "", searchText, selectForExcel).ToList();
            }
            else
            {
                if (CurrentUser.Role == SandlerRoles.Corporate || CurrentUser.Role == SandlerRoles.SiteAdmin || CurrentUser.Role == SandlerRoles.HomeOfficeAdmin || CurrentUser.Role == SandlerRoles.HomeOfficeUser)
                {
                    contacts = uow.ContactRepository().Get(orderBy, pageSize.Value, page.Value, null, null, null, "", searchText, selectForExcel).ToList();
                }
                else if (CurrentUser.Role == SandlerRoles.Coach)
                {
                    contacts = uow.ContactRepository().Get(orderBy, pageSize.Value, page.Value, CurrentUser.CoachID, null, null, "", searchText, selectForExcel).ToList();
                }
                else if (CurrentUser.Role == SandlerRoles.FranchiseeOwner || CurrentUser.Role == SandlerRoles.Client)
                {
                    contacts = uow.ContactRepository().Get(orderBy, pageSize.Value, page.Value, null, CurrentUser.FranchiseeID, null, "", searchText, selectForExcel).ToList();
                }
                else
                    contacts = uow.ContactRepository().Get(orderBy, pageSize.Value, page.Value, null, null, null, CurrentUser.UserId.ToString(), searchText, selectForExcel).ToList();
            
            }
            return Request.CreateResponse(new { success = true, __count = (contacts.Count > 0) ? contacts.FirstOrDefault().TotalCount : 0, results = contacts });
        }

        [System.Web.Http.HttpGet]
        [Route("api/ArchiveContactView/")]
        public HttpResponseMessage GetArchiveContactView(int? page, int? pageSize, string searchText, bool selectForExcel)
        {
            List<ContactView> contacts = null;
            //sort%5B0%5D%5Bfield%5D=COMPANYNAME&sort%5B0%5D%5Bdir%5D=asc
            string sortField = HttpContext.Current.Request.QueryString["sort[0][field]"];
            string sortDir = HttpContext.Current.Request.QueryString["sort[0][dir]"];
            bool filterByCompany = !string.IsNullOrEmpty(HttpContext.Current.Request.QueryString["filter[filters][0][field]"]);
            string orderBy = "LastName ASC";
            int? companyId = null;
            if (!string.IsNullOrEmpty(sortField))
                orderBy = sortField;
            if (!string.IsNullOrEmpty(sortField) && !string.IsNullOrEmpty(sortDir))
                orderBy = orderBy + " " + sortDir;
            if (filterByCompany)
                companyId = int.Parse(HttpContext.Current.Request.QueryString["filter[filters][0][value]"]);

            if (companyId > 0)
            {
                if (CurrentUser.Role == SandlerRoles.FranchiseeUser)
                    contacts = uow.ContactRepository().GetArchiveContacts(orderBy, pageSize.Value, page.Value, null, null, null, CurrentUser.UserId.ToString(), searchText, selectForExcel).ToList();
                else
                    contacts = uow.ContactRepository().GetArchiveContacts(orderBy, pageSize.Value, page.Value, null, null, companyId, "", searchText, selectForExcel).ToList();
            }
            else
            {
                if (CurrentUser.Role == SandlerRoles.Corporate || CurrentUser.Role == SandlerRoles.SiteAdmin || CurrentUser.Role == SandlerRoles.HomeOfficeAdmin || CurrentUser.Role == SandlerRoles.HomeOfficeUser)
                {
                    contacts = uow.ContactRepository().GetArchiveContacts(orderBy, pageSize.Value, page.Value, null, null, null, "", searchText, selectForExcel).ToList();
                }
                else if (CurrentUser.Role == SandlerRoles.Coach)
                {
                    contacts = uow.ContactRepository().GetArchiveContacts(orderBy, pageSize.Value, page.Value, CurrentUser.CoachID, null, null, "", searchText, selectForExcel).ToList();
                }
                else if (CurrentUser.Role == SandlerRoles.FranchiseeOwner || CurrentUser.Role == SandlerRoles.Client)
                {
                    contacts = uow.ContactRepository().GetArchiveContacts(orderBy, pageSize.Value, page.Value, null, CurrentUser.FranchiseeID, null, "", searchText, selectForExcel).ToList();
                }
                else
                    contacts = uow.ContactRepository().GetArchiveContacts(orderBy, pageSize.Value, page.Value, null, null, null, CurrentUser.UserId.ToString(), searchText, selectForExcel).ToList();

            }
            return Request.CreateResponse(new { success = true, __count = (contacts.Count > 0) ? contacts.FirstOrDefault().TotalCount : 0, results = contacts });
        }

        [HttpPost]
        [Route("api/Contact/Archive")]
        public genericResponse ArchiveContact(TBL_CONTACTS _contact)
        {
            genericResponse _response;
            try
            {
                if (uow.ContactRepository().ArchiveContact(_contact.CONTACTSID, CurrentUser.UserId.ToString()))
                {
                    _response = new genericResponse() { success = true };
                    return _response;
                }
                else
                {
                    _response = new genericResponse() { success = false, message = "There is a problem Archiving this Contact Record. Please try again later." };
                    return _response;
                }

            }
            catch
            {
                _response = new genericResponse() { success = false, message = "There is a problem Archiving this Contact Record. Please try again later." };
                return _response;
            }

        }
        [HttpPost]
        [Route("api/Contact/UnArchive")]
        public genericResponse UnArchiveContact(TBL_CONTACTS _contact)
        {
            genericResponse _response;
            try
            {
                if (uow.ContactRepository().UnArchiveContact(_contact.CONTACTSID, CurrentUser.UserId.ToString()))
                {
                    _response = new genericResponse() { success = true };
                    return _response;
                }
                else
                {
                    _response = new genericResponse() { success = false, message = "There is a problem Unarchiving this Contact Record. Please try again later." };
                    return _response;
                }

            }
            catch
            {
                _response = new genericResponse() { success = false, message = "There is a problem Unarchiving this Contact Record. Please try again later." };
                return _response;
            }

        }

        public HttpResponseMessage Get(int id)
        {
            //Let us Initiate the model with UniqueId and the Franchisee Id
            var data = new TBL_CONTACTS() { CONTACTSID= 0, COMPANYID=0};
            if (id > 0)
            {
                data = uow.Repository<TBL_CONTACTS>().GetById(id);
            }
            return Request.CreateResponse(data);


        }


        [Route("api/ContactSave")]
        [HttpPost()]
        public HttpResponseMessage Save(TBL_CONTACTS contact, bool quickstartSave = false)
        {
            if (!VerifyRequiredFields(contact))
                return new HttpResponseMessage(HttpStatusCode.InternalServerError);
            if(quickstartSave && !VerifyQuickstartRequiredFields(contact))
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

        private bool VerifyQuickstartRequiredFields(TBL_CONTACTS contact)
        {
            bool trainingcheck = true;
            if(contact.IsRegisteredForTraining.HasValue == true)
                 trainingcheck = (contact.CourseId > 0 && 
                !string.IsNullOrEmpty(contact.TrainingCourseName) && 
                contact.CourseTrainingDate.HasValue && 
                contact.HowManyAttended > 0);
            return trainingcheck && contact.ApptSourceId > 0;
        }
    }
}
