using System;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.ComponentModel;
using System.Collections.Generic;
using System.Linq;
using SandlerModels;
using SandlerModels.DataIntegration;
using SandlerRepositories;

/// <summary>
/// Summary description for EffectiveDataSource
/// </summary>

namespace EffectiveDataSourceMgmt
{
    [DataObject(true)]
    public class EffectiveDataSource
    {
        #region [[ Declaration ]]
        DBFactory db = new DBFactory();
        //Constructor
        public EffectiveDataSource()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        #endregion
        
        #region [[ For Home Office  - Franchisee ]]
        public Int32 TotalRowCount(Int32 startRowIndex, Int32 pageSize, String sortExpression, String TableName, UserModel _user, String FilterText)
        {
            SqlDataReader dataReader = null;

            dataReader = db.ExecuteReader("GetTableTotalCount", new SqlParameter("@TableName", TableName), new SqlParameter("@CompanyId", null), new SqlParameter("@FilterText", !string.IsNullOrEmpty(FilterText) ? FilterText.ToUpper() : null));

            dataReader.Read();
            return Convert.ToInt32(dataReader[0]);
        }
        
        public DataTable GetFranchiseesData(Int32 startRowIndex, Int32 pageSize, String sortExpression, String TableName, UserModel _user, String FilterText)
        {
            DataSet ds = new DataSet();

            startRowIndex = Convert.ToInt32(startRowIndex / pageSize) + 1;

            if (String.IsNullOrEmpty(sortExpression))
            {
                sortExpression = "LastName";
            }
            
            ds = db.ExecuteDataset("GetFranchiseesData", "FranchiseesData",
                new SqlParameter("@CurrentPage", startRowIndex),
                new SqlParameter("@PageSize", pageSize),
                new SqlParameter("@SortExpression", sortExpression),
                new SqlParameter("@TableName", TableName),
                new SqlParameter("@FilterText", !string.IsNullOrEmpty(FilterText) ? FilterText.ToUpper() : null));

            return ds.Tables[0];
        }

        public void ArchiveFranchisee(int ID, string CurrentUserId)
        {
            //Create the record
            db.ExecuteNonQuery("sp_ArchiveFranchiseeRecord", new SqlParameter("@FranchiseeID", ID), new SqlParameter("@CurrentUserId", CurrentUserId));
        }
        #endregion
        
        #region [[ For Company Module ]]

        public Int32 TotalRowCountCompany(Int32 startRowIndex, Int32 pageSize, String sortExpression, String TableName, UserModel _user)
        {
            SqlDataReader dataReader = null;
            if (_user.Role == SandlerRoles.Corporate || _user.Role == SandlerRoles.SiteAdmin || _user.Role == SandlerRoles.HomeOfficeAdmin)
            {
                dataReader = db.ExecuteReader("GetTableTotalCountCompany", new SqlParameter("@TableName", TableName), new SqlParameter("@CoachId", null), new SqlParameter("@FrId", null));
            }
            if (_user.Role == SandlerRoles.Coach)
            {
                dataReader = db.ExecuteReader("GetTableTotalCountCompany", new SqlParameter("@TableName", TableName), new SqlParameter("@CoachId", _user.CoachID), new SqlParameter("@FrId", null));
            }
            if (_user.Role == SandlerRoles.FranchiseeOwner || _user.Role == SandlerRoles.FranchiseeUser)
            {
                dataReader = db.ExecuteReader("GetTableTotalCountCompany", new SqlParameter("@TableName", TableName), new SqlParameter("@CoachId", null), new SqlParameter("@FrId", _user.FranchiseeID));
            }
            dataReader.Read();
            return Convert.ToInt32(dataReader[0]);
        }

