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
    public class AceMainController : BaseApiController
    {
        List<EmailAddressInfo> emailAdrsInfo = null;
        public AceMainController(IUnitOfWork uow) :base(uow)
        {
            
        }

        public AceMainController() : base()
        {
        }

        [Route("api/AceMainView/")]
        public HttpResponseMessage GetAceMainView(string searchText, int? page, int? pageSize, bool selectForExcel, int? coachId = null, int? franchiseeId = null)
        {
            List<AceMainView> aceviews = null;

            string sortField = HttpContext.Current.Request.QueryString["sort[0][field]"];
            string sortDir = HttpContext.Current.Request.QueryString["sort[0][dir]"];

            string orderBy = "CampaignName ASC";
            if (!string.IsNullOrEmpty(sortField))
                orderBy = sortField;
            if (!string.IsNullOrEmpty(sortField) && !string.IsNullOrEmpty(sortDir))
                orderBy = orderBy + " " + sortDir;

            if (!coachId.HasValue && !franchiseeId.HasValue && CurrentUser.Role == SandlerRoles.Coach)
                coachId = CurrentUser.CoachID;
            if (!coachId.HasValue && !franchiseeId.HasValue && (CurrentUser.Role == SandlerRoles.FranchiseeOwner || CurrentUser.Role == SandlerRoles.FranchiseeUser))
                franchiseeId = CurrentUser.FranchiseeID;

            aceviews = uow.AceMainRepository().Get(searchText, orderBy, pageSize.Value, page.Value, coachId, franchiseeId, selectForExcel).ToList();
            var returnObject = new { success = true, __count = (aceviews.Count > 0) ? aceviews.FirstOrDefault().TotalCount : 0, results = aceviews };
            return Request.CreateResponse(returnObject);

        }

        [Route("api/ArchiveCampaignView/")]
        public HttpResponseMessage GetArchiveCampaignView(string searchText, int? page, int? pageSize, bool selectForExcel, int? coachId = null, int? franchiseeId = null)
        {
            List<AceMainView> aceviews = null;

            string sortField = HttpContext.Current.Request.QueryString["sort[0][field]"];
            string sortDir = HttpContext.Current.Request.QueryString["sort[0][dir]"];

            string orderBy = "CampaignName ASC";
            if (!string.IsNullOrEmpty(sortField))
                orderBy = sortField;
            if (!string.IsNullOrEmpty(sortField) && !string.IsNullOrEmpty(sortDir))
                orderBy = orderBy + " " + sortDir;

            if (!coachId.HasValue && !franchiseeId.HasValue && CurrentUser.Role == SandlerRoles.Coach)
                coachId = CurrentUser.CoachID;
            if (!coachId.HasValue && !franchiseeId.HasValue && (CurrentUser.Role == SandlerRoles.FranchiseeOwner || CurrentUser.Role == SandlerRoles.FranchiseeUser))
                franchiseeId = CurrentUser.FranchiseeID;

            aceviews = uow.AceMainRepository().GetArchive(searchText, orderBy, pageSize.Value, page.Value, coachId, franchiseeId, selectForExcel).ToList();
            var returnObject = new { success = true, __count = (aceviews.Count > 0) ? aceviews.FirstOrDefault().TotalCount : 0, results = aceviews };
            return Request.CreateResponse(returnObject);

        }
        
        [HttpPost]
        [Route("api/AceMain/Archive")]
        public genericResponse ArchiveCampaign(Tbl_AceMainInfo _campaign)
        {
            genericResponse _response;
            try
            {
                if (uow.AceMainRepository().ArchiveCampaign(_campaign.AceId, CurrentUser.UserId.ToString()))
                {
                    _response = new genericResponse() { success = true };
                    return _response;
                }
                else
                {
                    _response = new genericResponse() { success = false, message = "There is a problem Archiving this Campaign Record. Please try again later." };
                    return _response;
                }

            }
            catch
            {
                _response = new genericResponse() { success = false, message = "There is a problem Archiving this Campaign Record. Please try again later." };
                return _response;
            }

        }

        [HttpPost]
        [Route("api/AceMain/UnArchive")]
        public genericResponse UnArchiveCampaign(Tbl_AceMainInfo _campaign)
        {
            genericResponse _response;
            try
            {
                if (uow.AceMainRepository().UnArchiveCampaign(_campaign.AceId, CurrentUser.UserId.ToString()))
                {
                    _response = new genericResponse() { success = true };
                    return _response;
                }
                else
                {
                    _response = new genericResponse() { success = false, message = "There is a problem Unarchiving this Campaign Record. Please try again later." };
                    return _response;
                }

            }
            catch
            {
                _response = new genericResponse() { success = false, message = "There is a problem Unarchiving this Campaign Record. Please try again later." };
                return _response;
            }

        }
        
        [Route("api/GetCampaignTypeOptions")]
        [HttpGet()]
        public HttpResponseMessage GetCampaignTypeOptions()
        {
            List<Tbl_AceCampaignType> cmpgTypes = null;
            cmpgTypes = uow.AceMainRepository().GetCampaignTypeOptions().ToList();
            var returnObject = new { success = true, results = cmpgTypes.ToList() };
            return Request.CreateResponse(returnObject);
        }

        [Route("api/GetCallToActionTypeOptions")]
        [HttpGet()]
        public HttpResponseMessage GetCallToActionTypeOptions()
        {
            List<Tbl_AceCallToActionType> callToActionTypes = null;
            callToActionTypes = uow.AceMainRepository().GetCallToActionTypeOptions().ToList();
            var returnObject = new { success = true, results = callToActionTypes.ToList() };
            return Request.CreateResponse(returnObject);
        }

        public HttpResponseMessage Get(int id)
        {
            //Let us Initiate the model with UniqueId and the Franchisee Id
            var data = new Tbl_AceMainInfo() { AceId = 0, FranchiseeId = CurrentUser.FranchiseeID };
            if (id > 0)
            {
                data = uow.Repository<Tbl_AceMainInfo>().GetById(id);
            }
            return Request.CreateResponse(data);
        }

        #region [[ Support Methods ]]
        
        public bool CheckRecipientsExist(List<EmailGroups> grps)
        {
            bool rExists = false;
            foreach (EmailGroups beg in grps)
            {
                if (beg.IsSelected)
                    rExists = true;
            }
            return rExists;
        }

        private string GetSelectedListSpl(List<EmailGroups> grps)
        {
            string _listAddresses = "";
            foreach (EmailGroups beg in grps)
            {
                if (beg.IsSelected)
                {
                    if (_listAddresses.Length > 0)
                    {
                        //Continue to add more
                        _listAddresses = _listAddresses + "," + Convert.ToInt32(beg.Id);
                    }
                    else
                    {
                        //Add for the first time
                        _listAddresses = beg.Id;
                    }
                }
            }
            //return the list for this Checkbox list
            return _listAddresses;
           
        }

        public static class Validation
        {
            public const string EmailStandard = @"^[a-zA-Z0-9._-]+@([a-zA-Z0-9.-]+\.)+[a-zA-Z0-9.-]{2,4}$";
            public static bool ValidateEmail(string emailID)
            {
                if (emailID != null)
                    return System.Text.RegularExpressions.Regex.IsMatch(emailID, EmailStandard);
                else
                    return false;
            }
        }

        private int CountOutBoundNumber(CampaignInformation cmpgInfo)
        {

            int totalCount = 0;

            #region [[ Count Email address in Recipients field ]]
            if (!string.IsNullOrEmpty(cmpgInfo.RCPNTS))
            {
                //We also have email address entered here
                string[] receiverAddress = cmpgInfo.RCPNTS.Trim().Split(',');
                foreach (string address in receiverAddress)
                {
                    //Add Address as To
                    if (Validation.ValidateEmail(address.Trim()))
                    {
                        totalCount = totalCount + 1;
                    }
                }
            }
            #endregion

            #region [[ For User Group ]]
            //For User Grooup if any selected .....
            foreach (EmailGroups usrg in cmpgInfo.userEmailGroups)
            {
                if (usrg.IsSelected)
                {
                    emailAdrsInfo = null;
                    emailAdrsInfo = uow.EmailRepository().GetUserEmailGroupAddresses(Convert.ToInt32(usrg.Id)).ToList();

                    if (emailAdrsInfo.Count > 0)
                    {
                        foreach (EmailAddressInfo em in emailAdrsInfo)
                        {
                            //Add Address as BCC
                            if (Validation.ValidateEmail(em.Email.ToString().Trim()))
                            {
                                totalCount = totalCount + 1;
                            }
                        }
                    }


                }
            }
            #endregion

            //return the count
            return totalCount;
        }

        #endregion

        [HttpPost]
        [Route("api/AceMain/SaveCampaign")]
        public genericResponse Save(CampaignInformation cmpgInfo)
        {
            genericResponse _response;
            int aceId = cmpgInfo.AceId;
                        
            try
            {
                if (cmpgInfo != null
                    && !string.IsNullOrEmpty(cmpgInfo.CAMPGNAME)
                    && !string.IsNullOrEmpty(cmpgInfo.CAMPGPURPOSE)
                    && !string.IsNullOrEmpty(cmpgInfo.MSGSUBJECT)
                    && !string.IsNullOrEmpty(cmpgInfo.MESSAGE)
                    && cmpgInfo.MSGNO != null
                    && cmpgInfo.EVENTDATE != null
                    && cmpgInfo.DAYSFROMEVENT != null
                    //To Address Option....
                    && (!string.IsNullOrEmpty(cmpgInfo.RCPNTS) || CheckRecipientsExist(cmpgInfo.userEmailGroups)))
                {
                    
                    //Crate object for Ace Main Info and Save it first....
                    Tbl_AceMainInfo aceMain = new Tbl_AceMainInfo();
                    if(cmpgInfo.AceId > 0 )
                        aceMain.AceId = cmpgInfo.AceId;
                    aceMain.CampaignName = cmpgInfo.CAMPGNAME;
                    aceMain.EventDate = cmpgInfo.EVENTDATE;
                    aceMain.CampaignTypeId = cmpgInfo.CampaignTypeId;
                    aceMain.CampaignPurpose = cmpgInfo.CAMPGPURPOSE;
                    aceMain.MessageNumber = cmpgInfo.MSGNO;
                    aceMain.DaysFromEvent = cmpgInfo.DAYSFROMEVENT;
                    aceMain.MessageSubject = cmpgInfo.MSGSUBJECT;
                    aceMain.ResponseTo = cmpgInfo.UserId;
                    aceMain.MessageText = cmpgInfo.MESSAGE;
                    aceMain.CreatedDate = DateTime.Now;
                    aceMain.CreatedBy = CurrentUser.UserId.ToString();
                    aceMain.Recipients = cmpgInfo.RCPNTS;
                    aceMain.FranchiseeId = CurrentUser.FranchiseeID;
                    aceMain.IsActive = true;
                    aceMain.EmailGroupIds = GetSelectedListSpl(cmpgInfo.userEmailGroups);
                    aceMain.CallToActionId = cmpgInfo.CallToActionId;
                    aceMain.MessageSentDate = null;//as we are creating new campaign..
                    aceMain.AttachFileName = !string.IsNullOrEmpty(cmpgInfo.FILENAMES) ? cmpgInfo.FILENAMES : "";
                    aceMain.TotalCountOutBound = CountOutBoundNumber(cmpgInfo);
                    aceMain.TotalCountConfirm = 0;//as we are creating new campaign..
                    //Now Save it...and get the unique Id back...
                    if (cmpgInfo.AceId > 0)
                        aceId = uow.AceMainRepository().UpdateCampaign(aceMain);
                    else
                        aceId = uow.AceMainRepository().AddCampaign(aceMain);
                    //create Response...
                    _response = new genericResponse() { success = true, UniqueId = aceId };
                }
                else
                {
                    _response = new genericResponse() { success = false, message = "Recipient is missing. Either enter email address or select group from the list to proceed." };
                }
                
                //Back
                return _response;
            }
            catch (Exception ex)
            {
                _response = new genericResponse() { success = false, message = "There is a problem in Saving Camopaign. Please try again later. " + ex.Message };
                return _response;
            }
        }
                
    }
}
