using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using SandlerModels;
using SandlerModels.DataIntegration;

namespace SandlerRepositories
{    
    public partial class HomeOfficeReportRepository
    {
        DBFactory db = new DBFactory();
        public string reportDisplayName = "";
        //update menu contact details to contract details
        public DataSet GetReportByName(string reportName,string reportType)
        {
            reportDisplayName = "";
            DataSet returnValue = null;
            switch (reportName)
            {
                case "frbycoach": returnValue = db.ExecuteDataset("sp_GetHomeOfficeReportfrbycoach", "HomeOfficeReportsfrbycoach", new SqlParameter("@reportType", reportType));
                    reportDisplayName = "Franchisee Report By Coach";   
                    break;
                case "frbyregion": returnValue = db.ExecuteDataset("sp_GetHomeOfficeReportfrbyregion", "HomeOfficeReportsfrbyregion", new SqlParameter("@reportType", reportType));
                    reportDisplayName = "Franchisee Report By Region";       
                    break;
                case "frbystate": returnValue = db.ExecuteDataset("sp_GetHomeOfficeReportfrbystate", "HomeOfficeReportsfrbystate", new SqlParameter("@reportType", reportType));
                    reportDisplayName = "Franchisee Report By State";          
                    break;
                case "frbycountry": returnValue = db.ExecuteDataset("sp_GetHomeOfficeReportfrbycountry", "HomeOfficeReportsfrbycountry", new SqlParameter("@reportType", reportType));
                    reportDisplayName = "Franchisee Report By Country/Province";           
                    break;
                case "frbyawlevel": returnValue = db.ExecuteDataset("sp_GetHomeOfficeReportfrbyawlevel", "HomeOfficeReportsfrbyawlevel", new SqlParameter("@reportType", reportType));
                    reportDisplayName = "Franchisee Report By Award Level";           
                    break;
                case "frbytrngdate": returnValue = db.ExecuteDataset("sp_GetHomeOfficeReportfrbytrngdate", "HomeOfficeReportsfrbytrngdate", new SqlParameter("@reportType", reportType));
                    reportDisplayName = "Franchisee Report By Initial Training Date";          
                    break;
                case "frbycontdetails": returnValue = db.ExecuteDataset("sp_GetHomeOfficeReportfrbycontdetails", "HomeOfficeReportsfrbycontdetails", new SqlParameter("@reportType", reportType));
                    reportDisplayName = "Report of Franchisee Contract Details";           
                    break;
                case "frbybusarea": returnValue = db.ExecuteDataset("sp_GetHomeOfficeReportfrbybusarea", "HomeOfficeReportsfrbybusarea", new SqlParameter("@reportType", reportType));
                    reportDisplayName = "Report of Franchisee By Primary Business Area";             
                    break;
                case "frbycertlevel": returnValue = db.ExecuteDataset("sp_GetHomeOfficeReportfrbycertlevel", "HomeOfficeReportsfrbycertlevel", new SqlParameter("@reportType", reportType));
                    reportDisplayName = "Franchisee Report By Certification Level";                        
                    break;
                case "frbyusingcrm": returnValue = db.ExecuteDataset("sp_GetHomeOfficeReportfrbyusingcrm", "HomeOfficeReportsfrbyusingcrm", new SqlParameter("@reportType", reportType));
                    reportDisplayName = "Franchisee Report By Sandler CRM Use";                            
                    break;

                case "mfrd": returnValue = db.ExecuteDataset("sp_GetHomeOfficeReportmfrd", "HomeOfficeReportmfrd", new SqlParameter("@reportType", reportType));
                    reportDisplayName = "Report of Master Franchisee Details";                                
                    break;

                case "msfr": returnValue = db.ExecuteDataset("sp_GetHomeOfficeReportmsfr", "HomeOfficeReportmsfr", new SqlParameter("@reportType", reportType));
                    reportDisplayName = "Report of Master Franchisee and Their Subfranchisees";                                    
                    break;


                case "msrbykeyopnldr": returnValue = db.ExecuteDataset("sp_GetHomeOfficeReportmsrbykeyopnldr", "HomeOfficeReportmsrbykeyopnldr", new SqlParameter("@reportType", reportType));
                    reportDisplayName = "Report of Key Opinion Leader Franchisees";                                        
                    break;
                case "msrbyadvboard": returnValue = db.ExecuteDataset("sp_GetHomeOfficeReportmsrbyadvboard", "HomeOfficeReportmsrbyadvboard", new SqlParameter("@reportType", reportType));
                    reportDisplayName = "Report of Advisory Board Members";                                            
                    break;
                case "msrbymktgcom": returnValue = db.ExecuteDataset("sp_GetHomeOfficeReportmsrbymktgcom", "HomeOfficeReportmsrbymktgcom", new SqlParameter("@reportType", reportType));
                    reportDisplayName = "Report of Marketing Committee Members";    
                    break;


                case "dhsa": returnValue = db.ExecuteDataset("sp_GetHomeOfficeReportdhsa", "HomeOfficeReportdhsa", new SqlParameter("@reportType", reportType));
                    reportDisplayName = "Report of Franchisees Receiving the David H.Sandler Award";        
                    break;
                case "ctra": returnValue = db.ExecuteDataset("sp_GetHomeOfficeReportctra", "HomeOfficeReportctra", new SqlParameter("@reportType", reportType));
                    reportDisplayName = "Report of Allowable Contractor Usage by Franchisee";            
                    break;
                case "sere": returnValue = db.ExecuteDataset("sp_GetHomeOfficeReportsere", "HomeOfficeReportsere", new SqlParameter("@reportType", reportType));
                    reportDisplayName = "Report of Sandler E-mail Required by Franchisee";             
                    break;
                case "zcbt": returnValue = db.ExecuteDataset("sp_GetHomeOfficeReportzcbt", "HomeOfficeReportzcbt", new SqlParameter("@reportType", reportType));
                    reportDisplayName = "Report of Franchisee Zip Codes by Territory";                 
                    break;
                case "msfc": returnValue = db.ExecuteDataset("sp_GetHomeOfficeReportmsfc", "HomeOfficeReportmsfc", new SqlParameter("@reportType", reportType));
                    reportDisplayName = "Report of Franchisee Who Must Submit Financials";                     
                    break;
                case "prpl": returnValue = db.ExecuteDataset("sp_GetHomeOfficeReportprpl", "HomeOfficeReportprpl", new SqlParameter("@reportType", reportType));
                    reportDisplayName = "Report of Franchisee by Required Product Purchase Level";                         
                    break;
                case "frmd": returnValue = db.ExecuteDataset("sp_GetHomeOfficeReportfrmd", "HomeOfficeReportfrmd", new SqlParameter("@reportType", reportType));
                    reportDisplayName = "Report of Franchisees and Their Associates";                             
                    break;
                case "glaa": returnValue = db.ExecuteDataset("sp_GetHomeOfficeReportglaa", "HomeOfficeReportglaa", new SqlParameter("@reportType", reportType));
                    reportDisplayName = "Report of Franchisees with Representative Agreements for Global Accounts";                                 
                    break;
                    
            }
            return returnValue;
        }
     }
}
