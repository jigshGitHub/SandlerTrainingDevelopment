﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using SandlerModels;
using SandlerData.Models;
using System.Configuration;

/// <summary>
/// Summary description for BasePage
/// </summary>

public abstract class BasePage : System.Web.UI.Page
{
    protected string QUERYSTRINGPARAMDRILLCHARTIDS = ConfigurationManager.AppSettings["QueryStringParamDrillChartIDs"];
    protected string QUERYSTRINGPARAMDRILLBY = ConfigurationManager.AppSettings["QueryStringParamDrillBy"];
    protected string GENERICCHARTLITERALWIDTH = ConfigurationManager.AppSettings["GenericChartLiteralWidth"];
    protected string GENERICCHARTLITERALHEIGHT = ConfigurationManager.AppSettings["GenericChartLiteralHeight"];

    public BasePage()
    {
    }

    public UserModel CurrentUser
    {
        get
        {
            UserModel user = Session["CurrentUser"] as UserModel;
            if (user == null)
            {
                user = new UserModel();
                new UserDataModel().Load(user);

                Session["CurrentUser"] = user;
            }
            return user; 
        }
        set
        {
            Session["CurrentUser"] = value;
        }
    }
    
    protected override void OnPreInit(EventArgs e)
    {
        base.OnPreInit(e);
        if (CurrentUser.RequirePasswordChange)
        {
            CurrentUser = null;
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

    protected virtual bool IsUserReadOnly(SandlerUserActions action, SandlerEntities entity)
    {
        switch (CurrentUser.Role)
        {
            case SandlerRoles.FranchiseeUser:
                if (action == SandlerUserActions.View)
                    return true;
                else
                {
                    return (entity != SandlerEntities.Contact);
                }
            case SandlerRoles.FranchiseeOwner:
                if (action == SandlerUserActions.View)
                    return true;
                else
                {
                    return (entity == SandlerEntities.Coach || entity == SandlerEntities.Region);
                }
            case SandlerRoles.Coach:
                if (action == SandlerUserActions.View)
                    return true;
                else
                {
                    return (entity != SandlerEntities.Coach);
                }
            default:
                return true;
        }
    }
}