using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerModels.DataIntegration;
using Sandler.UI.ChartStructure;
public partial class Reports_ClosedSalesAnalysis : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCompanies();
        }

    }

    protected void lnlNextStep_Click(object sender, CommandEventArgs e)
    {
        string commandArg = e.CommandArgument.ToString();
        string commandName = e.CommandName;
        ChartSubType subType;
        lblResult.Text = "";

        if (commandArg == "1")
        {
            if (IsDataValid())
            {
                subType = GetAnalysisSubType(); ;
                wzGapAnalysis.ActiveStepIndex = int.Parse(commandArg);
            }

        }
    }

    protected void ddlCreateDefaultSelection(object sender, EventArgs e)
    {
        DropDownList dropdownList = sender as DropDownList;
        if (!(dropdownList.Items.Count == 0))
        {
            string defaultSelection = "";
            switch (dropdownList.ID)
            {
                case "drpLstCompanies":
                    defaultSelection = "--Select one company--";
                    break;
                default:
                    defaultSelection = "";
                    break;
            }
            ListItem selectItem = new ListItem(defaultSelection, "0");
            dropdownList.Items.Insert(0, selectItem);
        }
    }

    protected void lbxCreateDefaultSelection(object sender, EventArgs e)
    {
        ListBox lstCompanies = sender as ListBox;
        if (!(lstCompanies.Items.Count == 0))
        {
            string defaultSelection = "";
            switch (lstCompanies.ID)
            {
                case "lstCompanies":
                    defaultSelection = "--Select multiple company--";
                    break;
                default:
                    defaultSelection = "";
                    break;
            }
            ListItem selectItem = new ListItem(defaultSelection, "0");
            lstCompanies.Items.Insert(0, selectItem);
        }
    }

    private void BindCompanies()
    {
        drpLstCompanies.DataSource = UserEntitiesFactory.Get(this.CurrentUser).Companies;
        drpLstCompanies.DataTextField = "CompanyName";
        drpLstCompanies.DataValueField = "COMPANIESID";
        drpLstCompanies.DataBind();

        lstCompanies.DataSource = UserEntitiesFactory.Get(this.CurrentUser).Companies;
        lstCompanies.DataTextField = "CompanyName";
        lstCompanies.DataValueField = "COMPANIESID";
        lstCompanies.DataBind();
    }

    private bool IsDataValid()
    {
        if (radBtnAnalysisType.SelectedItem == null)
        {
            lblResult.Text = "Please select analysis type first.";
            return false;
        }
        if (radBtnCompanySelection.SelectedItem != null)
            return true;
        else if (drpLstCompanies.SelectedIndex > 0)
            return true;
        else if (lstCompanies.GetSelectedIndices().Length > 0)
        {
            if (lstCompanies.GetSelectedIndices().Length == 1 && lstCompanies.GetSelectedIndices()[0] == 0)
            {
                lblResult.Text = "Please select any one option from company(ies).";
                return false;
            }
            return true;
        }
        return false;
    }

    private ChartSubType GetAnalysisSubType()
    {
        if (radBtnAnalysisType.SelectedValue == "ProductsSold" && radBtnQtyValChoice.SelectedValue == "Value")
            return ChartSubType.ProductsSoldBySalesValue;
        else if (radBtnAnalysisType.SelectedValue == "ProductsSold" && radBtnQtyValChoice.SelectedValue == "Quantity")
            return ChartSubType.ProductsSoldBySalesQuantity;
        else if (radBtnAnalysisType.SelectedValue == "OpportunitySource" && radBtnQtyValChoice.SelectedValue == "Value")
            return ChartSubType.SalesValueOppSource;
        else if (radBtnAnalysisType.SelectedValue == "OpportunitySource" && radBtnQtyValChoice.SelectedValue == "Quantity")
            return ChartSubType.SalesQuantityOppSource;
        else if (radBtnAnalysisType.SelectedValue == "OpportunityType" && radBtnQtyValChoice.SelectedValue == "Value")
            return ChartSubType.SalesValueOpportunityType;
        else if (radBtnAnalysisType.SelectedValue == "OpportunityType" && radBtnQtyValChoice.SelectedValue == "Quantity")
            return ChartSubType.SalesQuantityOpportunityType;
        else if (radBtnAnalysisType.SelectedValue == "SalesRep" && radBtnQtyValChoice.SelectedValue == "Value")
            return ChartSubType.SalesValueSalesRep;
        else 
            return ChartSubType.SalesQuantitySalesRep;

    }
}