using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_Coach_Details : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            hdnCoachId.Value = Request.QueryString["id"];        
            hdnCorporateUserID.Value = CurrentUser.UserId.ToString();
            anchorEdit.HRef = "Edit.aspx?id=" + hdnCoachId.Value;
        }
    }
}