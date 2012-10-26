﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using SandlerModels;
using SandlerData.Models;
using System.Configuration;

using SandlerWeb = Sandler.Web;
/// <summary>
/// Summary description for BasePage
/// </summary>

public abstract class BasePage : System.Web.UI.Page
{
    public string QUERYSTRINGPARAMDRILLCHARTIDS = ConfigurationManager.AppSettings["QueryStringParamDrillChartIDs"];
    public string QUERYSTRINGPARAMDRILLBY = ConfigurationManager.AppSettings["QueryStringParamDrillBy"];
    public string GENERICCHARTLITERALWIDTH = ConfigurationManager.AppSettings["GenericChartLiteralWidth"];
    public string GENERICCHARTLITERALHEIGHT = ConfigurationManager.AppSettings["GenericChartLiteralHeight"];

    protected int CurrentPage
    {
        get
        {
            if (ViewState["CurrentPage"] == null)
            {
                ViewState["CurrentPage"] = 1;
            }
            return int.Parse(ViewState["CurrentPage"].ToString());
        }
        set
        {
            ViewState["CurrentPage"] = value;
        }
    }
    protected int PageSize
    {
        get
        {
            if (ViewState["PageSize"] == null)
            {
                ViewState["PageSize"] = ConfigurationManager.AppSettings["DefaultPageSize"];
            }
            return int.Parse(ViewState["PageSize"].ToString());
        }
        set
        {
            ViewState["PageSize"] = value;
        }
    }
    protected string SortExpression
    {
        get
        {
            if (ViewState["SortExpression"] == null)
            {
                ViewState["SortExpression"] = "OPPORTUNITYID";
            }
            return ViewState["SortExpression"].ToString();
        }
        set
        {
            ViewState["SortExpression"] = value;
        }
    }
    protected bool IsAscendigSortOrder
    {
        get
        {
            if (ViewState["IsAscendigSortOrder"] == null)
            {
                ViewState["IsAscendigSortOrder"] = true;
            }
            return Convert.ToBoolean(ViewState["IsAscendigSortOrder"] );
        }
        set
        {
            ViewState["IsAscendigSortOrder"] = value;
        }
    }
    protected int TotalRecords
    {
        get
        {
            return int.Parse(ViewState["TotalRecords"].ToString());
        }
        set
        {
            ViewState["TotalRecords"] = value;
        }
    }
    public List<SandlerWeb.Menu> CRMMenu;

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
        if (CurrentUser.RequirePasswordChange && !Request.FilePath.Contains("ChangePassword"))
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

        CRMMenu = new List<SandlerWeb.Menu>();

        List<SandlerWeb.MenuItem> items = new List<SandlerWeb.MenuItem>();

        items.Add(new SandlerWeb.MenuItem { Id = "Search", Text = "Search", Link = "~/CRM/Companies/Search.aspx", IsVisible = true });
        items.Add(new SandlerWeb.MenuItem { Id = "Upload", Text = "Upload Company Data", Link = "~/CRM/Companies/Upload.aspx", IsVisible = !IsUserReadOnly(SandlerUserActions.Add, SandlerEntities.Company) });
        items.Add(new SandlerWeb.MenuItem { Id = "AddProduct", Text = "Add New Product", Link = "~/CRM/Products/Add.aspx", IsVisible = !IsUserReadOnly(SandlerUserActions.Add, SandlerEntities.Company) });
        items.Add(new SandlerWeb.MenuItem { Id = "AddCompany", Text = "Add New Company", Link = "~/CRM/Companies/Add.aspx", IsVisible = !IsUserReadOnly(SandlerUserActions.Add, SandlerEntities.Company) });

        CRMMenu.Add(new SandlerWeb.Menu { Title = "Companies", IsVisible = true, Items = items.Where(item => item.IsVisible == true).ToList() });

        items = new List<SandlerWeb.MenuItem>();

        items.Add(new SandlerWeb.MenuItem { Id = "Search", Text = "Search", Link = "~/CRM/Contacts/Search.aspx", IsVisible = true });
        items.Add(new SandlerWeb.MenuItem { Id = "Upload", Text = "Upload Contact Data", Link = "~/CRM/Contacts/Upload.aspx", IsVisible = !IsUserReadOnly(SandlerUserActions.Add, SandlerEntities.Contact) });
        items.Add(new SandlerWeb.MenuItem { Id = "AddContact", Text = "Add New Contact", Link = "~/CRM/Contacts/Add.aspx", IsVisible = !IsUserReadOnly(SandlerUserActions.Add, SandlerEntities.Contact) });
        items.Add(new SandlerWeb.MenuItem { Id = "CallList", Text = "View Call List", Link = "~/CRM/Contacts/CallList.aspx", IsVisible = true });

        CRMMenu.Add(new SandlerWeb.Menu { Title = "Contacts", IsVisible = true, Items = items.Where(item => item.IsVisible == true).ToList() });

        items = new List<SandlerWeb.MenuItem>();

        items.Add(new SandlerWeb.MenuItem { Id = "Search", Text = "Search", Link = "~/CRM/Opportunities/Search.aspx", IsVisible = true });
        items.Add(new SandlerWeb.MenuItem { Id = "AddOpportunity", Text = "Add New Opportunity", Link = "~/CRM/Opportunities/Add.aspx", IsVisible = !IsUserReadOnly(SandlerUserActions.Add, SandlerEntities.Opportunity) });

        CRMMenu.Add(new SandlerWeb.Menu { Title = "Opportunities", IsVisible = true, Items = items.Where(item => item.IsVisible == true).ToList() });

        items = new List<SandlerWeb.MenuItem>();

        items.Add(new SandlerWeb.MenuItem { Id = "Search", Text = "Search", Link = "~/CRM/Documents/Search.aspx", IsVisible = true });
        items.Add(new SandlerWeb.MenuItem { Id = "AddDocument", Text = "Attach New Document", Link = "~/CRM/Documents/Add.aspx", IsVisible = !IsUserReadOnly(SandlerUserActions.Add, SandlerEntities.Document) });

        CRMMenu.Add(new SandlerWeb.Menu { Title = "Documents", IsVisible = true, Items = items.Where(item => item.IsVisible == true).ToList() });
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
                    return (entity == SandlerEntities.Company || entity == SandlerEntities.Coach || entity == SandlerEntities.Region);
                }
            case SandlerRoles.FranchiseeOwner:
                if (action == SandlerUserActions.View)
                    return true;
                else
                {
                    return (entity == SandlerEntities.Coach || entity == SandlerEntities.Region);
                }
            case SandlerRoles.Client:
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
                    return (entity != SandlerEntities.Franchisee);
                }
            default:
                if (action == SandlerUserActions.View)
                    return true;
                else
                {
                    return (entity != SandlerEntities.Coach);
                }
        }
    }
}