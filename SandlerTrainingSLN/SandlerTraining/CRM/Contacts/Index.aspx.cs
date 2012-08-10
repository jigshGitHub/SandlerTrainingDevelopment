using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerModels;

public partial class ContactIndex : BasePage 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            addContactAnchor.Visible = !IsUserReadOnly(SandlerUserActions.Add, SandlerEntities.Contact);
        }

    }
    protected void ddlCompanies_DataBound(object sender, EventArgs e)
    {
        if (!(ddlCompanies.Items.Count == 0))
        {
            ListItem selectItem = new ListItem("All", "0");
            ddlCompanies.Items.Insert(0, selectItem);
        }
    }
    protected void gvContacts_SelectedIndexChanged(object sender, EventArgs e)
    {
        hidContactID.Value = gvContacts.SelectedDataKey.Value.ToString();
        Server.Transfer("~/CRM/Contacts/Detail.aspx");
    }
    protected void btnAddContact_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/CRM/Contacts/Add.aspx");
    }
    protected void gvContacts_DataBound(object sender, EventArgs e)
    {
        if (gvContacts.Rows.Count == 0)
        {
            LblStatus.Text = "There are no Contacts available for this Company/Franchisee.";
        }
        else
        {
            LblStatus.Text = "";
        }
    }
   
}