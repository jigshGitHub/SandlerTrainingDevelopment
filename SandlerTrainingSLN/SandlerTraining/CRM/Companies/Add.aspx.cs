using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerRepositories;
using SandlerModels;

public partial class AddCompany : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }

    }
    protected void dvCompany_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        lblResult.Text = "Company created Successfully!";

    }
    protected void dvCompany_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        if (e.CancelingEdit)
        {
            Response.Redirect("~/CRM/Companies/Index.aspx");
        }
    }

    protected void dvCompany_DataBound(object sender, EventArgs e)
    {
        //For IndustryDDL
        DropDownList industryDropDownList = new DropDownList();
        industryDropDownList = (DropDownList)dvCompany.FindControl("ddlIndustry");
        if ((industryDropDownList != null))
        {
            ListItem selectItem = new ListItem("--Select Industry--", "0");
            industryDropDownList.Items.Insert(0, selectItem);
        }

        //Sandler Rep Last Name - It should be Sales for Client
        TemplateField repLastNameTempField = new TemplateField();
        repLastNameTempField = dvCompany.Fields.OfType<TemplateField>().Where(f => f.HeaderText == "Sandler Rep Last Name :").FirstOrDefault();
        if (repLastNameTempField != null)
        {
            //Get the User Info
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];
            if (_user.Role == SandlerRoles.Client)
            {
                repLastNameTempField.HeaderText = "Sales Rep Last Name :";
            }
        }

        //For Sandler Rep First Name
        TemplateField repFirstNameTempField = new TemplateField();
        repFirstNameTempField = dvCompany.Fields.OfType<TemplateField>().Where(f => f.HeaderText == "Sandler Rep First Name :").FirstOrDefault();
        if (repFirstNameTempField != null)
        {
            //Get the User Info
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];
            if (_user.Role == SandlerRoles.Client)
            {
                repFirstNameTempField.HeaderText = "Sales Rep First Name :";
            }
        }


    }

    protected void ddlBillingAdrs_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        //For Billing Adrs DDL
        DropDownList billingAddressDropDownList = new DropDownList();
        billingAddressDropDownList = (DropDownList)dvCompany.FindControl("ddlBillingAdrs");
        if (billingAddressDropDownList != null)
        {
            if (billingAddressDropDownList.SelectedValue == "1")
            {
                //Find existing Address Info
                (dvCompany.FindControl("txtBillingAddress") as TextBox).Text = (dvCompany.FindControl("txtAddress") as TextBox).Text;
                (dvCompany.FindControl("txtBillingCity") as TextBox).Text = (dvCompany.FindControl("txtCity") as TextBox).Text;
                (dvCompany.FindControl("txtBillingState") as TextBox).Text = (dvCompany.FindControl("txtState") as TextBox).Text;
                (dvCompany.FindControl("txtBillingZip") as TextBox).Text = (dvCompany.FindControl("txtZip") as TextBox).Text;
                (dvCompany.FindControl("txtBillingCountry") as TextBox).Text = (dvCompany.FindControl("txtCountry") as TextBox).Text;
                //Also make them readonly true
                (dvCompany.FindControl("txtBillingAddress") as TextBox).Enabled = false;
                (dvCompany.FindControl("txtBillingCity") as TextBox).Enabled = false;
                (dvCompany.FindControl("txtBillingState") as TextBox).Enabled = false;
                (dvCompany.FindControl("txtBillingZip") as TextBox).Enabled = false;
                (dvCompany.FindControl("txtBillingCountry") as TextBox).Enabled = false;
            }
            else
            {
                //Also make them readonly false
                (dvCompany.FindControl("txtBillingAddress") as TextBox).Enabled = true;
                (dvCompany.FindControl("txtBillingCity") as TextBox).Enabled = true;
                (dvCompany.FindControl("txtBillingState") as TextBox).Enabled = true;
                (dvCompany.FindControl("txtBillingZip") as TextBox).Enabled = true;
                (dvCompany.FindControl("txtBillingCountry") as TextBox).Enabled = true;
            }
        }
     }

    protected void dvCompany_ItemCreated(object sender, EventArgs e)
    {
        if (dvCompany.CurrentMode == DetailsViewMode.Insert)
        {
            (dvCompany.FindControl("CreationDate") as TextBox).Text = DateTime.Now.ToShortDateString();
        }
    }
}