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
    public class QuickStartController : BaseApiController
    {
        public QuickStartController(IUnitOfWork uow) :base(uow)
        {
            
        }

        public QuickStartController()
            : base()
        {
        }

        #region Save Pipeline

        [Route("api/QS/PipelineSave")]
        [HttpPost()]
        public HttpResponseMessage SavePipeline(TBL_OPPORTUNITIES opportunity)
        {
            if (!VerifyPipelineRequiredFields(opportunity))
                return new HttpResponseMessage(HttpStatusCode.InternalServerError);
            if (opportunity.ID > 0)
            {
                opportunity.UpdatedBy = CurrentUser.UserId.ToString();
                opportunity.UpdatedDate = DateTime.Now;
                uow.Repository<TBL_OPPORTUNITIES>().Update(opportunity);
            }
            else
            {
                opportunity.CreatedBy = CurrentUser.UserId.ToString();
                opportunity.CreatedDate = DateTime.Now;
                opportunity.IsActive = true;
                uow.Repository<TBL_OPPORTUNITIES>().Add(opportunity);
            }

            uow.Save();
            return Request.CreateResponse(opportunity);
        }        

        private bool VerifyPipelineRequiredFields(TBL_OPPORTUNITIES opportunity)
        {
            return (opportunity.COMPANYID > 0 &&
                opportunity.CONTACTID > 0 &&
                !string.IsNullOrEmpty(opportunity.NAME) &&
                opportunity.ProductID > 0 &&
                !string.IsNullOrEmpty(opportunity.VALUE.Value.ToString()) &&
                opportunity.CLOSEDATE.HasValue &&
                !string.IsNullOrEmpty(opportunity.Pain) &&
                opportunity.STATUSID > 0 &&
                opportunity.SourceID > 0 &&
                opportunity.TypeID > 0);
        }

        #endregion

        #region Save Contact
        [Route("api/QS/ContactSave")]
        [HttpPost()]
        public HttpResponseMessage SaveContact(TBL_CONTACTS contact)
        {
            if (!VerifyContactRequiredFields(contact))
                return new HttpResponseMessage(HttpStatusCode.InternalServerError);

            List<ContactView> contacts = uow.ContactRepository().Get("LastName ASC", 0, 0, null, CurrentUser.FranchiseeID, null, CurrentUser.UserId.ToString(), "", false).Where(r => r.FirstName == contact.FIRSTNAME && r.LastName == contact.LASTNAME && r.CompanyId == contact.COMPANYID).ToList<ContactView>(); ;

            if (contacts.Count > 0)
                contact.CONTACTSID = contacts[0].ContactsId;

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

        private bool VerifyContactRequiredFields(TBL_CONTACTS contact)
        {            
            bool trainingcheck = true;
            if (contact.IsRegisteredForTraining.HasValue == true)
                trainingcheck = (contact.CourseId > 0 &&
               !string.IsNullOrEmpty(contact.TrainingCourseName) &&
               contact.CourseTrainingDate.HasValue &&
               contact.HowManyAttended > 0);
            return trainingcheck && (contact.COMPANYID > 0 && !string.IsNullOrEmpty(contact.FIRSTNAME) && !string.IsNullOrEmpty(contact.LASTNAME) && contact.ApptSourceId > 0);
        }
        #endregion

        #region Save Company
        [HttpPost]
        [Route("api/QS/CompanySave")]
        public genericResponse SaveCompany(TBL_COMPANIES _company)
        {
            genericResponse _response;
            try
            {
                int companiesId = _company.COMPANIESID;
                _company.IsActive = true;

                if (!VerifyCompanyRequiredFields(_company))
                    return new genericResponse() { success = false, UniqueId = 0 };

                if (companiesId > 0)
                {
                    //Update Operation
                    _company.UpdatedBy = CurrentUser.UserId.ToString();
                    _company.UpdatedDate = DateTime.Now;
                    companiesId = uow.CompanyRepository().UpdateCompany(_company);
                }
                else
                {
                    List<CompanyView> companies = uow.CompanyRepository().Get("", "COMPANYNAME ASC", 0, 0,null, CurrentUser.FranchiseeID, false).ToList().Where(r => r.COMPANYNAME == _company.COMPANYNAME).ToList<CompanyView>();

                    if (companies.Count > 0)
                    {
                        _response = new genericResponse() { success = false, UniqueId = companies[0].COMPANIESID };
                        return _response;
                    }
                    //Add Operation
                    _company.CreatedDate = DateTime.Now;
                    _company.CreatedBy = CurrentUser.UserId.ToString();
                    companiesId = uow.CompanyRepository().AddCompany(_company);
                }
                uow.Save();
                //We will send back the companiesId - Either newly created or from Updated record
                _response = new genericResponse() { success = true, UniqueId = companiesId };
                return _response;
            }
            catch (Exception ex)
            {
                _response = new genericResponse() { success = false, message = "There is a problem in Saving Company Information. Please try again later." };
                return _response;
            }
        }

        private bool VerifyCompanyRequiredFields(TBL_COMPANIES company)
        {
            return (!string.IsNullOrEmpty(company.COMPANYNAME) && !string.IsNullOrEmpty(company.POCFirstName) && !string.IsNullOrEmpty(company.POCLastName) && company.IndustryId > 0);
        }

        #endregion

        [Route("api/PipelineArchive")]
        [HttpGet()]
        public HttpResponseMessage Archive(int id, bool isActive)
        {
            TBL_OPPORTUNITIES opportunity = uow.Repository<TBL_OPPORTUNITIES>().GetById(id);
            opportunity.IsActive = isActive;
            opportunity.UpdatedBy = CurrentUser.UserId.ToString();
            opportunity.UpdatedDate = DateTime.Now;
            uow.Repository<TBL_OPPORTUNITIES>().Update(opportunity);
            uow.Save();
            return new HttpResponseMessage(HttpStatusCode.OK);
   
        }
    }
}
