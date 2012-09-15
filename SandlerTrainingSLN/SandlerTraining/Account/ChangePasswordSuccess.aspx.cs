using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerModels.DataIntegration;

public partial class Account_ChangePasswordSuccess : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CurrentUser = null;
            UserEntitiesFactory.ReLoad();
            //FormsAuthentication.SignOut();
        }
    }
}
