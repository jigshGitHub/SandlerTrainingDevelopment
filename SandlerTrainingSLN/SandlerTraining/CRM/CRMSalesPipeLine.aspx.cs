using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMSalesPipeLine : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void gvOpportunities_DataBound(object sender, EventArgs e)
    {
        if (gvOpportunities.Rows.Count == 0)
        {
            LblStatus.Text = "There are no Opportunity available for this company.";
        }
        else
        {
            LblStatus.Text = "";
        }
    }
    protected void ddlCompany_DataBound(object sender, EventArgs e)
    {
        if (!(ddlCompany.Items.Count == 0))
        {
            ListItem selectItem = new ListItem("All", "0");
            ddlCompany.Items.Insert(0, selectItem);
        }
    }
    protected void gvOpportunities_SelectedIndexChanged(object sender, EventArgs e)
    {
        hidOpprtunityID.Value = gvOpportunities.SelectedDataKey.Value.ToString();
        Server.Transfer("CRMViewOpportunity.aspx");
    }
    protected void btnAddOpportunity_Click(object sender, EventArgs e)
    {
        Response.Redirect("CRMAddOpportunity.aspx");
    }
    decimal Weighted_valueTotal = 0;
    decimal Total_ValueTotal = 0;
    protected void gvOpportunities_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // add the UnitPrice and QuantityTotal to the running total variables
            Weighted_valueTotal += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Weighted_value"));
            Total_ValueTotal += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Total_Value"));
        }
        else if (e.Row.RowType == DataControlRowType.Footer)
        {
            e.Row.Cells[1].Text = "Total";
            e.Row.Cells[4].Text = Weighted_valueTotal.ToString("c");
            e.Row.Cells[5].Text = Weighted_valueTotal.ToString("c");

            e.Row.Cells[1].HorizontalAlign = e.Row.Cells[4].HorizontalAlign = e.Row.Cells[5].HorizontalAlign = HorizontalAlign.Center;
            e.Row.Font.Bold = true;
        }
    }
}