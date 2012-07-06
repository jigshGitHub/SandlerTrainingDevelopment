using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;

public partial class CRMAdjustForecast : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        //Collect all the Information from the screen
        int Q2Total = Convert.ToInt32(txtq2quota.Text) + Convert.ToInt32(txtq2Bestcase.Text) + Convert.ToInt32(txtq2Sales.Text);
        int Q3Total = Convert.ToInt32(txtq3quota.Text) + Convert.ToInt32(txtq3Bestcase.Text) + Convert.ToInt32(txtq3Sales.Text);
        int Q4Total = Convert.ToInt32(txtq4quota.Text) + Convert.ToInt32(txtq4Bestcase.Text) + Convert.ToInt32(txtq4Sales.Text);
                
        int QuotaTotal = Convert.ToInt32(txtq2quota.Text) + Convert.ToInt32(txtq3quota.Text) + Convert.ToInt32(txtq4quota.Text);
        int BestCaseTotal = Convert.ToInt32(txtq2Bestcase.Text) + Convert.ToInt32(txtq3Bestcase.Text) + Convert.ToInt32(txtq4Bestcase.Text);
        int SalesPLTotal = Convert.ToInt32(txtq2Sales.Text) + Convert.ToInt32(txtq3Sales.Text) + Convert.ToInt32(txtq4Sales.Text);
        
        //Now Update


        new SandlerRepositories.ForcastingRepository().Insert(ddlCompany.SelectedIndex, Q2Total, Q3Total, Q4Total, 2012, QuotaTotal, BestCaseTotal, SalesPLTotal, int.Parse(txtq2quota.Text), int.Parse(txtq2Bestcase.Text),int.Parse(txtq2Sales.Text), int.Parse(txtq3quota.Text), int.Parse(txtq3Bestcase.Text), int.Parse(txtq3Sales.Text), int.Parse(txtq4quota.Text), int.Parse(txtq4Bestcase.Text), int.Parse(txtq4Sales.Text),txtSeasonalityIndex.Text,txtGrowthIndex.Text, txtTrainedSalesRep.Text, txtSalesCycleTime.Text);
        GetData();
        
        //Update Status
        lblStatus.Text = "Forecast details successfully updated!!";

    }
    protected void ddlCompany_DataBound(object sender, System.EventArgs e)
    {
        if (!(ddlCompany.Items.Count == 0))
        {
            ListItem selectItem = new ListItem("--Select --", "0");
            ddlCompany.Items.Insert(0, selectItem);
        }

    }
    public void GetData()
    {
        DataSet ds;
        ds = new SandlerRepositories.ForcastingRepository().GetById(ddlCompany.SelectedIndex);
        if (ds.Tables[0].Rows.Count > 0)
        {
                        
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                txtq2quota.Text = dr["Q2Quota"].ToString();
                txtq3quota.Text = dr["Q3Quota"].ToString();
                txtq4quota.Text = dr["Q4Quota"].ToString();
                lblTotalQuota.Text = "$ " + dr["QuotaTotal"].ToString();

                txtq2Bestcase.Text = dr["Q2BestCase"].ToString();
                txtq3Bestcase.Text = dr["Q3BestCase"].ToString();
                txtq4Bestcase.Text = dr["Q4BestCase"].ToString();
                lblTotalBestCase.Text = "$ " + dr["BestCaseTotal"].ToString();

                txtq2Sales.Text = dr["Q2SalesPL"].ToString();
                txtq3Sales.Text = dr["Q3SalesPL"].ToString();
                txtq4Sales.Text = dr["Q4SalesPL"].ToString();
                lblTotalSales.Text = "$ " + dr["SalesPLTotal"].ToString();

                txtSeasonalityIndex.Text = dr["Season_Index"].ToString();
                txtGrowthIndex.Text = dr["Growth_Index"].ToString();
                txtTrainedSalesRep.Text = dr["Trained_Reps"].ToString();
                txtSalesCycleTime.Text = dr["Sales_Cycle_Time"].ToString();

            }
        }
        else
        {
            ClearData();
            
        }
    }
    private void ClearData()
    {
        txtq2quota.Text = "";
        txtq3quota.Text = "";
        txtq4quota.Text = "";
        lblTotalQuota.Text = "";

        txtq2Bestcase.Text = "";
        txtq3Bestcase.Text = "";
        txtq4Bestcase.Text = "";
        lblTotalBestCase.Text = "";

        txtq2Sales.Text = "";
        txtq3Sales.Text = "";
        txtq4Sales.Text = "";
        lblTotalSales.Text = "";

        txtSeasonalityIndex.Text = "";
        txtGrowthIndex.Text = "";
        txtTrainedSalesRep.Text = "";
        txtSalesCycleTime.Text = "";
    }
    protected void ddlCompany_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        if (!(ddlCompany.SelectedIndex == 0))
        {
            tblMain.Style.Add("display", "block");
            GetData();
            lblStatus.Text = "";
        }
        else
        {
            ClearData();
            tblMain.Style.Add("display", "none");
            lblStatus.Text = "Please select Company to View/Update forecast information.";
        }
    }
}