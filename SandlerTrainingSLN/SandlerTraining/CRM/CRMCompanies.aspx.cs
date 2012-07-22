using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerModels;
public partial class UpdatedCRM_CRMCompanies : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btnAddCompany.Visible = !IsUserReadOnly(SandlerUserActions.Add, SandlerEntities.Company);
        }
    }
    protected void btnAddCompany_Click(object sender, EventArgs e)
    {
        Response.Redirect("CRMAddCompany.aspx");
    }
    protected void gvCompanies_SelectedIndexChanged(object sender, EventArgs e)
    {
        hidCompanyID.Value = gvCompanies.SelectedDataKey.Value.ToString();
        Server.Transfer("CRMViewCompany.aspx");
    }
    protected void gvCompanies_DataBound(object sender, EventArgs e)
    {
        if (gvCompanies.Rows.Count == 0)
        {
            LblStatus.Text = "There are no Companies entered in the System.";
        }
        else
        {
            LblStatus.Text = "";
        }
    }
}