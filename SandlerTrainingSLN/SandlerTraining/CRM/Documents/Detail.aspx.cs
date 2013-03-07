using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class DocumentDETAIL : BasePage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if ((PreviousPage != null))
            {
                //Find out ContactID selected by the User
                hidDocumentID.Value = ((HiddenField)PreviousPage.Master.FindControl("MainContent").FindControl("hidDocumentID")).Value;
            }
            else
                hidDocumentID.Value = Request.QueryString["id"];

            GetDocumentDetails();
        }
    }
    public void GetDocumentDetails()
    {
        //Now get the details
        System.Data.DataSet ds = new SandlerRepositories.DocumentsRepository().GetDetailsById(Convert.ToInt32(hidDocumentID.Value));
        DocumentDW.DataSource = ds;
        //Find the company ID for this Document and store in the Hidden field
        hidCompanyID.Value = ds.Tables[0].Rows[0]["COMPANIESID"].ToString();
        hidDocumentName.Value = ds.Tables[0].Rows[0]["DOCNAME"].ToString();
        hdnDocFullName.Value = ds.Tables[0].Rows[0]["docFullName"].ToString();
        DocumentDW.DataBind();
    }
    protected void DocumentDW_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        //No code required
    }
    protected void OpprtunityDS_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["_user"] = CurrentUser;
    }
    protected void DocumentDW_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        //wE COME HERE AFTER UPDATE IS DONE NOW NOW AGAIN CHANGEMODE AND GET DETAILS
        DocumentDW.ChangeMode(DetailsViewMode.ReadOnly);
        GetDocumentDetails();
    }
    protected void DocumentDW_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            DocumentDW.ChangeMode(DetailsViewMode.Edit);
            LblStatus.Text = "";
            LblStatus1.Text = "";
            GetDocumentDetails();

        }
        else if (e.CommandName == "Update")
        {
            LblStatus.Text = "";
            LblStatus1.Text = "";
            UpdateDocumentDetails();
        }
        else if (e.CommandName == "Cancel")
        {
            DocumentDW.ChangeMode(DetailsViewMode.ReadOnly);
            LblStatus.Text = "";
            LblStatus1.Text = "";
            GetDocumentDetails();
        }
    }
    public void UpdateDocumentDetails()
    {
        string DocName = default(System.String);
        int DocStatus = default(System.Int32);
        int OppsID = default(System.Int32);
        System.DateTime LastModifyDate = default(System.DateTime);

        //For LastModifyDate
        {
            TextBox LastModifyDateCal = new TextBox();
            LastModifyDateCal = (TextBox)DocumentDW.FindControl("LastModifyDate");
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
        DocStatusDDList = (DropDownList)DocumentDW.FindControl("ddlDocStatus");
        if ((DocStatusDDList != null))
        {
            DocStatus = Convert.ToInt32(DocStatusDDList.SelectedValue);

        }
        //For Opportunity
        DropDownList OpportunityDDList = new DropDownList();
        OpportunityDDList = (DropDownList)DocumentDW.FindControl("ddlOpportunity");
        if ((OpportunityDDList != null))
        {
            OppsID = Convert.ToInt32(OpportunityDDList.SelectedValue);

        }
        FileUpload FileUploadControl = new FileUpload();
        FileUploadControl = (FileUpload)DocumentDW.FindControl("Upload");
        if ((FileUploadControl != null))
        {
            //Add GUID 
            DocName = System.Guid.NewGuid() + "_" + FileUploadControl.FileName.ToString();
            if (string.IsNullOrEmpty(DocName))
            {
                //User has not uploaded new file so keep the same filename
                DocName = hidDocumentName.Value;
            }
            else
            {
                //Save the actual file in the documents folder
                //FileUploadControl.SaveAs(Server.MapPath(DocName));
                //FileUploadControl.SaveAs(ConfigurationManager.AppSettings["DocumentsUploadLocation"] + DocName);
                FileUploadControl.SaveAs(Server.MapPath(ConfigurationManager.AppSettings["DocumentsUploadLocation"] + DocName));
            }

        }
        //Now Update
        new SandlerRepositories.DocumentsRepository().Update(Convert.ToInt32(hidDocumentID.Value), OppsID, DocName, DocStatus, LastModifyDate,CurrentUser);
    }
    protected void DocumentDW_DataBound(object sender, EventArgs e)
    {
        DetailsView DocumentDW = sender as DetailsView;
        HyperLink moduleLink = DocumentDW.FindControl("ModuleLink") as HyperLink;

        if (moduleLink != null && !string.IsNullOrEmpty(hdnDocFullName.Value))
        {
            moduleLink.NavigateUrl = string.Format(@"{0}\{1}", ConfigurationManager.AppSettings["DocumentsUploadLocation"], hdnDocFullName.Value);
        }
    }
}