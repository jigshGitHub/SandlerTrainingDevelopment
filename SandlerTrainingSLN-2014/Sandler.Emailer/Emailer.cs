﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


using System.Net;
using System.Net.Mail;
using System.Configuration;
namespace Sandler.Emailer
{
    public interface IMailer
    {
        MailAddress GetFromAddress();
        string GetSubject();
        string PrepareHTMLMessageBody();
        List<MailAddress> GetToAddresses();
        void PrepareAttachments(MailMessage message);
    }
    public class EMailer
    {

        private System.Diagnostics.EventLog eventLog;
        public EMailer()
        {
            eventLog = new System.Diagnostics.EventLog();
            eventLog.Source = "SandlerAppEventSource";
            eventLog.Log = "SandlerAppEventLog";
        }
        public const string EmailStandard = @"^[a-zA-Z0-9._-]+@([a-zA-Z0-9.-]+\.)+[a-zA-Z0-9.-]{2,4}$";
        public void SendEmail(IMailer mailer)
        {
            SmtpClient smtpClient = null;

            try
            {
                smtpClient = GetSMTPClient();
                MailMessage mail = GetMailMessage(mailer);
                smtpClient.Send(mail);
            }
            catch (Exception ex)
            {
                eventLog.WriteEntry("Exception in Sandler.Emailer.Emailer.SendEmail():" + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                throw ex;
            }

        }

        private MailMessage GetMailMessage(IMailer mailer)
        {
            MailMessage message = null;
            try
            {
                message = new MailMessage();
                message.IsBodyHtml = true;
                message.From = mailer.GetFromAddress();
                message.Subject = mailer.GetSubject();
                message.Body = mailer.PrepareHTMLMessageBody();// emailInfo.MESSAGE.Trim().Replace("\r\n", "<br/>").Replace(" ", "&nbsp;");
                mailer.PrepareAttachments(message);
                foreach (MailAddress address in mailer.GetToAddresses())
                {
                    if (ValidateEmail(address.Address.Trim()))
                        message.To.Add(address);
                }
            }
            catch (Exception ex)
            {
                eventLog.WriteEntry("Exception in Sandler.Emailer.Emailer.GetMailMessage():" + ex.Message, System.Diagnostics.EventLogEntryType.Error); 
                throw ex;
            }
            return message;
        }

        private SmtpClient GetSMTPClient()
        {
            SmtpClient client = null;
            try
            {
                client = new SmtpClient(ConfigurationManager.AppSettings["Server.Hostname"].ToString(), int.Parse(ConfigurationManager.AppSettings["Server.Port"].ToString()));

                if (Convert.ToBoolean(ConfigurationManager.AppSettings["Server.UseDefaultCredentials"].ToString()))
                    client.UseDefaultCredentials = true;

                if (Convert.ToBoolean(ConfigurationManager.AppSettings["Server.CredentialsRequired"].ToString()))
                    client.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["Server.Username"].ToString(), ConfigurationManager.AppSettings["Server.Password"].ToString());

                if (Convert.ToBoolean(ConfigurationManager.AppSettings["Server.EnableSSL"].ToString()))
                    client.EnableSsl = true;
            }
            catch (Exception ex)
            {
                eventLog.WriteEntry("Exception in Sandler.Emailer.Emailer.GetSMTPClient():" + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                throw ex;
            }
            return client;
        }

        private bool ValidateEmail(string emailID)
        {
            if (emailID != null)
                return System.Text.RegularExpressions.Regex.IsMatch(emailID, EmailStandard);
            else
                return false;
        }
    }
}
