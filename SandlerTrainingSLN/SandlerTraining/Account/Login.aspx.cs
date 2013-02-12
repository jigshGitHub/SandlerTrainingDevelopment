using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
public partial class Login : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        
    }
    protected void sandlerLogin_LoggedIn(object sender, EventArgs e)
    {
        //ProfileCommon profile = HttpContext.Current.Profile as ProfileCommon;
        //if (profile.AcceptedAgrements)
            Response.Redirect("~/Default.aspx");
        //else
        //    Response.Redirect("~/AcceptAgreements.aspx");
    }
}