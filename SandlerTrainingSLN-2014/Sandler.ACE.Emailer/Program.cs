using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Net;
using System.Net.Mail;
namespace Sandler.ACE.Emailer
{
    class Program
    {
        static void Main(string[] args)
        {
        }


    }

    public class ACEMailer
    {
        public void SendEmail()
        {
            SmtpClient smtpClient = new SmtpClient();

                try
                {
                    MailMessage mail = new MailMessage();

                    mail.From = new MailAddress("vinach@gmail.com");
                    mail.To.Add(row["GroupToEmails"].ToString());
                    mail.CC.Add(row["GroupCCEmails"].ToString());
                    mail.Bcc.Add(row["GroupBCCEmails"].ToString());

                    mail.Subject = row["EmailSubject"].ToString();
                    mail.Body = row["EmailBody"].ToString();

                    string filepath = "C:\\temp\\";
                    string s = row["filenames"].ToString();
                    string[] values = s.Split(',');
                    for (int i = 0; i < values.Length; i++)
                    {
                        values[i] = values[i].Trim();

                        string fname = filepath + values[i];
                        mail.Attachments.Add(new Attachment(fname));
                    }

                    // SMPT settings
                    SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                    smtp.UseDefaultCredentials = false;
                    smtp.EnableSsl = true;
                    smtp.Credentials = new NetworkCredential("jshahcareer@gmail.com", "N!mda420$0115");
                    smtp.Send(mail);
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.ToString());
                }

        }
    }
}
