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
using DDay.iCal;
using DDay.Collections;
using DDay.iCal.Serialization;
using DDay.iCal.Serialization.iCalendar;


public partial class Email_Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnTest_Click(object sender, EventArgs e)
    {
        #region Working Test code
        //mail client
        //var client = new SmtpClient();
        //client.UseDefaultCredentials = false;
        //client.Credentials = new System.Net.NetworkCredential("server3905", "ZI5a5YwZoKV4vF2XKBqm");
        //client.Host = "smtp.socketlabs.com";
        //client.Port = 25;
        ////Now set up MailMessage
        //MailMessage message = new MailMessage();
        //message.IsBodyHtml = true;
        ////From Address
        //message.From = new MailAddress("thakkarbhav@hotmail.com");
        //message.Subject = "Test Subject : Please Ignore";
        //message.Body = "This is test message. Please ignore it.";
        ////Set To Address as From by default
        //message.To.Add(message.From);
        ////message.CC.Add("jshahcareer@gmail.com");
        //message.CC.Add("bthakkar@cmdi.net");
        //client.Send(message);
        #endregion
        
        //Location = smtp.cso.local
        //Anonymous authentication
        //Use the default smtp port

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
        message.From = new MailAddress(ConfigurationManager.AppSettings["testEmailSenderAccount"].ToString());
        message.Subject = ConfigurationManager.AppSettings["testMessageSubject"].ToString();
        message.Body = ConfigurationManager.AppSettings["testMessageBody"].ToString();
        //Set To Address as From by default
        string[] emailAddress = ConfigurationManager.AppSettings["testEmailsAccounts"].ToString().Split(new char[] { ';' });
        foreach (string address in emailAddress)
        {
            message.To.Add(new MailAddress(address));
        }

        client.Send(message);
    }
    protected void btnSendMeetingEnvite_Click(object sender, EventArgs e)
    {
        //SmtpClient sc = new SmtpClient();
        var client = new SmtpClient();
        if (Convert.ToBoolean(ConfigurationManager.AppSettings["Server.UseDefaultCredentials"].ToString()))
            client.UseDefaultCredentials = true;
        client.Host = ConfigurationManager.AppSettings["Server.Hostname"].ToString();// "smtp.cso.local";
        client.Port = int.Parse(ConfigurationManager.AppSettings["Server.Port"].ToString());//25;
        //client.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis;
        if (Convert.ToBoolean(ConfigurationManager.AppSettings["Server.CredentialsRequired"].ToString()))
            client.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["Server.Username"].ToString(), ConfigurationManager.AppSettings["Server.Password"].ToString());

        MailMessage msg = new MailMessage();
        msg.From = new MailAddress("thakkarbhav@gmail.com", "Gmail Account");
        msg.To.Add(new MailAddress("bthakkar@cmdi.net", "Exchange Account"));
        //msg.To.Add(new MailAddress("thakkarbhav@hotmail.com", "Hotmail Account"));
        msg.Subject = "Send Calendar Appointment Email";
        //msg.Body = "Here is the Body Content";

        //For HTMl Body
        AlternateView body = AlternateView.CreateAlternateViewFromString("<b>This is test</b>", new ContentType("text/html"));
        msg.AlternateViews.Add(body);

        //StringBuilder str = new StringBuilder();
        //str.AppendLine("BEGIN:VCALENDAR");
        //str.AppendLine("PRODID:-//My Test Email");
        //str.AppendLine("VERSION:2.0");
        //str.AppendLine("METHOD:REQUEST");
        //str.AppendLine("BEGIN:VEVENT");

        //str.AppendLine(string.Format("DTSTART:{0:yyyyMMddTHHmmssZ}", DateTime.Now.AddDays(4).ToUniversalTime()));
        //str.AppendLine(string.Format("DTSTAMP:{0:yyyyMMddTHHmmssZ}", DateTime.UtcNow));
        //str.AppendLine(string.Format("DTEND:{0:yyyyMMddTHHmmssZ}", DateTime.Now.AddDays(5).ToUniversalTime()));
                      
        //str.AppendLine("LOCATION: Falls Church, VA");
        //str.AppendLine(string.Format("UID:{0}", Guid.NewGuid()));
        //str.AppendLine(string.Format("DESCRIPTION:{0}", msg.Body));
        
        ////str.AppendLine(string.Format("X-ALT-DESC;FMTTYPE=text/html:{0}", msg.Body));
        //str.AppendLine(string.Format("X-ALT-DESC;FMTTYPE=text/html:{0}", body));
        
        //str.AppendLine(string.Format("SUMMARY:{0}", msg.Subject));
        //str.AppendLine(string.Format("ORGANIZER:MAILTO:{0}", msg.From.Address));
        ////For all To Addresses
        //str.AppendLine(string.Format("ATTENDEE;CN=\"{0}\";RSVP=TRUE:mailto:{1}", msg.To[0].DisplayName, msg.To[0].Address));
        ////str.AppendLine(string.Format("ATTENDEE;CN=\"{0}\";RSVP=TRUE:mailto:{1}", msg.To[1].DisplayName, msg.To[1].Address));
        
        ////For Alarm setting
        //str.AppendLine("BEGIN:VALARM");
        //str.AppendLine("TRIGGER:-PT15M");
        //str.AppendLine("ACTION:DISPLAY");
        //str.AppendLine("DESCRIPTION:Reminder");
        //str.AppendLine("END:VALARM");
        //str.AppendLine("END:VEVENT");
        //str.AppendLine("END:VCALENDAR");
        //System.Net.Mime.ContentType ct = new System.Net.Mime.ContentType("text/calendar");
        //ct.Parameters.Add("method", "REQUEST");
        //AlternateView avCal = AlternateView.CreateAlternateViewFromString(str.ToString(), ct);
        //msg.AlternateViews.Add(avCal);

        System.Net.Mime.ContentType ct = new System.Net.Mime.ContentType("text/calendar");
        //ct.Parameters.Add("method", "REQUEST");
        //AlternateView avCal = AlternateView.CreateAlternateViewFromString(CreateCalendarEvent("This is my meeting", body.ToString(), DateTime.Now , 1, "Falls church VA", msg.From.Address , null, false,7,2), ct);

        AlternateView avCal = AlternateView.CreateAlternateViewFromString(CreateCalendarEvent("This is my meeting", body.ToString(), DateTime.Now, 1, "Falls church VA", msg.From.Address, null, false, 0, 0), ct);

        //AlternateView avCal = AlternateView.CreateAlternateViewFromString(CreateCalendarEvent("This is my meeting", body.ToString(), DateTime.Now, DateTime.Now.AddHours(2) , "Falls church VA", msg.From.Address, null, false), ct);
        msg.AlternateViews.Add(avCal);
        
        //sc.Send(msg);
        client.Send(msg);
        
    }
    
    protected void btnUsingDDayIcal_Click(object sender, EventArgs e)
    {

        ////init the message with your defaults (from, to, subject, etc)
        //MailMessage message = initMailMessage();
        //string iCal = initICal(parameters ...);

        ////Add the attachment, specify it is a calendar file.

        //System.Net.Mail.Attachment attachment = System.Net.Mail.Attachment.CreateAttachmentFromString(iCal, new ContentType("text/calendar"));

        //attachment.TransferEncoding = TransferEncoding.Base64;

        //attachment.Name = "EventDetails.ics"; //not visible in outlook

        //message.Attachments.Add(attachment);

        //sendMailMessage(message);



    }
    public static MailMessage CreateMeetingRequest(DateTime start, DateTime end, string subject, string summary,string location, string organizerName, string organizerEmail, string attendeeName, string attendeeEmail)
    {    
        MailAddressCollection col = new MailAddressCollection();    
        col.Add(new MailAddress(attendeeEmail, attendeeName));    
        return CreateMeetingRequest(start, end, subject, summary, location, organizerName, organizerEmail, col);
    }
    public static MailMessage CreateMeetingRequest(DateTime start, DateTime end, string subject, string summary,string location, string organizerName, string organizerEmail, MailAddressCollection attendeeList)
    {    
        MailMessage msg = new MailMessage();    
        //  Set up the different mime types contained in the message    
        System.Net.Mime.ContentType textType = new System.Net.Mime.ContentType("text/plain");    
        System.Net.Mime.ContentType HTMLType = new System.Net.Mime.ContentType("text/html");    
        System.Net.Mime.ContentType calendarType = new System.Net.Mime.ContentType("text/calendar");    
        //  Add parameters to the calendar header    
        calendarType.Parameters.Add("method", "REQUEST");    
        calendarType.Parameters.Add("name", "meeting.ics");    
        //  Create message body parts    
        //  create the Body in text format    
        string bodyText = "Type:Single Meeting\r\nOrganizer: {0}\r\nStart Time:{1}\r\nEnd Time:{2}\r\nTime Zone:{3}\r\nLocation: {4}\r\n\r\n*~*~*~*~*~*~*~*~*~*\r\n\r\n{5}";    
        bodyText = string.Format(bodyText, 
            organizerName, 
            start.ToLongDateString() + " " + start.ToLongTimeString(), 
            end.ToLongDateString() + " " + end.ToLongTimeString(),
            System.TimeZone.CurrentTimeZone.StandardName, 
            location,
            summary);    
        
        AlternateView textView = AlternateView.CreateAlternateViewFromString(bodyText, textType);    
        msg.AlternateViews.Add(textView);    
        
        //create the Body in HTML format    
        string bodyHTML = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 3.2//EN\">\r\n<HTML>\r\n<HEAD>\r\n<META HTTP-EQUIV=\"Content-Type\" CONTENT=\"text/html; charset=utf-8\">\r\n<META NAME=\"Generator\" CONTENT=\"MS Exchange Server version 6.5.7652.24\">\r\n<TITLE>{0}</TITLE>\r\n</HEAD>\r\n<BODY>\r\n<!-- Converted from text/plain format -->\r\n<P><FONT SIZE=2>Type:Single Meeting<BR>\r\nOrganizer:{1}<BR>\r\nStart Time:{2}<BR>\r\nEnd Time:{3}<BR>\r\nTime Zone:{4}<BR>\r\nLocation:{5}<BR>\r\n<BR>\r\n*~*~*~*~*~*~*~*~*~*<BR>\r\n<BR>\r\n{6}<BR>\r\n</FONT>\r\n</P>\r\n\r\n</BODY>\r\n</HTML>";    
        bodyHTML = string.Format(bodyHTML,
            organizerName,
            start.ToLongDateString() + " " + start.ToLongTimeString(),
            end.ToLongDateString() + " " + end.ToLongTimeString(),
            System.TimeZone.CurrentTimeZone.StandardName,
            location,
            summary);    
        
        AlternateView HTMLView = AlternateView.CreateAlternateViewFromString(bodyHTML, HTMLType);    
        msg.AlternateViews.Add(HTMLView);    
        
        //create the Body in VCALENDAR format    
        string calDateFormat = "yyyyMMddTHHmmssZ";    
        string bodyCalendar = "BEGIN:VCALENDAR\r\nMETHOD:REQUEST\r\nPRODID:Microsoft CDO for Microsoft Exchange\r\nVERSION:2.0\r\nBEGIN:VTIMEZONE\r\nTZID:(GMT-06.00) Central Time (US & Canada)\r\nX-MICROSOFT-CDO-TZID:11\r\nBEGIN:STANDARD\r\nDTSTART:16010101T020000\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0600\r\nRRULE:FREQ=YEARLY;WKST=MO;INTERVAL=1;BYMONTH=11;BYDAY=1SU\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nDTSTART:16010101T020000\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0500\r\nRRULE:FREQ=YEARLY;WKST=MO;INTERVAL=1;BYMONTH=3;BYDAY=2SU\r\nEND:DAYLIGHT\r\nEND:VTIMEZONE\r\nBEGIN:VEVENT\r\nDTSTAMP:{8}\r\nDTSTART:{0}\r\nSUMMARY:{7}\r\nUID:{5}\r\nATTENDEE;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=TRUE;CN=\"{9}\":MAILTO:{9}\r\nACTION;RSVP=TRUE;CN=\"{4}\":MAILTO:{4}\r\nORGANIZER;CN=\"{3}\":mailto:{4}\r\nLOCATION:{2}\r\nDTEND:{1}\r\nDESCRIPTION:{7}\\N\r\nSEQUENCE:1\r\nPRIORITY:5\r\nCLASS:\r\nCREATED:{8}\r\nLAST-MODIFIED:{8}\r\nSTATUS:CONFIRMED\r\nTRANSP:OPAQUE\r\nX-MICROSOFT-CDO-BUSYSTATUS:BUSY\r\nX-MICROSOFT-CDO-INSTTYPE:0\r\nX-MICROSOFT-CDO-INTENDEDSTATUS:BUSY\r\nX-MICROSOFT-CDO-ALLDAYEVENT:FALSE\r\nX-MICROSOFT-CDO-IMPORTANCE:1\r\nX-MICROSOFT-CDO-OWNERAPPTID:-1\r\nX-MICROSOFT-CDO-ATTENDEE-CRITICAL-CHANGE:{8}\r\nX-MICROSOFT-CDO-OWNER-CRITICAL-CHANGE:{8}\r\nBEGIN:VALARM\r\nACTION:DISPLAY\r\nDESCRIPTION:REMINDER\r\nTRIGGER;RELATED=START:-PT00H15M00S\r\nEND:VALARM\r\nEND:VEVENT\r\nEND:VCALENDAR\r\n";    
        bodyCalendar = string.Format(bodyCalendar,        
            start.ToUniversalTime().ToString(calDateFormat),        
            end.ToUniversalTime().ToString(calDateFormat),        
            location,        
            organizerName,
            organizerEmail,
            Guid.NewGuid().ToString("B"),
            summary,
            subject,
            DateTime.Now.ToUniversalTime().ToString(calDateFormat),
            attendeeList.ToString());    
        
        AlternateView calendarView = AlternateView.CreateAlternateViewFromString(bodyCalendar, calendarType);
        calendarView.TransferEncoding = TransferEncoding.SevenBit;    
        msg.AlternateViews.Add(calendarView);    
        //Adress the message    
        msg.From = new MailAddress(organizerEmail);    
        foreach (MailAddress attendee in attendeeList)    
        {        
            msg.To.Add(attendee);    
        }    
        msg.Subject = subject;    
        return msg;
    }

    private static string CreateCalendarEvent(string title, string body, 
        DateTime startDate, double duration, string location, 
        string organizer, string eventId, bool allDayEvent ,
        int recurrenceDaysInterval, int recurrenceCount)
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
            rp.Frequency = FrequencyType.Daily;
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

    private static string CreateCalendarEvent(string title, string body,DateTime startDate, DateTime endDate, string location,
        string organizer, string eventId, bool allDayEvent)
    {
        var iCal = new iCalendar
        {
            Method = "PUBLISH", //PUBLISH 
            Version = "2.0"
        };

        // Create the event       
        var evt = iCal.Create<Event>();
        evt.Summary = title;
        evt.Start = new iCalDateTime(startDate.Year,
                                     startDate.Month, startDate.Day, startDate.Hour,
                                     startDate.Minute, startDate.Second);

        

        evt.End = new iCalDateTime(endDate.Year,
                                     endDate.Month, endDate.Day, endDate.Hour,
                                     endDate.Minute, endDate.Second);
        evt.Description = body;
        evt.Location = location;

        evt.IsAllDay = allDayEvent;

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


    //private static void sendMailMessage(MailMessage mailMessage)
    //{
    //    string mailHost = "Ask.Someone.com";
    //    SmtpClient smtpClient = new SmtpClient(mailHost, 25);
    //    smtpClient.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis;
    //    smtpClient.Send(mailMessage);
    //}


   // public void SendAppointment(string from, string to,
   //string title, string body, DateTime startDate,
   //double duration, string location, string organizer,
   //bool updatePreviousEvent, string eventId,
   //bool allDayEvent,
   //int recurrenceDaysInterval, int recurrenceCount)
   // {
   //     iCalendar iCal = new iCalendar();

   //     // outlook 2003 needs this property,
   //     //  or we'll get an error (a Lunar error!)
   //     iCal.Method = "PUBLISH";

   //     // Create the event
   //     Event evt = iCal.Create<Event>();

   //     evt.Summary = title;

   //     evt.Start = new iCalDateTime(startDate.Year, startDate.Month, startDate.Day, startDate.Hour, startDate.Minute, startDate.Second);
   //     evt.Duration = TimeSpan.FromHours(duration);
   //     evt.Description = body;
   //     evt.Location = location;

   //     if (recurrenceDaysInterval > 0)
   //     {
   //         RecurrencePattern rp = new RecurrencePattern();
   //         rp.Frequency = FrequencyType.Daily;
   //         rp.Interval = recurrenceDaysInterval; // interval of days

   //         rp.Count = recurrenceCount;
   //         evt.RecurrenceRules.Add(rp);
   //     }
   //     evt.IsAllDay = allDayEvent;

   //     //organizer is mandatory for outlook 2007 - think about
   //     // trowing an exception here.
   //     if (!String.IsNullOrEmpty(organizer))
   //         evt.Organizer.CommonName = organizer;


   //     if (!String.IsNullOrEmpty(eventId))
   //         evt.UID = eventId;

   //     //"REQUEST" will update an existing event with the same
   //     // UID (Unique ID) and a newer time stamp.
   //     if (updatePreviousEvent)
   //         iCal.Method = "REQUEST";

   //     // Save into calendar file.

   //     iCalendarSerializer serializer = new iCalendarSerializer(iCal);
   //     //serializer.Serialize(@"iCalendar.ics");

   //     string icalData = serializer.SerializeToString();

   //     //send the iCal data. Also sends the subject and body
   //     //on the mail.
   //     SendAppointmentFromICalWithMailTitle(from, to, icalData, title, body);
   // }



    //// #1: Monthly meetings that occur on the last Wednesday from 6pm - 7pm// Create an iCalendar
    //iCalendar iCal = new iCalendar();
    //// Create the event
    //Event evt = iCal.Create<Event>();
    //evt.Summary = "Test Event";
    //evt.Start = new iCalDateTime(2008, 1, 1, 18, 0, 0); // Starts January 1, 2008 @ 6:00 P.M.
    //evt.Duration = TimeSpan.FromHours(1);
    //// Add a recurrence pattern to the event
    //RecurrencePattern rp = new RecurrencePattern();
    //rp.Frequency = FrequencyType.Monthly;
    //rp.ByDay.Add(new DaySpecifier(DayOfWeek.Wednesday, FrequencyOccurrence.Last));
    //evt.AddRecurrencePattern(rp);
    //// #2: Yearly events like holidays that occur on the same day each year.
    //// The same as #1, except:
    //RecurrencePattern rp = new RecurrencePattern();
    //rp.Frequency = FrequencyType.Yearly;
    //evt.AddRecurrencePattern(rp);
    
    //// #3: Yearly events like holidays that occur on a specific day like the first monday.
    //// The same as #1, except:
    //RecurrencePattern rp = new RecurrencePattern();
    //rp.Frequency = FrequencyType.Yearly;
    //rp.ByMonth.Add(3);
    //rp.ByDay.Add(new DaySpecifier(DayOfWeek.Monday, FrequencyOccurrence.First));
    //evt.AddRecurrencePattern(rp);
    ///*Note that all events occur on their start time, no matter theirrecurrence pattern. So, for example, you could occur on the first Mondayof every month, but if your event is scheduled for a Friday (i.e.evt.Start = new iCalDateTime(2008, 3, 7, 18, 0, 0)), then it will firstoccur on that Friday, and then the first Monday of every month afterthat.*/

}