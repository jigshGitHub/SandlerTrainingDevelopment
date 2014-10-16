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
    public class FranchiseeUserController : BaseApiController
    {
        public FranchiseeUserController(IUnitOfWork uow) :base(uow)
        {
            
        }

        public FranchiseeUserController():base()
        {
        }


        [HttpGet]
        public HttpResponseMessage Get()
        {
            return Request.CreateResponse(uow.Repository<TBL_COMPANIES>().GetAll().Take(10));
        }

                                
        [Route("api/FranchiseeUsersView/")]
        public HttpResponseMessage GetFranchiseeUsersView(string searchText, int? page, int? pageSize)
        {
            List<FranchiseeUsersView> users = null;
            //sort%5B0%5D%5Bfield%5D=COMPANYNAME&sort%5B0%5D%5Bdir%5D=asc
            string sortField =  HttpContext.Current.Request.QueryString["sort[0][field]"];
            string sortDir = HttpContext.Current.Request.QueryString["sort[0][dir]"];

            string orderBy = "ID ASC";
            if (!string.IsNullOrEmpty(sortField))
                orderBy = sortField;
            if (!string.IsNullOrEmpty(sortField) && !string.IsNullOrEmpty(sortDir))
                orderBy = orderBy + " " + sortDir;

            users = uow.FranchiseeUsersRepository().Get(searchText, orderBy, pageSize.Value, page.Value, CurrentUser.UserId).ToList();
            var returnObject = new { success = true, __count = (users.Count > 0) ? users.FirstOrDefault().TotalCount : 0, results = users };
            return Request.CreateResponse(returnObject);
            
        }

        public HttpResponseMessage Get(int id)
        {
            //Let us Initiate the model with UniqueId and the Franchisee Id
            var data = new TBL_FRANCHISEE_USERS() { ID = 0, FranchiseeID = CurrentUser.FranchiseeID };
            if (id > 0)
            {
                data = uow.Repository<TBL_FRANCHISEE_USERS>().GetById(id);
            }
            return Request.CreateResponse(data);
        }
        
    }
}
