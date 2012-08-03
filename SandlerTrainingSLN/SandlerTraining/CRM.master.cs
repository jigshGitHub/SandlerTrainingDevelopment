using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class CRM : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            HtmlButton activeButton = (HtmlButton)Page.Master.FindControl("btn" + Page.Title);
            if(activeButton != null)
                activeButton.Attributes.Add("class", "menuButtonActive");
            HyperLink activeLink = (HyperLink)Page.Master.FindControl("lnk" + Page.Title);
            if (activeLink != null)
                activeLink.CssClass = "menuLinkActive";

            LinkButton activeSubMenuLink = null;
            if(Request.Url.AbsoluteUri.Contains("CRM/Companies"))
                activeSubMenuLink = (LinkButton)Page.Master.FindControl("linkCompanies");
            else if (Request.Url.AbsoluteUri.Contains("CRM/Contacts"))
                activeSubMenuLink = (LinkButton)Page.Master.FindControl("linkContacts");
            else if (Request.Url.AbsoluteUri.Contains("CRM/Opportunities"))
                activeSubMenuLink = (LinkButton)Page.Master.FindControl("linkOpportunities");
            else if (Request.Url.AbsoluteUri.Contains("CRM/Documents"))
                activeSubMenuLink = (LinkButton)Page.Master.FindControl("linkDocuments");

            if (activeSubMenuLink != null)
                activeSubMenuLink.CssClass = "CRMSubMenusActive";
        }
    }
    
    protected void linkContacts_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/CRM/Contacts/Index.aspx");
    }
    protected void linkCompanies_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/CRM/Companies/Index.aspx");
    }
    protected void linkDocuments_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/CRM/Documents/Index.aspx");
    }
    protected void linkOpportunities_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/CRM/Opportunities/Index.aspx");
    }

}
