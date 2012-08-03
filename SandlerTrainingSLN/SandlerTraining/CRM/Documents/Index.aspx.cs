using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerModels;

public partial class DocumentIndex : BasePage 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ddlCompany_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        LblStatus.Text = "";         
    }

    protected void ddlOpportunity_SelectedIndexChanged(object sender, System.EventArgs e)
    {
       
    }


    protected void ddlCompany_DataBound(object sender, System.EventArgs e)
    {
        if (!(ddlCompany.Items.Count == 0))
        {
            ListItem selectItem = new ListItem("--Select Company--", "0");
            ddlCompany.Items.Insert(0, selectItem);
        }

    }
    protected void ddlOpportunity_DataBound(object sender, System.EventArgs e)
    {
	    if (!(ddlOpportunity.Items.Count == 0))
        {
		    ListItem selectItem = new ListItem("--Select Opportunity--", "0");
		    ddlOpportunity.Items.Insert(0, selectItem);
            gvDocuments.Visible = true;
	    }
        else
        {
		    if (!(ddlCompany.SelectedIndex == 0)) 
            {
                gvDocuments.Visible = false;
                LblStatus.Text = "";
			    ClientScript.RegisterStartupScript(this.GetType(), "NoOpp", ("<script> alert('Please add opportunity to the selected company prior to attaching the document.'); </script>"));
		    }
	    }

    }
    protected void gvDocuments_SelectedIndexChanged(object sender, EventArgs e)
    {
        hidDocumentID.Value = gvDocuments.SelectedDataKey.Value.ToString();
        Server.Transfer("~/CRM/Documents/Detail.aspx");
    }
    protected void gvDocuments_DataBound(object sender, EventArgs e)
    {
        if (gvDocuments.Rows.Count == 0 && ddlCompany.SelectedIndex != 0 && ddlOpportunity.SelectedIndex != 0)
        {
            LblStatus.Text = "There are no documents attached to the selected opportunity.";
        }
        else
        {
            LblStatus.Text = "";
            gvDocuments.Visible = true;
        }
               
    }
    protected void btnAddDocument_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/CRM/Documents/Add.aspx");
    }


}

