using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Text;
using System.Configuration;
using System.IO;
using System.Net.Mime;
using SandlerModels;
using System.Data;
using SandlerRepositories;
using DDay.iCal;
using DDay.Collections;
using DDay.iCal.Serialization;
using DDay.iCal.Serialization.iCalendar;
using eWorld;


public partial class Email_MeetingEnvite : System.Web.UI.Page
{
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    /// <summary>
    /// This method is used to Add addresses as BCC in the Mail Message
    /// </summary>
    /// <param name="ds">DS with Email Addresses</param>
    /// <param name="msg">Mail message</param>
    /// <returns></returns>
    public MailMessage AddAddresses(DataSet ds, MailMessage msg)
    {
        //check if we have records
        if (ds.Tables[0].Rows.Count > 0)
        {
            //We have Addresses to add in the Message
            for (int count = 0; count < ds.Tables[0].Rows.Count; count++)
            {
                //Loop through
                string EmailAdrs = ds.Tables[0].Rows[count]["EMAIL"].ToString().Trim();
                //Add Address as BCC
                if (Validation.ValidateEmail(EmailAdrs))
                {
                    msg.Bcc.Add(new MailAddress(EmailAdrs));
                }

            }
        }
        //send the Message object back
        return msg;
    }
    /// <summary>
    /// To Validate Email Address
    /// </summary>
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
    private bool IsAtleastOneGroupSelected()
    {
        bool IsSelected = false;
        //For User's Own Email Group
        foreach (ListItem listItem in lstUserEmailGroup.Items)
        {
            if (listItem.Selected)
            {
                IsSelected = true;
            }
        }
        return IsSelected;
    }
    protected void lstUserEmailGroup_DataBound(object sender, EventArgs e)
    {
        if (lstUserEmailGroup.Items.Count == 0)
        {
            ListItem selectItem = new ListItem("No Group created yet", "0");
            lstUserEmailGroup.Items.Insert(0, selectItem);
        }
    }
    /// <summary>
    /// Used For Meeting Duration Text Box
    /// </summary>
    /// <returns></returns>
    public bool checkDoubleEntry()
    {
        if (!string.IsNullOrEmpty(txtDuration.Text))
        {
            double intOutput = 0;
            if (Double.TryParse(txtDuration.Text, out intOutput))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else 
        {
            return true;
        }
    }
    /// <summary>
    /// Used for Recurrnece count Text Box
    /// </summary>
    /// <returns></returns>
    public bool checkIntegerEntry()
    {
        if (!string.IsNullOrEmpty(txtRecurrenceCount.Text))
        {
            int dOutput = 0;
            if (Int32.TryParse(txtRecurrenceCount.Text, out dOutput))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else 
        {
            return true;
        }
        
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        if (checkDoubleEntry() && checkIntegerEntry() && (IsAtleastOneGroupSelected() || !string.IsNullOrEmpty(txtEmailAdrs.Text)))
        {
            //We can go ahead
            try
            {
                //Get the User Info
                UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];
                BlastEmailRepository bers = new BlastEmailRepository();
                //mail client
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
                message.From = new MailAddress(_user.EmailAdress);
                //For Priority
                message.Priority = MailPriority.High;
                //Meeting Subject
                message.Subject = txtSubject.Text.Trim();
                //Set To Address as From by default
                message.To.Add(message.From);
                //For HTML Body
                string bodyText = "Meeting Type: {0}\r\n\r\n</br></br>{1}";
                bodyText = string.Format(bodyText,ddlMeetingType.SelectedItem.Text, msgFreeTB.Text.Trim());    
                AlternateView body = AlternateView.CreateAlternateViewFromString(bodyText, new ContentType("text/html"));
                message.AlternateViews.Add(body);
                               
                System.Net.Mime.ContentType ct = new System.Net.Mime.ContentType("text/calendar");
                //Check if event is Rercurring type
                if (ddlRecFrequency.SelectedItem.Text == "No")
                {
                    AlternateView avCal = 
                        AlternateView.CreateAlternateViewFromString(CreateCalendarEvent(message.Subject, 
                        msgFreeTB.Text.Trim(),
                        GetDateAndTimeTogether(Convert.ToDateTime(StartDate.Text), tpStartTime.PostedTime),
                        GetDateAndTimeTogether(Convert.ToDateTime(EndDate.Text), tpEndTime.PostedTime), 
                        txtLocation.Text.Trim(), 
                        message.From.Address, 
                        null, 
                        false), ct);
                    message.AlternateViews.Add(avCal);
                }
                else
                {
                    AlternateView avCal = AlternateView.CreateAlternateViewFromString(CreateCalendarEvent(message.Subject, 
                        msgFreeTB.Text.Trim(),
                        GetDateAndTimeTogether(Convert.ToDateTime(StartDate.Text), tpStartTime.PostedTime),
                        Convert.ToDouble(txtDuration.Text), 
                        txtLocation.Text.Trim(), 
                        message.From.Address, 
                        null, 
                        false, 
                        GetRecurrenceDayInterval(),
                        Convert.ToInt32(txtRecurrenceCount.Text),
                        ddlMeetingFrequency.SelectedItem.Text), ct);
                    message.AlternateViews.Add(avCal);
                }
                //Now check for User's Own Email Group(s)
                foreach (ListItem listItem in lstUserEmailGroup.Items)
                {
                    if (listItem.Selected)
                    {
                        //Go ahead and get Email Addresses for the selected group
                        ds = bers.GetUserEmailGroupAddresses(Convert.ToInt32(listItem.Value));
                        message = AddAddresses(ds, message);
                    }
                }
                //For Entered Email Addresses
                if (!string.IsNullOrEmpty(txtEmailAdrs.Text))
                {
                    //We also have email address entered here
                    string[] receiverAddress = txtEmailAdrs.Text.Trim().Split(',');
                    foreach (string address in receiverAddress)
                    {
                        //Add Address as To
                        if (Validation.ValidateEmail(address.Trim()))
                        {
                            message.To.Add(new MailAddress(address.Trim()));
                        }
                    }
                }
                //For Attachment
                if (EmailUpLoad.PostedFile != null)
                {
                    if (!string.IsNullOrEmpty(EmailUpLoad.PostedFile.FileName))
                    {
                        //We have attachment for this email message
                        System.Net.Mail.Attachment _attachment = new System.Net.Mail.Attachment(EmailUpLoad.PostedFile.FileName, MediaTypeNames.Application.Octet);
                        // Add time stamp information for the file.
                        ContentDisposition disposition = _attachment.ContentDisposition;
                        disposition.CreationDate = System.IO.File.GetCreationTime(EmailUpLoad.PostedFile.FileName);
                        disposition.ModificationDate = System.IO.File.GetLastWriteTime(EmailUpLoad.PostedFile.FileName);
                        disposition.ReadDate = System.IO.File.GetLastAccessTime(EmailUpLoad.PostedFile.FileName);
                        // Add the file attachment to this e-mail message.
                        message.Attachments.Add(_attachment);
                    }
                }
                //Send the message
                var sendEmails = Convert.ToBoolean(ConfigurationManager.AppSettings["General.SendBlastEmails"]);
                if (sendEmails)
                {
                    client.Send(message);
                    lblInfo.Text = "Your meeting envite has been sent successfully.";
                    lblError.Text = "";
                }
                                
            }
            catch
            {
                lblError.Text = "There is a problem sending meeting envite. Please contact Administrator or try again later.";
                lblInfo.Text = "";
            }
        }
        else
        {
            //Problem with DataEntry
            lblError.Text = "There is some problem with the data entry. Please check your entry and try again.";
            lblInfo.Text = "";

        }
    }
    /// <summary>
    /// Get Date and Time Together
    /// </summary>
    /// <param name="DatePortion"></param>
    /// <param name="TimePortion"></param>
    /// <returns></returns>
    public DateTime GetDateAndTimeTogether(DateTime DatePortion, string TimePortion)
    {
        DateTime _finalDate;
        //Let us divide and just get Time Portion
        string[] _enteredTimeDetails = TimePortion.Split(' ');
        //Again Divide and just get Hours and Minutes
        string[] _timeDetails = _enteredTimeDetails[0].ToString().Split(':');
        //hour
        int _hour = Convert.ToInt32(_timeDetails[0].ToString());
        //Minute
        int _minute = Convert.ToInt32(_timeDetails[1].ToString());
        //Set again if it is PM
        if (_enteredTimeDetails[1].ToString().ToUpper()  == "PM")
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
    public Int32 GetRecurrenceDayInterval()
    {
        Int32 RecDayInterval = 0;
        if (ddlMeetingFrequency.SelectedItem.Text == "Daily")
        {
            RecDayInterval = 1;
        }
        else if (ddlMeetingFrequency.SelectedItem.Text == "Weekly")
        {
            RecDayInterval = 7;
        }
        else if (ddlMeetingFrequency.SelectedItem.Text == "Monthly")
        {
            RecDayInterval = 30;
        }
        else if (ddlMeetingFrequency.SelectedItem.Text == "Yearly")
        {
            RecDayInterval = 365;
        }
        return RecDayInterval;
    }
    /// <summary>
    /// This method is used for Recurring events: Only Start time, duration and recurring count and interval will be supplied
    /// </summary>
    /// <param name="title"></param>
    /// <param name="body"></param>
    /// <param name="startDate"></param>
    /// <param name="duration"></param>
    /// <param name="location"></param>
    /// <param name="organizer"></param>
    /// <param name="eventId"></param>
    /// <param name="allDayEvent"></param>
    /// <param name="recurrenceDaysInterval"></param>
    /// <param name="recurrenceCount"></param>
    /// <returns></returns>
    private static string CreateCalendarEvent(string title, string body, DateTime startDate, double duration, string location, string organizer, string eventId, bool allDayEvent,int recurrenceDaysInterval, int recurrenceCount, string freqType)
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
    private static string CreateCalendarEvent(string title, string body, DateTime startDate, DateTime endDate, string location,string organizer, string eventId, bool allDayEvent)
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
    /// <summary>
    /// This is used when user selects meeting's Reoccurence details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void ddlRecFrequency_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlRecFrequency.SelectedIndex == 1)
        {
            lblSelectFreq.Visible = true;
            ddlMeetingFrequency.Visible = true;
            ddlMeetingFrequency.SelectedIndex = -1;
            lblRecurrence.Visible = true;
            txtRecurrenceCount.Visible = true;
            lblDuration.Visible = true;
            txtDuration.Visible = true;
            txtRecurrenceCount.Text = "";
            txtDuration.Text = "";
            //Hide the End time row
            trEndTime.Visible = false;
            //show the Rec Info row
            trRecInfo.Visible = true;
            rfvDuration.Enabled = true;
            rfvRecurrenceCount.Enabled = true;
        }
        else
        {
            lblSelectFreq.Visible = false;
            ddlMeetingFrequency.Visible = false;
            lblRecurrence.Visible = false;
            txtRecurrenceCount.Visible = false;
            lblDuration.Visible = false;
            txtDuration.Visible = false;
            //Show the End time row
            trEndTime.Visible = true;
            //hide the RecInfo row
            trRecInfo.Visible = false;
            EndDate.Text = "";
            rfvDuration.Enabled = false;
            rfvRecurrenceCount.Enabled = false;
        }
    }
}