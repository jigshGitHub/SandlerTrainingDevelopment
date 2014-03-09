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

        [Route("api/OpportunitySources/")]
        public HttpResponseMessage GetOpportunitySources()
        {
            return Request.CreateResponse(uow.Repository<TBL_OpportunitySource>().GetAll().Where(r => r.IsActive == true));
        }

        [Route("api/SandlerRoles/")]
        public HttpResponseMessage GetSandlerRoles()
        {
            return Request.CreateResponse(uow.Repository<Tbl_SandlerRole>().GetAll().Where(r => r.IsActive == true));
        }

        //[Route("api/SandlerCoachRegions/")]
        //public HttpResponseMessage GetSandlerCoachRegions()
        //{
        //    var coaches = from record in uow.Repository<TBL_COACH>().GetAll().Where(r => r.IsActive == true)
        //                  select new { Id = record.ID, Name = record.FirstName + ' ' + record.LastName + " - Region " + record.RegionID };

        //    return Request.CreateResponse(coaches);
        //}

        [Route("api/Coaches/")]
        public HttpResponseMessage GetCoaches()
        {
            return Request.CreateResponse(uow.Repository<TBL_COACH>().GetAll().Where(r => r.IsActive == true));
        }

        [Route("api/MasterFranchisees/")]
        public HttpResponseMessage GetMasterFranchisees()
        {
            return Request.CreateResponse(uow.Repository<Tbl_MasterFranchisee>().GetAll());
        }

        [Route("api/CostPlusAmount/")]
        public HttpResponseMessage GetCostPlusAmount()
        {
            return Request.CreateResponse(uow.Repository<Tbl_CostPlusAmount>().GetAll());
        }

        [Route("api/BehindAmount/")]
        public HttpResponseMessage GetBehindAmount()
        {
            return Request.CreateResponse(uow.Repository<Tbl_BehindAmount>().GetAll());
        }

        [Route("api/AwardLevel/")]
        public HttpResponseMessage GetAwardLevel()
        {
            return Request.CreateResponse(uow.Repository<Tbl_AwardLevel>().GetAll());
        }

        [Route("api/CertifiedLevel/")]
        public HttpResponseMessage GetCertifiedLevel()
        {
            return Request.CreateResponse(uow.Repository<Tbl_CertifiedLevel>().GetAll());
        }

        [Route("api/PurchaseLevel/")]
        public HttpResponseMessage GetPurchaseLevel()
        {
            return Request.CreateResponse(uow.Repository<Tbl_PurchaseLevel>().GetAll());
        }

        [Route("api/PrimaryBusiness/")]
        public HttpResponseMessage GetPrimaryBusiness()
        {
            return Request.CreateResponse(uow.Repository<Tbl_PrimaryBusiness>().GetAll());
        }

        [Route("api/Countries/")]
        public HttpResponseMessage GetCountries()
        {
            return Request.CreateResponse(uow.Repository<TBL_COUNTRY>().GetAll());
        }

        [Route("api/States/")]
        public HttpResponseMessage GetStates()
        {
            return Request.CreateResponse(uow.Repository<TBL_State>().GetAll());
        }


    }
}
