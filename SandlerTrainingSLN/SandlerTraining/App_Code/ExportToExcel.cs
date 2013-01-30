using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI.WebControls;

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
    public static void DownloadReportResults(DataSet _data)
    {

        GridView gv = new GridView();
        gv.HeaderStyle.BackColor = System.Drawing.Color.White;
        gv.HeaderStyle.Font.Bold = true;
        gv.HeaderStyle.ForeColor = System.Drawing.Color.FromName("#0000ff");
        gv.RowStyle.BackColor = System.Drawing.Color.FromName("#eeeeee");
        gv.AlternatingRowStyle.BackColor = System.Drawing.Color.FromName("#dcdcdc");
        gv.DataSource = _data;
        gv.DataBind();

        System.Web.HttpContext.Current.Response.Clear();
        System.Web.HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=HomeOfficeResults.xls");
        System.Web.HttpContext.Current.Response.Charset = "";
        System.Web.HttpContext.Current.Response.ContentType = "application/vnd.ms-excel";
        
        System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter htmlWrite = new System.Web.UI.HtmlTextWriter(stringWrite);
        gv.AllowPaging = false;
        gv.AllowSorting = false;
        //Get the User Info
        
        gv.DataBind();
        //Report is the Div which we need to Export - Gridview is under this Div
        gv.RenderControl(htmlWrite);
        System.Web.HttpContext.Current.Response.Write(stringWrite.ToString());
        System.Web.HttpContext.Current.Response.End();        
       
    }
   
   
}