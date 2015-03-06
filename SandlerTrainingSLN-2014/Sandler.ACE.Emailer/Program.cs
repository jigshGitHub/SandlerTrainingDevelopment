using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Sandler.Emailer;
using System.Net.Mail;
using System.Net.Mime;
using Sandler.DB.Data;
using Sandler.DB.Data.Common;
using Sandler.DB.Data.Common.Implementation;
using Sandler.DB.Data.Common.Interface;
using Sandler.DB.Data.Repositories;
using Sandler.DB.Models;
using System.Configuration;
namespace Sandler.ACE.Emailer
{

    public class ACEmailer : IMailer 
    {
        protected IUnitOfWork uow;
        protected List<AceMainView> campaigns;
        private AceMainView campaign;
        EMailer emailer = new EMailer();
        private string emailBackgroundImagePath;
        private string campaignEmailResponseURL;
        private Tbl_AceEmailTracker receipient;
        private System.Diagnostics.EventLog eventLog;
        private aspnet_Membership CampainCreatedBy;
        public ACEmailer()
        {
            try
            {
                eventLog = new System.Diagnostics.EventLog();
                eventLog.Source = "SandlerAppEventSource";
                eventLog.Log = "SandlerAppEventLog";
                uow = new SandlerUnitOfWork(new SandlerRepositoryProvider(new RepositoryFactories()), new SandlerDBContext());
                emailBackgroundImagePath = ConfigurationManager.AppSettings["EmailBackgroundImagePath"].ToString();
                campaignEmailResponseURL = ConfigurationManager.AppSettings["CampaignEmailResponseURL"].ToString();
            }
            catch (Exception ex)
            {
                throw new Exception ("Exception in Sandler.ACE.Emailer.ACEmailer():" + ex.Message);
            }
        }

        public MailAddress GetFromAddress()
        {
            MailAddress mailAddress = null;
            if (CampainCreatedBy == null)
                mailAddress = new MailAddress("donotreply@gmail.com");
            else
                mailAddress = new MailAddress(CampainCreatedBy.Email);
            return mailAddress;
        }

        public string GetSubject()
        {
            return campaign.MessageSubject;
        }

