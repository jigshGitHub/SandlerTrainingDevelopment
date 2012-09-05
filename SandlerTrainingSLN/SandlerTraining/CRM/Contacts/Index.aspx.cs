﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerModels;

public partial class ContactIndex : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            contactMenu.MenuEntityTitle = "Contacts";
        }

    }
    protected void ddlCompanies_DataBound(object sender, EventArgs e)
    {
        if (!(ddlCompanies.Items.Count == 0))
        {
            ListItem selectItem = new ListItem("All", "0");
            ddlCompanies.Items.Insert(0, selectItem);
        }
    }
    protected void gvContacts_SelectedIndexChanged(object sender, EventArgs e)
    {
        hidContactID.Value = gvContacts.SelectedDataKey.Value.ToString();
        Server.Transfer("~/CRM/Contacts/Detail.aspx");
    }
    protected void btnAddContact_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/CRM/Contacts/Add.aspx");
    }
    protected void gvContacts_DataBound(object sender, EventArgs e)
    {
        if (gvContacts.Rows.Count == 0)
        {
            LblStatus.Text = "There are no Contacts available for this Company/Franchisee.";
            btnExportExcel.Visible = false;
            //searchAnchor.Visible = false;
            contactMenu.MenuEntity.Items.Find(delegate(Sandler.Web.MenuItem item) { return item.Text == "Search"; }).IsVisible = false;
            contactMenu.ReLoadSubMenu();
        }
        else
        {
            LblStatus.Text = "";
            btnExportExcel.Visible = true;
            contactMenu.MenuEntity.Items.Find(delegate(Sandler.Web.MenuItem item) { return item.Text == "Search"; }).IsVisible = true;
            contactMenu.ReLoadSubMenu();
        }
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        //This means that you are overriding the default implementation of the method and giving permission to the GridView to be exported as an Excel file.
    }
    protected void btnExportExcel_Click(object sender, ImageClickEventArgs e)
    {
        //Export results to Excel
        trExport.Visible = true;
        Response.Clear();
        Response.AddHeader("content-disposition", "attachment;filename=AllContacts.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        this.EnableViewState = false;
        System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter htmlWrite = new System.Web.UI.HtmlTextWriter(stringWrite);
        gvContactsExport.AllowPaging = false;
        gvContactsExport.AllowSorting = false;
        gvContactsExport.DataBind();
        //Report is the Div which we need to Export - Gridview is under this Div
        Report.RenderControl(htmlWrite);
        Response.Write(stringWrite.ToString());
        Response.End();
        this.EnableViewState = true;
        trExport.Visible = false;

    }
}