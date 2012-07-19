﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using SandlerModels;
using SandlerData.Models;
/// <summary>
/// Summary description for BasePage
/// </summary>

public abstract class BasePage : System.Web.UI.Page
{
    public BasePage()
    {
    }
    public UserModel CurrentUser
    {
        get
        {
            UserModel user = Session["CurrentUser"]  as UserModel;
            if (user == null)
            {
                user = new UserModel();
                new UserDataModel().Load(user);

                Session["CurrentUser"] = user;
            }
            return user; 
        }
    }
    
    protected override void OnPreInit(EventArgs e)
    {
        base.OnPreInit(e);
        if (CurrentUser.RequirePasswordChange)
        {
            Session["CurrentUser"] = null;
            Response.Redirect("~/Account/ChangePassword.aspx");
        }
    }


    protected override void OnPreLoad(EventArgs e)
    {
        base.OnPreLoad(e);
    }

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
    }
}