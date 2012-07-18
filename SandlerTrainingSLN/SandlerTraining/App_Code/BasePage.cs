using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
/// <summary>
/// Summary description for BasePage
/// </summary>

public abstract class BasePage : System.Web.UI.Page
{
    protected MembershipUser CurrentUser
    {
        get
        {
            return Membership.GetUser(HttpContext.Current.User.Identity.Name); ;
        }
    }
    
    protected override void OnPreInit(EventArgs e)
    {
        base.OnPreInit(e);
        if (CurrentUser.CreationDate == CurrentUser.LastPasswordChangedDate)
            Response.Redirect("~/Account/ChangePassword.aspx");
    }


    protected override void OnPreLoad(EventArgs e)
    {
        base.OnPreLoad(e);
    }

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
    }
}