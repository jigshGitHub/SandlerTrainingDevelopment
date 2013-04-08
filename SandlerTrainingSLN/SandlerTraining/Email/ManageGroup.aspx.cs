using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerModels;
using SandlerModels.DataIntegration;

public partial class Email_ManageGroup : BasePage
{
    string _coachIds = "";
    string _frOwnerIds = "";
    string _frUsersIds = "";
    string _frContactsIds = "";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //Check for the User Role
            
            if (CurrentUser.Role == SandlerRoles.Corporate)
            {
                NonCorporate.Visible = false;
                //Hide Addresses Rows - It will be visible when user selects the Franchisee
                SetResetRowPosition(false);
            }
            else
            {
                Corporate.Visible = false;
                lblFranchisee.Text = CurrentUser.FranchiseeName;
            }
        }
    }

    protected void CoachEmailDS_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["_user"] = CurrentUser;
    }

    protected void FrOwnerEmailDS_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["_user"] = CurrentUser;
    }

    protected void FrUsersEmailDS_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["_user"] = CurrentUser;
    }

    protected void FrContactsEmailDS_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["_user"] = CurrentUser;
    }

    protected void FranchiseeDS_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["_user"] = CurrentUser;
    }

    


    public void SetResetRowPosition(bool status)
    {
        //Rows
        trCorp1.Visible = status;
        trCorp2.Visible = status;
        trCorp3.Visible = status;
        trCorp4.Visible = status;
        trCorp5.Visible = status;
        trCorp6.Visible = status;
        trCorp7.Visible = status;
        trCorp8.Visible = status;
        trCorp9.Visible = status; 

    }
    protected void ddlFranchisee_DataBound(object sender, EventArgs e)
    {
        if (!(ddlFranchisee.Items.Count == 0))
        {
            ListItem selectItem = new ListItem("--Select Franchisee--", "0");
            ddlFranchisee.Items.Insert(0, selectItem);
        }
    }
    protected void ddlFranchisee_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        if (ddlFranchisee.SelectedValue != "0")
        {
            SetResetRowPosition(true);
        }
        else
        {
            SetResetRowPosition(false);
        }
        //Reset
        lblErrorCorp.Text = "";
        txtGroupNameCorp.Text = "";

    }
    /// <summary>
    /// For Non Corporate User
    /// </summary>
    /// <returns></returns>
    private bool IsAtleastOneGroupSelected()
    {
        bool IsSelected = false;
        //For Coach
        foreach (ListItem listItem in chkListCoach.Items)
        {
            if (listItem.Selected)
            {
                IsSelected = true;
            }
        }
        //for Fr Owner
        foreach (ListItem listItem in chkListFrOwner.Items)
        {
            if (listItem.Selected)
            {
                IsSelected = true;
            }
        }
        //For Fr Users
        foreach (ListItem listItem in chkListFrUsers.Items)
        {
            if (listItem.Selected)
            {
                IsSelected = true;
            }
        }
        //For Fr Contacts
        foreach (ListItem listItem in chkListFrContacts.Items)
        {
            if (listItem.Selected)
            {
                IsSelected = true;
            }
        }
        return IsSelected;
    }

    /// <summary>
    /// For Corporate User
    /// </summary>
    /// <returns></returns>
    private bool IsAtleastOneGroupSelectedCorp()
    {
        bool IsSelected = false;
        //For Coach Corp
        foreach (ListItem listItem in chkListCoachCorp.Items)
        {
            if (listItem.Selected)
            {
                IsSelected = true;
            }
        }
        //for Fr Owner Corp
        foreach (ListItem listItem in chkListFrOwnerCorp.Items)
        {
            if (listItem.Selected)
            {
                IsSelected = true;
            }
        }
        //For Fr Users Corp
        foreach (ListItem listItem in chkListFrUsersCorp.Items)
        {
            if (listItem.Selected)
            {
                IsSelected = true;
            }
        }
        //For Fr Contacts Corp
        foreach (ListItem listItem in chkListFrContactsCorp.Items)
        {
            if (listItem.Selected)
            {
                IsSelected = true;
            }
        }
        return IsSelected;
    }

    /// <summary>
    /// Get Value of each selected Email Adrs
    /// </summary>
    /// <param name="_chkList"></param>
    /// <returns></returns>
    private string GetSelectedList (CheckBoxList _chkList)
    {
       string _listAddresses = "";

       foreach (ListItem listItem in _chkList.Items)
        {
            if (listItem.Selected)
            {
                if (_listAddresses.Length > 0)
                {
                   //Continue to add more
                    _listAddresses = _listAddresses + "','" + listItem.Value;
                }
                else 
                {
                   //Add for the first time
                   _listAddresses = listItem.Value;
                }
            }
        }
        //return the list for this Checkbox list
        return _listAddresses;
    }

    private string GetSelectedListSpl(CheckBoxList _chkList)
    {
        string _listAddresses = "";

        foreach (ListItem listItem in _chkList.Items)
        {
            if (listItem.Selected)
            {
                if (_listAddresses.Length > 0)
                {
                    //Continue to add more
                    _listAddresses = _listAddresses + "," + listItem.Value;
                }
                else
                {
                    //Add for the first time
                    _listAddresses = listItem.Value;
                }
            }
        }
        //return the list for this Checkbox list
        return _listAddresses;
    }

    protected void btnCreateGroup_Click(object sender, EventArgs e)
    {
        //This is when user has entered Group Name and selected few Address to be included in the GroupList
        if (IsAtleastOneGroupSelected() && !string.IsNullOrEmpty(txtGroupName.Text))
        {
           
            try 
            {
                //Create the Group Addresses List - Let us start with Coach
                _coachIds = GetSelectedList(chkListCoach);
                _frOwnerIds = GetSelectedList(chkListFrOwner);
                _frUsersIds = GetSelectedList(chkListFrUsers);
                _frContactsIds = GetSelectedListSpl(chkListFrContacts);
                //Now Save the Info
                new SandlerRepositories.BlastEmailRepository().AddGroup(txtGroupName.Text.Trim(), _coachIds, _frOwnerIds, _frUsersIds, _frContactsIds,CurrentUser);
                lblError.Text = "Group added successfully. This will be available when you compose message using Send Email feature.";
            }
            catch
            {
                lblError.Text = "There is a problem saving the information in the Database. Please contact Administrator or try again later.";
                lblError.Font.Bold = true; 
            }
            
        }
        else
        {
            //User has not selected address from any group 
            lblError.Text = "Please select at least one Email Address to be included in the Group.";
            lblError.Font.Bold = true; 
            
        }

    }
    protected void btnCreateGrpCorp_Click(object sender, EventArgs e)
    {
        //This is when user has entered Group Name and selected few Address to be included in the GroupList
        if (IsAtleastOneGroupSelectedCorp() && !string.IsNullOrEmpty(txtGroupNameCorp.Text))
        {
            try
            {
                //Create the Group Addresses List - Let us start with Coach
                _coachIds = GetSelectedList(chkListCoachCorp);
                _frOwnerIds = GetSelectedList(chkListFrOwnerCorp);
                _frUsersIds = GetSelectedList(chkListFrUsersCorp);
                _frContactsIds = GetSelectedListSpl(chkListFrContactsCorp);
                //Now Save the Info
                new SandlerRepositories.BlastEmailRepository().AddGroup(txtGroupNameCorp.Text.Trim(), _coachIds, _frOwnerIds, _frUsersIds, _frContactsIds,CurrentUser);
                lblErrorCorp.Text = "Group added successfully. This will be available when you compose message using Send Email feature.";
            }
            catch
            {
                lblErrorCorp.Text = "There is a problem saving the information in the Database. Please contact Administrator or try again later.";
                lblErrorCorp.Font.Bold = true;
            }
        }
        else 
        {
            //User has not selected address from any group 
            lblErrorCorp.Text = "Please select at least one Email Address to be included in the Group.";
            lblErrorCorp.Font.Bold = true; 
        }
    }
}