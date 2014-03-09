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
    public class GlobalSearchController : BaseApiController
    {
         public GlobalSearchController(IUnitOfWork uow)
            : base(uow)
        {
            
        }

         public GlobalSearchController()
            : base()
        {
           
        }
       

        //http://localhost:5580/api/ContactView?companyId=0&page=1&pageSize=100
        [System.Web.Http.HttpGet]
        [Route("api/GlobalSearchView/")]
         public HttpResponseMessage GetGlobalSearchRecords(int? page, int? pageSize, string searchText, string searchRecordType)
        {
            List<GlobalSearchView> globalSearchRecords = null;
            //List<ContactView> globalSearchRecords = null;
            //sort%5B0%5D%5Bfield%5D=COMPANYNAME&sort%5B0%5D%5Bdir%5D=asc
            string sortField = HttpContext.Current.Request.QueryString["sort[0][field]"];
            string sortDir = HttpContext.Current.Request.QueryString["sort[0][dir]"];
            bool filterByCompany = !string.IsNullOrEmpty(HttpContext.Current.Request.QueryString["filter[filters][0][field]"]);
            string orderBy = "COMPANYNAME ASC";
          
            if (!string.IsNullOrEmpty(sortField))
                orderBy = sortField;
            if (!string.IsNullOrEmpty(sortField) && !string.IsNullOrEmpty(sortDir))
                orderBy = orderBy + " " + sortDir;

            if (CurrentUser.Role == SandlerRoles.Corporate || CurrentUser.Role == SandlerRoles.SiteAdmin || CurrentUser.Role == SandlerRoles.HomeOfficeAdmin || CurrentUser.Role == SandlerRoles.HomeOfficeUser)
            {
                globalSearchRecords = uow.ContactRepository().GetGlobalSearchRecords(orderBy, pageSize.Value, page.Value, null,null,"", searchText, searchRecordType).ToList();
            }
            else if (CurrentUser.Role == SandlerRoles.Coach)
            {
                globalSearchRecords = uow.ContactRepository().GetGlobalSearchRecords(orderBy, pageSize.Value, page.Value, CurrentUser.CoachID,null,"", searchText, searchRecordType).ToList();
            }
            else if (CurrentUser.Role == SandlerRoles.FranchiseeOwner || CurrentUser.Role == SandlerRoles.FranchiseeUser)
            {
                globalSearchRecords = uow.ContactRepository().GetGlobalSearchRecords(orderBy, pageSize.Value, page.Value, null,CurrentUser.FranchiseeID,"", searchText, searchRecordType).ToList();
            }
            else
                globalSearchRecords = uow.ContactRepository().GetGlobalSearchRecords(orderBy, pageSize.Value, page.Value, null, null, CurrentUser.UserId.ToString(), searchText, searchRecordType).ToList();

            
            return Request.CreateResponse(new { success = true, __count = (globalSearchRecords.Count > 0) ? globalSearchRecords.FirstOrDefault().TotalCount : 0, results = globalSearchRecords });
        }
    }
}
