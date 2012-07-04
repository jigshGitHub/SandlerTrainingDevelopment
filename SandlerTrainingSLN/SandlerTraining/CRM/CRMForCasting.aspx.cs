using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sandler.Data.Utility;
using System.Data.SqlClient;
using System.Data;

public partial class CRMForCasting : System.Web.UI.Page
{
    DBUtility db = new DBUtility();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ddlCompany_DataBound(object sender, System.EventArgs e)
    {
        if (!(ddlCompany.Items.Count == 0))
        {
            ListItem selectItem = new ListItem("--Select --", "0");
            ddlCompany.Items.Insert(0, selectItem);
        }

    }
    protected void btnChangeForecast_Click(object sender, EventArgs e)
    {
        Response.Redirect("CRMAdjustForecast.aspx");
    }
    protected void ddlCompany_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        if (!(ddlCompany.SelectedIndex == 0))
        {
            DataSet ds;
            ds = db.ExecuteDataset("sp_GetForecastDetails","ForeCastDetails", new SqlParameter("@CompID", ddlCompany.SelectedIndex));
            if (ds.Tables[0].Rows.Count > 0)
            {
                tblMain.Style.Add("display", "block");
                lblStatus.Text = "";

                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    lblq2quota.Text = dr["Q2Quota"].ToString();
                    lblq3quota.Text = dr["Q3Quota"].ToString();
                    lblq4quota.Text = dr["Q4Quota"].ToString();
                    lblTotalQuota.Text = dr["QuotaTotal"].ToString();

                    lblq2Bestcase.Text = dr["Q2BestCase"].ToString();
                    lblq32Bestcase.Text = dr["Q3BestCase"].ToString();
                    lblq4Bestcase.Text = dr["Q4BestCase"].ToString();
                    lblTotalBestCase.Text = dr["BestCaseTotal"].ToString();

                    lblq2Sales.Text = dr["Q2SalesPL"].ToString();
                    lblq3Sales.Text = dr["Q3SalesPL"].ToString();
                    lblq4Sales.Text = dr["Q4SalesPL"].ToString();
                    lblTotalSales.Text = dr["SalesPLTotal"].ToString();

                    lblSeasonalityIndex.Text = dr["Season_Index"].ToString();
                    lblGrowthIndex.Text = dr["Growth_Index"].ToString();
                    lblTrainedSalesRep.Text = dr["Trained_Reps"].ToString();
                    lblSalesCycleTime.Text = dr["Sales_Cycle_Time"].ToString();

                }
            }
            else
            {
                tblMain.Style.Add("display", "none");
                lblStatus.Text = "No forecasting information is available for the selected company.";
            }
               
                                  
            
        }
        else
        {
            tblMain.Style.Add("display", "none");
            lblStatus.Text = "No forecasting information is available for the selected company.";
        }
    }
}