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
using DDay.iCal;
using DDay.Collections;
using DDay.iCal.Serialization;
using DDay.iCal.Serialization.iCalendar;


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

        private static string CreateCalendarEvent(string title, string body, DateTime startDate, double duration, string location, string organizer, string eventId, bool allDayEvent, int recurrenceDaysInterval, int recurrenceCount, string freqType)
        {
            var iCal = new iCalendar
            {
                Method = "PUBLISH", //PUBLISH 
                Version = "2.0"
            };

            //if i use method PUBLISH:  
            //if i use method REQUEST: it's an appointment, but then says meeting cannot be found in the calendar. if you click no response required, it gets deleted 

            // outlook 2003 needs this property, 
            //  or we'll get an error (a Lunar error!) 

            // Create the event       
            var evt = iCal.Create<Event>();
            evt.Summary = title;
            evt.Start = new iCalDateTime(startDate.Year,
                                         startDate.Month, startDate.Day, startDate.Hour,
                                         startDate.Minute, startDate.Second);
            evt.Duration = TimeSpan.FromHours(duration);
            evt.Description = body;
            evt.Location = location;

            evt.IsAllDay = allDayEvent;

            evt.UID = new Guid().ToString();



            if (recurrenceDaysInterval > 0)
            {
                RecurrencePattern rp = new RecurrencePattern();
                if (freqType == "Daily")
                {
                    rp.Frequency = FrequencyType.Daily;
                }
                else if (freqType == "Weekly")
                {
                    rp.Frequency = FrequencyType.Weekly;
                }
                else if (freqType == "Yearly")
                {
                    rp.Frequency = FrequencyType.Yearly;
                }
                else if (freqType == "Monthly")
                {
                    rp.Frequency = FrequencyType.Monthly;
                }
                rp.Interval = recurrenceDaysInterval; // interval of days
                rp.Count = recurrenceCount; // number of recurrence count
                evt.RecurrenceRules.Add(rp);
            }

            //organizer is mandatory for outlook 2007 - think about 
            // throwing an exception here. 
            if (!String.IsNullOrEmpty(organizer))
            {
                evt.Organizer = new Organizer(organizer);
            }
            else
            {
                throw new Exception("Organizer provided was null");
            }


            if (!String.IsNullOrEmpty(eventId))
            {
                evt.UID = eventId;
            }

            //"REQUEST" will update an existing event with the same 
            // UID (Unique ID) and a newer time stamp. 
            //if (updatePreviousEvent) 
            //{ 
            //    iCal.Method = "REQUEST"; 
            //} 

            var alarm = new Alarm
            {
                Duration = new TimeSpan(0, 15, 0),
                Trigger = new Trigger(new TimeSpan(0, 15, 0)),
                Action = AlarmAction.Display,
                Description = "Reminder"
            };

            evt.Alarms.Add(alarm);

            // Save into calendar file. 
            var serializer = new iCalendarSerializer(iCal);

            return serializer.SerializeToString(iCal);
        }
        /// <summary>
        /// This method is used when Start and End time both are supplied
        /// </summary>
        /// <param name="title"></param>
        /// <param name="body"></param>
        /// <param name="startDate"></param>
        /// <param name="endDate"></param>
        /// <param name="location"></param>
        /// <param name="organizer"></param>
        /// <param name="eventId"></param>
        /// <param name="allDayEvent"></param>
        /// <returns></returns>
        private static string CreateCalendarEvent(string title, string body, DateTime startDate, DateTime endDate, string location, string organizer, string eventId, bool allDayEvent)
        {
            var iCal = new iCalendar
            {
                Method = "PUBLISH", //PUBLISH 
                Version = "2.0"
            };
            // Create the event       
            var evt = iCal.Create<Event>();
            //Subject
            evt.Summary = title;
            //Start Time
            evt.Start = new iCalDateTime(startDate.Year,
                                         startDate.Month, startDate.Day, startDate.Hour,
                                         startDate.Minute, startDate.Second);
            //End Time
            evt.End = new iCalDateTime(endDate.Year,
                                         endDate.Month, endDate.Day, endDate.Hour,
                                         endDate.Minute, endDate.Second);
            //Description of the Event
            evt.Description = body;
            //Location for the Event
            evt.Location = location;
            //Is All Day flag
            evt.IsAllDay = allDayEvent;
            //Event Id
            evt.UID = new Guid().ToString();

            //organizer is mandatory for outlook 2007 - think about 
            // throwing an exception here. 
            if (!String.IsNullOrEmpty(organizer))
            {
                evt.Organizer = new Organizer(organizer);
            }
            else
            {
                throw new Exception("Organizer provided was null");
            }


            if (!String.IsNullOrEmpty(eventId))
            {
                evt.UID = eventId;
            }

            var alarm = new Alarm
            {
                Duration = new TimeSpan(0, 15, 0),
                Trigger = new Trigger(new TimeSpan(0, 15, 0)),
                Action = AlarmAction.Display,
                Description = "Reminder"
            };

            evt.Alarms.Add(alarm);

            // Save into calendar file. 
            var serializer = new iCalendarSerializer(iCal);

            return serializer.SerializeToString(iCal);
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


        public bool CheckDateElements(SendMeetingInvite meetingInfo)
        {

            if(meetingInfo.STARTDTE == null || meetingInfo.STARTTIME == null)
                return false;

            if (meetingInfo.ENDDTE != null || meetingInfo.ENDTIME == null)
                return false;

            if (meetingInfo.ENDDTE == null || meetingInfo.ENDTIME != null)
                return false;

            if(meetingInfo.IsRecurring != null && meetingInfo.IsRecurring =="2" && meetingInfo.Duration == null)
                return false;

            if (meetingInfo.IsRecurring != null && meetingInfo.IsRecurring == "2" && meetingInfo.RecurrenceCount == null)
                return false;

            if (meetingInfo.IsRecurring != null && meetingInfo.IsRecurring == "2" && meetingInfo.FreqId == null)
                return false;

            //All good..
            return true;
        }

        public DateTime GetDateAndTimeTogether(DateTime DatePortion, string DateTimePortion)
        {
            DateTime _finalDate;
            //Let us divide and just get Time Portion
            string[] _enteredTimeDetails = DateTimePortion.Split(' ');
            //Again Divide and just get Hours and Minutes
            string[] _timeDetails = _enteredTimeDetails[1].ToString().Split(':');
            //hour
            int _hour = Convert.ToInt32(_timeDetails[0].ToString());
            //Minute
            int _minute = Convert.ToInt32(_timeDetails[1].ToString());
            //Set again if it is PM
            if (_enteredTimeDetails[2].ToString().ToUpper() == "PM")
            {
                _hour = _hour + 12;
            }
            //Now add in the date part
            _finalDate = DatePortion.AddHours(_hour);
            _finalDate = _finalDate.AddMinutes(_minute);
            //Final date is ready so return it
            return _finalDate;
        }
        /// <summary>
        /// Get Recurrence Day Interval details
        /// </summary>
        /// <returns></returns>
        public Int32 GetRecurrenceDayInterval(string recDay)
        {
            Int32 RecDayInterval = 0;
            if (recDay == "Daily")
            {
                RecDayInterval = 1;
            }
            else if (recDay == "Weekly")
            {
                RecDayInterval = 7;
            }
            else if (recDay == "Monthly")
            {
                RecDayInterval = 30;
            }
            else if (recDay == "Yearly")
            {
                RecDayInterval = 365;
            }
            return RecDayInterval;
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
                        if (_file_path.Substring(_file_path.Length) != "\\")
                        {
                            _file_path += "\\";
                        }
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
                _response = new genericResponse() { success = false, message = "There is a problem in sending the Email message. Please try again later. " + ex.Message };
                return _response;
            }
        }

        [HttpPost]
        [Route("api/Email/SendMeetingInviteNow")]
        public genericResponse SendMeetingInviteNow(SendMeetingInvite meetingInfo)
        {
            genericResponse _response;
            try
            {
                #region [[ Basic Check Here...]]
                if (meetingInfo != null
                    && !string.IsNullOrEmpty(meetingInfo.SUBJECT)
                    && !string.IsNullOrEmpty(meetingInfo.MESSAGE)
                    //To Address Option....
                    && (!string.IsNullOrEmpty(meetingInfo.RCPNTS) || CheckRecipientsExist(meetingInfo.userEmailGroups))
                    && CheckDateElements(meetingInfo))
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
                    message.Subject = meetingInfo.SUBJECT.Trim();
                    //Meeting type and Recurrency Freq Type
                    string meetingType = uow.EmailRepository().GetMeetingTypeName(Convert.ToInt32(meetingInfo.TypeId));
                    string RecurrenceFrequency = "";
                    if (!string.IsNullOrEmpty(meetingInfo.FreqId))
                    {
                        RecurrenceFrequency = uow.EmailRepository().GetMeetingFreqTypeName(Convert.ToInt32(meetingInfo.FreqId));
                    }
                    //For HTML Body
                    string bodyText = "Meeting Type: {0}\r\n\r\n</br></br>{1}";
                    bodyText = string.Format(bodyText, meetingType, meetingInfo.MESSAGE.Trim().Replace("\r\n", "<br/>").Replace(" ", "&nbsp;"));
                    AlternateView body = AlternateView.CreateAlternateViewFromString(bodyText, new ContentType("text/html"));
                    message.AlternateViews.Add(body);

                    System.Net.Mime.ContentType ct = new System.Net.Mime.ContentType("text/calendar");
                    //Check if event is Rercurring type
                    if (meetingInfo.IsRecurring == null || meetingInfo.IsRecurring == "1")
                    {
                        AlternateView avCal =
                            AlternateView.CreateAlternateViewFromString(CreateCalendarEvent(message.Subject,
                            meetingInfo.MESSAGE.Trim().Replace("\r\n", "<br/>").Replace(" ", "&nbsp;"),
                            GetDateAndTimeTogether(Convert.ToDateTime(meetingInfo.STARTDTE), meetingInfo.STARTTIME.ToString()),
                            GetDateAndTimeTogether(Convert.ToDateTime(meetingInfo.ENDDTE), meetingInfo.ENDTIME.ToString()),
                            meetingInfo.LOCATION.Trim(),
                            message.From.Address,
                            null,
                            false), ct);
                        message.AlternateViews.Add(avCal);
                    }
                    else
                    {
                        //For recurring Event...
                        AlternateView avCal = AlternateView.CreateAlternateViewFromString(CreateCalendarEvent(message.Subject,
                            meetingInfo.MESSAGE.Trim().Replace("\r\n", "<br/>").Replace(" ", "&nbsp;"),
                            GetDateAndTimeTogether(Convert.ToDateTime(meetingInfo.STARTDTE), meetingInfo.STARTTIME.ToString()),
                            Convert.ToDouble(meetingInfo.Duration),
                            meetingInfo.LOCATION.Trim(),
                            message.From.Address,
                            null,
                            false,
                            GetRecurrenceDayInterval(RecurrenceFrequency),
                            Convert.ToInt32(meetingInfo.RecurrenceCount),
                            RecurrenceFrequency), ct);
                        message.AlternateViews.Add(avCal);
                    }
                    
                    //Set To Address as From by default
                    message.To.Add(message.From);
                    //For Entered Email Addresses
                    if (!string.IsNullOrEmpty(meetingInfo.RCPNTS))
                    {
                        //We also have email address entered here
                        string[] receiverAddress = meetingInfo.RCPNTS.Trim().Split(',');
                        foreach (string address in receiverAddress)
                        {
                            //Add Address as To
                            if (Validation.ValidateEmail(address.Trim()))
                            {
                                message.To.Add(new MailAddress(address.Trim()));
                            }
                        }
                    }
                    //For User Grooup if any selected .....
                    foreach (EmailGroups usrg in meetingInfo.userEmailGroups)
                    {
                        if (usrg.IsSelected)
                        {
                            emailAdrsInfo = null;
                            emailAdrsInfo = uow.EmailRepository().GetUserEmailGroupAddresses(Convert.ToInt32(usrg.Id)).ToList();
                            message = AddAddresses(emailAdrsInfo, message);
                        }
                    }

                    //For Attachement...
                    if (!string.IsNullOrEmpty(meetingInfo.FILENAMES))
                    {
                        //Now save the file in the tmp folder
                        _file_path = System.Web.Hosting.HostingEnvironment.MapPath("~");
                        if (_file_path.Substring(_file_path.Length) != "\\")
                        {
                            _file_path += "\\";
                        }
                        _file_path += "Uploads\\" + meetingInfo.FILENAMES;

                        using (System.IO.FileStream fileStream = new System.IO.FileStream(_file_path, System.IO.FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
                        {
                            System.Net.Mail.Attachment _attachment = new System.Net.Mail.Attachment(fileStream, meetingInfo.FILENAME, MediaTypeNames.Application.Octet);
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
                    #endregion
                    _response = new genericResponse() { success = true };
                                        
                }
                else
                {
                    _response = new genericResponse() { success = false, message = "Required information is missing. Please check and correct your entry to proceed." };
                }
                #endregion
                //Back
                return _response;
            }
            catch (Exception ex)
            {
                _response = new genericResponse() { success = false, message = "There is a problem in sending the Email message. Please try again later. " + ex.Message };
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

        [Route("api/GetMeetingTypeOptions")]
        [HttpGet()]
        public HttpResponseMessage GetMeetingTypeOptions()
        {
            List<Tbl_MeetingType> mtgTypes = null;
            mtgTypes = uow.EmailRepository().GetMeetingTypeOptions().ToList();
            var returnObject = new { success = true, results = mtgTypes.ToList() };
            return Request.CreateResponse(returnObject);
        }

        [Route("api/GetMeetingFrequencyTypes")]
        [HttpGet()]
        public HttpResponseMessage GetMeetingFrequencyTypes()
        {
            List<Tbl_MeetingFrequencyType> mtgFTypes = null;
            mtgFTypes = uow.EmailRepository().GetMeetingFrequencyTypes().ToList();
            var returnObject = new { success = true, results = mtgFTypes.ToList() };
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
