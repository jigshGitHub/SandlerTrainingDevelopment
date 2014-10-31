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
using System.Configuration;
using System.Net.Mail;
using System.IO;
using System.Net.Mime;
using System.Data;
using System.Web.UI.WebControls;


namespace Sandler.Web.Controllers.API
{
    public class EmailController : BaseApiController
    {
        DataSet ds;
        List<EmailAddressInfo> emailAdrsInfo = null;
        string _coachIds = "";
        string _frOwnerIds = "";
        string _frUsersIds = "";
        string _frContactsIds = "";

        public EmailController(IUnitOfWork uow) :base(uow)
        {
            
        }

        public EmailController() : base()
        {
        }

        #region [[ Support Methods...]]
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
        
        private string GetSelectedList(List<EmailGroups> grps)
        {
            string _listAddresses = "";
            foreach (EmailGroups beg in grps)
            {
                if (beg.IsSelected)
                {
                    if (_listAddresses.Length > 0)
                    {
                        //Continue to add more
                        _listAddresses = _listAddresses + "','" + beg.Id.Trim();
                    }
                    else
                    {
                        //Add for the first time
                        _listAddresses = beg.Id.Trim();
                    }
                }
            }
            //return the list for this Checkbox list
            return _listAddresses;
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
        
        public MailMessage AddAddresses(List<EmailAddressInfo> EmailAdrsses, MailMessage msg)
        {
            if (EmailAdrsses != null && EmailAdrsses.Count > 0)
            {
                foreach (EmailAddressInfo em in EmailAdrsses)
                {
                    //Add Address as BCC
                    if (Validation.ValidateEmail(em.Email.ToString().Trim()))
                    {
                        msg.Bcc.Add(new MailAddress(em.Email.ToString().Trim()));
                    }
                }
            }
            //send the Message object back
            return msg;
        }
        #endregion
        
        [HttpPost]
        [Route("api/Email/SaveEmailGroupNow")]
        public genericResponse Save(CreateEmailGroupInfo createGrpInfo)
        {
            genericResponse _response;
            try
            {
                #region [[ Basic Check Here...]]

                if (createGrpInfo != null
                    && !string.IsNullOrEmpty(createGrpInfo.GRPNAME)
                    //Receipient(s) Selections...
                    && (CheckRecipientsExist(createGrpInfo.frcontactEmails)
                    || CheckRecipientsExist(createGrpInfo.frownerEmails)
                    || CheckRecipientsExist(createGrpInfo.fruserEmails)
                    || CheckRecipientsExist(createGrpInfo.frcoachEmails)))
                {
                    //Now we are good so go ahead and save this Group details....
                    _coachIds = GetSelectedList(createGrpInfo.frcoachEmails);
                    _frOwnerIds = GetSelectedList(createGrpInfo.frownerEmails);
                    _frUsersIds = GetSelectedList(createGrpInfo.fruserEmails);
                    _frContactsIds = GetSelectedListSpl(createGrpInfo.frcontactEmails);
                    //Now go ahead and add the group...
                    if (uow.EmailRepository().AddEmailUserGroup(createGrpInfo.GRPNAME, _coachIds, _frOwnerIds, _frUsersIds, _frContactsIds, CurrentUser.UserId.ToString()))
                    {
                        _response = new genericResponse() { success = true };
                    }
                    else
                    {
                        _response = new genericResponse() { success = false, message = "There is a problem in sending the Email message. Please try again later." };
                    }
                }
                else
                {
                    _response = new genericResponse() { success = false, message = "Please select at least one group to be included as Recipient(s) in this Email group to continue." };
                }
                #endregion
                //Go Back...                                
                return _response;
            }
            catch (Exception ex)
            {
                _response = new genericResponse() { success = false, message = "There is a problem in sending the Email message. Please try again later." };
                return _response;
            }
        }
                        
        [HttpPost]
        [Route("api/Email/SendEmailNow")]
        public genericResponse Save(SendEmailInfo emailInfo)
        {
            genericResponse _response;
            try
            {
                #region [[ Basic Check Here...]]
                if (emailInfo != null 
                    && !string.IsNullOrEmpty(emailInfo.SUBJECT) 
                    && !string.IsNullOrEmpty(emailInfo.MESSAGE) 
                    //To Address Option....
                    && (!string.IsNullOrEmpty(emailInfo.RCPNTS) || CheckRecipientsExist(emailInfo.userEmailGroups) || CheckRecipientsExist(emailInfo.blastEmailGroups)))
                {
                    #region [[ Continue as we are good...]]
                    bool IsMessageSent = false;
                    string _file_path = "";
                    var sendEmails = Convert.ToBoolean(ConfigurationManager.AppSettings["General.SendBlastEmails"]);
                    //Let us gather Information for sending Email out...
                    var client = new SmtpClient();
                    if (Convert.ToBoolean(ConfigurationManager.AppSettings["Server.UseDefaultCredentials"].ToString()))
                        client.UseDefaultCredentials = true;
                    client.Host = ConfigurationManager.AppSettings["Server.Hostname"].ToString();// "smtp.cso.local";
                    client.Port = int.Parse(ConfigurationManager.AppSettings["Server.Port"].ToString());//25;
                    //client.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis;
                    if (Convert.ToBoolean(ConfigurationManager.AppSettings["Server.CredentialsRequired"].ToString()))
                        client.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["Server.Username"].ToString(), ConfigurationManager.AppSettings["Server.Password"].ToString());
                    //Now set up MailMessage
                    MailMessage message = new MailMessage();
                    message.IsBodyHtml = true;
                    //From Address
                    if (Convert.ToBoolean(ConfigurationManager.AppSettings["Server.CredentialsRequired"].ToString()))
                    {
                        message.From = new MailAddress("donotreply@gmail.com");
                    }
                    else
                    {
                        message.From = new MailAddress(CurrentUser.EmailAdress);
                    }
                    //Subject
                    message.Subject = emailInfo.SUBJECT.Trim();
                    message.Body = emailInfo.MESSAGE.Trim().Replace("\r\n", "<br/>").Replace(" ", "&nbsp;");
                    //Set To Address as From by default
                    message.To.Add(message.From);
                    //For Entered Email Addresses
                    if (!string.IsNullOrEmpty(emailInfo.RCPNTS))
                    {
                        //We also have email address entered here
                        string[] receiverAddress = emailInfo.RCPNTS.Trim().Split(',');
                        foreach (string address in receiverAddress)
                        {
                            //Add Address as To
                            if (Validation.ValidateEmail(address.Trim()))
                            {
                                message.To.Add(new MailAddress(address.Trim()));
                            }
                        }
                    }
                    //For Blast Email Groups....
                    foreach (EmailGroups beg in emailInfo.blastEmailGroups)
                    {
                        if (beg.IsSelected)
                        {
                            //This group is selected so let us get Email Addresses and add them as BCC
                            switch (beg.name)
                            {
                                case "All Coach":
                                    emailAdrsInfo = uow.EmailRepository().GetAllCoachAddresses().ToList();
                                    message = AddAddresses(emailAdrsInfo, message);
                                    break;
                                case "All Franchisee Owners":
                                    emailAdrsInfo = null;
                                    emailAdrsInfo = uow.EmailRepository().GetAllFranchiseeAddresses("FranchiseeOwner").ToList();
                                    message = AddAddresses(emailAdrsInfo, message);
                                    break;
                                case "Franchisee Owner":
                                    emailAdrsInfo = null;
                                    emailAdrsInfo = uow.EmailRepository().GetFranchiseeAddresses("FranchiseeOwner", CurrentUser.FranchiseeID).ToList();
                                    message = AddAddresses(emailAdrsInfo, message);
                                    break;
                                case "All Franchisee Users":
                                    emailAdrsInfo = null;
                                    emailAdrsInfo = uow.EmailRepository().GetAllFranchiseeAddresses("FranchiseeUser").ToList();
                                    message = AddAddresses(emailAdrsInfo, message);
                                    break;
                                case "Franchisee Users":
                                    emailAdrsInfo = null;
                                    emailAdrsInfo = uow.EmailRepository().GetFranchiseeAddresses("FranchiseeUser", CurrentUser.FranchiseeID).ToList();
                                    message = AddAddresses(emailAdrsInfo, message);
                                    break;
                                case "All Franchisee Contacts":
                                case "Franchisee Contacts":
                                    int FrId;
                                    emailAdrsInfo = null;
                                    if ((CurrentUser.Role == SandlerRoles.Corporate) || (CurrentUser.Role == SandlerRoles.SiteAdmin))
                                    {
                                        FrId = 0;
                                    }
                                    else
                                    {
                                        FrId = CurrentUser.FranchiseeID;
                                    }
                                    emailAdrsInfo = uow.EmailRepository().GetAllContactsAddresses(FrId).ToList();
                                    message = AddAddresses(emailAdrsInfo, message);
                                    break;
                                default:
                                    break;
                            }
                        }
                    }
                    //For User Grooup if any selected .....
                    foreach (EmailGroups usrg in emailInfo.userEmailGroups)
                    {
                        if (usrg.IsSelected)
                        {
                            emailAdrsInfo = null;
                            emailAdrsInfo = uow.EmailRepository().GetUserEmailGroupAddresses(Convert.ToInt32(usrg.Id)).ToList();
                            message = AddAddresses(emailAdrsInfo, message);
                        }
                    }
                    //For Attachement...
                    if (!string.IsNullOrEmpty(emailInfo.FILENAMES))
                    {
                        //Now save the file in the tmp folder
                        _file_path = System.Web.Hosting.HostingEnvironment.MapPath("~");
                        _file_path += "Uploads\\" + emailInfo.FILENAMES;

                        using (System.IO.FileStream fileStream = new System.IO.FileStream(_file_path, System.IO.FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
                        {
                            System.Net.Mail.Attachment _attachment = new System.Net.Mail.Attachment(fileStream, emailInfo.FILENAME, MediaTypeNames.Application.Octet);
                            // Add time stamp information for the file.
                            ContentDisposition disposition = _attachment.ContentDisposition;
                            disposition.CreationDate = System.IO.File.GetCreationTime(_file_path);
                            disposition.ModificationDate = System.IO.File.GetLastWriteTime(_file_path);
                            disposition.ReadDate = System.IO.File.GetLastAccessTime(_file_path);
                            // Add the file attachment to this e-mail message.
                            message.Attachments.Add(_attachment);

                            //Send the message with Attachment
                            if (sendEmails)
                            {
                                client.Timeout = 30000000;
                                client.Send(message);
                                IsMessageSent = true;
                            }
                        }
                        //Now delete attachment
                        File.Delete(_file_path);
                    }
                    //Send the message for non-Attachment Messages...
                    if (sendEmails && !IsMessageSent)
                    {
                        client.Timeout = 30000000;
                        client.Send(message);
                    }
                    _response = new genericResponse() { success = true };
                    #endregion
                }
                else
                {
                    _response = new genericResponse() { success = false, message = "Recipient is missing. Either enter email address or select group from the list to proceed." };
                }
                #endregion
                //Back
                return _response;
            }
            catch (Exception ex)
            {
                _response = new genericResponse() { success = false, message = "There is a problem in sending the Email message. Please try again later." };
                return _response;
            }
        }
                
        [Route("api/GetBlastEmailGroupByRole")]
        [HttpGet()]
        public HttpResponseMessage GetBlastEmailGroupByRole()
        {
            List<TBL_BlastEmailGroup> blastEmailGroups = null;
            blastEmailGroups = uow.EmailRepository().GetBlastEmailGroups(CurrentUser.Role.ToString()).ToList();
            var returnObject = new { success = true, results = blastEmailGroups.ToList() };
            return Request.CreateResponse(returnObject);
        }

        [Route("api/GetUserEmailGroups")]
        [HttpGet()]
        public HttpResponseMessage GetUserEmailGroups()
        {
            List<TBL_UserEmailGroup> usrEmailGroups = null;
            usrEmailGroups = uow.EmailRepository().GetUserEmailGroups(CurrentUser.UserId.ToString()).ToList();
            var returnObject = new { success = true, results = usrEmailGroups.ToList() };
            return Request.CreateResponse(returnObject);
        }

        [Route("api/GetFranchiseeName")]
        [HttpGet()]
        public string GetFranchiseeName()
        {
            //Get Current Franchisee Name...
            if (CurrentUser != null && !string.IsNullOrEmpty(CurrentUser.FranchiseeName))
            {
                return CurrentUser.FranchiseeName;
            }
            return "";
        }
        
        [Route("api/GetCoachEmailInfo")]
        [HttpGet()]
        public HttpResponseMessage GetCoachEmailInfo()
        {
            List<CoachEmailInfo> coachInfo = null;
            coachInfo = uow.EmailRepository().GetAllCoachAddressesByFrId(CurrentUser.FranchiseeID).ToList();
            var returnObject = new { success = true, results = coachInfo.ToList() };
            return Request.CreateResponse(returnObject);
        }

        [Route("api/FrOwnerAdrsInfo")]
        [HttpGet()]
        public HttpResponseMessage FrOwnerAdrsInfo()
        {
            List<FranchiseeEmailInfo> frownerInfo = null;
            frownerInfo = uow.EmailRepository().GetAllFranchiseeAddressesByFrId(SandlerRoles.FranchiseeOwner.ToString(),CurrentUser.FranchiseeID).ToList();
            var returnObject = new { success = true, results = frownerInfo.ToList() };
            return Request.CreateResponse(returnObject);
        }

        [Route("api/FrUsersAdrsInfo")]
        [HttpGet()]
        public HttpResponseMessage FrUsersAdrsInfo()
        {
            List<FranchiseeEmailInfo> frusersInfo = null;
            frusersInfo = uow.EmailRepository().GetAllFranchiseeAddressesByFrId(SandlerRoles.FranchiseeUser.ToString(), CurrentUser.FranchiseeID).ToList();
            var returnObject = new { success = true, results = frusersInfo.ToList() };
            return Request.CreateResponse(returnObject);
        }

        [Route("api/FrContactsAdrsInfo")]
        [HttpGet()]
        public HttpResponseMessage FrContactsAdrsInfo()
        {
            List<ContactEmailInfo> frctInfo = null;
            frctInfo = uow.EmailRepository().GetAllContactsAddressesByFrId(CurrentUser.FranchiseeID).ToList();
            var returnObject = new { success = true, results = frctInfo.ToList() };
            return Request.CreateResponse(returnObject);
        }
        
    }
}
