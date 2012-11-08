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
                string EmailAdrs = ds.Tables[0].Rows[count]["EMAIL"].ToString().Trim() ;
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
    protected void lstUserEmailGroup_DataBound(object sender, EventArgs e)
    {
        if (lstUserEmailGroup.Items.Count == 0)
        {
            ListItem selectItem = new ListItem("No Group created yet", "0");
            lstUserEmailGroup.Items.Insert(0, selectItem);
        }
        
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
        //For Blast Email Group
        foreach (ListItem listItem in chkListGroup.Items)
        {
          if (listItem.Selected)
          {
            IsSelected = true;
          }
        }
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
    /// <summary>
    /// User comes here when he click on the Send Email button
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSend_Click(object sender, EventArgs e)
    {
        if (IsAtleastOneGroupSelected() || !string.IsNullOrEmpty(txtEmailAdrs.Text))
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
                //Subject
                message.Subject = txtSubject.Text.Trim();
                message.Body = msgFreeTB.Text.Trim();
                //Set To Address as From by default
                message.To.Add(message.From);
                //Now check the Blast Email Group(s) selection by the User
                foreach (ListItem listItem in chkListGroup.Items)
                {
                    if (listItem.Selected)
                    {
                        //This group is selected so let us get Email Addresses and add them as BCC
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
                                ds = bers.GetFranchiseeAddresses("FranchiseeOwner", _user.FranchiseeID);
                                message = AddAddresses(ds, message);
                                break;
                            case "All Franchisee Users":
                                ds = bers.GetAllFranchiseeAddresses("FranchiseeUser");
                                message = AddAddresses(ds, message);
                                break;
                            case "Franchisee Users":
                                ds = bers.GetFranchiseeAddresses("FranchiseeUser", _user.FranchiseeID);
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
                    lblInfo.Text = "Your email has been sent successfully.";
                    lblError.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "There is a problem sending email message. Please contact Administrator or try again later.";
                lblInfo.Text = "";
            }
        }
        else
        {
            //User has not selected any group and also Receiver's email adrs textbox is empty so we can not go ahead
            lblError.Text = "Please select at least one Group as Email receiver or type Email address(es).";
            lblInfo.Text = "";

        }
        
    }
        
}