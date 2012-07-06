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
    protected void linkSalesPipeLine_Click(object sender, EventArgs e)
    {
        Response.Redirect("CRMSalesPipeLine.aspx");
    }
    protected void linkForCasting_Click(object sender, EventArgs e)
    {
        Response.Redirect("CRMForCasting.aspx");
    }
    protected void linkAccounts_Click(object sender, EventArgs e)
    {
        Response.Redirect("CRMAccounts.aspx");
    }
    protected void linkDocuments_Click(object sender, EventArgs e)
    {
        Response.Redirect("CRMDocuments.aspx");
    }
}
