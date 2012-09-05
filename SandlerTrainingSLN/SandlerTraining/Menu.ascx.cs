using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

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
            }
            if (activeLink != null)
                activeLink.Attributes.Add("class", "menuLinkActive");

            SecureNavigation();
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
            if (thisPage.CurrentUser.Role == SandlerModels.SandlerRoles.FranchiseeOwner)
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
        }
    }
}