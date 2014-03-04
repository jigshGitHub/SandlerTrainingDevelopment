using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.IO;
using System.Text;

namespace Sandler.Web.Library
{
    public class ExcelResult : ActionResult
    {
        public string fileName { get; set; }
        public string filePath { get; set; }
        public string sqlStatement { get; set; }
        public string sheetName { get; set; }
        public string connectionSring { get; set; }
        public string clientsidefileName { get; set; }
        

        public override void ExecuteResult(ControllerContext context)
        {
            //Create Excel file            
            string folder = context.HttpContext.Server.MapPath(filePath);
                        
            string connStr = connectionSring;
            SqlToDataSet sqlDataset = new SqlToDataSet(sqlStatement, connStr, sheetName);
            DataSet dset = sqlDataset.results;

            string pathfileName = context.HttpContext.Server.MapPath(filePath + fileName);
            ExportExcelXls exportExcel = new ExportExcelXls(pathfileName, dset);

            //Download Excel file
            context.HttpContext.Response.Buffer = true;
            context.HttpContext.Response.Clear();
            //context.HttpContext.Response.AddHeader("content-disposition", "attachment; filename=" + fileName);
            context.HttpContext.Response.AddHeader("content-disposition", "attachment; filename=" + clientsidefileName);
            context.HttpContext.Response.ContentType = "application/vnd.ms-excel";
            context.HttpContext.Response.WriteFile(context.HttpContext.Server.MapPath(filePath + fileName));
        }
    }

    public class ExportExcelXls
    {
        public const string TABLE_NAME_PROPERTY = "TableName";

        private struct ExcelDataTypes
        {
            public const string NUMBER = "NUMBER";
            public const string DATETIME = "DATETIME";
            public const string STRING = "STRING";
        }

        private struct ClassDataTypes
        {
            public const string SHORT = "int16";
            public const string INT = "int32";
            public const string LONG = "int64";
            public const string STRING = "string";
            public const string DATE = "datetime";
            public const string BOOL = "boolean";
            public const string DECIMAL = "decimal";
        }

        private string fileName { get; set; }
        private DataSet dataset { get; set; }
        public bool success { get; set; }

        public ExportExcelXls(string fileName, DataSet dataset)
        {
            this.fileName = fileName;
            this.dataset = dataset;
            this.success = SaveExcel();
        }

        private bool SaveExcel()
        {
            // delete if file exists
            if (File.Exists(fileName))
            {
                File.Delete(fileName);
            }
            if (dataset != null && dataset.Tables.Count > 0)
            {
                string strConn = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" +
                       fileName + ";Extended Properties=\"Excel 12.0 Xml;HDR=Yes\"";

                using (OleDbConnection conn = new OleDbConnection(strConn))
                {
                    conn.Open();
                    DataTable dt = dataset.Tables[0];
                    OleDbCommand cmd = new OleDbCommand(getCreateTableCommand(dt), conn);
                    cmd.ExecuteNonQuery();
                    for (int rowIndex = 0; rowIndex < dt.Rows.Count; rowIndex++)
                    {
                        cmd = new OleDbCommand(getInsertCommand(dt, rowIndex), conn);
                        cmd.ExecuteNonQuery();
                    }

                    conn.Close();
                }
                return true;
            }
            return false;
        }

        private static string getCreateTableCommand(DataTable dataTable)
        {
            Dictionary<string, string> dataTypeList = getExcelDataTypeList();

            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("CREATE TABLE [{0}] (", getExcelSheetName(dataTable));
            foreach (DataColumn col in dataTable.Columns)
            {
                string type = ExcelDataTypes.STRING;
                if (dataTypeList.ContainsKey(col.DataType.Name.ToString().ToLower()))
                {
                    type = dataTypeList[col.DataType.Name.ToString().ToLower()];
                }
                sb.AppendFormat("[{0}] {1},", col.Caption.Replace(' ', '_'), type);
            }
            sb = sb.Replace(',', ')', sb.ToString().LastIndexOf(','), 1);

            return sb.ToString();
        }

        private static string getInsertCommand(DataTable dataTable, int rowIndex)
        {
            StringBuilder sb = new StringBuilder();
            string val;

            sb.AppendFormat("INSERT INTO [{0}$](", getExcelSheetName(dataTable));
            foreach (DataColumn col in dataTable.Columns)
            {
                sb.AppendFormat("[{0}],", col.Caption.Replace(' ', '_'));
            }
            sb = sb.Replace(',', ')', sb.ToString().LastIndexOf(','), 1);
            sb.Append("VALUES (");
            foreach (DataColumn col in dataTable.Columns)
            {
                val = dataTable.Rows[rowIndex][col].ToString();
                val = val.Replace("'", "''");
                //sb.AppendFormat("'{0}',", dataTable.Rows[rowIndex][col].ToString());
                if (col.DataType.Name.ToString() == "Decimal")
                {
                    if (string.IsNullOrEmpty(val))
                    {
                        sb.AppendFormat("'{0}',", val);
                    }
                    else
                    {
                        sb.AppendFormat("{0},", val);
                    }
                }
                else
                {
                    sb.AppendFormat("'{0}',", val);
                }
            }
            sb = sb.Replace(',', ')', sb.ToString().LastIndexOf(','), 1);
            return sb.ToString();
        }

        private static string getExcelSheetName(DataTable dataTable)
        {
            string retVal = dataTable.TableName;
            if (dataTable.ExtendedProperties.ContainsKey(TABLE_NAME_PROPERTY))
            {
                retVal = dataTable.ExtendedProperties[TABLE_NAME_PROPERTY].ToString();
            }
            return retVal.Replace(' ', '_');
        }

        private static Dictionary<string, string> getExcelDataTypeList()
        {
            Dictionary<string, string> dataTypeList = new Dictionary<string, string>();

            dataTypeList.Add(ClassDataTypes.SHORT, ExcelDataTypes.NUMBER);
            dataTypeList.Add(ClassDataTypes.INT, ExcelDataTypes.NUMBER);
            dataTypeList.Add(ClassDataTypes.LONG, ExcelDataTypes.NUMBER);
            dataTypeList.Add(ClassDataTypes.STRING, ExcelDataTypes.STRING);
            dataTypeList.Add(ClassDataTypes.DATE, ExcelDataTypes.DATETIME);
            dataTypeList.Add(ClassDataTypes.BOOL, ExcelDataTypes.STRING);
            dataTypeList.Add(ClassDataTypes.DECIMAL, ExcelDataTypes.NUMBER);

            return dataTypeList;
        }
    }

    public class SqlToDataSet
    {
        public DataSet results;

        public SqlToDataSet(string sqlStatement, string connectionString, string sheetName)
        {

            try
            {
                SqlConnection sqlConnection = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = sqlStatement;
                cmd.CommandType = CommandType.Text;
                cmd.Connection = sqlConnection;

                sqlConnection.Open();

                SqlDataAdapter adp = new SqlDataAdapter();
                DataSet dset = new DataSet();
                adp.SelectCommand = cmd;
                adp.Fill(dset, sheetName);

                sqlConnection.Close();
                results = dset;
            }
            catch (Exception ex)
            {
                results = null;
            }

        }
    }
}