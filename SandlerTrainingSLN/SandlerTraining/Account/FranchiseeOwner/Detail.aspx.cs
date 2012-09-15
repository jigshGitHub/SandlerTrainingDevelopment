using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_FranchiseeOwner_Details : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            hdnFranchiseeId.Value = Request.QueryString["id"];
            hdnFranchiseeOwnerUserId.Value = Request.QueryString["UserId"];
            hdnCoachId.Value = CurrentUser.UserId.ToString();
            anchorEdit.HRef = "Edit.aspx?UserId=" + hdnFranchiseeOwnerUserId.Value + "&id=" + hdnFranchiseeId.Value;
        }
    }
}