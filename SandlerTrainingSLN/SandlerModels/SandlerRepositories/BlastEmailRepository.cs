using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using SandlerModels;


namespace SandlerRepositories
{
    public partial class BlastEmailRepository
    {
        DBFactory db = new DBFactory();
        public DataSet GetBlastEmailGroupsByRole()
        {
            //Get the User Session
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];
            //Get Groups
            return  db.ExecuteDataset("sp_GetBlastEmailGroupsByRole", "GroupsByRole", new SqlParameter("@Role", _user.Role.ToString()));
        }
        public DataSet GetAllCoachAddresses()
        {
            //Get All Coach Addresses
            return db.ExecuteDataset("sp_GetAllCoachAddresses", "AllCoachAddresses");
        }
        public DataSet GetAllFranchiseeAddresses(string RoleName)
        {
            //Get All Franchisee Addresses
            return db.ExecuteDataset("sp_GetAllFranchiseeAddresses", "AllFranchiseeAddress", new SqlParameter("@RoleName", RoleName));
        }
        public DataSet GetAllContactsAddresses()
        {
            //Get All Franchisee Addresses
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];
            if ((_user.Role == SandlerRoles.Corporate) || (_user.Role == SandlerRoles.SiteAdmin))
            {
                return db.ExecuteDataset("sp_GetAllContactsAddresses", "ContactAddress", new SqlParameter("@FranchiseeId", 0));
            }
            else
            {
                return db.ExecuteDataset("sp_GetAllContactsAddresses", "ContactAddress", new SqlParameter("@FranchiseeId", _user.FranchiseeID));
            }
                       
        }
        public DataSet GetFranchiseeAddresses(string RoleName,int FranchiseeId)
        {
            //Get Franchisee Addresses
            return db.ExecuteDataset("sp_GetFranchiseeAddresses", "FranchiseeAddress", new SqlParameter("@RoleName", RoleName), new SqlParameter("@FranchiseeId", FranchiseeId));
        }
        public DataSet GetLoggedInUserAddress(string UserId)
        {
            //Get Franchisee Addresses
            return db.ExecuteDataset("sp_GetLoggedInUserAddress", "LoggedinUserAddress", new SqlParameter("@UserId", UserId));
        }
        public void UpdateSubscriptionInfo(string UserId, string Response)
        {
            //Update the Subscription Information
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];
            db.ExecuteNonQuery("sp_UpdateSubscriptionInfo", new SqlParameter("@UserId", UserId),  new SqlParameter("@Response", Response),new SqlParameter("@Role", _user.Role.ToString()));
        }
        public DataSet GetSubscriptionInfo(string UserId)
        {
            //Get User Subscirption Info
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];
            return db.ExecuteDataset("sp_GetSubscriptionInfo", "SubscriptionInfo", new SqlParameter("@UserId", UserId), new SqlParameter("@Role", _user.Role.ToString()));
            
        }

        //Create Procedures
        //sp_GetBlastEmailGroupsByRole
        //sp_GetAllCoachAddresses
        //sp_GetAllFranchiseeAddresses(@RoleName)
        //sp_GetAllContactsAddresses(@FranchiseeId)
        //sp_GetFranchiseeAddresses(@RoleName,@FranchiseeId)
        //sp_GetLoggedInUserAddress(@UserId)
        //sp_UpdateSubscriptionInfo(string UserId, int Response)
        //sp_GetSubscriptionInfo(string UserId)
        //sp_GetBlastEmailOptions

        //Update Procedures
        //sp_InsertContact
        //sp_GetContactDetails
        //sp_UpdateContactDetails
    }
}
