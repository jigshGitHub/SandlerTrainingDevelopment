using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using SandlerModels;
public partial class OpportunityDETAIL : OpportunityBasePage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        OpportunityID = int.Parse(Request.QueryString["id"]);
            
        if (!Page.IsPostBack)
        {
            BindDetails(OpportunityID);
            anchorEdit.Visible = !IsUserReadOnly(SandlerUserActions.Edit, SandlerEntities.Opportunity);
            anchorEdit.HRef = "Add.aspx?id=" + OpportunityID;
            if (!string.IsNullOrEmpty(Request.QueryString["showResult"]))
                lblResult.Text = "Opportunity updated Successfully!";

        }
    }

    private void BindDetails(int ID)
    {
        TBL_OPPORTUNITIES record = GetOpportunity(ID);
        lblCloseDate.Text = record.CLOSEDATE.Value.ToShortDateString();
        TBL_COMPANIES company = GetCompany(record.COMPANYID);
        TBL_CONTACTS contact = GetContact(record.CONTACTID);
        lblCompany.Text = company.COMPANYNAME;
        lblContact.Text = contact.FIRSTNAME + " " + contact.LASTNAME;
        lblEmail.Text = contact.EMAIL;
        lblOppName.Text = record.NAME;
        lblOpportunityID.Text = record.OpportunityID.Value.ToString();
        lblOpportunityValue.Text = string.Format("{0:C}",record.VALUE);
        lblPhone.Text = contact.PHONE;
        Tbl_ProductType product = GetProduct(record.ProductID);
        lblProduct.Text = product.ProductTypeName;
        lblSalesRepFName.Text = record.SALESREPFIRSTNAME;
        lblSalesRepLName.Text = record.SALESREPLASTNAME;
        lblSalesRepPhone.Text = record.SALESREPPHONE;
        lblStatus.Text = GetAppointment(contact.ApptSourceId.Value).ApptSourceName;
        lblWeightedValue.Text = string.Format("{0:C}",record.WEIGHTEDVALUE);
        lblWinProbability.Text = record.WINPROBABILITY;        
    }
}