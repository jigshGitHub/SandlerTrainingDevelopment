using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Sandler.Emailer;
using System.Net.Mail;
using Sandler.DB.Data;
using Sandler.DB.Data.Common;
using Sandler.DB.Data.Common.Implementation;
using Sandler.DB.Data.Common.Interface;
using Sandler.DB.Data.Repositories;
using Sandler.DB.Models;
namespace Sandler.ACE.Emailer
{
    class Program
    {
        static void Main(string[] args)
        {
            IMailer aceMailer = new ACEmailer();
            EMailer emailer = new EMailer();
            emailer.SendEmail(aceMailer);
        }


    }

    public class ACEmailer : IMailer 
    {
        protected IUnitOfWork uow;
        protected List<AceMainView> preCampaigns;
        protected List<AceMainView> postCampaigns;
        public ACEmailer()
        {
            uow = new SandlerUnitOfWork(new SandlerRepositoryProvider(new RepositoryFactories()), new SandlerDBContext());
            
            preCampaigns = uow.AceMainRepository().GetByCampaignType(1).ToList<AceMainView>();
            postCampaigns = uow.AceMainRepository().GetByCampaignType(2).ToList<AceMainView>();
        }

        public MailAddress GetFromAddress()
        {
            MailAddress mailAddress = null;
            mailAddress = new MailAddress("donotreply@gmail.com");
            //From Address
            //if (Convert.ToBoolean(ConfigurationManager.AppSettings["Server.CredentialsRequired"].ToString()))
            //{
            //    address = new MailAddress("donotreply@gmail.com");
            //}
            //else
            //{
            //    return new MailAddress(CurrentUser.EmailAdress);
            //}
            return mailAddress;
        }

        public string GetSubject()
        {
            return "Test Message";
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
                messageBuilder.Append("<v:fill type='tile' src='http://minedsystemsassetmanagement.com/spm2/images/heroAccent.png' color='#ffffff'/>");
                messageBuilder.Append("</v:background>");
                messageBuilder.Append("<![endif]-->");
                messageBuilder.Append("<table height='100%' width='100%' cellpadding='0' cellspacing='0' border='0'>    ");
                messageBuilder.Append("<tr>");
                messageBuilder.Append("<td valign='top' align='left' background='http://minedsystemsassetmanagement.com/spm2/images/heroAccent.png'>");
                messageBuilder.Append("<table width='100%'>");
                messageBuilder.Append("<tr>");
                messageBuilder.Append("<td>");
                messageBuilder.Append("if you want to set a background image or color in your HTML email, you can set it in your BODY tag, where it usually goes. That’ll work ok for some desktop email applications, like Microsoft Outlook.  But to make it work across more email applications, you need to 'rig' your code so that your entire email is set inside a big TABLE WRAP. Just set a big table that’s 100% wide, then specify your background color and image there. We recommend doing it the old-fashioned 'bgcolor' or 'background='' way. If you prefer doing it with CSS, be sure to read the 'CSS' tips below. As with all images in HTML email, they need to be hosted on your server, and you need to point to them with absolute (not relative) paths.  Once you’ve created the big TABLE WRAP with your background color or image, place your actual newsletter code inside, and you’re good to go.  If you’re a very experienced web designer, this will no doubt make you feel dirty, and make you want to take a shower immediately afterwards. But HTML email isn’t as reliable as web pages are (yet) and there are way too many email apps out there that display HTML differently. Until all the various email apps get a little more consistent, you’re going to have to get used to 'rigs' like this.");
                messageBuilder.Append("</td>");
                messageBuilder.Append("</tr>");
                messageBuilder.Append("<tr>");
                messageBuilder.Append("<td align='centre'><a href='http://minedsystemsassetmanagement.com/spm2/' target='_blank'>Click Me</a>");
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
                throw ex;
            }
            return messageBuilder.ToString();
        }

        public List<MailAddress> GetToAddresses()
        {
            List<MailAddress> toAddresses = null;
            try
            {
                toAddresses = new List<MailAddress>();
                toAddresses.Add(new MailAddress("jigsh@hotmail.com", "Jignesh Shah"));
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return toAddresses;
        }
    }
    
}
