using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerModels.DataModels;
public partial class Header : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void HeadLoginStatus_LoggingOut(object sender, LoginCancelEventArgs e)
    {
        Session["CurrentUser"] = null;
        UserEntitiesFactory.ReLoad();
    }
}