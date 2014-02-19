using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Sandler.DB.Models;
namespace Sandler.Web.Controllers.API
{
    public class LookupController : BaseApiController
    {
        [Route("api/Industries/")]
        public HttpResponseMessage GetIndustries()
        {
            return Request.CreateResponse(uow.Repository<Tbl_IndustryType>().GetAll().Where(r => r.IsActive == true));
        }

        [Route("api/Products/")]
        public HttpResponseMessage GetProducts()
        {
            return Request.CreateResponse(uow.Repository<Tbl_ProductType>().GetAll().Where(r => r.IsActive == true && r.FranchiseeId == 0));
        }

        [Route("api/ProductsByFranchisee/")]
        public HttpResponseMessage GetProducts(int? franchiseeId)
        {
            return Request.CreateResponse(uow.Repository<Tbl_ProductType>().GetAll().Where(r => r.IsActive == true && (r.FranchiseeId == 0 || r.FranchiseeId == franchiseeId.Value)));
        }

        [Route("api/AppointmentsSources/")]
        public HttpResponseMessage GetAppointmentsSources()
        {
            return Request.CreateResponse(uow.Repository<Tbl_AppointmentsSource>().GetAll().Where(r => r.IsActive == true));
        }

        [Route("api/AwardLevels/")]
        public HttpResponseMessage GetAwardLevels()
        {
            return Request.CreateResponse(uow.Repository<Tbl_AwardLevel>().GetAll().Where(r => r.IsActive == true));
        }
                
        [Route("api/YesNoOptions/")]
        public HttpResponseMessage GetYesNoOptions()
        {
            return Request.CreateResponse(uow.Repository<Tbl_YesNoOptions>().GetAll());
        }

        [Route("api/Courses/")]
        public HttpResponseMessage GetCourses()
        {
            return Request.CreateResponse(uow.Repository<Tbl_Course>().GetAll().Where(r => r.IsActive == true));
        }

        [Route("api/OpportunityStatus/")]
        public HttpResponseMessage GetOpportunityStatus()
        {
            return Request.CreateResponse(uow.Repository<TBL_OPPORTUNITYSTATUS>().GetAll().Where(r => r.IsActive == true));
        }

        [Route("api/OpportunityTypes/")]
        public HttpResponseMessage GetOpportunityTypes()
        {
            return Request.CreateResponse(uow.Repository<TBL_OpportunityTypes>().GetAll().Where(r => r.IsActive == true));
        }

        [Route("api/OpportunityWhyLosts/")]
        public HttpResponseMessage GetOpportunityWhyLosts()
        {
            return Request.CreateResponse(uow.Repository<TBL_OpportunityWhyLost>().GetAll().Where(r => r.IsActive == true));
        }
    }
}
