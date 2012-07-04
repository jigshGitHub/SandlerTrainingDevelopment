using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMAddAccount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void dvAccount_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        lblResult.Text = "Account created Successfully!";

    }
    protected void dvAccount_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        if (e.CancelingEdit)
        {
            Response.Redirect("CRMAccounts.aspx");
        }
    }
}