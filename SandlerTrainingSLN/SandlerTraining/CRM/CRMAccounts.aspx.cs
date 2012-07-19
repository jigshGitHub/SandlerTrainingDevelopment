using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMAccounts : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAddAccount_Click(object sender, EventArgs e)
    {
        Response.Redirect("CRMAddAccount.aspx");
    }
    protected void gvAccounts_SelectedIndexChanged(object sender, EventArgs e)
    {
        hidAccountID.Value = gvAccounts.SelectedDataKey.Value.ToString();
        Server.Transfer("CRMViewAccount.aspx");
    }
    protected void gvAccounts_DataBound(object sender, EventArgs e)
    {
        if (gvAccounts.Rows.Count == 0)
        {
            LblStatus.Text = "There are no Accounts entered in the System.";
        }
        else
        {
            LblStatus.Text = "";
        }
    }
   
}