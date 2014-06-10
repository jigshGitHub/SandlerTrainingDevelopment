using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using SandlerModels.DataIntegration;
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
        UserEntitiesFactory.ReLoad();
        if (Roles.IsUserInRole(sandlerLogin.UserName, SandlerModels.SandlerRoles.HomeOfficeAdmin.ToString()) || Roles.IsUserInRole(sandlerLogin.UserName, SandlerModels.SandlerRoles.HomeOfficeUser.ToString()))
            Response.Redirect("~/CRM/HomeOffice/Index.aspx");
        //ProfileCommon profile = HttpContext.Current.Profile as ProfileCommon;
        //if (profile.AcceptedAgrements)
        Response.Redirect("~/Default.aspx");
        //else
        //    Response.Redirect("~/AcceptAgreements.aspx");
    }

    private void SetLoginFailureText(string text)
    {
        if (string.IsNullOrEmpty(sandlerLogin.FailureText))
            sandlerLogin.FailureText = text;
    }
    protected void sandlerLogin_Authenticate(object sender, AuthenticateEventArgs e)
    {
        sandlerLogin.FailureText = "";
        MembershipUser user = Membership.GetUser(sandlerLogin.UserName);
        if(user != null)
            SetLoginFailureText("Username/password is incorrect.");
        else
            SetLoginFailureText("No User/Login found in the system");

        if (Membership.ValidateUser(sandlerLogin.UserName, sandlerLogin.Password))
        {
            e.Authenticated = true;
        }
        else if(user!= null && LDAPValidation("108.40.102.115:389",sandlerLogin.UserName, sandlerLogin.Password))
        {
            e.Authenticated = true;
            if (Session["IsLDAPUser"] == null)
                Session["IsLDAPUser"] = true;
        }
        else{
            SetLoginFailureText("No User/Login found in the system");
        }

    }

    private bool LDAPValidation(string ldapDomain, string userName, string password)
    {
        sandlerLogin.FailureText = "";

        System.DirectoryServices.DirectoryEntry de = new System.DirectoryServices.DirectoryEntry(@"LDAP://" + ldapDomain, userName, password);

        try
        {
            object o = de.NativeObject;
            //This means LDAP has found the entry with username and Password
            return true;
        }
        catch (Exception ex)
        {
            //Either User does not exists or password is Wrong
            SetLoginFailureText("LDAP validation failed:" + ex.Message);
            return false;
        }
    }

}