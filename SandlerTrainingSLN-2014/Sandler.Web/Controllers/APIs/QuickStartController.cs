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
            try
            {
                if (!VerifyPipelineRequiredFields(opportunity))
                    throw new Exception("Pipeline required fields are not submiited");
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
            catch (Exception ex)
            {
                throw new Exception("There is a problem in Saving Pipeline Information. Please try again later.", ex);
            }
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
            try
            {
                

                //List<ContactView> contacts = uow.ContactRepository().Get("LastName ASC", 0, 0, null, CurrentUser.FranchiseeID, null, CurrentUser.UserId.ToString(), "", false).Where(r => r.FirstName == contact.FIRSTNAME && r.LastName == contact.LASTNAME && r.CompanyId == contact.COMPANYID).ToList<ContactView>(); ;
                List<ContactView> contacts = uow.ContactRepository().Get("LastName ASC", 0, 0, null, CurrentUser.FranchiseeID, null,"", "", false).Where(r => r.FirstName == contact.FIRSTNAME && r.LastName == contact.LASTNAME && r.CompanyId == contact.COMPANYID).ToList<ContactView>();

                TBL_CONTACTS tmpContact;

                if (contacts.Count > 0)
                {
                    tmpContact = uow.Repository<TBL_CONTACTS>().GetById(contacts[0].ContactsId);
                }
                else
                {
                    tmpContact = new TBL_CONTACTS();
                }
                tmpContact.COMPANYID = contact.COMPANYID;
                tmpContact.CourseTrainingDate = contact.CourseTrainingDate;
                tmpContact.NEXT_CONTACT_DATE = contact.NEXT_CONTACT_DATE;
                tmpContact.ApptSourceId = contact.ApptSourceId;
                tmpContact.IsNewAppointment = contact.IsNewAppointment;
                tmpContact.IsRegisteredForTraining = contact.IsRegisteredForTraining;
                tmpContact.CourseId = contact.CourseId;
                tmpContact.TrainingCourseName = contact.TrainingCourseName;
                tmpContact.HowManyAttended = contact.HowManyAttended;
                tmpContact.ACTIONSTEP = contact.ACTIONSTEP;
                tmpContact.FIRSTNAME = contact.FIRSTNAME;
                tmpContact.LASTNAME = contact.LASTNAME;
                tmpContact.PHONE = contact.PHONE;
                tmpContact.EMAIL = contact.EMAIL;
                
                contact = tmpContact;

                if (!VerifyContactRequiredFields(contact))
                    throw new Exception("Contact required fields are not submiited");

                if (contact.CONTACTSID > 0)
                {                    
                    contact.UpdatedBy = CurrentUser.UserId.ToString();
                    contact.UpdatedDate = DateTime.Now;
                    uow.Repository<TBL_CONTACTS>().Update(contact);
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
            catch (Exception ex)
            {
                throw new Exception("There is a problem in Saving Contact Information. Please try again later.", ex);
            }
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
                    throw new Exception("Company required fields are not submiited");

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
                //_response = new genericResponse() { success = false, message = "There is a problem in Saving Company Information. Please try again later." };
                //return _response;
                throw new Exception("There is a problem in Saving Company Information. Please try again later.", ex);
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
