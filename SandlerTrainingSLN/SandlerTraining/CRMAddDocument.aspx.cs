using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sandler.Data;
using Sandler.Data.Utility;
using System.Data;
using System.Data.SqlClient; 

public partial class CRMAddDocument : System.Web.UI.Page
{
    DBUtility db = new DBUtility();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void dvDocument_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        lblResult.Text = "Document attached Successfully!";

    }
    protected void dvDocument_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        if (e.CancelingEdit)
        {
            Response.Redirect("CRMDocuments.aspx");
        }
    }
    
    protected void dvDocument_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        string DocName = "";
        string DocumentLoaded = "";
        int OppID = 0;
        string DocStatus = "";
        System.DateTime LastModifyDate = default(System.DateTime);

        
        //for file
        FileUpload FileUploadControl = new FileUpload();
        FileUploadControl = (FileUpload)dvDocument.FindControl("Upload");
        if ((FileUploadControl != null))
        {
            DocName = FileUploadControl.FileName.ToString();
            //Save the actual file in the documents folder
            FileUploadControl.SaveAs(Server.MapPath("Documents\\" + DocName));

        }
        //For LastModifyDate
        {
            eWorld.UI.CalendarPopup LastModifyDateCal = new eWorld.UI.CalendarPopup();
            LastModifyDateCal = (eWorld.UI.CalendarPopup)dvDocument.FindControl("LastModifyDate");
            if ((LastModifyDateCal != null))
            {
                LastModifyDate = LastModifyDateCal.SelectedDate;

            }
        }
        //For Document Status
        {
            TextBox DocStatusTB = new TextBox();
            DocStatusTB = (TextBox)dvDocument.FindControl("txtDocStatus");
            if ((DocStatusTB != null))
            {
                DocStatus = DocStatusTB.Text;
            }
        }
        //For Document Loaded
        {
            TextBox DocLoadedTB = new TextBox();
            DocLoadedTB = (TextBox)dvDocument.FindControl("txtDocLoaded");
            if ((DocLoadedTB != null))
            {
                DocumentLoaded = DocLoadedTB.Text;
            }
        }
        //For Opp ID
        {
            DropDownList OppDDList = new DropDownList();
            OppDDList = (DropDownList)dvDocument.FindControl("ddlOpportunity");
            if ((OppDDList != null))
            {
                OppID = Convert.ToInt32(OppDDList.SelectedValue.ToString());
            }
        }

        //now save the reocord
        db.ExecuteNonQuery("sp_AttachDocument", new SqlParameter("@OppID", OppID),
            new SqlParameter("@Document_Name", DocName),
            new SqlParameter("@Document_Status", DocStatus),
            new SqlParameter("@Document_Loaded", DocumentLoaded), new SqlParameter("@LastModifyDate", LastModifyDate));

        lblResult.Text = "Document attached Successfully!";
    


    }
}