using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerRepositories;
using System.Data;
using Microsoft.Reporting.WebForms;
using System.Security;
using System.Security.Permissions;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Specialized;
using System.Web.UI.HtmlControls;
using System.Net;

public partial class RDL_DashboardViewer : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                ProcessReport();
            }

            catch (Exception excany)
            {
            }
        }
    }

    private void ProcessReport()
    {
        //Session["reportName"] = "CustomReportingDashboard";
        string reportName = "CustomReportingDashboard";
        List<ReportParameter> rptParams = new List<ReportParameter>();
        
        //Common steps - no changes here
        ReportViewer1.ProcessingMode = ProcessingMode.Remote;
        string ReportsUserName = ConfigurationManager.AppSettings["ReportsUserName"];
        string ReportsUserPassword = ConfigurationManager.AppSettings["ReportsUserPassword"];
        string ReportsDomain = ConfigurationManager.AppSettings["ReportsDomain"];
        string ReportsServerURL = ConfigurationManager.AppSettings["ReportsServerURL"];
        string ReportFolderPath = ConfigurationManager.AppSettings["ReportFolderPath"];

        IReportServerCredentials irsc = new CustomReportCredentials(ReportsUserName, ReportsUserPassword, ReportsDomain);
        ReportViewer1.ServerReport.ReportServerUrl = new Uri(ReportsServerURL);
        ReportViewer1.ServerReport.ReportPath = ReportFolderPath + reportName;
        ReportViewer1.ShowParameterPrompts = false;
        ReportViewer1.ShowPrintButton = true;
        this.ReportViewer1.ServerReport.SetParameters(rptParams);
        ReportViewer1.ServerReport.Refresh();
        
    }
    
    protected void ReportViewer1_DataBinding(object sender, EventArgs e)
    {

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