using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;



/// <summary>
/// Summary description for DocumentsDAL
/// </summary>
namespace SandlerRepositories
{
    public class DocumentsRepository
    {
        DBFactory db = new DBFactory();
        public DocumentsRepository()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public DataSet GetById(int Opp_ID)
        {
            System.Data.DataSet ds = db.ExecuteDataset("sp_GetDocumentsById", "Documents", new SqlParameter("@OppID", Opp_ID));
            return ds;

        }
        public DataSet GetDetailsById(int Doc_ID)
        {
            System.Data.DataSet ds = db.ExecuteDataset("sp_GetDocumentDetails", "Documents", new SqlParameter("@DocID", Doc_ID));
            return ds;

        }

        public void Insert(int ID, string DocStatus, string DocName, string DocumentLoaded, DateTime LastModifyDate)
        {
            db.ExecuteNonQuery("sp_AttachDocument", new SqlParameter("@OppID", ID),
           new SqlParameter("@Document_Name", DocName),
           new SqlParameter("@Document_Status", DocStatus),
           new SqlParameter("@Document_Loaded", DocumentLoaded), new SqlParameter("@LastModifyDate", LastModifyDate));

        }

        public void Update(int ID, string DocStatus, string DocName, DateTime LastModifyDate)
        {
            db.ExecuteNonQuery("sp_UpdateDocumentDetails",
            new SqlParameter("@DocID", ID),
            new SqlParameter("@DocStatus", DocStatus),
            new SqlParameter("@DocName", DocName),
            new SqlParameter("@LastModifyDate", LastModifyDate));
        }

    }
}