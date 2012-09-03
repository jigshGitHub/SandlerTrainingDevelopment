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

public partial class Email_BlastEmail : BasePage
{
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
                string EmailAdrs = ds.Tables[0].Rows[count]["EMAIL"].ToString();
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


    public string LoggedInUserEmailAdrs(DataSet ds)
    {
        string EmailAdress = "";
        //check if we have records
        if (ds.Tables[0].Rows.Count > 0)
        {
            EmailAdress = ds.Tables[0].Rows[0]["EMAIL"].ToString();
        }
        return EmailAdress;
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
    /// <summary>
    /// User comes here when he click on the Send Email button
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSend_Click(object sender, EventArgs e)
    {
        try
        {
            //Get the User Info
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];
            BlastEmailRepository bers = new BlastEmailRepository();
            DataSet dsAdrs = bers.GetLoggedInUserAddress(_user.UserId.ToString()); 
            //mail client
            var client = new SmtpClient();
            client.UseDefaultCredentials = false;
            client.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["Server.Username"], ConfigurationManager.AppSettings["Server.Password"]);
            client.Host = ConfigurationManager.AppSettings["Server.Hostname"];
            client.Port = Convert.ToInt32(ConfigurationManager.AppSettings["Server.Port"]);
            //Now set up MailMessage
            MailMessage message = new MailMessage();
            message.IsBodyHtml = true;
            //From Address
            message.From = new MailAddress(LoggedInUserEmailAdrs(dsAdrs)); 
            message.Subject = txtSubject.Text.Trim();
            message.Body = msgFreeTB.Text.Trim();
            //Set To Address as From by default
            message.To.Add(message.From);
            //Now check the group selection by the User
            foreach (ListItem listItem in chkListGroup.Items)
            {
                if (listItem.Selected)
                {
                    //This group is selected so let us get Email Addresses and add them as BCC
                    DataSet ds;
                    switch (listItem.Text)
                    {
                        case "All Coach":
                            ds = bers.GetAllCoachAddresses();
                            message = AddAddresses(ds, message);
                            break;
                        case "All Franchisee Owners":
                            ds = bers.GetAllFranchiseeAddresses("FranchiseeOwner");
                            message = AddAddresses(ds, message);
                            break;
                        case "Franchisee Owner":
                            ds = bers.GetFranchiseeAddresses("FranchiseeOwner",_user.FranchiseeID);
                            message = AddAddresses(ds, message);
                            break;
                        case "All Franchisee Users":
                            ds = bers.GetAllFranchiseeAddresses("FranchiseeUser");
                            message = AddAddresses(ds, message);
                            break;
                        case "Franchisee Users":
                            ds = bers.GetFranchiseeAddresses("FranchiseeUser",_user.FranchiseeID);
                            message = AddAddresses(ds, message);
                            break;
                        case "All Franchisee Contacts":
                        case "Franchisee Contacts":
                            ds = bers.GetAllContactsAddresses();
                            message = AddAddresses(ds, message);
                            break;
                        default:
                            break;
                    }
                    
                }
                                
            }
            //For Attachment
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
            //Send the message
            var sendEmails = Convert.ToBoolean(ConfigurationManager.AppSettings["General.SendBlastEmails"]); 
            if (sendEmails)
            {
                client.Send(message);
                lblInfo.Text = "Your Blast Email has been sent successfully.";
                lblError.Text = "";
            }
        }
        catch(Exception ex)
        {
            lblError.Text = "There is a problem sending email message. Please contact Administrator or try again later.";
            lblInfo.Text = "";
            //Now log the Exception Message
        }
        
    }
        
}