using Sandler.DB.Data.Common;
using Sandler.DB.Data.Common.Implementation;
using Sandler.DB.Data.Common.Interface;
using Sandler.DB.Data.Repositories;
using Sandler.DB.Models;
using Sandler.Web.Controllers;
using Sandler.Web.ViewModels;
using Sandler.Web.Library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Configuration;
using Sandler.Web.Models;
using System.Data.Entity;

namespace Sandler.Web.Areas.CRM.Controllers
{
    public class ContactsController : BaseController
    {
        public EntityViewModel<TBL_CONTACTS> ContactsViewModel;

        public ContactsController(IUnitOfWork uow)
            : base(uow)
        {
            ContactsViewModel = new EntityViewModel<TBL_CONTACTS>();
            ContactsViewModel.BaseModel = this.BaseVM;
        }

        public ContactsController()
            : this(new SandlerUnitOfWork(new SandlerRepositoryProvider(new RepositoryFactories()), new SandlerDBContext()))
        {
        }
        //
        // GET: /CRM/Companies/

        public ActionResult Index()
        {
            return PartialView(ContactsViewModel);
        }

        public ActionResult Manage(int? id)
        {
            if (id.HasValue)
                ContactsViewModel.EntityModel = uow.Repository<TBL_CONTACTS>().GetById(long.Parse(id.ToString()));
            else
                ContactsViewModel.EntityModel = new TBL_CONTACTS();
            return PartialView("Manage", ContactsViewModel);
        }

        public ActionResult ViewArchivedContacts()
        {
            return PartialView("ViewArchivedContacts");
        }

        public ActionResult ViewCallList()
        {
            return PartialView("ViewCallList");
        }

        public ActionResult ExportContact(bool bringArchiveRecords, int? companyId)
        {
            string sToday = String.Format("{0:yyyyMMMdd__hh_mm_ss tt}", DateTime.Now);
            string moduleName = (bringArchiveRecords) ? "Archived" : "" + "Contacts";
            //Excel Result...
            return new ExcelResult
            {
                fileName = moduleName + "_" + System.Guid.NewGuid() + "_" + sToday + ".xlsx",
                filePath = "~/Downloads/",
                sheetName = moduleName,
                clientsidefileName = moduleName + "_" + sToday + ".xlsx",
                sqlStatement = GetSQLStatement(bringArchiveRecords, companyId),
                connectionSring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString
            };
        }

        public ActionResult ExportMyCallList()
        {
            string sToday = String.Format("{0:yyyyMMMdd__hh_mm_ss tt}", DateTime.Now);
            string moduleName = "ViewCallList";
            //Excel Result...
            return new ExcelResult
            {
                fileName = moduleName + "_" + System.Guid.NewGuid() + "_" + sToday + ".xlsx",
                filePath = "~/Downloads/",
                sheetName = moduleName,
                clientsidefileName = moduleName + "_" + sToday + ".xlsx",
                sqlStatement = GetCallListSQLStatement(),
                connectionSring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString
            };
        }

        //public ActionResult ExportArchivedContact()
        //{

        //    string sToday = String.Format("{0:yyyyMMMdd__hh_mm_ss tt}", DateTime.Now);
        //    string moduleName = "ArchivedContacts";

        //    return new ExcelResult
        //    {
        //        fileName = moduleName + "_" + System.Guid.NewGuid() + "_" + sToday + ".xlsx",
        //        filePath = "~/Downloads/",
        //        sheetName = moduleName,
        //        clientsidefileName = moduleName + "_" + sToday + ".xlsx",
        //        sqlStatement = GetSQLStatement(false),
        //        connectionSring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString
        //    };

        //}

