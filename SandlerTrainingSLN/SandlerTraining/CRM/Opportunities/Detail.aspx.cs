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
        //TBL_OPPORTUNITIES record = GetOpportunity(ID);
        Opportunity record = FillOpportunity(ID);
        lblCloseDate.Text = record.CLOSEDATE.Value.ToShortDateString();
        lblCreationDate.Text = (record.OppCreationDate.HasValue) ? record.OppCreationDate.Value.ToShortDateString() : "";
        lblCompany.Text = record.COMPANYNAME;
        lblOppName.Text = record.NAME;
        lblOpportunityID.Text = record.OpportunityID.Value.ToString();
        lblOpportunityValue.Text = string.Format("{0:C}", record.VALUE);
        lblProduct.Text = record.ProductTypeName;
        lblProductCost.Text = string.Format("{0:C}", record.ProductCost);
        lblSalesRepFName.Text = record.SALESREPFIRSTNAME;
        lblSalesRepLName.Text = record.SALESREPLASTNAME;
        lblSalesRepPhone.Text = record.SALESREPPHONE;
        lblStatus.Text = record.Status;
        lblWeightedValue.Text = string.Format("{0:C}", record.WEIGHTEDVALUE);
        lblActualValue.Text = string.Format("{0:C}", record.ActualValue);
        lblWinProbability.Text = record.WINPROBABILITY;
        txtDescription.Text = record.Description;
        lblNotes.Text = record.Notes;
        lblSource.Text = record.Source;
        lblType.Text = record.Type;
        lblWLost.Text = record.WhyLost;
        lblPrimaryContact.Text = record.PrimaryContactFirstName + " " + record.PrimaryContactLastName;
        lblSecondaryContact1.Text = record.SeconadryContact1FirstName + " " + record.SeconadryContact1LastName;
        lblSecondaryContact2.Text = record.SeconadryContact2FirstName + " " + record.SeconadryContact2LastName;
        lblPain.Text = record.Pain;
        lblLengthofProblem.Text = record.LengthofProblem;
        lblAlternatives.Text = record.Alternatives;
        lblCostToFix.Text = record.CostToFix;
        lblBudgetIdentified.Text = (record.IsBudgeIdentified.Value) ? "Yes" : "No";
        lblMoveForward.Text = (record.IsMoveForward.Value) ? "Yes" : "No";
    }
}