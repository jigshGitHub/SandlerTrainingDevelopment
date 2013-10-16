using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

public partial class CRM_RDL_RDLReports : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
        }
    }
    protected void ddlreportlist_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        string reportName = ddlreportlist.SelectedValue.ToString();
        HideAllControls();
        if (reportName == "")
        {
            lblErrorMessage.Text="Please select a report";
           
        }
        else
        {
            lblErrorMessage.Text="";
             loadSearchCriteria(reportName);
        }        
    }
    private void LoadRDLReport()
    {
        PopUpWindow("ReportControlViewer.aspx", "Report");
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (ddlreportlist.SelectedValue.ToString() == "")
        {
            lblErrorMessage.Text = "Please select a report";
            HideAllControls();
        }
        else
        {            
            lblErrorMessage.Text = "";
            GetSearchCriteria();
            LoadRDLReport();           
           
        }
        
    }
    

    private void GetSearchCriteria()
    {
        //string franchiselist = GetListBoxSelValueInComma(lbFrachiseList);      
        //string statuslist = GetListBoxSelStringInComma(lbStatus);
        Session["reportName"] = ddlreportlist.SelectedValue.ToString();
        
        switch (ddlreportlist.SelectedValue.ToString())
        {
            case "SalesRepresentativeReport":
                string[] franchiselist = buildstringarrayIDS(lbFrachiseList);
                string[] statuslist = buildstringarray(lbStatus);
                Session["FranchiseList"] = franchiselist;
                Session["StatusList"] = statuslist;  
                break;
            case "TotalPipelinebyStatusAndFranchiseSpecificbyID":
                Session["FranchiseID"] = ddlFranchiseID.SelectedValue.ToString();
                break;

        }

    }
    private void HideAllControls()
    {
        lblFranchise.Visible = false;
        lblStatus.Visible = false;
        lbFrachiseList.Visible = false;
        lbStatus.Visible = false;
        lblFranchiseID.Visible = false;
        ddlFranchiseID.Visible = false;
        rflbFranchise.Enabled = false;
        rflbStatus.Enabled = false;
        rfDDLFranchiseID.Enabled = false;
        
    }
    private void loadSearchCriteria(string reportName)
    {
        switch (reportName)
        {
            case "SalesRepresentativeReport":
                lblFranchise.Visible = true;
                lblStatus.Visible = true;
                lbFrachiseList.Visible = true;
                lbStatus.Visible = true;
                rflbFranchise.Enabled = true;
                rflbStatus.Enabled = true;
                LoadFranchise();
                //hdnFranchiseeId.Value = CurrentUser.FranchiseeID.ToString();
                //hdnFranchiseeOwnerUserId.Value = CurrentUser.UserId.ToString();
                if (CurrentUser.Role.ToString() == "FranchiseeOwner" || CurrentUser.Role.ToString() == "FranchiseeUser")
                    lbFrachiseList.SelectedValue = CurrentUser.FranchiseeID.ToString();
                
                LoadStatus();
                break;
            case "TotalPipelinebyStatusAndFranchiseSpecificbyID":
                lblFranchiseID.Visible = true;                
                ddlFranchiseID.Visible = true;
                rfDDLFranchiseID.Enabled = true;
                LoadFranchiseID();                
                break;  

        }

    }
    private void LoadFranchiseID()
    {

        DataTable franchiseList = new DataTable();

        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString()))
        {

            try
            {

                string where = "";
                if (CurrentUser.Role.ToString() == "FranchiseeOwner" || CurrentUser.Role.ToString() == "FranchiseeUser")
                    where = "Where F.id = " + CurrentUser.FranchiseeID.ToString();

                if (CurrentUser.Role.ToString() == "Coach")
                    where = "Where F.id in (SELECT ID from  TBL_FRANCHISEE where CoachID = " + CurrentUser.CoachID.ToString() + ")";
                
                //Prepare the SQL Statment
                string sql = string.Format("SELECT F.Id,F.Name FROM TBL_FRANCHISEE F {0} order by F.ID desc", where);
                
                //SqlDataAdapter adapter = new SqlDataAdapter(@"SELECT TBL_FRANCHISEE.id FROM   TBL_FRANCHISEE order by id desc", con);

                SqlDataAdapter adapter = new SqlDataAdapter(@sql, con);
                adapter.Fill(franchiseList);

                ddlFranchiseID.DataSource = franchiseList;
                ddlFranchiseID.DataTextField = "Name";
                ddlFranchiseID.DataValueField = "ID";
                ddlFranchiseID.DataBind();
            }
            catch (Exception ex)
            {
                // Handle the error
            }

        }

        // Add the default item
        ddlFranchiseID.Items.Insert(0, new ListItem("--Select Franchise --", "0"));

    }
    
    private void LoadFranchise()
    {

        DataTable franchiseList = new DataTable();

        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString())) 
        {

            try
            {
                string where = "";
                if (CurrentUser.Role.ToString() == "FranchiseeOwner" || CurrentUser.Role.ToString() == "FranchiseeUser")
                    where = "Where Test1.ID1 = " + CurrentUser.FranchiseeID.ToString();

                if (CurrentUser.Role.ToString() == "Coach")
                    where = "Where Test1.ID1 in (SELECT ID from TBL_FRANCHISEE where CoachID = " + CurrentUser.CoachID.ToString() + ")";
                
                //Prepare the SQL Statment
                string sql = string.Format("Select distinct(Name), ID1 from (SELECT  TBL_FRANCHISEE.Name, TBL_FRANCHISEE.ID as ID1, TBL_OPPORTUNITIES.VALUE FROM TBL_FRANCHISEE inner join TBL_COMPANIES on TBL_COMPANIES.FranchiseeId=TBL_FRANCHISEE.ID inner join TBL_OPPORTUNITIES on TBL_OPPORTUNITIES.COMPANYID=TBL_COMPANIES.COMPANIESID where TBL_OPPORTUNITIES.VALUE>0) as Test1 {0}  order by Test1.Name asc", where);
                
//                SqlDataAdapter adapter = new SqlDataAdapter(@"Select distinct(Name), ID1 from (SELECT  TBL_FRANCHISEE.Name, TBL_FRANCHISEE.ID as ID1, 
//                TBL_OPPORTUNITIES.VALUE FROM TBL_FRANCHISEE
//                inner join TBL_COMPANIES on TBL_COMPANIES.FranchiseeId=TBL_FRANCHISEE.ID
//                inner join TBL_OPPORTUNITIES on TBL_OPPORTUNITIES.COMPANYID=TBL_COMPANIES.COMPANIESID where TBL_OPPORTUNITIES.VALUE>0
//                    ) as Test1
//                order by Test1.Name asc", con);

                SqlDataAdapter adapter = new SqlDataAdapter(@sql, con);

                adapter.Fill(franchiseList);

                lbFrachiseList.DataSource = franchiseList;
                lbFrachiseList.DataTextField = "Name";
                lbFrachiseList.DataValueField = "ID1";
                lbFrachiseList.DataBind();
            }
            catch (Exception ex)
            {
                // Handle the error
            }

        }

        // Add the default item
        lbFrachiseList.Items.Insert(0, new ListItem("Select All", "0"));

    }
    private void LoadStatus()
    {

        DataTable statusList = new DataTable();

        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString()))
        {

            try
            {
                SqlDataAdapter adapter = new SqlDataAdapter(@"SELECT
                  TBL_OPPORTUNITYSTATUS.Name
                FROM
                  TBL_OPPORTUNITYSTATUS", con);
                adapter.Fill(statusList);

                lbStatus.DataSource = statusList;
                lbStatus.DataTextField = "Name";
                lbStatus.DataValueField = "Name";
                lbStatus.DataBind();
            }
            catch (Exception ex)
            {
                // Handle the error
            }

        }

        // Add the initial item - you can add this even if the options from the
        // db were not successfully loaded
        lbStatus.Items.Insert(0, new ListItem("Select All", "0"));

    }
    public string GetListBoxSelStringInComma(ListBox Listbox1)
    {
        string selectedItem = "";
        if (Listbox1.Items.Count > 0)
        {
            if (Listbox1.SelectedValue.ToString() == "0")
            {
                for (int i = 0; i < Listbox1.Items.Count; i++)
                {
                    if (selectedItem == "")
                        selectedItem = Listbox1.Items[i].Text;
                    else
                        selectedItem += "\",\"" + Listbox1.Items[i].Text;
                }
            }
            else
            {
                for (int i = 0; i < Listbox1.Items.Count; i++)
                {
                    if (Listbox1.Items[i].Selected)
                    {
                        if (selectedItem == "")
                            selectedItem = Listbox1.Items[i].Text;
                        else
                            selectedItem += "\",\"" + Listbox1.Items[i].Text;
                    }

                }
            }
        }
        selectedItem = "\"" + selectedItem + "\"";
        return selectedItem;
    }
    public string GetListBoxSelValueInComma(ListBox Listbox1)
    {
        string selectedItem = "";
        if (Listbox1.Items.Count > 0)
        {
            if (Listbox1.SelectedValue.ToString() == "0")
            {
                for (int i = 0; i < Listbox1.Items.Count; i++)
                {
                    if (selectedItem == "")
                        selectedItem = Listbox1.Items[i].Value;
                    else
                        selectedItem += "\",\"" + Listbox1.Items[i].Value;
                }
            }
            else
            {
                for (int i = 0; i < Listbox1.Items.Count; i++)
                {
                    if (Listbox1.Items[i].Selected)
                    {
                        if (selectedItem == "")
                            selectedItem = Listbox1.Items[i].Value;
                        else
                            selectedItem += "\",\"" + Listbox1.Items[i].Value;
                    }

                }
            }
        }
        selectedItem = "\"" + selectedItem + "\"";
        return selectedItem;
    }
    private string[] buildstringarray(ListBox Listbox1)
    {
        string[] array = new string[Listbox1.Items.Count];
        if (Listbox1.SelectedValue.ToString() == "0")
        {
            for (int i = 0; i < Listbox1.Items.Count; i++)
            {
                if (Listbox1.Items[i].Value != "0")
                {
                    object s = Listbox1.Items[i];
                    array[i] = s.ToString();
                }
            }
        }
        else
        {
            for (int i = 0; i < Listbox1.Items.Count; i++)
            {
                if (Listbox1.Items[i].Selected)
                {
                    object s = Listbox1.Items[i];
                    array[i] = s.ToString();
                }
            }
        }
        return array;
    }
    private string[] buildstringarrayIDS(ListBox Listbox1)
    {
        string[] array = new string[Listbox1.Items.Count];
        if (Listbox1.SelectedValue.ToString() == "0")
        {
            for (int i = 0; i < Listbox1.Items.Count; i++)
            {
                if (Listbox1.Items[i].Value != "0")
                {
                    object s = Listbox1.Items[i].Value;
                    array[i] = s.ToString();
                }
            }
        }
        else
        {
            for (int i = 0; i < Listbox1.Items.Count; i++)
            {
                if (Listbox1.Items[i].Selected)
                {
                    object s = Listbox1.Items[i].Value;
                    array[i] = s.ToString();
                }
            }
        }
        return array;
    }
    public static void PopUpWindow(string pTarget, string pName)
    {

        Page p;
        StringBuilder strScript = new StringBuilder();

        strScript.Append("<script language=JavaScript>");
        strScript.Append("var " + pName + "=window.open('" + pTarget);
        strScript.Append("','WindowName','height=800,width=1100,toolbar=yes,");
        strScript.Append(" menubar=yes,resizable=yes,scrollbars=yes');");
        //    strScript.Append("if (window.focus) {" + pName + ".focus()};");
        strScript.Append("</script>");

        p = (System.Web.UI.Page)HttpContext.Current.Handler;

        //       p.RegisterStartupScript("startupScript", strScript.ToString());
        p.ClientScript.RegisterStartupScript(typeof(string), "startupScript", strScript.ToString());

    }

}