        public DataTable GetCompanyData(Int32 startRowIndex, Int32 pageSize, String sortExpression, String TableName, UserModel _user)
        {
            DataSet ds = new DataSet();

            startRowIndex = Convert.ToInt32(startRowIndex / pageSize) + 1;

            if (String.IsNullOrEmpty(sortExpression) && TableName == "CMP")
            {
                sortExpression = "COMPANYNAME";
            }
            //check role and execute SP accordingly
            if (_user.Role == SandlerRoles.Corporate || _user.Role == SandlerRoles.SiteAdmin || _user.Role == SandlerRoles.HomeOfficeAdmin)
            { 
                ds = db.ExecuteDataset("GetCompanyData", "CompanyData", new SqlParameter("@CurrentPage", startRowIndex), new SqlParameter("@PageSize", pageSize), new SqlParameter("@SortExpression", sortExpression));
            }
            if (_user.Role == SandlerRoles.Coach)
            { 
                ds = db.ExecuteDataset("GetCompanyDataByCoachId", "CompanyCoachData", new SqlParameter("@CurrentPage", startRowIndex), new SqlParameter("@PageSize", pageSize), new SqlParameter("@SortExpression", sortExpression),new SqlParameter("@CoachId", _user.CoachID));
            }
            if (_user.Role == SandlerRoles.FranchiseeOwner || _user.Role == SandlerRoles.FranchiseeUser)
            {
                ds = db.ExecuteDataset("GetCompanyDataByFrId", "CompanyFrData", new SqlParameter("@CurrentPage", startRowIndex), new SqlParameter("@PageSize", pageSize), new SqlParameter("@SortExpression", sortExpression), new SqlParameter("@FrId", _user.FranchiseeID));
            }
            return ds.Tables[0];
        }

        public void ArchiveCompany(int COMPANIESID, string CurrentUserId)
        {
            //Create the record
            db.ExecuteNonQuery("sp_ArchiveCompanyRecord", new SqlParameter("@COMPANIESID", COMPANIESID), new SqlParameter("@CurrentUserId", CurrentUserId));
        }
        #endregion
        
        #region [[ For Contact Module ]]
        public void ArchiveContact(int contactsid, string CurrentUserId)
        {
            //Create the record
            db.ExecuteNonQuery("sp_ArchiveContactRecord", new SqlParameter("@ContactId", contactsid), new SqlParameter("@CurrentUserId", CurrentUserId));
        }
        
        public Int32 TotalRowCountContact(Int32 startRowIndex, Int32 pageSize, String sortExpression, String TableName, UserModel _user, Int32 COMPANIESID)
        {
            SqlDataReader dataReader = null;
            if (COMPANIESID == 0)
            {
                if (_user.Role == SandlerRoles.SiteAdmin || _user.Role == SandlerRoles.Corporate || _user.Role == SandlerRoles.HomeOfficeAdmin)
                {
                    dataReader = db.ExecuteReader("GetTableTotalCountContact", 
                        new SqlParameter("@TableName", TableName),
                        new SqlParameter("@CompId", null),
                        new SqlParameter("@FrId", null),
                        new SqlParameter("@UserId", null),
                        new SqlParameter("@CoachId", null));
                }
                else if (_user.Role == SandlerRoles.Coach)
                {
                    dataReader = db.ExecuteReader("GetTableTotalCountContact",
                        new SqlParameter("@TableName", TableName),
                        new SqlParameter("@CompId", null),
                        new SqlParameter("@FrId", null),
                        new SqlParameter("@UserId", null),
                        new SqlParameter("@CoachId", _user.CoachID));
                }
                else if (_user.Role == SandlerRoles.FranchiseeOwner || _user.Role == SandlerRoles.Client)
                {
                    dataReader = db.ExecuteReader("GetTableTotalCountContact",
                        new SqlParameter("@TableName", TableName),
                        new SqlParameter("@CompId", null),
                        new SqlParameter("@FrId", _user.FranchiseeID),
                        new SqlParameter("@UserId", null),
                        new SqlParameter("@CoachId", null));
                }
                else
                {
                    dataReader = db.ExecuteReader("GetTableTotalCountContact",
                        new SqlParameter("@TableName", TableName),
                        new SqlParameter("@CompId", null),
                        new SqlParameter("@FrId", null),
                        new SqlParameter("@UserId", _user.UserId),
                        new SqlParameter("@CoachId", null));
                }

            }
            else
            {
                //We have Company ID
                if (_user.Role != SandlerRoles.FranchiseeUser)
                {
                    dataReader = db.ExecuteReader("GetTableTotalCountContact",
                        new SqlParameter("@TableName", TableName),
                        new SqlParameter("@CompId", COMPANIESID),
                        new SqlParameter("@FrId", null),
                        new SqlParameter("@UserId", null),
                        new SqlParameter("@CoachId", null));
                }
                else
                {
                    dataReader = db.ExecuteReader("GetTableTotalCountContact",
                        new SqlParameter("@TableName", TableName),
                        new SqlParameter("@CompId", COMPANIESID),
                        new SqlParameter("@FrId", null),
                        new SqlParameter("@UserId", _user.UserId),
                        new SqlParameter("@CoachId", null));
                }

            }
            dataReader.Read();
            return Convert.ToInt32(dataReader[0]);
        }

