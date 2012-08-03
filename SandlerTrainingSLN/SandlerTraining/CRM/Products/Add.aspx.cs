using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRM_Product_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }

    }
    protected void dvProduct_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        lblResult.Text = "Product created Successfully!";

    }
    protected void dvProduct_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        if (e.CancelingEdit)
        {
            Response.Redirect("~/CRM/Companies/Index.aspx");
        }
    }

}