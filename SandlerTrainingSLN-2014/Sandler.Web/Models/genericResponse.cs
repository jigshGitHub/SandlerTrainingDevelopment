using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Sandler.DB.Models;

namespace Sandler.Web.Models
{
    public interface iItemType
    {
    }

    public class genericResponse
    {
        public bool success { get; set; }
        public string message { get; set; }
        public int UniqueId { get; set; }
        public string orgfilename { get; set; }
        public string serverfilename { get; set; }

        public int __count { get; set; }
        public List<iItemType> results { get; set; }
    }

    public class SendEmailInfo
    {
        public string FILEINFO { get; set; }
        public string FILENAME { get; set; }
        public string FILENAMES { get; set; }
        public string SUBJECT { get; set; }
        public string RCPNTS { get; set; }
        public string MESSAGE { get; set; }
        public List<EmailGroups> blastEmailGroups { get; set; }
        public List<EmailGroups> userEmailGroups { get; set; }

    }


    public class SendMeetingInvite
    {
        public string FILEINFO { get; set; }
        public string FILENAME { get; set; }
        public string FILENAMES { get; set; }
        public string SUBJECT { get; set; }
        public string RCPNTS { get; set; }
        public string MESSAGE { get; set; }
        public string Duration { get; set; }
        public string LOCATION { get; set; }
        public string RecurrenceCount { get; set; }
        public string TypeId { get; set; }
        public string FreqId { get; set; }
        public string IsRecurring { get; set; }
        public List<EmailGroups> userEmailGroups { get; set; }
        public DateTime? STARTDTE { get; set; }
        public DateTime? ENDDTE { get; set; }
        public DateTime? STARTTIME { get; set; }
        public DateTime? ENDTIME { get; set; }
        
    }




    public class CreateEmailGroupInfo
    {
        public string FRNAME { get; set; }
        public string GRPNAME { get; set; }
        public List<EmailGroups> frcoachEmails { get; set; }
        public List<EmailGroups> frownerEmails { get; set; }
        public List<EmailGroups> fruserEmails { get; set; }
        public List<EmailGroups> frcontactEmails { get; set; }

    }

    public class EmailGroups
    {
        public string Id { get; set; }
        public string name { get; set; }
        public bool IsSelected { get; set; }
    }


}