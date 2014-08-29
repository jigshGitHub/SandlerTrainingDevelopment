using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sandler.Web.Areas.RDL
{
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                LoadReport();

        }
        private void LoadReport()
        {
            string reportName = Request.QueryString["rpt"];
            List<ReportParameter> rptParams = new List<ReportParameter>();

            #region [[ Commented code ]]
            //switch (reportName)
            //{
            //    case "1":
            //        /*string[] franchiseList = (string[])Session["FranchiseList"];
            //        string[] statusList = (string[])Session["statusList"];
            //        ReportParameter param = new ReportParameter("Franchise");
            //        param.Values.AddRange(franchiseList);
            //        rptParams.Add(param);
            //        ReportParameter param1 = new ReportParameter("Status");
            //        //string[] values1 = new string[] { "Prospect" };
            //        param1.Values.AddRange(statusList);
            //        rptParams.Add(param1);
            //        */
            //         string[] franchiseeID = new string[] { "8" };
            //        ReportParameter paramFranchiseeID = new ReportParameter("Franchise");
            //        paramFranchiseeID.Values.AddRange(franchiseeID);
            //        rptParams.Add(paramFranchiseeID);

            //        break;
            //    case "2":
            //        string[] franchiseID = new string[] { "8" };
            //        ReportParameter paramFranchiseID = new ReportParameter("Franchise");
            //        paramFranchiseID.Values.AddRange(franchiseID);
            //        rptParams.Add(paramFranchiseID);
            //        break;
            //}
            #endregion
            
            ReportViewer1.ProcessingMode = ProcessingMode.Remote;
            string ReportsUserName = ConfigurationManager.AppSettings["ReportsUserName"];
            string ReportsUserPassword = ConfigurationManager.AppSettings["ReportsUserPassword"];
            string ReportsDomain = ConfigurationManager.AppSettings["ReportsDomain"];
            string ReportsServerURL = ConfigurationManager.AppSettings["ReportsServerURL"];
            string ReportFolderPath = ConfigurationManager.AppSettings["ReportFolderPath"];
            IReportServerCredentials irsc = new CustomReportCredentials(ReportsUserName, ReportsUserPassword, ReportsDomain);
            ReportViewer1.ServerReport.ReportServerUrl = new Uri(ReportsServerURL);
            //ReportViewer1.ServerReport.ReportPath = "/" + "TotalPipelinebyStatusAndFranchiseSpecificbyID";//reportName;

            ReportViewer1.ServerReport.ReportPath = ReportFolderPath + reportName;//reportName;
            
            //ReportViewer1.ShowParameterPrompts = false;
            if (reportName.Contains("WithPara"))
            {
                ReportViewer1.ShowParameterPrompts = true;
            }
            else
            {
                ReportViewer1.ShowParameterPrompts = false;
            }
            ReportViewer1.ShowPrintButton = true;
            this.ReportViewer1.ServerReport.SetParameters(rptParams);
            ReportViewer1.ServerReport.Refresh();

        }
    }


    public class CustomReportCredentials : IReportServerCredentials
    {
        private string _UserName;
        private string _PassWord;
        private string _DomainName;

        public CustomReportCredentials(string UserName, string PassWord, string DomainName)
        {
            _UserName = UserName;
            _PassWord = PassWord;
            _DomainName = DomainName;
        }

        public System.Security.Principal.WindowsIdentity ImpersonationUser
        {
            get { return null; }
        }

        public ICredentials NetworkCredentials
        {
            get { return new NetworkCredential(_UserName, _PassWord, _DomainName); }
        }

        public bool GetFormsCredentials(out Cookie authCookie, out string user,
         out string password, out string authority)
        {
            authCookie = null;
            user = password = authority = null;
            return false;
        }
    }
}