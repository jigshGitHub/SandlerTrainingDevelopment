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
        public HttpResponseMessage GetCompanyView(int? page, int? pageSize)
        {
            List<CompanyView> data = null;
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
                data = uow.CompanyRepository().Get(orderBy, pageSize.Value, page.Value, null, null).ToList();
            }
            if (CurrentUser.Role == SandlerRoles.Coach)
            {
                data = uow.CompanyRepository().Get(orderBy, pageSize.Value, page.Value, CurrentUser.CoachID, null).ToList();
            }
            if (CurrentUser.Role == SandlerRoles.FranchiseeOwner || CurrentUser.Role == SandlerRoles.FranchiseeUser)
            {
                data = uow.CompanyRepository().Get(orderBy, pageSize.Value, page.Value, null, CurrentUser.FranchiseeID).ToList();
            }

            var returnObject = new { success = true, __count = data.FirstOrDefault().TotalCount, results = data };
            return Request.CreateResponse(returnObject);
            
        }
    }
}
