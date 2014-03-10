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
