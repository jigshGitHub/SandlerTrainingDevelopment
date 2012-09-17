using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_FranchiseeUser_Add : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            hdnFranchiseeId.Value = CurrentUser.FranchiseeID.ToString();
            hdnFranchiseeOwnerUserId.Value = CurrentUser.UserId.ToString();
        }
    }
}