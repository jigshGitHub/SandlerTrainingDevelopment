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
    public class PipelineController : BaseApiController
    {
        public PipelineController(IUnitOfWork uow) :base(uow)
        {
            
        }

        public PipelineController():base()
        {
        }

        //[Route("api/PipelineView/")]
        //public HttpResponseMessage GetPipelineView(int? page, int? pageSize)
        //{
        //    List<PipelineView> data = null;
        //    //sort%5B0%5D%5Bfield%5D=COMPANYNAME&sort%5B0%5D%5Bdir%5D=asc
        //    string sortField =  HttpContext.Current.Request.QueryString["sort[0][field]"];
        //    string sortDir = HttpContext.Current.Request.QueryString["sort[0][dir]"];

        //    string orderBy = "COMPANYNAME ASC";
        //    if (!string.IsNullOrEmpty(sortField))
        //        orderBy = sortField;
        //    if (!string.IsNullOrEmpty(sortField) && !string.IsNullOrEmpty(sortDir))
        //        orderBy = orderBy + " " + sortDir;
            
        //    if (CurrentUser.Role == SandlerRoles.Corporate || CurrentUser.Role == SandlerRoles.SiteAdmin || CurrentUser.Role == SandlerRoles.HomeOfficeAdmin || CurrentUser.Role == SandlerRoles.HomeOfficeUser)
        //    {
        //        data = uow.PipelineRepository().Get(orderBy, pageSize.Value, page.Value, null, null).ToList();
        //    }
        //    if (CurrentUser.Role == SandlerRoles.Coach)
        //    {
        //        data = uow.PipelineRepository().Get(orderBy, pageSize.Value, page.Value, CurrentUser.CoachID, null).ToList();
        //    }
        //    if (CurrentUser.Role == SandlerRoles.FranchiseeOwner || CurrentUser.Role == SandlerRoles.FranchiseeUser)
        //    {
        //        data = uow.PipelineRepository().Get(orderBy, pageSize.Value, page.Value, null, CurrentUser.FranchiseeID).ToList();
        //    }

        //    var returnObject = new { success = true, __count = data.FirstOrDefault().TotalCount, results = data };
        //    return Request.CreateResponse(returnObject);
            
        //}

        public HttpResponseMessage Get(int id)
        {
            var data = uow.Repository<TBL_COMPANIES>().GetById(id);

            return Request.CreateResponse(data);
        }
    }
}