        public DataTable GetContactData(Int32 startRowIndex, Int32 pageSize, String sortExpression, String TableName, UserModel _user, Int32 COMPANIESID)
        {
            DataSet ds = new DataSet();

            startRowIndex = Convert.ToInt32(startRowIndex / pageSize) + 1;

            if (String.IsNullOrEmpty(sortExpression) && TableName == "CNT")
            {
                sortExpression = "COMPANYNAME";
            }

            if (COMPANIESID == 0)
            {
                if (_user.Role == SandlerRoles.Corporate || _user.Role == SandlerRoles.SiteAdmin || _user.Role == SandlerRoles.HomeOfficeAdmin)
                {
                    ds = db.ExecuteDataset("GetContactData", "ContactData", new SqlParameter("@CurrentPage", startRowIndex), new SqlParameter("@PageSize", pageSize), new SqlParameter("@SortExpression", sortExpression));
                }
                else if (_user.Role == SandlerRoles.Coach)
                {
                    ds = db.ExecuteDataset("GetContactDataByCoachId", "ContactData", 
                        new SqlParameter("@CurrentPage", startRowIndex), 
                        new SqlParameter("@PageSize", pageSize), 
                        new SqlParameter("@SortExpression", sortExpression),
                        new SqlParameter("@CoachId", _user.CoachID));
                }
                else if (_user.Role == SandlerRoles.FranchiseeOwner || _user.Role == SandlerRoles.Client)
                {
                    ds = db.ExecuteDataset("GetContactDataByFrId", "ContactData",
                        new SqlParameter("@CurrentPage", startRowIndex),
                        new SqlParameter("@PageSize", pageSize),
                        new SqlParameter("@SortExpression", sortExpression),
                        new SqlParameter("@FrId", _user.FranchiseeID));
                }
                else
                {
                    ds = db.ExecuteDataset("GetContactDataByUserId", "ContactData",
                        new SqlParameter("@CurrentPage", startRowIndex),
                        new SqlParameter("@PageSize", pageSize),
                        new SqlParameter("@SortExpression", sortExpression),
                        new SqlParameter("@UserId", _user.UserId));
                }
            }
            else
            {
                //We have Company Id
                if (_user.Role != SandlerRoles.FranchiseeUser)
                {
                    ds = db.ExecuteDataset("GetContactDataByCompId", "ContactData",
                        new SqlParameter("@CurrentPage", startRowIndex),
                        new SqlParameter("@PageSize", pageSize),
                        new SqlParameter("@SortExpression", sortExpression),
                        new SqlParameter("@CompId", COMPANIESID));
                }
                else
                {
                    ds = db.ExecuteDataset("GetContactDataForCompByUserId", "ContactData",
                       new SqlParameter("@CurrentPage", startRowIndex),
                       new SqlParameter("@PageSize", pageSize),
                       new SqlParameter("@SortExpression", sortExpression),
                       new SqlParameter("@CompanyId", COMPANIESID),
                       new SqlParameter("@UserId", _user.UserId));

                }

            }
            return ds.Tables[0];
        }

        #endregion

    }
        
}

