using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMContacts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void ddlCompany_DataBound(object sender, EventArgs e)
    {
        if (!(ddlCompany.Items.Count == 0))
        {
            ListItem selectItem = new ListItem("All", "0");
            ddlCompany.Items.Insert(0, selectItem);
        }
    }
    protected void gvContacts_SelectedIndexChanged(object sender, EventArgs e)
    {
        hidContactID.Value = gvContacts.SelectedDataKey.Value.ToString() ;
        Server.Transfer("CRMViewContact.aspx");
    }
    protected void btnAddContact_Click(object sender, EventArgs e)
    {
        Response.Redirect("CRMAddContact.aspx");
    }
    protected void gvContacts_DataBound(object sender, EventArgs e)
    {
        if (gvContacts.Rows.Count == 0)
        {
            LblStatus.Text = "There are no Contacts available for this company.";
        }
        else
        {
            LblStatus.Text = "";
        }
    }
}