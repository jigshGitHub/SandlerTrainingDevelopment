using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Footer : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //set the onclient click event for this link
        lnkPrivacy.OnClientClick = "window.open('" + Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath + "/PrivacyPage.aspx" + "','_blank','height=400,width=460,status=yes,toolbar=no,scrollbars=yes,menubar=no,location=no'); return false;";

    }
}