        public string GetSQLStatement(bool bringArchiveRecords, int? companyId)
        {
            //Get the Current User
            UserModel CurrentUser = BaseVM.CurrentUser;
            string query = "";
            string whereClause = "";

            if (CurrentUser.Role == SandlerRoles.Corporate || CurrentUser.Role == SandlerRoles.SiteAdmin || CurrentUser.Role == SandlerRoles.HomeOfficeAdmin || CurrentUser.Role == SandlerRoles.HomeOfficeUser)
            {
                whereClause = whereClause + ",@userId=''";
            }
            else if (CurrentUser.Role == SandlerRoles.Coach)
            {
                if (CurrentUser.CoachID > 0)
                    whereClause = whereClause + ",@coachId=" + CurrentUser.CoachID;
            }
            else if (CurrentUser.Role == SandlerRoles.FranchiseeOwner || CurrentUser.Role == SandlerRoles.Client)
            {
                if (CurrentUser.FranchiseeID > 0)
                    whereClause = whereClause + ",@franchiseeId=" + CurrentUser.FranchiseeID;
            }
            else
                whereClause = whereClause + ",@userId=" + CurrentUser.UserId.ToString();

            if (companyId.HasValue)
                whereClause = whereClause + ",@companyId=" + companyId.Value;

            //Set PageSize and PageNo as 0 because we want all records
            if (!bringArchiveRecords)
            {
                query = string.Format("exec [sp_ContactView] @orderBy='{0}' ,@pageSize={1},@pageNo={2}{3}"
                , "LASTNAME ASC", 0, 0, whereClause);
            }
            else
            {
                query = string.Format("exec [sp_ArchiveContactView] @orderBy='{0}' ,@pageSize={1},@pageNo={2}{3}"
                , "LASTNAME ASC", 0, 0, whereClause);
            }

            //return
            return query;
        }

        /*  public string GetSQLStatement(int companyId)
        {
            string whereClause = "";
            if (companyId > 0)
                whereClause = whereClause + ", @companyId=" + companyId;


            return string.Format("exec [sp_ContactView] @orderBy='{0}' ,@pageSize={1},@pageNo={2}{3}"
                , "LASTNAME ASC", 0, 0, whereClause);
        }
       * */

        public string GetCallListSQLStatement()
        {
            string _sql_Text = "";
            //Let us check role and Decide the SQL...
            if (BaseVM.CurrentUser.Role == SandlerRoles.Corporate || BaseVM.CurrentUser.Role == SandlerRoles.Client || BaseVM.CurrentUser.Role == SandlerRoles.HomeOfficeAdmin)
            {
                _sql_Text = String.Format(_sql_getCorporateData, BaseVM.CurrentUser.UserId.ToString());
            }
            else if (BaseVM.CurrentUser.Role == SandlerRoles.FranchiseeOwner || BaseVM.CurrentUser.Role == SandlerRoles.Client)
            {
                _sql_Text = String.Format(_sql_getFrOwnerData, BaseVM.CurrentUser.FranchiseeID, BaseVM.CurrentUser.UserId.ToString());
            }
            else if (BaseVM.CurrentUser.Role == SandlerRoles.Coach)
            {
                _sql_Text = String.Format(_sql_getCoachData, BaseVM.CurrentUser.RegionID, BaseVM.CurrentUser.UserId.ToString());
            }
            else if (BaseVM.CurrentUser.Role == SandlerRoles.FranchiseeUser)
            {
                _sql_Text = String.Format(_sql_getFrUserData, BaseVM.CurrentUser.UserId.ToString());
            }
            //go back....
            return _sql_Text;
        }

        #region [[ SQL Bank ]]

        #region [[ For Corporate User ]]
        //Pass UserId
        const string _sql_getCorporateData =
          @"SELECT 
		CONVERT(DATETIME,CONVERT(varchar(10),NextContact_date,101)) AS TaskDate,
		CompanyName as Description, IsNull(DiscussionTopic,'') as Topic,POCPhone as Phone From TBL_Companies 
		where NextContact_date is not null and DiscussionTopic is not null and DiscussionTopic != '' and IsActive = 1
	    Union
	    Select 
	    CONVERT(DATETIME,CONVERT(varchar(10),Next_Contact_date,101)) AS TaskDate,
		LastName + ', ' + FirstName as Description, IsNull(DiscussionTopic,'') as Topic,Phone as Phone 
	    from TBL_CONTACTS where Next_Contact_date is not null
	    and DiscussionTopic is not null and DiscussionTopic != '' and IsActive = 1
	    Union
	    Select 
	    CONVERT(DATETIME,CONVERT(varchar(10),BirthDay,101)) AS TaskDate,
		LastName + ', ' + FirstName as Description, 
	    ('Birthday For ' + LastName + ', ' + FirstName) as Topic,Phone as Phone 
	    from TBL_CONTACTS where BirthDay is not null and IsActive = 1
	    Union
	    Select 
	    CONVERT(DATETIME,CONVERT(varchar(10),Anniversary,101)) AS TaskDate,
		LastName + ', ' + FirstName as Description, 
	    ('Anniversary For ' + LastName + ', '+ FirstName) as Topic,Phone as Phone 
	    from TBL_CONTACTS  where Anniversary is not null and IsActive = 1
	    Union
	    Select 
	    CONVERT(DATETIME,CONVERT(varchar(10),FollowUpDate,101)) AS TaskDate,
		Description, 
	    IsNull(Topic,'') as Topic, Phone 
	    from Tbl_FollowUpItemsList where UserId = '{0}' and IsActive = 1
	    and Topic is not null and Topic != '' ";
        #endregion

