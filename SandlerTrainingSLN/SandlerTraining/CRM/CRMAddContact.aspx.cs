using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMAddContact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void dvContact_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        lblResult.Text = "Contact created Successfully!";
        
    }
    protected void dvContact_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        if (e.CancelingEdit)
        {
            Response.Redirect("CRMContacts.aspx");
        }
    }
}