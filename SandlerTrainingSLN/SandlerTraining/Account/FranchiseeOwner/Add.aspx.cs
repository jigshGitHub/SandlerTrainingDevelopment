﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_FranchiseeOwner_Add : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            hdnCoachId.Value = CurrentUser.CoachID.ToString(); 
            hdnCoachUserid.Value = CurrentUser.UserId.ToString();
        }
    }
}