        #region [[ For Coach Data ]]
        //Pass RegionId and UserId
        const string _sql_getCoachData =
          @"SELECT 
		CONVERT(DATETIME,CONVERT(varchar(10),c.NextContact_date,101)) AS TaskDate,
		c.CompanyName as Description, 
		IsNull(c.DiscussionTopic,'') as Topic , c.POCPhone as Phone From TBL_Companies c 
		join TBL_FRANCHISEE f on c.FranchiseeId = f.ID join TBL_COACH ch on f.CoachID = ch.ID  
		where c.NextContact_date is not null and ch.RegionID = {0}
		and c.DiscussionTopic is not null 
		and f.IsActive = 1 
		and c.IsActive = 1 
		and c.DiscussionTopic != ''
	    Union
	    Select 
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.Next_Contact_date,101)) AS TaskDate,
		ct.LastName+', '+ ct.FirstName as Description, 
	    IsNull(ct.DiscussionTopic,'') as Topic, ct.Phone as Phone from TBL_CONTACTS ct
	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f 
        on c.FranchiseeId = f.ID join TBL_COACH ch on f.CoachID = ch.ID 
	    where ct.Next_Contact_date is not null and ch.RegionID = {0}
	    and ct.DiscussionTopic is not null 
	    and ct.IsActive = 1 and ct.DiscussionTopic != ''
	    Union
	    Select 
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.BirthDay,101)) AS TaskDate,
		ct.LastName+', '+ ct.FirstName as Description, 
	    ('Birthday For ' + ct.LastName+', '+ ct.FirstName) as Topic,
	    ct.Phone as Phone from TBL_CONTACTS ct
	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f 
        on c.FranchiseeId = f.ID join TBL_COACH ch on f.CoachID = ch.ID  
    	where ct.BirthDay is not null 
    	and ct.IsActive = 1 and ch.RegionID = {0}
    	Union
	    Select 
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.Anniversary,101)) AS TaskDate,
		ct.LastName+', '+ ct.FirstName as Description, 
	    ('Anniversary For ' + ct.LastName+', '+ ct.FirstName) as Topic,
	    ct.Phone as Phone from TBL_CONTACTS ct
	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f 
        on c.FranchiseeId = f.ID join TBL_COACH ch on f.CoachID = ch.ID   
    	where ct.Anniversary is not null  
    	and ct.IsActive = 1 and ch.RegionID = {0}
    	Union
	    Select 
	    CONVERT(DATETIME,CONVERT(varchar(10),FollowUpDate,101)) AS TaskDate,
		Description, ISNULL(Topic,'') as Topic, Phone from Tbl_FollowUpItemsList 
	    where UserId = '{1}' and IsActive = 1
	    and Topic is not null and Topic != '' ";
        #endregion

        #region [[ For Franchisee Owner ]]
        //Pass FranchiseeId and UserId
        const string _sql_getFrOwnerData = @"SELECT 
        CONVERT(DATETIME,CONVERT(varchar(10),c.NextContact_date,101)) AS TaskDate,
		c.CompanyName as Description, 
        IsNull(c.DiscussionTopic,'') as Topic , 
        c.POCPhone as Phone From TBL_Companies c 
    	join TBL_FRANCHISEE f on c.FranchiseeId = f.ID where c.NextContact_date is not null 
    	and f.ID = {0}
    	and c.DiscussionTopic is not null 
    	and f.IsActive = 1 
    	and c.IsActive = 1 
    	and c.DiscussionTopic != ''
	    Union
	    Select 
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.Next_Contact_date,101)) AS TaskDate,
		ct.LastName+', '+ ct.FirstName as Description, IsNull(ct.DiscussionTopic,'') as 
        Topic,ct.Phone as Phone from TBL_CONTACTS ct
 	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f 
        on c.FranchiseeId = f.ID 
 	    where ct.Next_Contact_date is not null and f.ID = {0}
 	    and ct.DiscussionTopic is not null 
 	    and ct.IsActive = 1 and ct.DiscussionTopic != ''
	    Union
	    Select 
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.BirthDay,101)) AS TaskDate,
		ct.LastName+', '+ ct.FirstName as Description, 
	    ('Birthday For ' + ct.LastName+', '+ ct.FirstName) as Topic,
	    ct.Phone as Phone from TBL_CONTACTS ct
	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f 
        on c.FranchiseeId = f.ID 
	    where ct.BirthDay is not null 
	    and ct.IsActive = 1 and f.ID = {0}
	    Union
	    Select 
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.Anniversary,101)) AS TaskDate,
		ct.LastName+', '+ ct.FirstName as Description, 
	    ('Anniversary For ' + ct.LastName+', '+ ct.FirstName) as Topic,
	    ct.Phone as Phone from TBL_CONTACTS ct
	    join TBL_COMPANIES c on ct.COMPANYID = c.COMPANIESID join TBL_FRANCHISEE f 
        on c.FranchiseeId = f.ID 
	    where ct.Anniversary is not null 
	    and ct.IsActive = 1 and f.ID = {0}
	    Union
	    Select 
	    CONVERT(DATETIME,CONVERT(varchar(10),FollowUpDate,101)) AS TaskDate,
		Description, ISNULL(Topic,'') as Topic, Phone 
	    from Tbl_FollowUpItemsList where UserId = '{1}' and IsActive = 1
	    and Topic is not null and Topic != '''' ";
        #endregion

        #region [[ For Franchisee User ]]

        //pass UserId
        const string _sql_getFrUserData = @"SELECT 
        CONVERT(DATETIME,CONVERT(varchar(10),ct.Next_Contact_date,101)) AS TaskDate,
		ct.LastName+', '+ ct.FirstName as Description, IsNull(ct.DiscussionTopic,'') as Topic,
        ct.Phone as Phone from TBL_CONTACTS ct
	    where ct.Next_Contact_date is not null and ct.CreatedBy = '{0}'
	    and ct.DiscussionTopic is not null and 
	    ct.IsActive = 1 and ct.DiscussionTopic != ''
	    Union
	    Select 
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.BirthDay,101)) AS TaskDate,
		ct.LastName+', '+ ct.FirstName as Description, 
	    ('Birthday For ' + ct.LastName+', '+ ct.FirstName) as Topic,
	    ct.Phone as Phone from TBL_CONTACTS ct
 	    where ct.BirthDay is not null 
 	    and ct.IsActive = 1 and ct.CreatedBy = '{0}'
 	    Union
	    Select 
	    CONVERT(DATETIME,CONVERT(varchar(10),ct.Anniversary,101)) AS TaskDate,
		ct.LastName+', '+ ct.FirstName as Description, 
	    ('Anniversary For ' + ct.LastName+', '+ ct.FirstName) as Topic,
	    ct.Phone as Phone from TBL_CONTACTS ct
	    where ct.Anniversary is not null 
	    and ct.IsActive = 1 and ct.CreatedBy = '{0}'
	    Union
 	    Select 
 	    CONVERT(DATETIME,CONVERT(varchar(10),FollowUpDate,101)) AS TaskDate,
	    Description, 
 	    ISNULL(Topic,'') as Topic,Phone from Tbl_FollowUpItemsList 
 	    where UserId = '{0}' and IsActive = 1
 	    and Topic is not null and Topic != '' ";

        #endregion

        #endregion

    }
}
