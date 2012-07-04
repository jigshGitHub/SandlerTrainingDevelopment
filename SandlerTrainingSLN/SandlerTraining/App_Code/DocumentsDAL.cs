using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Sandler.Data;
using Sandler.Data.Utility;
using System.Data;
using System.Data.SqlClient; 


/// <summary>
/// Summary description for DocumentsDAL
/// </summary>
public class DocumentsDAL
{
    DBUtility db = new DBUtility();
    public DocumentsDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataSet GetDocumentsById(int Opp_ID)
    {
        System.Data.DataSet ds = db.ExecuteDataset("sp_GetDocumentsById", "Documents", new SqlParameter("@OppID", Opp_ID));
        return ds;

    }

   
}