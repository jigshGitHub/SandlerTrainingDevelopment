using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerModels.DataIntegration;

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
        //string commandArg = e.CommandArgument.ToString();
        //string commandName = e.CommandName;


        //if (commandArg == "1")
        //{
        //    (plotChart.ContentTemplateContainer.FindControl("lblResult") as Label).Text = "";
        //    int companyId = int.Parse(drpLstCompanies.SelectedValue);
        //    int contactId = int.Parse(drpLstContacts.SelectedValue);

        //    SaveGARecord(companyId, contactId);
        //    RenderChart();
        //    (plotChart.CustomNavigationTemplateContainer.FindControl("editRoi") as System.Web.UI.HtmlControls.HtmlAnchor).HRef = "Roi.aspx?companyId=" + companyId.ToString() + "&contactId=" + contactId;
        //    PopulateAsIsToBEFields();
        //    wzGapAnalysis.ActiveStepIndex = int.Parse(commandArg);

        //}
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
                    defaultSelection = "--Select company--";
                    break;
                case "lstCompanies":
                    defaultSelection = "--Select contact--";
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
}