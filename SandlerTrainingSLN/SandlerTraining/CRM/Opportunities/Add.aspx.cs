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
            lbtnCancel.Text = "Back To Opportunities";
            ProductTypesDS.SelectParameters["franchiseeId"].DefaultValue = CurrentUser.FranchiseeID.ToString();
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                OpportunityID = int.Parse(Request.QueryString["id"]);
                BindDetailsToFields(OpportunityID);
                lbtnAdd.Text = "Update";
                lbtnCancel.Text = "Cancel";
            }
        }
        lblResult.Text = "";
    }
    protected void ddlCreateDefaultSelection(object sender, EventArgs e)
    {
        DropDownList dropdownList = sender as DropDownList;
        if (!(dropdownList.Items.Count == 0))
        {
            string defaultSelection = "";
            switch (dropdownList.ID)
            {
                case "ddlCompanySearch":
                    defaultSelection = "--Select company--";
                    break;
                case "ddlProducts":
                    defaultSelection = "--Select product--";
                    break;
                case "ddlProductStatus":
                    defaultSelection = "--Select status--";
                    break;
                case "ddlSource":
                    defaultSelection = "--Select source--";
                    break;
                case "ddlTypes":
                    defaultSelection = "--Select type--";
                    break;
                case "ddlWhyLost":
                    defaultSelection = "--Select whylost?--";
                    break;
                default:
                    break;

            }
            ListItem selectItem = new ListItem(defaultSelection, "0");
            dropdownList.Items.Insert(0, selectItem);
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
        lstBxContacts.Items.Clear();
        pnlContacts.Visible = false;
        if (ddlCompany.SelectedIndex > 0)
        {
            //Bind lstBxContacts            
            BindContacts(int.Parse(ddlCompany.SelectedValue));
        }

        SetContact("", "");
    }
    private void BindContacts(int companyId)
    {
        //IEnumerable<TBL_CONTACTS> companyContacts = GetContactsByCompany(companyId);
        IEnumerable<SandlerModels.Contact> companyContacts = GetContactsByCompany(companyId);
        if (companyContacts != null)
        {
            var data = from records in companyContacts
                       select new { Name = records.FIRSTNAME + " " + records.LASTNAME, ID = records.CONTACTSID };
            if (data.Count() > 0)
            {
                lstBxContacts.DataSource = data;
                lstBxContacts.DataTextField = "Name";
                lstBxContacts.DataValueField = "ID";
                lstBxContacts.DataBind();
                pnlContacts.Visible = true;
            }
            else
            {
                lblResult.Text = "First create the contacts for the company selected.";
            }
        }
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
        //txtContactPhone.Text = phone;
        //txtEmail.Text = email;
    }

    protected void lbtnAdd_Click(object sender, EventArgs e)
    {
        TBL_OPPORTUNITIES opportunity = null;
        if (lbtnAdd.Text == "Add")
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
            lblResult.Text = "Opportunity with Opportunity ID = " + opportunity.OpportunityID.Value.ToString() + " created Successfully!";
        }
        else
        {
            OpportunityID = int.Parse(Request.QueryString["id"]);
            opportunity = GetOpportunity(OpportunityID);

            BindFieldsToOpportunity(opportunity);

            opportunity.UpdatedBy = CurrentUser.UserId.ToString();
            opportunity.UpdatedDate = DateTime.Now;
            Update(opportunity);
            Server.Transfer("Detail.aspx?showResult=True&id=" + OpportunityID);
        }
        ClearFiels();
    }

    private void BindFieldsToOpportunity(TBL_OPPORTUNITIES opportunity)
    {
        if (!string.IsNullOrEmpty(CloseDate.Text))
            opportunity.CLOSEDATE = Convert.ToDateTime(CloseDate.Text);
        opportunity.COMPANYID = int.Parse(ddlCompany.SelectedValue);
        opportunity.NAME = txtOppName.Text;
        if (ddlProducts.SelectedIndex > 0)
            opportunity.ProductID = int.Parse(ddlProducts.SelectedValue);
        opportunity.SALESREPFIRSTNAME = txtSalesRepFName.Text;
        opportunity.SALESREPLASTNAME = txtSalesRepLName.Text;
        opportunity.SALESREPPHONE = txtSalesRepPhone.Text;
        if (ddlProductStatus.SelectedIndex > 0)
            opportunity.STATUSID = int.Parse(ddlProductStatus.SelectedValue);
        else
            opportunity.STATUSID = null;
        opportunity.VALUE = int.Parse(txtOpportunityValue.Text);
        opportunity.WINPROBABILITY = txtWinProbability.Text;
        opportunity.WEIGHTEDVALUE = (opportunity.VALUE * int.Parse(opportunity.WINPROBABILITY)) / 100;
        if (ddlSource.SelectedIndex > 0)
            opportunity.SourceID = int.Parse(ddlSource.SelectedValue);
        else
            opportunity.SourceID = null;
        if (ddlTypes.SelectedIndex > 0)
            opportunity.TypeID = int.Parse(ddlTypes.SelectedValue);
        else
            opportunity.TypeID = null;
        if (ddlWhyLost.SelectedIndex > 0)
            opportunity.WhyLostID = int.Parse(ddlWhyLost.SelectedValue);
        else
            opportunity.WhyLostID = null;
        opportunity.Description = txtDescription.Text;
        opportunity.Notes = txtNotes.Text;
        if (!string.IsNullOrEmpty(txtActualValue.Text))
            opportunity.ActualValue = Convert.ToDecimal(txtActualValue.Text);

        int[] selectedItemIndexes = lstBxContacts.GetSelectedIndices();

        opportunity.CONTACTID = int.Parse(lstBxContacts.Items[selectedItemIndexes[0]].Value);

        if (selectedItemIndexes.Count() > 1)
            opportunity.SeconadryContactId1 = int.Parse(lstBxContacts.Items[selectedItemIndexes[1]].Value);
        if (selectedItemIndexes.Count() > 2)
            opportunity.SeconadryContactId2 = int.Parse(lstBxContacts.Items[selectedItemIndexes[2]].Value);
    }

    private void BindDetailsToFields(int ID)
    {
        TBL_OPPORTUNITIES record = GetOpportunity(ID);
        if (record.CLOSEDATE.HasValue)
            CloseDate.Text = record.CLOSEDATE.Value.ToShortDateString();
        ddlCompany.SelectedValue = record.COMPANYID.ToString();
        BindContacts(record.COMPANYID);
        //ddlContacts.SelectedValue = record.CONTACTID.ToString();
        TBL_CONTACTS contact = GetContact(long.Parse(record.CONTACTID.ToString()));
        SetContact(contact.PHONE, contact.EMAIL);
        txtOppName.Text = record.NAME;
        trOpportunityID.Visible = true;
        txtOpportunityID.Text = record.OpportunityID.Value.ToString();
        txtOpportunityValue.Text = record.VALUE.ToString();
        ddlProducts.SelectedValue = record.ProductID.ToString();
        txtSalesRepFName.Text = record.SALESREPFIRSTNAME;
        txtSalesRepLName.Text = record.SALESREPLASTNAME;
        txtSalesRepPhone.Text = record.SALESREPPHONE;
        if (record.STATUSID.HasValue)
            ddlProductStatus.SelectedValue = record.STATUSID.ToString();
        txtWeightedValue.Text = record.WEIGHTEDVALUE.ToString();
        txtWinProbability.Text = record.WINPROBABILITY;
        txtDescription.Text = record.Description;
        txtNotes.Text = record.Notes;
        if (record.SourceID.HasValue)
            ddlSource.SelectedValue = record.SourceID.ToString();
        if (record.TypeID.HasValue)
            ddlTypes.SelectedValue = record.TypeID.ToString();
        if (record.WhyLostID.HasValue)
            ddlWhyLost.SelectedValue = record.WhyLostID.ToString();
        txtActualValue.Text = record.ActualValue.ToString();

        ListItem findContact;
        findContact = lstBxContacts.Items.FindByValue(record.CONTACTID.ToString());
        if (findContact != null)
        {
            lstBxContacts.Items.FindByValue(record.CONTACTID.ToString()).Selected = true;
            findContact = null;
        }
        if (record.SeconadryContactId1.HasValue)
        {
            findContact = lstBxContacts.Items.FindByValue(record.SeconadryContactId1.ToString());
            if (findContact != null)
            {
                lstBxContacts.Items.FindByValue(record.SeconadryContactId1.ToString()).Selected = true; 
                findContact = null;
            }
        }
        if (record.SeconadryContactId2.HasValue)
        {
            findContact = lstBxContacts.Items.FindByValue(record.SeconadryContactId2.ToString());
            if (findContact != null)
            {
                lstBxContacts.Items.FindByValue(record.SeconadryContactId2.ToString()).Selected = true;
                findContact = null;
            }
        }
    }

    private void ClearFiels()
    {
        ddlCompany.SelectedValue = "0";
        SetContact("", "");
        //ddlContacts.SelectedValue = "0";
        txtOppName.Text = "";
        if (trOpportunityID.Visible)
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
        txtDescription.Text = "";
        txtNotes.Text = "";
        txtActualValue.Text = "";
        ddlSource.SelectedIndex = 0;
        ddlTypes.SelectedIndex = 0;
        ddlProductStatus.SelectedIndex = 0;
        ddlWhyLost.SelectedIndex = 0;
    }

    protected void lbtnCancel_Click(object sender, EventArgs e)
    {
        ClearFiels();
        if (OpportunityID > 0)
            Server.Transfer("~/CRM/Opportunities/Detail.aspx?id=" + OpportunityID);
        else
            Server.Transfer("~/CRM/Opportunities/Index.aspx");
    }
}