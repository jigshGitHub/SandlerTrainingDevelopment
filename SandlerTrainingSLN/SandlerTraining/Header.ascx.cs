using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerModels.DataIntegration;
using System.Web.UI.HtmlControls;
using System.Configuration;
public partial class Header : System.Web.UI.UserControl
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BasePage thisPage = this.Page as BasePage;
            if (thisPage != null)
            {
                string[] specialUsers = ConfigurationManager.AppSettings["specialAccessUsers"].Split(new char[] { ';' });
                if (specialUsers.Contains(thisPage.CurrentUser.UserName))
                {
                    HtmlAnchor link = null;
                    link = ((HtmlAnchor)FindControl("anchorUserGuide"));
                    link.Visible = true;

                    link = ((HtmlAnchor)FindControl("anchorIcidentReporting"));
                    link.Visible = true;
                }
            }
        }
    }

    protected void HeadLoginStatus_LoggingOut(object sender, LoginCancelEventArgs e)
    {
        Session["CurrentUser"] = null;
        UserEntitiesFactory.ReLoad();
    }
}