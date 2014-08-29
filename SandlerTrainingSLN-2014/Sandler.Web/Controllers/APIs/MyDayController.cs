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
    public class MyDayController : BaseApiController
    {
        
        public MyDayController(IUnitOfWork uow) : base(uow)
        {
            
        }

        public MyDayController() : base()
        {

        }

        [Route("api/MytasksListView/")]
        public HttpResponseMessage GetMytasksListView(int? page, int? pageSize)
        {
            List<MyTaskView> mytasksList = null;
            string sortField = HttpContext.Current.Request.QueryString["sort[0][field]"];
            string sortDir = HttpContext.Current.Request.QueryString["sort[0][dir]"];

            //string orderBy = "CompanyName ASC";
            string orderBy = "FollowUpDate ASC";
                 
            if (!string.IsNullOrEmpty(sortField))
                orderBy = sortField;
            if (!string.IsNullOrEmpty(sortField) && !string.IsNullOrEmpty(sortDir))
                orderBy = orderBy + " " + sortDir;

            if (CurrentUser.Role == SandlerRoles.Coach)
            {
                mytasksList = uow.MyTaskRepository().GetmytasksList(orderBy, pageSize.Value, page.Value, CurrentUser.UserId.ToString(), null, CurrentUser.CoachID).ToList();
            }
            else if (CurrentUser.Role == SandlerRoles.FranchiseeOwner || CurrentUser.Role == SandlerRoles.Client)
            {
                mytasksList = uow.MyTaskRepository().GetmytasksList(orderBy, pageSize.Value, page.Value, CurrentUser.UserId.ToString(), CurrentUser.FranchiseeID, null).ToList();
            }
            else
                mytasksList = uow.MyTaskRepository().GetmytasksList(orderBy, pageSize.Value, page.Value, CurrentUser.UserId.ToString(), null, null).ToList();

            var returnObject = new { success = true, __count = (mytasksList.Count > 0) ? mytasksList.FirstOrDefault().TotalCount : 0, results = mytasksList };
            return Request.CreateResponse(returnObject);

        }

        [Route("api/MyAppointmentsListView/")]
        public HttpResponseMessage GetMyAppointmentsListView(int? page, int? pageSize)
        {
            List<MyTaskView> myAppointmentsList = null;
            string sortField = HttpContext.Current.Request.QueryString["sort[0][field]"];
            string sortDir = HttpContext.Current.Request.QueryString["sort[0][dir]"];

            //string orderBy = "CompanyName ASC";

            string orderBy = "StartTime DESC";

            if (!string.IsNullOrEmpty(sortField))
                orderBy = sortField;
            if (!string.IsNullOrEmpty(sortField) && !string.IsNullOrEmpty(sortDir))
                orderBy = orderBy + " " + sortDir;

            if (CurrentUser.Role == SandlerRoles.Coach)
            {
                myAppointmentsList = uow.MyTaskRepository().GetmyAppointmentsList(orderBy, pageSize.Value, page.Value, CurrentUser.UserId.ToString(), null, CurrentUser.CoachID).ToList();
            }
            else if (CurrentUser.Role == SandlerRoles.FranchiseeOwner || CurrentUser.Role == SandlerRoles.Client)
            {
                myAppointmentsList = uow.MyTaskRepository().GetmyAppointmentsList(orderBy, pageSize.Value, page.Value, CurrentUser.UserId.ToString(), CurrentUser.FranchiseeID, null).ToList();
            }
            else
                myAppointmentsList = uow.MyTaskRepository().GetmyAppointmentsList(orderBy, pageSize.Value, page.Value, CurrentUser.UserId.ToString(), null, null).ToList();

            var returnObject = new { success = true, __count = (myAppointmentsList.Count > 0) ? myAppointmentsList.FirstOrDefault().TotalCount : 0, results = myAppointmentsList };
            return Request.CreateResponse(returnObject);

        }
       
        [Route("api/MyOpportunityListView/")]
        public HttpResponseMessage GetMyOpportunityListView(int? page, int? pageSize)
        {
            List<MyTaskView> myOpportunityList = null;
            string sortField = HttpContext.Current.Request.QueryString["sort[0][field]"];
            string sortDir = HttpContext.Current.Request.QueryString["sort[0][dir]"];

            //string orderBy = "CompanyName ASC";
            string orderBy = "NEXT_CONTACT_DATE ASC";

            if (!string.IsNullOrEmpty(sortField))
                orderBy = sortField;
            if (!string.IsNullOrEmpty(sortField) && !string.IsNullOrEmpty(sortDir))
                orderBy = orderBy + " " + sortDir;

            if (CurrentUser.Role == SandlerRoles.Coach)
            {
                myOpportunityList = uow.MyTaskRepository().GetmyOpportunityList(orderBy, pageSize.Value, page.Value, CurrentUser.UserId.ToString(), null, CurrentUser.CoachID).ToList();
            }
            else if (CurrentUser.Role == SandlerRoles.FranchiseeOwner || CurrentUser.Role == SandlerRoles.Client)
            {
                myOpportunityList = uow.MyTaskRepository().GetmyOpportunityList(orderBy, pageSize.Value, page.Value, CurrentUser.UserId.ToString(), CurrentUser.FranchiseeID, null).ToList();
            }
            else
                myOpportunityList = uow.MyTaskRepository().GetmyOpportunityList(orderBy, pageSize.Value, page.Value, CurrentUser.UserId.ToString(), null, null).ToList();

            var returnObject = new { success = true, __count = (myOpportunityList.Count > 0) ? myOpportunityList.FirstOrDefault().TotalCount : 0, results = myOpportunityList };
            return Request.CreateResponse(returnObject);

        }

        [Route("api/TasksView/")]
        public HttpResponseMessage GetTasksView()
        {
            List<MyTaskView> mytasks = null;

            mytasks = uow.MyTaskRepository().Get(CurrentUser.Role.ToString(), CurrentUser.UserId.ToString(), CurrentUser.FranchiseeID, CurrentUser.RegionID).ToList();

            var returnObject = new { success = true, results = mytasks.ToList() };
            return Request.CreateResponse(returnObject);

        }

        [Route("api/MyTasksView/")]
        public HttpResponseMessage GetMyTasksView(DateTime selDte)
        {
            List<MyTaskView> mytasks = null;

            mytasks = uow.MyTaskRepository().GetByDate(CurrentUser.Role.ToString(), CurrentUser.UserId.ToString(), CurrentUser.FranchiseeID, CurrentUser.RegionID, selDte).ToList();

            var returnObject = new { success = true, __count = (mytasks.Count > 0) ? mytasks.Count : 0, results = mytasks.ToList() };
            return Request.CreateResponse(returnObject);

        }


        [HttpPost]
        [Route("api/MyTask/Save")]
        public genericResponse Save(Tbl_FollowUpItemsList _followupItem)
        {
            genericResponse _response;
            try
            {
                int Id = 0;
                
                //Add Operation
                _followupItem.IsActive = true;
                _followupItem.UserId = CurrentUser.UserId;
                _followupItem.CreatedOn = DateTime.Now;

                Id = uow.MyTaskRepository().AddTask(_followupItem);

                //We will send back the Id for the Newly created Task
                _response = new genericResponse() { success = true, UniqueId = Id };
                return _response;
            }
            catch
            {
                _response = new genericResponse() { success = false, message = "There is a problem in Saving Task Information. Please try again later." };
                return _response;
            }
        }

        


        
    }
}