        public void PrepareAttachments(MailMessage message)
        {
            try
            {
                if (!string.IsNullOrEmpty(campaign.AttachFileName))
                {
                    string filePath = ConfigurationManager.AppSettings["Server.Host.UploadDirectoryPath"].ToString() + "\\" + campaign.AttachFileName;

                    using (System.IO.FileStream fileStream = new System.IO.FileStream(filePath, System.IO.FileMode.Open, System.IO.FileAccess.Read, System.IO.FileShare.ReadWrite))
                    {
                        System.Net.Mail.Attachment _attachment = new System.Net.Mail.Attachment(fileStream, campaign.AttachFileName, MediaTypeNames.Application.Octet);
                        // Add time stamp information for the file.
                        ContentDisposition disposition = _attachment.ContentDisposition;
                        disposition.CreationDate = System.IO.File.GetCreationTime(filePath);
                        disposition.ModificationDate = System.IO.File.GetLastWriteTime(filePath);
                        disposition.ReadDate = System.IO.File.GetLastAccessTime(filePath);
                        // Add the file attachment to this e-mail message.
                        message.Attachments.Add(_attachment);
                    }
                }
            }
            catch (Exception ex)
            {
                eventLog.WriteEntry("Exception in Sandler.ACE.Emailer.PrepareAttachments():" + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
        }

        public string PrepareHTMLMessageBody()
        {
            StringBuilder messageBuilder = null;
            try
            {
                messageBuilder = new StringBuilder();
                messageBuilder.Append("<body>");
                messageBuilder.Append("<div style='background-color:#ffffff;'>");
                messageBuilder.Append("<!--[if gte mso 9]>");
                messageBuilder.Append("<v:background xmlns:v='urn:schemas-microsoft-com:vml' fill='t'>");
                messageBuilder.Append("<v:fill type='tile' src='" + emailBackgroundImagePath + "' color='#ffffff'/>");
                messageBuilder.Append("</v:background>");
                messageBuilder.Append("<![endif]-->");
                messageBuilder.Append("<table height='100%' width='100%' cellpadding='0' cellspacing='0' border='0'>    ");
                messageBuilder.Append("<tr>");
                messageBuilder.Append("<td valign='top' align='left' background='" + this.emailBackgroundImagePath + "'>");
                messageBuilder.Append("<table width='100%'>");
                messageBuilder.Append("<tr>");
                messageBuilder.Append("<td>");
                //messageBuilder.Append("if you want to set a background image or color in your HTML email, you can set it in your BODY tag, where it usually goes. That’ll work ok for some desktop email applications, like Microsoft Outlook.  But to make it work across more email applications, you need to 'rig' your code so that your entire email is set inside a big TABLE WRAP. Just set a big table that’s 100% wide, then specify your background color and image there. We recommend doing it the old-fashioned 'bgcolor' or 'background='' way. If you prefer doing it with CSS, be sure to read the 'CSS' tips below. As with all images in HTML email, they need to be hosted on your server, and you need to point to them with absolute (not relative) paths.  Once you’ve created the big TABLE WRAP with your background color or image, place your actual newsletter code inside, and you’re good to go.  If you’re a very experienced web designer, this will no doubt make you feel dirty, and make you want to take a shower immediately afterwards. But HTML email isn’t as reliable as web pages are (yet) and there are way too many email apps out there that display HTML differently. Until all the various email apps get a little more consistent, you’re going to have to get used to 'rigs' like this.");
                messageBuilder.Append(campaign.MessageText);
                messageBuilder.Append("</td>");
                messageBuilder.Append("</tr>");
                messageBuilder.Append("<tr>");
                messageBuilder.Append("<td align='centre'><a href='" + this.campaignEmailResponseURL + "?id=" + this.receipient.ID.ToString() + "' target='_blank'>" + campaign.CallToActionText + "</a>");
                messageBuilder.Append("</tr>");
                messageBuilder.Append("</table>");
                messageBuilder.Append("</td>");
                messageBuilder.Append("</tr>");
                messageBuilder.Append("</table>");
                messageBuilder.Append("</div>");
                messageBuilder.Append("</body>");
            }
            catch (Exception ex)
            {
                eventLog.WriteEntry("Exception in Sandler.ACE.Emailer.PrepareHTMLMessageBody():" + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return messageBuilder.ToString();
        }

        public List<MailAddress> GetToAddresses()
        {
            List<MailAddress> toAddresses = null;
            try
            {
                toAddresses = new List<MailAddress>();
                toAddresses.Add(new MailAddress(receipient.EmailAddress));
            }
            catch (Exception ex)
            {
                eventLog.WriteEntry("Exception in Sandler.ACE.Emailer.GetToAddresses():" + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return toAddresses;
        }

        public void ProcessPreCampaigns()
        {
            ProcessCampaigns(1);
        }

        public void ProcessPostCampaigns()
        {
            ProcessCampaigns(2);
        }

        private void ProcessCampaigns(int campaignTypeId)
        {
            try
            {
                campaigns = uow.AceMainRepository().GetByCampaignType(campaignTypeId).ToList<AceMainView>();
                if (campaigns != null)
                {
                    foreach (AceMainView _campaign in campaigns)
                    {
                        try
                        {
                            this.campaign = _campaign;
                            this.campaign.CallToActionText = uow.AceMainRepository().GetCallToActionTypeOptions().Where(r => r.CallToActionId == int.Parse(_campaign.CallToActionId.ToString())).FirstOrDefault().CallToActionText;
                            this.CampainCreatedBy = uow.MembershipRepository().Get(new Guid(this.campaign.CreatedBy));
                            List<Tbl_AceEmailTracker> recipients = uow.AceEmailTrackerRepository().GetForCampaign(campaign.AceId);
                            if (recipients == null)
                            {
                                eventLog.WriteEntry("recipients are NULL", System.Diagnostics.EventLogEntryType.Information);
                                eventLog.WriteEntry("receipient is NULL", System.Diagnostics.EventLogEntryType.Information);
                            }
                            else
                            {
                                foreach (Tbl_AceEmailTracker recipient in recipients)
                                {
                                    this.receipient = recipient;
                                    emailer.SendEmail(this);
                                }

                                PostUpdateProcess(this.campaign.AceId);
                            }
                        }
                        catch (Exception ex)
                        {
                            eventLog.WriteEntry("Error in Sandler.ACE.Emailer.GetToAddresses() processing each individual AceId: " + this.campaign.AceId.ToString() + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                        }
                    }
                }
                else
                {
                    eventLog.WriteEntry("Sandler.ACE.Emailer.ProcessCampaigns() campaigns are null", System.Diagnostics.EventLogEntryType.Information);
                    eventLog.WriteEntry("Sandler.ACE.Emailer.ProcessCampaigns() this.campaign is null", System.Diagnostics.EventLogEntryType.Information);
                    throw new Exception("Sandler.ACE.Emailer.ProcessCampaigns() this.campaign is null");
                }
            }
            catch (Exception ex)
            {
                eventLog.WriteEntry("Exception in Sandler.ACE.Emailer.ProcessCampaigns():" + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                throw ex;
            }
        }

        private void PostUpdateProcess(int aceId)
        {
            Tbl_AceMainInfo _campaign;
            try
            {
                if (aceId == 0)
                {
                    eventLog.WriteEntry("Sandler.ACE.Emailer.PostUpdateProcess() aceId is zero", System.Diagnostics.EventLogEntryType.Information);
                    throw new Exception("Sandler.ACE.Emailer.PostUpdateProcess() aceId is zero");
                }
                else
                {
                    _campaign = uow.AceMainRepository().Get(aceId);
                    _campaign.MessageSentDate = DateTime.Now;
                    uow.AceMainRepository().UpdateCampaign(_campaign);
                }
            }
            catch (Exception ex)
            {
                eventLog.WriteEntry("Exception in Sandler.ACE.Emailer.PostUpdateProcess():" + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                throw ex;
            }
        }
    }
    
}
