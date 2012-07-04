using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
public partial class SiteAdmin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {            
        }

    }

    protected void CreateRoleButton_Click(object sender, EventArgs e)
    {
        string newRoleName = RoleName.Text.Trim();
        try
        {


            if (!Roles.RoleExists(newRoleName))
            {
                // Create the role
                Roles.CreateRole(newRoleName);

                // Refresh the RoleList Grid
                //DisplayRolesInGrid();
            }

            lblMessage.Text = string.Format("{0} created successfully.", newRoleName);
            RoleName.Text = "";
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }
    protected void SandlerCreateUserWizard_CreatedUser(object sender, EventArgs e)
    {
        FormsAuthentication.SetAuthCookie(SandlerCreateUserWizard.UserName, false /* createPersistentCookie */);

        CheckBoxList RoleList = SandlerCreateUserWizard.CreateUserStep.ContentTemplateContainer.FindControl("RoleList") as CheckBoxList; ;

        foreach (ListItem item in RoleList.Items)
        {
            if (item.Selected)
            {
                Roles.AddUserToRole(SandlerCreateUserWizard.UserName, item.Value);
            }
        }

    }
    protected void SandlerCreateUserWizard_CreateUserError(object sender, CreateUserErrorEventArgs e)
    {
        MembershipCreateStatus s = e.CreateUserError;

    }
}