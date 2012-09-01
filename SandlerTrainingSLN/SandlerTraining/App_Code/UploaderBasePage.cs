using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;

/// <summary>
/// Summary description for UploaderBasePage
/// </summary>
public class UploaderBasePage:BasePage
{
    protected string FileName
    {
        get;
        set;
    }

    protected DataTable ExcelData
    {
        get;
        set;
    }

    protected DataTable LogData
    {
        get;
        set;
    }

	public UploaderBasePage()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    protected virtual void SetUpExcel()
    {
        OleDbConnection con;
        string query, sourceConstr;
        OleDbDataAdapter data;
        try
        {
            if (ExcelData == null)
                ExcelData = new DataTable();
            sourceConstr = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source='" + Server.MapPath(FileName) + "';Extended Properties= 'Excel 8.0;HDR=Yes;IMEX=1'";
            //sourceConstr = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source='" + Server.MapPath(FileName) + "';Extended Properties=Excel 8.0";
            con = new OleDbConnection(sourceConstr);
            query = "Select * from [Sheet1$]";
            data = new OleDbDataAdapter(query, con);
            data.Fill(ExcelData);

            ExcelData.Columns.Add("Errormessage");
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected virtual void SetUpLogData()
    {
        try
        {
            if(LogData == null)
                LogData = ExcelData.Clone();
        }
        catch (Exception ex)
        {
        }
    }

    protected virtual void CreateLogRow(DataRow excelRow)
    {
        LogData.ImportRow(excelRow);
    }
}