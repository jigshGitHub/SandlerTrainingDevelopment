using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMAddOpportunity_Konckout : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            hdnFrenchiseeID.Value = CurrentUser.FranchiseeID.ToString();
        }

    }
    protected void dvOpportunity_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        //lblResult.Text = "Opportunity created Successfully!";

    }
    protected void dvOpportunity_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        if (e.CancelingEdit)
        {
            Response.Redirect("CRMSalesPipeLine.aspx");
        }
    }
}