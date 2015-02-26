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
        
        [Route("api/OurTasksView/")]
        public HttpResponseMessage GetOurTasksView()
        {
            List<MyTaskView> mytasks = null;

            mytasks = uow.MyTaskRepository().GetOurTasks(CurrentUser.Role.ToString(), CurrentUser.UserId.ToString(), CurrentUser.FranchiseeID, CurrentUser.RegionID).ToList();

            var returnObject = new { success = true, results = mytasks.ToList() };
            return Request.CreateResponse(returnObject);
        }
        
        [Route("api/GetMyCallList/")]
        public HttpResponseMessage GetMyCallList(int? page, int? pageSize)
        {
            List<MyTaskView> mytasks = null;
            string sortField = HttpContext.Current.Request.QueryString["sort[0][field]"];
            string sortDir = HttpContext.Current.Request.QueryString["sort[0][dir]"];
            
            string _sql_Text = "";
            //Let us check role and Decide the SQL...
            if (CurrentUser.Role == SandlerRoles.Corporate || CurrentUser.Role == SandlerRoles.Client || CurrentUser.Role == SandlerRoles.HomeOfficeAdmin)
            {
                _sql_Text = String.Format(_sql_getCorporateData, CurrentUser.UserId.ToString());
            }
            else if (CurrentUser.Role == SandlerRoles.FranchiseeOwner || CurrentUser.Role == SandlerRoles.Client)
            {
                _sql_Text = String.Format(_sql_getFrOwnerData, CurrentUser.FranchiseeID, CurrentUser.UserId.ToString());
            }
            else if (CurrentUser.Role == SandlerRoles.Coach)
            {
                _sql_Text = String.Format(_sql_getCoachData, CurrentUser.RegionID, CurrentUser.UserId.ToString());
            }
            else if (CurrentUser.Role == SandlerRoles.FranchiseeUser)
            {
                _sql_Text = String.Format(_sql_getFrUserData, CurrentUser.UserId.ToString());
            }
            string orderBy = "UniqueID";

            if (!string.IsNullOrEmpty(sortField))
                orderBy = sortField;
            if (!string.IsNullOrEmpty(sortField) && !string.IsNullOrEmpty(sortDir))
                orderBy = orderBy + " " + sortDir;

            mytasks = uow.MyTaskRepository().GetMyCallList(_sql_Text, orderBy, pageSize.Value, page.Value).ToList();
            var returnObject = new { success = true, __count = (mytasks.Count > 0) ? mytasks.FirstOrDefault().count_ : 0, results = mytasks };
            //Go back...
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

        [Route("api/GetFranchiseePersonnel")]
        [HttpGet()]
        public HttpResponseMessage GetFranchiseePersonnel()
        {
            List<FranchiseePersonnel> frPersonnels = null;
            frPersonnels = uow.MyTaskRepository().GetFranchiseePersonnel(CurrentUser.FranchiseeID).ToList();
            var returnObject = new { success = true, results = frPersonnels.ToList() };
            return Request.CreateResponse(returnObject);
        }

        [Route("api/GetCurrentUserId")]
        [HttpGet()]
        public string GetCurrentUserId()
        {
            return CurrentUser.UserId.ToString().ToUpper();
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
                //_followupItem.UserId = CurrentUser.UserId;
                _followupItem.UserId = _followupItem.UserId;
                _followupItem.CreatedOn = DateTime.Now;
                //get Id
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

        [HttpPost]
        [Route("api/MyTask/Update")]
        public genericResponse Update(Tbl_FollowUpItemsList _followupItem)
        {
            genericResponse _response;
            try
            {
                int updId = 0;
                //Now Update...
                updId = uow.MyTaskRepository().UpdateTask(_followupItem);
                _response = new genericResponse() { success = true, UniqueId = updId };
                return _response;
            }
            catch (Exception ex)
            {
                _response = new genericResponse() { success = false, message = "There is a problem in Updating Task Information. Please try again later." };
                return _response;
            }
        }
        
        [HttpPost]
        [Route("api/MyTask/UpdatePG")]
        public genericResponse UpdatePG(PerformanceGoalInformation _pgItem)
        {
            genericResponse _response;
            try
            {
                #region [[ Prepare Object and Save Data ]]
                TBL_PerformanceGoals pgItem = new TBL_PerformanceGoals();
                pgItem.Id = _pgItem.Id;
                pgItem.CallsGoal = _pgItem.CallsGoal;
                pgItem.SalesGoal = _pgItem.SalesGoal;
                pgItem.MeetingsGoal = _pgItem.MeetingsGoal;
                pgItem.Month = KnowMonthNumber(_pgItem.MonthId);
                pgItem.Year = _pgItem.YearId;
                pgItem.UserId = _pgItem.UserId;
                pgItem.IsActive = true;
                //Now Update...
                int updId = 0;
                //Now Update...
                if (pgItem.Id > 0)
                {
                    updId = uow.MyPGRepository().UpdatePG(pgItem);
                }
                else
                {
                    updId = uow.MyPGRepository().AddPG(pgItem);
                }
                #endregion
                //get response...back here...
                _response = new genericResponse() { success = true , UniqueId = updId };
                return _response;
            }
            catch (Exception ex)
            {
                _response = new genericResponse() { success = false, message = "There is a problem in Updating Performance Goal record. Please try again later." };
                return _response;
            }
        }


        #region [[ Helper classess ]]
        public class TaskDInfo
        {
            public int UniqueID { get; set; }
        }

        public static int KnowMonthNumber (string monthName)
        {
            if (monthName == "January")
            {
                return 1;
            }
            else if (monthName == "February")
            {
                return 2;
            }
            else if (monthName == "March")
            {
                return 3;
            }
            else if (monthName == "April")
            {
                return 4;
            }
            else if (monthName == "May")
            {
                return 5;
            }
            else if (monthName == "June")
            {
                return 6;
            }
            else if (monthName == "July")
            {
                return 7;
            }
            else if (monthName == "August")
            {
                return 8;
            }
            else if (monthName == "September")
            {
                return 9;
            }
            else if (monthName == "October")
            {
                return 10;
            }
            else if (monthName == "November")
            {
                return 11;
            }
            else 
            {
                return 12;
            }
        }
        
        public static string KnowMonthName(int monthId)
        {
            if (monthId == 1)
            {
                return "January";
            }
            else if (monthId == 2)
            {
                return "February";
            }
            else if (monthId == 3)
            {
                return "March";
            }
            else if (monthId == 4)
            {
                return "April";
            }
            else if (monthId == 5)
            {
                return "May";
            }
            else if (monthId == 6)
            {
                return "June";
            }
            else if (monthId == 7)
            {
                return "July";
            }
            else if (monthId == 8)
            {
                return "August";
            }
            else if (monthId == 9)
            {
                return "September";
            }
            else if (monthId == 10)
            {
                return "October";
            }
            else if (monthId == 11)
            {
                return "November";
            }
            else 
            {
                return "December";
            }
        }
        
        public class PerformanceGoalInformation
        {
            public int Id { get; set; }
            public string MonthId { get; set; }
            public string YearId { get; set; }
            public string UserId { get; set; }
            public string Year { get; set; }
            public int Month { get; set; }
            public Nullable<int> CallsGoal { get; set; }
            public Nullable<int> MeetingsGoal { get; set; }
            public Nullable<decimal> SalesGoal { get; set; }
            public string MonthText
            {
                get
                {
                    return KnowMonthName(Month); 
                }
            }
        }
        #endregion


        [HttpPost]
        [Route("api/MyTask/ArchiveDTask")]
        public genericResponse ArchiveDTask(TaskDInfo _tskInfo)
        {
            genericResponse _response;
            try
            {
                if (uow.MyTaskRepository().ArchiveDTask(_tskInfo.UniqueID))
                {
                    _response = new genericResponse() { success = true };
                    return _response;
                }
                else
                {
                    _response = new genericResponse() { success = false, message = "There is a problem Archiving this Task Record. Please try again later." };
                    return _response;
                }

            }
            catch
            {
                _response = new genericResponse() { success = false, message = "There is a problem Archiving this Task Record. Please try again later." };
                return _response;
            }
        }

        //Get Followup List item for Edit...
        public HttpResponseMessage Get(int id)
        {
            //Let us get task Info
            var data = new Tbl_FollowUpItemsList() { Id = 0 };
            if (id > 0)
            {
                data = uow.Repository<Tbl_FollowUpItemsList>().GetById(id);
            }
            return Request.CreateResponse(data);

        }

        //Get Performance Goal Item for Edit...
        public HttpResponseMessage GetPerfGoal(int id)
        {
            //Let us get Performance Goal Info
            PerformanceGoalInformation perfGoal = new PerformanceGoalInformation();
            perfGoal.Id = 0;
            var data = new TBL_PerformanceGoals() { Id = 0 };
            if (id > 0)
            {
                data = uow.Repository<TBL_PerformanceGoals>().GetById(id);
                //create...
                perfGoal.Id = data.Id;
                perfGoal.Month = Convert.ToInt32(data.Month);
                perfGoal.CallsGoal = data.CallsGoal;
                perfGoal.MeetingsGoal = data.MeetingsGoal;
                perfGoal.SalesGoal = data.SalesGoal;
                perfGoal.UserId = data.UserId;
                perfGoal.Year = data.Year;
            }
            //go back...
            return Request.CreateResponse(perfGoal);
        }
        
        #region [[ SQL Bank ]]


        #region [[ For Corporate User ]]
        //Pass UserId
        const string _sql_getCorporateData =
          @"SELECT CompaniesId as UniqueID, StartTime,
		CONVERT(DATETIME,CONVERT(varchar(10),NextContact_date,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(NextContact_date) + 1,101)) AS NextDay,
		CompanyName as Description, IsNull(DiscussionTopic,'''') as Topic,POCPhone as Phone From TBL_Companies 
		where NextContact_date is not null and DiscussionTopic is not null and DiscussionTopic != '''' and IsActive = 1
	    Union
	    Select ContactsId as UniqueID, StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),Next_Contact_date,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(Next_Contact_date) + 1,101)) AS NextDay,
	    LastName + '', '' + FirstName as Description, IsNull(DiscussionTopic,'''') as Topic,Phone as Phone 
	    from TBL_CONTACTS where Next_Contact_date is not null
	    and DiscussionTopic is not null and DiscussionTopic != '''' and IsActive = 1
	    Union
	    Select ContactsId as UniqueID,'''' as StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),BirthDay,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(BirthDay) + 1,101)) AS NextDay,
	    LastName + '', '' + FirstName as Description, 
	    (''Birthday For '' + LastName + '', '' + FirstName) as Topic,Phone as Phone 
	    from TBL_CONTACTS where BirthDay is not null and IsActive = 1
	    Union
	    Select ContactsId as UniqueID, '''' as StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),Anniversary,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(Anniversary) + 1,101)) AS NextDay,
	    LastName + '', '' + FirstName as Description, 
	    (''Anniversary For '' + LastName + '', ''+ FirstName) as Topic,Phone as Phone 
	    from TBL_CONTACTS  where Anniversary is not null and IsActive = 1
	    Union
	    Select Id as UniqueID, StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),FollowUpDate,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(FollowUpDate) + 1,101)) AS NextDay,
	    Description, 
	    IsNull(Topic,'''') as Topic, Phone 
	    from Tbl_FollowUpItemsList where UserId = '{0}' and IsActive = 1
	    and Topic is not null and Topic != '''' ";
        #endregion

        #region [[ For Coach Data ]]
        //Pass RegionId and UserId
        const string _sql_getCoachData =
          @"SELECT c.CompaniesId as UniqueID,c.StartTime as StartTime,
		CONVERT(DATETIME,CONVERT(varchar(10),c.NextContact_date,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(c.NextContact_date) + 1,101)) AS NextDay,
		c.CompanyName as Description, 
		IsNull(c.DiscussionTopic,'''') as Topic , c.POCPhone as Phone From TBL_Companies c 
		join TBL_FRANCHISEE f on c.FranchiseeId = f.ID join TBL_COACH ch on f.CoachID = ch.ID  
		where c.NextContact_date is not null and ch.RegionID = {0}
		and c.DiscussionTopic is not null 
		and f.IsActive = 1 
		and c.IsActive = 1 
		and c.DiscussionTopic != ''''
	    Union
	    Select ct.ContactsId as UniqueID, ct.StartTime as StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.Next_Contact_date,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(ct.Next_Contact_date) + 1,101)) AS NextDay,
	    ct.LastName+'', ''+ ct.FirstName as Description, 
	    IsNull(ct.DiscussionTopic,'''') as Topic, ct.Phone as Phone from TBL_CONTACTS ct
	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f 
        on c.FranchiseeId = f.ID join TBL_COACH ch on f.CoachID = ch.ID 
	    where ct.Next_Contact_date is not null and ch.RegionID = {0}
	    and ct.DiscussionTopic is not null 
	    and ct.IsActive = 1 and ct.DiscussionTopic != ''''
	    Union
	    Select c.CompaniesId as UniqueID,'''' as StartTime, 
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.BirthDay,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(ct.BirthDay) + 1,101)) AS NextDay,
	    ct.LastName+'', ''+ ct.FirstName as Description, 
	    (''Birthday For '' + ct.LastName+'', ''+ ct.FirstName) as Topic,
	    ct.Phone as Phone from TBL_CONTACTS ct
	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f 
        on c.FranchiseeId = f.ID join TBL_COACH ch on f.CoachID = ch.ID  
    	where ct.BirthDay is not null 
    	and ct.IsActive = 1 and ch.RegionID = {0}
    	Union
	    Select c.CompaniesId as UniqueID,'''' as StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.Anniversary,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(ct.Anniversary) + 1,101)) AS NextDay,
	    ct.LastName+'', ''+ ct.FirstName as Description, 
	    (''Anniversary For '' + ct.LastName+'', ''+ ct.FirstName) as Topic,
	    ct.Phone as Phone from TBL_CONTACTS ct
	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f 
        on c.FranchiseeId = f.ID join TBL_COACH ch on f.CoachID = ch.ID   
    	where ct.Anniversary is not null  
    	and ct.IsActive = 1 and ch.RegionID = {0}
    	Union
	    Select Id as UniqueID,StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),FollowUpDate,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(FollowUpDate) + 1,101)) AS NextDay,
	    Description, ISNULL(Topic,'''') as Topic, Phone from Tbl_FollowUpItemsList 
	    where UserId = ''{1}'' and IsActive = 1
	    and Topic is not null and Topic != '''' ";
        #endregion

        #region [[ For Franchisee Owner ]]
        //Pass FranchiseeId and UserId
        const string _sql_getFrOwnerData = @"SELECT c.CompaniesId as UniqueID,c.StartTime as StartTime,
        CONVERT(DATETIME,CONVERT(varchar(10),c.NextContact_date,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(c.NextContact_date) + 1,101)) AS NextDay,
        c.CompanyName as Description, 
        IsNull(c.DiscussionTopic,'''') as Topic , c.POCPhone as Phone From TBL_Companies c 
    	join TBL_FRANCHISEE f on c.FranchiseeId = f.ID where c.NextContact_date is not null 
    	and f.ID = {0}
    	and c.DiscussionTopic is not null 
    	and f.IsActive = 1 
    	and c.IsActive = 1 
    	and c.DiscussionTopic != ''''
	    Union
	    Select ct.ContactsId as UniqueID,ct.StartTime as StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.Next_Contact_date,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(ct.Next_Contact_date) + 1,101)) AS NextDay,
	    ct.LastName+'', ''+ ct.FirstName as Description, IsNull(ct.DiscussionTopic,'''') as 
        Topic,ct.Phone as Phone from TBL_CONTACTS ct
 	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f 
        on c.FranchiseeId = f.ID 
 	    where ct.Next_Contact_date is not null and f.ID = {0}
 	    and ct.DiscussionTopic is not null 
 	    and ct.IsActive = 1 and ct.DiscussionTopic != ''''
	    Union
	    Select c.CompaniesId as UniqueID,'''' as StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.BirthDay,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(ct.BirthDay) + 1,101)) AS NextDay,
	    ct.LastName+'', ''+ ct.FirstName as Description, 
	    (''Birthday For '' + ct.LastName+'', ''+ ct.FirstName) as Topic,
	    ct.Phone as Phone from TBL_CONTACTS ct
	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f 
        on c.FranchiseeId = f.ID 
	    where ct.BirthDay is not null 
	    and ct.IsActive = 1 and f.ID = {0}
	    Union
	    Select c.CompaniesId as UniqueID,'''' as StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.Anniversary,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(ct.Anniversary) + 1,101)) AS NextDay,
	    ct.LastName+'', ''+ ct.FirstName as Description, 
	    (''Anniversary For '' + ct.LastName+'', ''+ ct.FirstName) as Topic,
	    ct.Phone as Phone from TBL_CONTACTS ct
	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f 
        on c.FranchiseeId = f.ID 
	    where ct.Anniversary is not null 
	    and ct.IsActive = 1 and f.ID = {0}
	    Union
	    Select Id as UniqueID,StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),FollowUpDate,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(FollowUpDate) + 1,101)) AS NextDay,
	    Description, ISNULL(Topic,'''') as Topic, Phone 
	    from Tbl_FollowUpItemsList where UserId = ''{1}'' and IsActive = 1
	    and Topic is not null and Topic != '''' ";
        #endregion

        #region [[ For Franchisee User ]]

        //pass UserId
        const string _sql_getFrUserData = @"SELECT ct.ContactsId as UniqueID,ct.StartTime as StartTime, 
        CONVERT(DATETIME,CONVERT(varchar(10),ct.Next_Contact_date,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(ct.Next_Contact_date) + 1,101)) AS NextDay,
        ct.LastName+'', ''+ ct.FirstName as Description, IsNull(ct.DiscussionTopic,'''') as Topic,
        ct.Phone as Phone from TBL_CONTACTS ct
	    where ct.Next_Contact_date is not null and ct.CreatedBy = ''{0}''
	    and ct.DiscussionTopic is not null and 
	    ct.IsActive = 1 and ct.DiscussionTopic != ''''
	    Union
	    Select ct.ContactsId as UniqueID,'''' as StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.BirthDay,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(ct.BirthDay) + 1,101)) AS NextDay,
	    ct.LastName+'', ''+ ct.FirstName as Description, 
	    (''Birthday For '' + ct.LastName+'', ''+ ct.FirstName) as Topic,
	    ct.Phone as Phone from TBL_CONTACTS ct
 	    where ct.BirthDay is not null 
 	    and ct.IsActive = 1 and ct.CreatedBy = '{0}'
 	    Union
	    Select ct.ContactsId as UniqueID,'''' as StartTime,
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.Anniversary,101)) AS TaskDate,
		CONVERT(DATETIME,CONVERT(varchar(10),(ct.Anniversary) + 1,101)) AS NextDay,
	    ct.LastName+'', ''+ ct.FirstName as Description, 
	    (''Anniversary For '' + ct.LastName+'', ''+ ct.FirstName) as Topic,
	    ct.Phone as Phone from TBL_CONTACTS ct
	    where ct.Anniversary is not null 
	    and ct.IsActive = 1 and ct.CreatedBy = '{0}'
	    Union
 	    Select Id as UniqueID,StartTime,
 	    CONVERT(DATETIME,CONVERT(varchar(10),FollowUpDate,101)) AS TaskDate,
	    CONVERT(DATETIME,CONVERT(varchar(10),(FollowUpDate) + 1,101)) AS NextDay,
 	    Description, 
 	    ISNULL(Topic,'''') as Topic,Phone from Tbl_FollowUpItemsList 
 	    where UserId = ''{0}'' and IsActive = 1
 	    and Topic is not null and Topic != '''' ";

        #endregion


        #endregion

    }
}
