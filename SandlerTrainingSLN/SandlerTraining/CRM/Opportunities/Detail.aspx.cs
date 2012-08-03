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
        ID = int.Parse(Request.QueryString["id"]);
            
        if (!Page.IsPostBack)
        {
            BindDetails(ID);
            lbtnEdit.Visible = !IsUserReadOnly(SandlerUserActions.Edit, SandlerEntities.Opportunity);
        }
    }

    private void BindDetails(int ID)
    {
        TBL_OPPORTUNITIES record = GetOpportunity(ID);
        lblCloseDate.Text = record.CLOSEDATE.ToString();
        lblCompany.Text = record.TBL_COMPANIES.COMPANYNAME;
        lblContact.Text = record.TBL_CONTACTS.FIRSTNAME + " " + record.TBL_CONTACTS.LASTNAME;
        lblEmail.Text = record.TBL_CONTACTS.EMAIL;
        lblOppName.Text = record.NAME;
        lblOpportunityID.Text = record.OPPORTUNITYID.ToString();
        lblOpportunityValue.Text = record.VALUE.ToString();
        lblPhone.Text = record.TBL_CONTACTS.PHONE;
        lblProduct.Text = record.Tbl_ProductType.ProductTypeName;
        lblSalesRepFName.Text = record.SALESREPFIRSTNAME;
        lblSalesRepLName.Text = record.SALESREPLASTNAME;
        lblSalesRepPhone.Text = record.SALESREPPHONE;
        lblStatus.Text = record.TBL_OPPORTUNITYSTATUS.Name;
        lblWeightedValue.Text = record.WEIGHTEDVALUE.ToString();
        lblWinProbability.Text = record.WINPROBABILITY;
        
    }
    protected void Cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("CRMSalesPipeLine.aspx");
    }
    protected void lbtnEdit_Click(object sender, EventArgs e)
    {
        Response.Redirect("Add.aspx?id=" + ID);
    }
    protected void lbtnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Index.aspx");
    }
}