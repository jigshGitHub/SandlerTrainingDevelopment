using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI.WebControls;
using OfficeOpenXml;
using OfficeOpenXml.Style;
using System.Drawing;
using System.IO;

/// <summary>
/// Summary description for ExportToExcel
/// </summary>
public class ExportToExcel
{
	public ExportToExcel()
	{
		//
		// TODO: Add constructor logic here
		//
	}
     //public static void DownloadReportResults(DataSet _data)
    //{

    //    GridView gv = new GridView();
    //    gv.HeaderStyle.BackColor = System.Drawing.Color.White;
    //    gv.HeaderStyle.Font.Bold = true;
    //    gv.HeaderStyle.ForeColor = System.Drawing.Color.FromName("#0000ff");
    //    gv.RowStyle.BackColor = System.Drawing.Color.FromName("#eeeeee");
    //    gv.AlternatingRowStyle.BackColor = System.Drawing.Color.FromName("#dcdcdc");
    //    gv.DataSource = _data;
    //    gv.DataBind();

    //    System.Web.HttpContext.Current.Response.Clear();
    //    System.Web.HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=HomeOfficeResults.xls");
    //    System.Web.HttpContext.Current.Response.Charset = "";
    //    System.Web.HttpContext.Current.Response.ContentType = "application/vnd.ms-excel";

    //    System.IO.StringWriter stringWrite = new System.IO.StringWriter();
    //    System.Web.UI.HtmlTextWriter htmlWrite = new System.Web.UI.HtmlTextWriter(stringWrite);
    //    gv.AllowPaging = false;
    //    gv.AllowSorting = false;
    //    //Get the User Info

    //    gv.DataBind();
    //    //Report is the Div which we need to Export - Gridview is under this Div
    //    gv.RenderControl(htmlWrite);
    //    System.Web.HttpContext.Current.Response.Write(stringWrite.ToString());
    //    System.Web.HttpContext.Current.Response.End();

    //}
	public static void DownloadReportResults(DataSet _data)
    {

        DataTable reportsTable = _data.Tables[0];
        using (ExcelPackage p = new ExcelPackage())
        {
            //Set the Document properties
            p.Workbook.Properties.Author = "Sandler Training";
            p.Workbook.Properties.Title = "Home Office Report";

            //Create a sheet
            p.Workbook.Worksheets.Add("HomeOfficeResults");
            ExcelWorksheet ws = p.Workbook.Worksheets[1];
            //ws.Name = "Sample Worksheet"; //name the sheet as needed
            ws.Cells.Style.Font.Size = 11; //Default font size for whole sheet
            ws.Cells.Style.Font.Name = "Calibri"; //Default Font name for whole sheet
            ws.View.ShowGridLines = true;
                      
            //Load the data
            ws.Cells["A1"].LoadFromDataTable(reportsTable, true);
            //Bordor style
            ws.Cells[1, 1, reportsTable.Rows.Count + 1, reportsTable.Columns.Count].Style.Border.Left.Style = ExcelBorderStyle.Thin;
            ws.Cells[1, 1, reportsTable.Rows.Count + 1, reportsTable.Columns.Count].Style.Border.Top.Style = ExcelBorderStyle.Thin;
            ws.Cells[1, 1, reportsTable.Rows.Count + 1, reportsTable.Columns.Count].Style.Border.Right.Style = ExcelBorderStyle.Thin;
            ws.Cells[1, 1, reportsTable.Rows.Count + 1, reportsTable.Columns.Count].Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
            //Header to Bold
            ws.Cells[1, 1, 1, reportsTable.Columns.Count].Style.Font.Bold = true;
            //Header to color
            ws.Cells[1, 1, 1, reportsTable.Columns.Count].Style.Font.Color.SetColor(Color.Blue);
            //Data row back color
            ws.Cells[2, 1, reportsTable.Rows.Count + 1, reportsTable.Columns.Count].Style.Fill.PatternType = ExcelFillStyle.Solid;
            ws.Cells[2, 1, reportsTable.Rows.Count + 1, reportsTable.Columns.Count].Style.Fill.BackgroundColor.SetColor(Color.Beige);
            
            //Autofit columns
            ws.Cells[ws.Dimension.Address.ToString()].AutoFitColumns();
            ws.Column(1).AutoFit();
            System.Web.HttpContext.Current.Response.Clear();
            System.Web.HttpContext.Current.Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            System.Web.HttpContext.Current.Response.AddHeader("content-disposition", "attachment;  filename=HomeOfficeResults.xlsx");
            System.Web.HttpContext.Current.Response.BinaryWrite(p.GetAsByteArray());            
            System.Web.HttpContext.Current.Response.End();
            
        }
      

    }

    public static void DownloadReportResultsWithDT(DataTable _data, string reportName)
    {

        DataTable reportsTable = _data;
        using (ExcelPackage p = new ExcelPackage())
        {
            //Set the Document properties
            p.Workbook.Properties.Author = "Sandler Training";
            p.Workbook.Properties.Title = reportName;

            //Create a sheet
            p.Workbook.Worksheets.Add(reportName);
            ExcelWorksheet ws = p.Workbook.Worksheets[1];
            //ws.Name = "Sample Worksheet"; //name the sheet as needed
            ws.Cells.Style.Font.Size = 11; //Default font size for whole sheet
            ws.Cells.Style.Font.Name = "Calibri"; //Default Font name for whole sheet
            ws.View.ShowGridLines = true;

            //Load the data
            ws.Cells["A1"].LoadFromDataTable(reportsTable, true);
            //Bordor style
            ws.Cells[1, 1, reportsTable.Rows.Count + 1, reportsTable.Columns.Count].Style.Border.Left.Style = ExcelBorderStyle.Thin;
            ws.Cells[1, 1, reportsTable.Rows.Count + 1, reportsTable.Columns.Count].Style.Border.Top.Style = ExcelBorderStyle.Thin;
            ws.Cells[1, 1, reportsTable.Rows.Count + 1, reportsTable.Columns.Count].Style.Border.Right.Style = ExcelBorderStyle.Thin;
            ws.Cells[1, 1, reportsTable.Rows.Count + 1, reportsTable.Columns.Count].Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
            //Header to Bold
            ws.Cells[1, 1, 1, reportsTable.Columns.Count].Style.Font.Bold = true;
            //Header to color
            ws.Cells[1, 1, 1, reportsTable.Columns.Count].Style.Font.Color.SetColor(Color.Blue);
            //Data row back color
            ws.Cells[2, 1, reportsTable.Rows.Count + 1, reportsTable.Columns.Count].Style.Fill.PatternType = ExcelFillStyle.Solid;
            ws.Cells[2, 1, reportsTable.Rows.Count + 1, reportsTable.Columns.Count].Style.Fill.BackgroundColor.SetColor(Color.Beige);

            //Autofit columns
            ws.Cells[ws.Dimension.Address.ToString()].AutoFitColumns();
            ws.Column(1).AutoFit();
            System.Web.HttpContext.Current.Response.Clear();
            System.Web.HttpContext.Current.Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            System.Web.HttpContext.Current.Response.AddHeader("content-disposition", "attachment;  filename="+ reportName+ ".xlsx");
            System.Web.HttpContext.Current.Response.BinaryWrite(p.GetAsByteArray());
            System.Web.HttpContext.Current.Response.End();

        }


    }
}