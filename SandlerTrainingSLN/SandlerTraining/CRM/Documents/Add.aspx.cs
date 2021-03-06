﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class DocumentADD : BasePage
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void dvDocument_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        lblResult.Text = "Document attached Successfully!";

    }
    protected void CompanyDS_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["_user"] = CurrentUser;
    }
    protected void OpprtunityDS_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["_user"] = CurrentUser;
    }
    protected void ddlCompany_DataBound(object sender, System.EventArgs e)
    {
        if (!(ddlCompany.Items.Count == 0))
        {
            ListItem selectItem = new ListItem("--Select Company--", "0");
            ddlCompany.Items.Insert(0, selectItem);
        }

    }
    protected void ddlOpportunity_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        dvDocument.Visible = false;
        if (!(ddlOpportunity.SelectedIndex == 0))
        {
            dvDocument.Visible = true;
        }
    }
    protected void ddlOpportunity_DataBound(object sender, System.EventArgs e)
    {
        if (!(ddlOpportunity.Items.Count == 0))
        {
            ListItem selectItem = new ListItem("--Select Opportunity--", "0");
            ddlOpportunity.Items.Insert(0, selectItem);

        }
        else
        {
            if (!(ddlCompany.SelectedIndex == 0))
            {
                dvDocument.Visible = false;
                ClientScript.RegisterStartupScript(this.GetType(), "NoOpp", ("<script> alert('Please add opportunity to the selected company prior to attaching the document.'); </script>"));
            }
        }


    }
    protected void dvDocument_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        if (e.CancelingEdit)
        {
            Response.Redirect("~/CRM/Documents/Index.aspx");
        }
    }

    protected void dvDocument_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        string DocName = default(System.String);
        int DocStatus = default(System.Int32);
        System.DateTime LastModifyDate = default(System.DateTime);

        //for file
        FileUpload FileUploadControl = new FileUpload();
        FileUploadControl = (FileUpload)dvDocument.FindControl("Upload");
        if ((FileUploadControl != null))
        {
            //Create GUID and modify Document Name - This will ensure that document will be unique for all users even if they use same name
            DocName = System.Guid.NewGuid() + "_" + FileUploadControl.FileName.ToString();
            //check if we have Document name
            if (!string.IsNullOrEmpty(DocName))
            {
                //Save the actual file in the documents folder- DocumentsUploadLocation
                //FileUploadControl.SaveAs(Server.MapPath(DocName);
                FileUploadControl.SaveAs(Server.MapPath(ConfigurationManager.AppSettings["DocumentsUploadLocation"] + DocName));
            }
            else
            {
                //There is not file to attach so inform the user
                ClientScript.RegisterStartupScript(this.GetType(), "NoDocument", ("<script> alert('Please click on Browse button and select document to attach.'); </script>"));
                e.Cancel = true;
            }

        }
        //For LastModifyDate
        {
            TextBox LastModifyDateCal = new TextBox();
            LastModifyDateCal = (TextBox)dvDocument.FindControl("LastModifyDate");
            if ((LastModifyDateCal != null))
            {
                if (!string.IsNullOrEmpty(LastModifyDateCal.Text))
                {
                    LastModifyDate = Convert.ToDateTime(LastModifyDateCal.Text.Trim());
                }

            }

        }
        //For Document Status
        DropDownList DocStatusDDList = new DropDownList();
        DocStatusDDList = (DropDownList)dvDocument.FindControl("ddlDocStatus");
        if ((DocStatusDDList != null))
        {
            DocStatus = Convert.ToInt32(DocStatusDDList.SelectedValue);

        }
        if (!e.Cancel)
        {
            new SandlerRepositories.DocumentsRepository().Insert(Convert.ToInt32(ddlOpportunity.SelectedValue), Convert.ToInt32(ddlCompany.SelectedValue), DocStatus, DocName, LastModifyDate,CurrentUser);
            lblResult.Text = "Document attached Successfully!";
        }

    }
}