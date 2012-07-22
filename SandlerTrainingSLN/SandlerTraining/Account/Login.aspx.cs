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
        Response.Redirect("Default.aspx");
    }
    protected void sandlerLogin_LoggedIn(object sender, EventArgs e)
    {
        //CurrentUser = Membership.GetUser(sandlerLogin.UserName);        
    }
}