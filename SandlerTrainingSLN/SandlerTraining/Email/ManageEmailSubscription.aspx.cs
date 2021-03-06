﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerModels;
using System.Data;
using SandlerRepositories; 

public partial class Email_ManageEmailSubscription : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ShowCurrentSubscriptionInfo();
        }
    }
    /// <summary>
    /// Update the subscription Information
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnUpdateSub_Click(object sender, EventArgs e)
    {
        
        //Update the Response.
        string response = rdbOptions.SelectedValue;
        //set response - true or false based on user selection
        response = (response == "0") ? "false" : "true"; 
        //Now Update the subscription Info
        new SandlerRepositories.BlastEmailRepository().UpdateSubscriptionInfo(CurrentUser.UserId.ToString(), response,CurrentUser);
        LblStatus.Text = "Blast Email Subscription updated successfully!";
        ShowCurrentSubscriptionInfo();
     }

    public void ShowCurrentSubscriptionInfo()
    {
        //Update Subscription status
        
        System.Data.DataSet ds = new SandlerRepositories.BlastEmailRepository().GetSubscriptionInfo(CurrentUser.UserId.ToString(),CurrentUser);
        string SubscriptionInfo = ds.Tables[0].Rows[0]["IsEmailSubscription"].ToString();
        //To do - Check subscription for the User and update below message
        if (SubscriptionInfo.ToUpper() == "TRUE")
        {
            lblEmailSubStatus.Text = "You are currently receiving Blast Email from other users.";
            rdbOptions.SelectedIndex = 0;
            
        }
        else
        {
            lblEmailSubStatus.Text = "You are currently NOT receiving Blast Email from other users.";
            rdbOptions.SelectedIndex = 1;
        }
    }
    
}