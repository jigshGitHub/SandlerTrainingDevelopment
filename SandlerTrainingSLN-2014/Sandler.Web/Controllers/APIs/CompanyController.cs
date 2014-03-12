//using Breeze.WebApi2;
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
    //[BreezeController]
    public class CompanyController : BaseApiController
    {
        public CompanyController(IUnitOfWork uow) :base(uow)
        {
            
        }

        public CompanyController():base()
        {
        }

        //[HttpGet]
        //public string Metadata()
        //{
        //    return _contextProvider.Metadata();
        //}

        [HttpGet]
        public HttpResponseMessage Get()
        {
            return Request.CreateResponse(uow.Repository<TBL_COMPANIES>().GetAll().Take(10));
        }

        //usage api/CompanyView/310577A7-8751-4EC3-B8F7-3E831AF186CB
        //[Route("api/CompanyView/{userId}")]
        //public HttpResponseMessage Get(string userId)
        //{
        //    List<vw_Companies> data = uow.CompanyRepository().Get(new Guid(userId)).ToList();
        //    var returnObject = new { success = true, __count = data.Count(), results = data };
        //    return Request.CreateResponse(returnObject);
        //}
        [Route("api/CompanyView/")]
        public HttpResponseMessage GetCompanyView(string searchText, int? page, int? pageSize, bool selectForExcel)
        {
            List<CompanyView> companies = null;
            //sort%5B0%5D%5Bfield%5D=COMPANYNAME&sort%5B0%5D%5Bdir%5D=asc
            string sortField =  HttpContext.Current.Request.QueryString["sort[0][field]"];
            string sortDir = HttpContext.Current.Request.QueryString["sort[0][dir]"];

            string orderBy = "COMPANYNAME ASC";
            if (!string.IsNullOrEmpty(sortField))
                orderBy = sortField;
            if (!string.IsNullOrEmpty(sortField) && !string.IsNullOrEmpty(sortDir))
                orderBy = orderBy + " " + sortDir;
            
            if (CurrentUser.Role == SandlerRoles.Corporate || CurrentUser.Role == SandlerRoles.SiteAdmin || CurrentUser.Role == SandlerRoles.HomeOfficeAdmin || CurrentUser.Role == SandlerRoles.HomeOfficeUser)
            {
                companies = uow.CompanyRepository().Get(searchText,orderBy, pageSize.Value, page.Value, null, null, selectForExcel).ToList();
            }
            if (CurrentUser.Role == SandlerRoles.Coach)
            {
                companies = uow.CompanyRepository().Get(searchText,orderBy, pageSize.Value, page.Value, CurrentUser.CoachID, null,selectForExcel).ToList();
            }
            if (CurrentUser.Role == SandlerRoles.FranchiseeOwner || CurrentUser.Role == SandlerRoles.FranchiseeUser)
            {
                companies = uow.CompanyRepository().Get(searchText,orderBy, pageSize.Value, page.Value, null, CurrentUser.FranchiseeID,selectForExcel).ToList();
            }

            var returnObject = new { success = true, __count = (companies.Count > 0) ? companies.FirstOrDefault().TotalCount : 0, results = companies };
            return Request.CreateResponse(returnObject);
            
        }

        public HttpResponseMessage Get(int id)
        {
            //Let us Initiate the model with UniqueId and the Franchisee Id
            var data = new TBL_COMPANIES() { COMPANIESID = 0, FranchiseeId = CurrentUser.FranchiseeID };
            if (id > 0)
            {
                data = uow.Repository<TBL_COMPANIES>().GetById(id);
            }
            return Request.CreateResponse(data);
           

        }
        
        [HttpPost]
        [Route("api/Company/Archive")]
        public genericResponse ArchiveCompany(TBL_COMPANIES _company)
        {
            genericResponse _response;
            try
            {
                if (uow.CompanyRepository().ArchiveCompany(_company.COMPANIESID, CurrentUser.UserId.ToString()))
                {
                    _response = new genericResponse() { success = true };
                    return _response;
                }
                else
                {
                    _response = new genericResponse() { success = false, message = "There is a problem Archiving this Company Record. Please try again later." };
                    return _response;
                }

            }
            catch
            {
                _response = new genericResponse() { success = false, message = "There is a problem Archiving this Company Record. Please try again later." };
                return _response;
            }

        }


        [HttpPost]
        [Route("api/Company/UnArchive")]
        public genericResponse UnArchiveCompany(TBL_COMPANIES _company)
        {
            genericResponse _response;
            try
            {
                if (uow.CompanyRepository().UnArchiveCompany(_company.COMPANIESID, CurrentUser.UserId.ToString()))
                {
                    _response = new genericResponse() { success = true };
                    return _response;
                }
                else
                {
                    _response = new genericResponse() { success = false, message = "There is a problem Unarchiving this Company Record. Please try again later." };
                    return _response;
                }

            }
            catch
            {
                _response = new genericResponse() { success = false, message = "There is a problem Unarchiving this Company Record. Please try again later." };
                return _response;
            }

        }


        [HttpPost]
        [Route("api/Company/Save")]
        public genericResponse Save(TBL_COMPANIES _company)
        {
            genericResponse _response;
            try
            {
                int companiesId = _company.COMPANIESID;
                _company.IsActive = true;

                if (companiesId > 0)
                {
                    //Update Operation
                    _company.UpdatedBy = CurrentUser.UserId.ToString();
                    _company.UpdatedDate = DateTime.Now;
                    companiesId = uow.CompanyRepository().UpdateCompany(_company);
                }
                else
                {
                    //Add Operation
                    _company.CreatedDate = DateTime.Now;
                    _company.CreatedBy = CurrentUser.UserId.ToString();
                    companiesId = uow.CompanyRepository().AddCompany(_company);

                    if (_company.POCFirstName != "" && _company.POCLastName != "")
                    {
                        TBL_CONTACTS contact = new TBL_CONTACTS();
                        contact.COMPANYID = companiesId;
                        contact.FIRSTNAME = _company.POCFirstName;
                        contact.LASTNAME = _company.POCLastName;
                        contact.PHONE = _company.POCPhone;
                        contact.EMAIL = _company.POCEmail;
                        contact.Fax = _company.POCFax;
                        contact.ContactsDepartment = _company.POCDepartment;
                        contact.NEXT_CONTACT_DATE = _company.NEXTCONTACT_DATE;
                        contact.IsActive = true;
                        contact.CreatedBy = _company.CreatedBy;
                        contact.CreatedDate = _company.CreatedDate;
                        contact.UpdatedDate = _company.UpdatedDate;
                        contact.IsEmailSubscription = true;
                        contact.IsNeedCallBack = false;
                        contact.IsRegisteredForTraining = false;
                        contact.IsNewAppointment = false;
                        uow.Repository<TBL_CONTACTS>().Add(contact);
                        uow.Save();
                    }

                }
                //We will send back the companiesId - Either newly created or from Updated record
                _response = new genericResponse() { success = true, UniqueId = companiesId };
                return _response;
            }
            catch
            {
                _response = new genericResponse() { success = false, message = "There is a problem in Saving Company Information. Please try again later." };
                return _response;
            }
        }


        [Route("api/ArchiveCompanyView/")]
        public HttpResponseMessage GetArchiveCompanyView(string searchText, int? page, int? pageSize, bool selectForExcel)
        {
            List<CompanyView> companies = null;
            //sort%5B0%5D%5Bfield%5D=COMPANYNAME&sort%5B0%5D%5Bdir%5D=asc
            string sortField = HttpContext.Current.Request.QueryString["sort[0][field]"];
            string sortDir = HttpContext.Current.Request.QueryString["sort[0][dir]"];

            string orderBy = "COMPANYNAME ASC";
            if (!string.IsNullOrEmpty(sortField))
                orderBy = sortField;
            if (!string.IsNullOrEmpty(sortField) && !string.IsNullOrEmpty(sortDir))
                orderBy = orderBy + " " + sortDir;

            if (CurrentUser.Role == SandlerRoles.Corporate || CurrentUser.Role == SandlerRoles.SiteAdmin || CurrentUser.Role == SandlerRoles.HomeOfficeAdmin || CurrentUser.Role == SandlerRoles.HomeOfficeUser)
            {
                companies = uow.CompanyRepository().GetArchive(searchText, orderBy, pageSize.Value, page.Value, null, null, selectForExcel).ToList();
            }
            if (CurrentUser.Role == SandlerRoles.Coach)
            {
                companies = uow.CompanyRepository().GetArchive(searchText, orderBy, pageSize.Value, page.Value, CurrentUser.CoachID, null, selectForExcel).ToList();
            }
            if (CurrentUser.Role == SandlerRoles.FranchiseeOwner || CurrentUser.Role == SandlerRoles.FranchiseeUser)
            {
                companies = uow.CompanyRepository().GetArchive(searchText, orderBy, pageSize.Value, page.Value, null, CurrentUser.FranchiseeID, selectForExcel).ToList();
            }

            var returnObject = new { success = true, __count = (companies.Count > 0) ? companies.FirstOrDefault().TotalCount : 0, results = companies };
            return Request.CreateResponse(returnObject);

        }


    }
}
