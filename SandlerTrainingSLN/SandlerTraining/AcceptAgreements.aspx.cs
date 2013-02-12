using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AcceptAgreements : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btnAccept.Attributes.Add("style", "visibility: hidden");
        }
    }
    protected void btnAccept_Click(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
        {
            Profile.AcceptedAgrements = true;
            Response.Redirect("Default.aspx");
        }
    }
}