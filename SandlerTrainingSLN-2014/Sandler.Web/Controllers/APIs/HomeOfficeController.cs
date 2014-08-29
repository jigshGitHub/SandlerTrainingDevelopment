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
    public class HomeOfficeController : BaseApiController
    {
        
        public HomeOfficeController(IUnitOfWork uow) :base(uow)
        {
            
        }

        public HomeOfficeController() : base()
        {
        }

        public HttpResponseMessage Get(int id)
        {
            //Let us Initiate the model with UniqueId and the Franchisee Id
            var data = new TBL_FRANCHISEE() { ID = 0};
            if (id > 0)
            {
                data = uow.Repository<TBL_FRANCHISEE>().GetById(id);
            }
            return Request.CreateResponse(data);
        }

        [HttpPost]
        [Route("api/HomeOffice/Save")]
        public genericResponse Save(TBL_FRANCHISEE _franchisee)
        {
            genericResponse _response;
            try
            {
                int frId = _franchisee.ID;
                _franchisee.IsActive = true;

                if (frId > 0)
                {
                    //Update Operation
                    _franchisee.LastUpdatedBy = CurrentUser.UserId;
                    _franchisee.LastCreatedDate = DateTime.Now;
                    frId = uow.FranchiseeRepository().UpdateFranchisee(_franchisee);
                }
                else
                {
                    //Add Operation
                    _franchisee.CreatedDate = DateTime.Now;
                    _franchisee.CreatedBy = CurrentUser.UserId;
                    frId = uow.FranchiseeRepository().AddFranchisee(_franchisee);
                }
                //We will send back the companiesId - Either newly created or from Updated record
                _response = new genericResponse() { success = true, UniqueId = frId };
                return _response;
            }
            catch (Exception ex)
            {
                _response = new genericResponse() { success = false, message = "There is a problem in Saving Franchisee Information. Please try again later." };
                return _response;
            }
        }
        
        [Route("api/FranchiseeView/")]
        public HttpResponseMessage GetFranchiseeView(string searchText, int? page, int? pageSize, bool selectForExcel)
        {
            List<FranchiseeView> franchisees = null;
            //sort%5B0%5D%5Bfield%5D=COMPANYNAME&sort%5B0%5D%5Bdir%5D=asc
            string sortField = HttpContext.Current.Request.QueryString["sort[0][field]"];
            string sortDir = HttpContext.Current.Request.QueryString["sort[0][dir]"];

            string orderBy = "NAME ASC";
            if (!string.IsNullOrEmpty(sortField))
                orderBy = sortField;
            if (!string.IsNullOrEmpty(sortField) && !string.IsNullOrEmpty(sortDir))
                orderBy = orderBy + " " + sortDir;

            //if (CurrentUser.Role == SandlerRoles.Corporate || CurrentUser.Role == SandlerRoles.SiteAdmin || CurrentUser.Role == SandlerRoles.HomeOfficeAdmin || CurrentUser.Role == SandlerRoles.HomeOfficeUser)
            //{
            //    franchisees = uow.FranchiseeRepository().Get(searchText, orderBy, pageSize.Value, page.Value, selectForExcel).ToList();
            //}
            //if (CurrentUser.Role == SandlerRoles.Coach)
            //{
            //    franchisees = uow.FranchiseeRepository().Get(searchText, orderBy, pageSize.Value, page.Value, selectForExcel).ToList();
            //}
            //if (CurrentUser.Role == SandlerRoles.FranchiseeOwner || CurrentUser.Role == SandlerRoles.FranchiseeUser)
            //{
            //    franchisees = uow.FranchiseeRepository().Get(searchText, orderBy, pageSize.Value, page.Value, selectForExcel).ToList();
            //}
            
            franchisees = uow.FranchiseeRepository().Get(searchText, orderBy, pageSize.Value, page.Value, selectForExcel,CurrentUser.UserId,false).ToList();

            var returnObject = new { success = true, __count = (franchisees.Count > 0) ? franchisees.FirstOrDefault().TotalCount : 0, results = franchisees };
            return Request.CreateResponse(returnObject);

        }


        [Route("api/ArchiveFranchiseeView/")]
        public HttpResponseMessage GetArchiveFranchiseeView(string searchText, int? page, int? pageSize, bool selectForExcel)
        {
            List<FranchiseeView> franchisees = null;
            //sort%5B0%5D%5Bfield%5D=COMPANYNAME&sort%5B0%5D%5Bdir%5D=asc
            string sortField = HttpContext.Current.Request.QueryString["sort[0][field]"];
            string sortDir = HttpContext.Current.Request.QueryString["sort[0][dir]"];

            string orderBy = "NAME ASC";
            if (!string.IsNullOrEmpty(sortField))
                orderBy = sortField;
            if (!string.IsNullOrEmpty(sortField) && !string.IsNullOrEmpty(sortDir))
                orderBy = orderBy + " " + sortDir;

            //if (CurrentUser.Role == SandlerRoles.Corporate || CurrentUser.Role == SandlerRoles.SiteAdmin || CurrentUser.Role == SandlerRoles.HomeOfficeAdmin || CurrentUser.Role == SandlerRoles.HomeOfficeUser)
            //{
            //    franchisees = uow.FranchiseeRepository().GetArchive(searchText, orderBy, pageSize.Value, page.Value, selectForExcel).ToList();
            //}
            //if (CurrentUser.Role == SandlerRoles.Coach)
            //{
            //    franchisees = uow.FranchiseeRepository().GetArchive(searchText, orderBy, pageSize.Value, page.Value, selectForExcel).ToList();
            //}
            //if (CurrentUser.Role == SandlerRoles.FranchiseeOwner || CurrentUser.Role == SandlerRoles.FranchiseeUser)
            //{
            //    franchisees = uow.FranchiseeRepository().GetArchive(searchText, orderBy, pageSize.Value, page.Value, selectForExcel).ToList();
            //}

            franchisees = uow.FranchiseeRepository().Get(searchText, orderBy, pageSize.Value, page.Value, selectForExcel, CurrentUser.UserId, true).ToList();

            var returnObject = new { success = true, __count = (franchisees.Count > 0) ? franchisees.FirstOrDefault().TotalCount : 0, results = franchisees };
            return Request.CreateResponse(returnObject);

        }
        
        [HttpPost]
        [Route("api/Franchisee/Archive")]
        public genericResponse ArchiveFranchisee(TBL_FRANCHISEE _franchisee)
        {
            genericResponse _response;
            try
            {
                if (uow.FranchiseeRepository().ArchiveFranchisee(_franchisee.ID, CurrentUser.UserId.ToString()))
                {
                    _response = new genericResponse() { success = true };
                    return _response;
                }
                else
                {
                    _response = new genericResponse() { success = false, message = "There is a problem Archiving this Franchisee Record. Please try again later." };
                    return _response;
                }

            }
            catch (Exception ex)
            {
                _response = new genericResponse() { success = false, message = "There is a problem Archiving this Franchisee Record. Please try again later." };
                return _response;
            }

        }
        
        [HttpPost]
        [Route("api/Franchisee/UnArchive")]
        public genericResponse UnArchiveFranchisee (TBL_FRANCHISEE _franchisee)
        {
            genericResponse _response;
            try
            {
                if (uow.FranchiseeRepository().UnArchiveFranchisee(_franchisee.ID , CurrentUser.UserId.ToString()))
                {
                    _response = new genericResponse() { success = true };
                    return _response;
                }
                else
                {
                    _response = new genericResponse() { success = false, message = "There is a problem Unarchiving this Franchisee Record. Please try again later." };
                    return _response;
                }

            }
            catch
            {
                _response = new genericResponse() { success = false, message = "There is a problem Unarchiving this Franchisee Record. Please try again later." };
                return _response;
            }

        }

        [Route("api/InitiativeInteractGraph/")]
        public HttpResponseMessage GetInitiativeInteractGraph()
        {
            List<initiativePieCHARTdata> pieList = null;
            List<initiativescrollLineCHARTdata> lineList = null;

            pieList = uow.KendoChartsRepository().GetPieChartData().ToList();
            lineList = uow.KendoChartsRepository().GetScrollLineChartData().ToList();

            var returnObject = new { success = true, plist = pieList, pcount = pieList.Count(), lList = lineList, lcount = lineList.Count() };
            return Request.CreateResponse(returnObject);
        }

        [Route("api/InitiativeFundGraph/")]
        public HttpResponseMessage GetInitiativeFundGraph()
        {
            List<initiativeLineCHARTdata> cdList_initiative = null;

            cdList_initiative = uow.KendoChartsRepository().GetLineChartData().ToList();

            var returnObject = new { success = true, list = cdList_initiative, count = cdList_initiative.Count() };
            return Request.CreateResponse(returnObject);

        }
    }
}
