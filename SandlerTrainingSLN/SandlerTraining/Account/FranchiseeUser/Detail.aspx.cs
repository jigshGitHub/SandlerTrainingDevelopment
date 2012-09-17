using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_FranchiseeUser_Detail : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            hdnFranchiseeId.Value = CurrentUser.FranchiseeID.ToString();
            hdnFranchiseeUserUserId.Value = Request.QueryString["UserId"];
            hdnFranchiseeOwnerUserId.Value = CurrentUser.UserId.ToString();
            anchorEdit.HRef = "Edit.aspx?UserId=" + hdnFranchiseeUserUserId.Value;
        }
    }
}