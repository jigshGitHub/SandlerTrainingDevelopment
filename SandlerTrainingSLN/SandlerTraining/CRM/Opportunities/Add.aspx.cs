using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerModels;
public partial class OpportunityADD : OpportunityBasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                ID = int.Parse(Request.QueryString["id"]);
                BindDetailsToFields(ID);
                lbtnAdd.Text = "Update";
            }
        }

    }
    protected void ddlCompany_DataBound(object sender, EventArgs e)
    {
        DropDownList ddlCompany = sender as DropDownList;
        if (!(ddlCompany.Items.Count == 0))
        {
            ListItem selectItem = new ListItem("--Select company--", "0");
            ddlCompany.Items.Insert(0, selectItem);
        }
    }
    protected void ddlCompany_SelectedIndexChanged(object sender, EventArgs e)
    {
       if (ddlCompany.SelectedIndex > 0)
        {
            //Bind contacts            
            BindContacts(int.Parse(ddlCompany.SelectedValue));
        }
        else
        {
            ddlContacts.Items.Clear();
        }

        SetContact("", "");
    }
    private void BindContacts(int companyId)
    {
        var data = from records in GetContactsByCompany(companyId)
                   select new { Name = records.FIRSTNAME + " " + records.LASTNAME, ID = records.CONTACTSID };
        ddlContacts.DataSource = data;
        ddlContacts.DataTextField = "Name";
        ddlContacts.DataValueField = "ID";
        ddlContacts.DataBind();
        ddlContacts.Items.Insert(0, new ListItem("--Select contact--","0"));
    }
    protected void ddlContacts_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddlContacts = sender as DropDownList;
        if (ddlContacts.SelectedIndex > 0)
        {
            TBL_CONTACTS contact = GetContact(long.Parse(ddlContacts.SelectedValue));
            SetContact(contact.PHONE, contact.EMAIL);
        }
        else
            SetContact("", "");
        
    }

    private void SetContact(string phone, string email)
    {
        txtContactPhone.Text = phone;
        txtEmail.Text = email;
    }

    protected void lbtnAdd_Click(object sender, EventArgs e)
    {
        TBL_OPPORTUNITIES opportunity = null;
        if (lbtnAdd.Text=="Add")
        {
            opportunity = new TBL_OPPORTUNITIES();

            BindFieldsToOpportunity(opportunity);

            opportunity.UpdatedBy = CurrentUser.UserId.ToString();
            opportunity.CreatedBy = CurrentUser.UserId.ToString();
            opportunity.IsActive = true;
            //Default setup in DB is not working to do check
            opportunity.CreatedDate = DateTime.Now;
            opportunity.UpdatedDate = DateTime.Now;

            Save(opportunity);
            lblResult.Text = "Opportunity with Opportunity ID = " + opportunity.OpportunityID.Value.ToString()  + " created Successfully!";
        }
        else
        {
            ID = int.Parse(Request.QueryString["id"]);
            opportunity = GetOpportunity(ID);

            BindFieldsToOpportunity(opportunity);

            opportunity.UpdatedBy = CurrentUser.UserId.ToString();
            opportunity.UpdatedDate = DateTime.Now;
            Update(opportunity);
            lblResult.Text = "Opportunity updated Successfully!";
        }
        ClearFiels();
    }

    private void BindFieldsToOpportunity(TBL_OPPORTUNITIES opportunity)
    {
        if (!string.IsNullOrEmpty(CloseDate.Text))
            opportunity.CLOSEDATE = Convert.ToDateTime(CloseDate.Text);
        opportunity.COMPANYID = int.Parse(ddlCompany.SelectedValue);
        opportunity.CONTACTID = int.Parse(ddlContacts.SelectedValue);
        opportunity.NAME = txtOppName.Text;
        opportunity.ProductID = int.Parse(ddlProducts.SelectedValue);
        opportunity.SALESREPFIRSTNAME = txtSalesRepFName.Text;
        opportunity.SALESREPLASTNAME = txtSalesRepLName.Text;
        opportunity.SALESREPPHONE = txtSalesRepPhone.Text;
        opportunity.STATUSID = int.Parse(ddlProductStatus.SelectedValue);
        opportunity.VALUE = int.Parse(txtOpportunityValue.Text);
        opportunity.WINPROBABILITY = txtWinProbability.Text;
        opportunity.WEIGHTEDVALUE = (opportunity.VALUE * int.Parse(opportunity.WINPROBABILITY)) / 100;
    }
    
    private void BindDetailsToFields(int ID)
    {
        TBL_OPPORTUNITIES record = GetOpportunity(ID);
        if (record.CLOSEDATE.HasValue)
            CloseDate.Text = record.CLOSEDATE.Value.ToString();
        ddlCompany.SelectedValue = record.TBL_COMPANIES.COMPANIESID.ToString();
        BindContacts(record.COMPANYID);
        ddlContacts.SelectedValue = record.TBL_CONTACTS.CONTACTSID.ToString();
        SetContact(record.TBL_CONTACTS.PHONE, record.TBL_CONTACTS.EMAIL);
        txtOppName.Text = record.NAME;
        trOpportunityID.Visible = true;
        txtOpportunityID.Text = record.OpportunityID.Value.ToString();
        txtOpportunityValue.Text = record.VALUE.ToString();
        ddlProducts.SelectedValue = record.ProductID.ToString();
        txtSalesRepFName.Text = record.SALESREPFIRSTNAME;
        txtSalesRepLName.Text = record.SALESREPLASTNAME;
        txtSalesRepPhone.Text = record.SALESREPPHONE;
        ddlProductStatus.SelectedValue = record.STATUSID.ToString();
        txtWeightedValue.Text = record.WEIGHTEDVALUE.ToString();
        txtWinProbability.Text = record.WINPROBABILITY;
    }

    private void ClearFiels()
    {        
        ddlCompany.SelectedValue = "0";
        SetContact("", "");
        ddlContacts.SelectedValue = "0";
        txtOppName.Text = "";
        if(trOpportunityID.Visible)
            txtOpportunityID.Text = "";
        txtOpportunityValue.Text = "";
        ddlProducts.SelectedIndex = 0;
        txtSalesRepFName.Text = "";
        txtSalesRepLName.Text = "";
        txtSalesRepPhone.Text = "";
        ddlProductStatus.SelectedIndex = 0;
        txtWeightedValue.Text = "";
        txtWinProbability.Text = "";
        CloseDate.Text = "";
    }

    protected void lbtnCancel_Click(object sender, EventArgs e)
    {
        ClearFiels();
        Response.Redirect("~/CRM/Opportunities/Index.aspx");
    }
}