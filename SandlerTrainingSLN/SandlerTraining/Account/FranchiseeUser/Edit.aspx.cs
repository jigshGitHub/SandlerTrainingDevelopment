using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_FranchiseeUser_Edit : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            hdnFranchiseeId.Value = CurrentUser.FranchiseeID.ToString();
            hdnFranchiseeUserUserId.Value = Request.QueryString["UserId"];
            hdnFranchiseeOwnerUserId.Value = CurrentUser.UserId.ToString();
        }
    }
}