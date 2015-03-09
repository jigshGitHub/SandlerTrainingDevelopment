using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


using Sandler.DB.Data.Common;
using Sandler.DB.Data.Common.Implementation;
using Sandler.DB.Data.Common.Interface;
using Sandler.DB.Data.Repositories;
using Sandler.DB.Models;

namespace Sandler.Web.Feedback.Controllers
{
    public class HomeController : BaseController 
    {
        public HomeController(IUnitOfWork uow)
            : base(uow)
        {   
        }
        public HomeController()
            : this(new SandlerUnitOfWork(new SandlerRepositoryProvider(new RepositoryFactories()), new SandlerDBContext()))
        {
        }

        public ActionResult ACEFeedback(string id)
        {
            Tbl_AceEmailTracker receipient = null;
            Tbl_AceMainInfo campaign = null;
            string callToActionText ="";
            try
            {
                receipient = this.uow.AceEmailTrackerRepository().Get(new Guid(id));
                if (receipient != null)
                {

                    
                    campaign = this.uow.AceMainRepository().Get(receipient.AceId);

                    if (campaign != null)
                    {
                        callToActionText= uow.AceMainRepository().GetCallToActionTypeOptions().Where(r => r.CallToActionId == int.Parse(campaign.CallToActionId.ToString())).FirstOrDefault().CallToActionText;
                        campaign.TotalCountConfirm = ++campaign.TotalCountConfirm;
                        this.uow.AceMainRepository().UpdateCampaign(campaign);

                        aspnet_Membership  responseTo = this.uow.MembershipRepository().Get(new Guid(campaign.ResponseTo));
                        string receiver = this.uow.AceEmailTrackerRepository().Get(new Guid(id)).EmailAddress;
                        FeedbackEmailer emailer = new FeedbackEmailer();
                        emailer.Subject = campaign.MessageSubject;
                        emailer.ToAddress = responseTo.Email;
                        emailer.BodyMessage = string.Format("\"{0}\" has responded to the \"{1}\" campaign by clicking the \"{2}\" call-to-action item.",receiver, campaign.CampaignName, callToActionText) ;//System.Configuration.ConfigurationManager.AppSettings["responseToMessage"].ToString();
                        emailer.FromAddress = System.Configuration.ConfigurationManager.AppSettings["Server.EmailSender"].ToString();
                        Sandler.Emailer.EMailer mailer = new Emailer.EMailer();
                        mailer.SendEmail(emailer);
                    }

                    //receipient.IsViewed = true;
                    //this.uow.AceEmailTrackerRepository().Update(receipient); 
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            

            return View();
        }
    }

    public class FeedbackEmailer : Sandler.Emailer.IMailer
    {
        public string Subject { get; set; }
        public string ToAddress { get; set; }
        public string BodyMessage { get; set; }
        public string FromAddress { get; set; }
        public System.Net.Mail.MailAddress GetFromAddress()
        {
            return new System.Net.Mail.MailAddress(FromAddress);
        }

        public string GetSubject()
        {
            return Subject;
        }

        public string PrepareHTMLMessageBody()
        {
            return BodyMessage;
        }

        public List<System.Net.Mail.MailAddress> GetToAddresses()
        {
            List<System.Net.Mail.MailAddress> toAddresses = new List<System.Net.Mail.MailAddress>();
            toAddresses.Add(new System.Net.Mail.MailAddress(ToAddress));
            return toAddresses;
        }

        public void PrepareAttachments(System.Net.Mail.MailMessage message)
        {
        }
    }
}
