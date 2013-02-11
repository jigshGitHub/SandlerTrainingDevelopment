using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Configuration;

public partial class Menu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            HtmlAnchor activeLink = (HtmlAnchor)FindControl("anchor" + Page.Title);
            if (activeLink == null)
            {
                if (Page.Title.Contains("CRM"))
                    activeLink = (HtmlAnchor)FindControl("anchorCRM");
                else if (Page.Title.Contains("My Account"))
                    activeLink = (HtmlAnchor)FindControl("anchorMyAccount");
                else if (Page.Title.Contains("Reports"))
                    activeLink = (HtmlAnchor)FindControl("anchorChart");
                else if (Page.Title.Contains("Benchmarks"))
                    activeLink = (HtmlAnchor)FindControl("anchorBenchmarks");
            }
            if (activeLink != null)
                activeLink.Attributes.Add("class", "menuLinkActive");

            SecureNavigation();
            anchorCostOfSale.HRef = string.Format("{0}?{1}={2}&{3}={4}&SubType={5}", "~/Reports/CostOfSale.aspx", ConfigurationManager.AppSettings["QueryStringParamDrillChartIDs"], "CostOfSale", ConfigurationManager.AppSettings["QueryStringParamDrillBy"], "", "");
            anchorSalesCycleTime.HRef = string.Format("{0}?{1}={2}&{3}={4}&SubType={5}", "~/ChartPage.aspx", ConfigurationManager.AppSettings["QueryStringParamDrillChartIDs"], "SalesCycleTimeMain", ConfigurationManager.AppSettings["QueryStringParamDrillBy"], "", "");
            anchorSalesTotalByMonth.HRef = string.Format("{0}?{1}={2}&{3}={4}&SubType={5}", "~/Reports/SalesTotal.aspx", ConfigurationManager.AppSettings["QueryStringParamDrillChartIDs"], "SalesTotalsByMonthQty", ConfigurationManager.AppSettings["QueryStringParamDrillBy"], "", "");
        }
    }

    private void SecureNavigation()
    {
        BasePage thisPage = this.Page as BasePage;
        if (thisPage != null)
        {
            HtmlAnchor link = null;
            if (thisPage.CurrentUser.Role == SandlerModels.SandlerRoles.Corporate)
            {
                link = ((HtmlAnchor)FindControl("manageCoachAnchor"));
                link.HRef = "~/Account/Coach/Index.aspx";
                link.Visible = true;
            }
            if (thisPage.CurrentUser.Role == SandlerModels.SandlerRoles.Coach)
            {
                link = ((HtmlAnchor)FindControl("manageFranchiseeAnchor"));
                link.HRef = "~/Account/FranchiseeOwner/Index.aspx";
                link.Visible = true;
            }
            if (thisPage.CurrentUser.Role == SandlerModels.SandlerRoles.FranchiseeOwner || thisPage.CurrentUser.Role == SandlerModels.SandlerRoles.Client)
            {
                link = ((HtmlAnchor)FindControl("manageFranchiseeUserAnchor"));
                link.HRef = "~/Account/FranchiseeUser/Index.aspx";
                link.Visible = true;
            }
            if (thisPage.CurrentUser.Role != SandlerModels.SandlerRoles.Corporate)
            {
                link = ((HtmlAnchor)FindControl("manageEmailSubscription"));
                link.HRef = "~/Email/ManageEmailSubscription.aspx";
                link.Visible = true;
            }
            if (thisPage.CurrentUser.Role == SandlerModels.SandlerRoles.Client)
            {
                reportsMenu.Attributes.Add("style", "display:none");
                anchorBenchmarks.Visible = false;
                anchorAssessment.Visible = false;
                clientLogo.Visible = true;
            }
        }
    }
}