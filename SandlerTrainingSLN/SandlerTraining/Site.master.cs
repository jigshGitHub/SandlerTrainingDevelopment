using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //HyperLink activeLink = (HyperLink)Page.Master.FindControl("lnk" + Page.Title);
            //if (activeLink != null)
            //    activeLink.CssClass = "menuLinkActive";

            HtmlAnchor activeLink = (HtmlAnchor)Page.Master.FindControl("anchor" + Page.Title);
            if (activeLink != null)
                activeLink.Attributes.Add("class","menuLinkActive");
        }
    }

}
