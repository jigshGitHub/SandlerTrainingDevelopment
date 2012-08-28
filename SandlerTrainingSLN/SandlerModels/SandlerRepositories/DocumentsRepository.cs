using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using SandlerModels;


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
        public DataSet GetByOppsId(int OppsID)
        {
            System.Data.DataSet ds = db.ExecuteDataset("sp_GetDocumentsByOppId", "Documents", new SqlParameter("@OppsID", OppsID));
            return ds;

        }
        public DataSet GetDetailsById(int DocsID)
        {
            System.Data.DataSet ds = db.ExecuteDataset("sp_GetDocumentDetails", "Documents", new SqlParameter("@DocsID", DocsID));
            return ds;

        }

        public DataSet GetDocStatus()
        {
            System.Data.DataSet ds = db.ExecuteDataset("sp_GetDocStatus", "DocStatus");
            return ds;
        }

        public void Insert(int OppsID, int DocStatus, string DocName, DateTime LastModifyDate)
        {
            //Get the User Info
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];

           db.ExecuteNonQuery("sp_AttachDocument", new SqlParameter("@OppsID", OppsID),
           new SqlParameter("@DocName", DocName),
           new SqlParameter("@DocStatus", DocStatus),
           new SqlParameter("@LastModifyDate", LastModifyDate),
           new SqlParameter("@CreatedBy", _user.UserId));

        }

        public void Update(int DocsID, int OppsID, string DocName, int DocStatus, DateTime LastModifyDate)
        {
            
            //Get the User Info
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];
            
            db.ExecuteNonQuery("sp_UpdateDocumentDetails",
            new SqlParameter("@DocsID", DocsID),
            new SqlParameter("@OppsID", OppsID),
            new SqlParameter("@DocName", DocName),
            new SqlParameter("@DocStatus", DocStatus),
            new SqlParameter("@LastModifyDate", LastModifyDate),
            new SqlParameter("@UpdatedBy", _user.UserId));
        }

    }
}