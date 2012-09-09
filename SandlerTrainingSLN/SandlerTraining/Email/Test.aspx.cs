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
}