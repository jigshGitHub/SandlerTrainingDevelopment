using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMAddOpportunity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void dvOpportunity_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        lblResult.Text = "Opportunity created Successfully!";

    }
    protected void dvOpportunity_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        if (e.CancelingEdit)
        {
            Response.Redirect("CRMSalesPipeLine.aspx");
        }
    }
}