using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reports_CostOfSale : BasePage
{
    public decimal totalRevenue;
    public decimal totalCost;
    public decimal totalProfit;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SandlerModels.DataIntegration.DataQueries queries = new SandlerModels.DataIntegration.DataQueries();
            IEnumerable<SandlerModels.DataIntegration.CostOfSaleVM> costofsaleData = queries.GetCostOfSale(CurrentUser);

            gvCOS.DataSource = costofsaleData;
            gvCOS.DataBind();
                        
        }
    }

    protected void gvCOS_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // add the UnitPrice and QuantityTotal to the running total variables
            totalRevenue += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Revenue"));
            totalCost += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Cost"));
            totalProfit += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Profit"));

        }
        else if (e.Row.RowType == DataControlRowType.Footer)
        {
            e.Row.Cells[0].Text = "Totals";
            e.Row.Cells[1].Text = totalRevenue.ToString("c");
            e.Row.Cells[2].Text = totalCost.ToString("c");
            e.Row.Cells[3].Text = totalProfit.ToString("c");


            e.Row.Cells[0].HorizontalAlign = e.Row.Cells[1].HorizontalAlign = e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Center;
            e.Row.Font.Bold = true;
        }
    }
}