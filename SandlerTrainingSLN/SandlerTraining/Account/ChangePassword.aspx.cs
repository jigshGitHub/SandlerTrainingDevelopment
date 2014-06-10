using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Configuration;
public partial class Account_ChangePassword : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (CurrentUser.IsLDAPUser)
            {
                pnlChangePassword.Visible = false;
                lblPasswordCanBeChanged.Text = ConfigurationManager.AppSettings["PasswordCanBeChangedMessage"].ToString();
            }
            if (Request.QueryString["intialPasswordChange"] != null)
            {
                lblIntialPwdChange.Visible = (Request.QueryString["intialPasswordChange"] == "true");
            }
            lblPasswordInstruction.Text = "New passwords must be at least " + Membership.MinRequiredPasswordLength + " characters in length including " + Membership.MinRequiredNonAlphanumericCharacters + " \"special\" character (e.g. !, @, #, etc.)";
        }
    }
    protected void ChangeUserPassword_ChangePasswordError(object sender, EventArgs e)
    {
        lblPasswordInstruction.CssClass = "failureNotification";
        lblIntialPwdChange.Text = "";
    }
    protected void ChangeUserPassword_ChangingPassword(object sender, LoginCancelEventArgs e)
    {
        if (!Membership.ValidateUser(User.Identity.Name, ChangeUserPassword.CurrentPassword))
        {
            ChangeUserPassword.ChangePasswordFailureText = "The Old Password entered is incorrect.  Please re-enter the old password and try again.";            
        }
        else if (ChangeUserPassword.NewPassword != ChangeUserPassword.ConfirmNewPassword)
        {
            ChangeUserPassword.ChangePasswordFailureText = "The New Password entered is not-consistent.  Please ensure the “New Password” and “Confirm New Password” match, and try again.";            
        }
    }
}
