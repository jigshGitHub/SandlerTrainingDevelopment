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
    protected MembershipUser CurrentUser;
    
    protected override void OnPreInit(EventArgs e)
    {
        base.OnPreInit(e);
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