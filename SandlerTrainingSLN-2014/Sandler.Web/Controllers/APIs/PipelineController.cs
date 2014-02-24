﻿//using Breeze.WebApi2;
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

        [Route("api/PipelineView/")]
        public HttpResponseMessage GetPipelineView(int? page, int? pageSize)
        {
            List<OpportunityView> opportunities = null;
            //sort%5B0%5D%5Bfield%5D=COMPANYNAME&sort%5B0%5D%5Bdir%5D=asc
            //
            /*
             filter%5bfilters%5d%5b0%5d%5bfield%5d=COMPANIESID&
             filter%5bfilters%5d%5b0%5d%5boperator%5d=eq&
             filter%5bfilters%5d%5b0%5d%5bvalue%5d=2938
             %5b='['
             %5d=']'
             filter[filters][0][field]=COMPANIESID
             filter[filters][0][operator]=eq
             filter[filters][0][value]=2938
             * */
            string sortField = HttpContext.Current.Request.QueryString["sort[0][field]"];
            string sortDir = HttpContext.Current.Request.QueryString["sort[0][dir]"];
            bool filterByCompany = !string.IsNullOrEmpty(HttpContext.Current.Request.QueryString["filter[filters][0][field]"]);
            string orderBy = "NAME ASC";
            int? companyId=null;
            if (!string.IsNullOrEmpty(sortField))
                orderBy = sortField;
            if (!string.IsNullOrEmpty(sortField) && !string.IsNullOrEmpty(sortDir))
                orderBy = orderBy + " " + sortDir;
            if (filterByCompany)
                companyId = int.Parse(HttpContext.Current.Request.QueryString["filter[filters][0][value]"]);
            opportunities = uow.OpportunityRepository().Get(orderBy, pageSize.Value, page.Value, CurrentUser.UserId, companyId).ToList();

            var returnObject = new { success = true, __count = (opportunities.Count > 0) ? opportunities.FirstOrDefault().TotalCount:0, results = opportunities };
            return Request.CreateResponse(returnObject);

        }

        public HttpResponseMessage Get(int id)
        {
            var data = uow.Repository<TBL_COMPANIES>().GetById(id);

            return Request.CreateResponse(data);
        }
    }
}