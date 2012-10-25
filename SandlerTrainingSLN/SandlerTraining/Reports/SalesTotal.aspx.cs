using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sandler.UI.ChartStructure;
using System.Data;
public partial class Reports_SalesTotal : BasePage
{
    public decimal totalPrevYr2;
    public decimal totalPrevYr1;
    public decimal totalCurrentYr;
    List<ChartParameter> chartParams = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SandlerModels.DataIntegration.DataQueries queries = new SandlerModels.DataIntegration.DataQueries();
            
            chartParams = new List<ChartParameter>();
            chartParams.Add(new ChartParameter { Value = (DateTime.Now.Year - 2).ToString() });
            chartParams.Add(new ChartParameter { Value = (DateTime.Now.Year - 1).ToString() });
            chartParams.Add(new ChartParameter { Value = DateTime.Now.Year.ToString() });
            IEnumerable<SandlerModels.DataIntegration.SalesTotalByMonthVM> salesTotalData;
            DataTable data = new DataTable();
            DataRow dr;
            int columnIndex = 0;
            data.Columns.Add(new DataColumn(" "));

            string[] monthNames = System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat.MonthNames;

            foreach (string monthName in monthNames) // writing out
            {
                if (!string.IsNullOrEmpty(monthName))
                {
                    dr = data.NewRow();
                    dr[columnIndex] = monthName.Substring(0, 3);
                    data.Rows.Add(dr);
                }
            }

            foreach (ChartParameter parameter in chartParams)
            {
                data.Columns.Add(new DataColumn((parameter.Value == DateTime.Now.Year.ToString()) ? parameter.Value + "*" : parameter.Value));
                columnIndex++;
                try
                {
                    salesTotalData = queries.GetSalesTotalByMonth(CurrentUser, int.Parse(parameter.Value));
                    if (salesTotalData != null)
                    {
                        var salesDataForAYear = from opportunity in salesTotalData
                                                group opportunity by new { opportunity.CloseDate.Month }
                                                    into grp
                                                    select new { TotalValue = grp.Sum(record => record.Value), MonthName = ChartHelper.GetMonthName(grp.Key.Month) };

                        foreach(DataRow dR in data.Rows)
                        {
                            foreach (var record in salesDataForAYear)
                            {
                                if (record.MonthName == dR[0].ToString())
                                    dR[columnIndex] = record.TotalValue/1000;
                            }
                        }

                    }
                }
                catch (Exception ex)
                {
                }
            }

            gvSalesTotal.DataSource = data;
            gvSalesTotal.DataBind();

        }
    }

    protected void gvSalesTotal_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            
            // add the UnitPrice and QuantityTotal to the running total variables
            if(DataBinder.Eval(e.Row.DataItem, chartParams[0].Value) != DBNull.Value)
                totalPrevYr2 += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, chartParams[0].Value));
            if (DataBinder.Eval(e.Row.DataItem, chartParams[1].Value) != DBNull.Value)
                totalPrevYr1 += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, chartParams[1].Value));
            if (DataBinder.Eval(e.Row.DataItem, chartParams[2].Value+"*") != DBNull.Value)
                totalCurrentYr += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, chartParams[2].Value+"*"));

        }
        else if (e.Row.RowType == DataControlRowType.Footer)
        {
            e.Row.Cells[0].Text = "Totals";
            e.Row.Cells[1].Text = totalPrevYr2.ToString();
            e.Row.Cells[2].Text = totalPrevYr1.ToString();
            e.Row.Cells[3].Text = totalCurrentYr.ToString();


            e.Row.Cells[0].HorizontalAlign = e.Row.Cells[1].HorizontalAlign = e.Row.Cells[2].HorizontalAlign = e.Row.Cells[3].HorizontalAlign = HorizontalAlign.Right;
            e.Row.Font.Bold = true;
        }
    }
}