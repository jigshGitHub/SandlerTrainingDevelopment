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
        }
    }
    
    protected void linkContacts_Click(object sender, EventArgs e)
    {
        Response.Redirect("CRMContacts.aspx");
    }
    protected void linkCompanies_Click(object sender, EventArgs e)
    {
        Response.Redirect("CRMCompanies.aspx");
    }
    protected void linkDocuments_Click(object sender, EventArgs e)
    {
        Response.Redirect("CRMDocuments.aspx");
    }
    protected void linkForOpps_Click(object sender, EventArgs e)
    {
        Response.Redirect("CRMOpportunities.aspx");
    }

    
}
