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
            //HyperLink activeLink = (HyperLink)Page.Master.FindControl("lnk" + Page.Title);
            //if (activeLink != null)
            //    activeLink.CssClass = "menuLinkActive";

            //HtmlAnchor activeLink = (HtmlAnchor)Page.Master.FindControl("anchor" + Page.Title);
            HtmlAnchor activeLink = (HtmlAnchor)FindControl("anchor" + Page.Title);
            if (activeLink == null)
            {
                if(Page.Title.Contains("CRM"))
                    activeLink = (HtmlAnchor)FindControl("anchorCRM");
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
                link.HRef = this.Page.ResolveClientUrl("~/Account/Coach/Index.aspx");
                link.Visible = true;
            }
            if (thisPage.CurrentUser.Role == SandlerModels.SandlerRoles.Corporate || thisPage.CurrentUser.Role == SandlerModels.SandlerRoles.Coach)
            {
                link = ((HtmlAnchor)FindControl("manageFranchiseeAnchor"));
                link.HRef = this.Page.ResolveClientUrl("~/Account/FranchiseeOwner/Index.aspx");
                link.Visible = true;
            }
            if (thisPage.CurrentUser.Role == SandlerModels.SandlerRoles.FranchiseeOwner)
            {
                link = ((HtmlAnchor)FindControl("manageFranchiseeUserAnchor"));
                link.HRef = this.Page.ResolveClientUrl("~/Account/FranchiseeUser/Index.aspx");
                link.Visible = true;
            }
        }
    }
}